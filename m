Return-Path: <max.oss.09@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 18B0E60034
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 23:38:58 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so23624430qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2015 16:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2/Sr8xvpKMpF1owRXH+/S2n6uA61FXm6PlLc7AueX4E=;
	b=q2tC4lewz05/pMRpMXXlW0QG31x9gEIfl0ithIZRLzVCopu2N2qyj0OWMEaYS4WtPx
	m4smIwMvUPrwjLzOfajVzsiCJvY1uNU5bZi1Y+ylcXgE7CisF/KaVlXudhnu6LzNgbiC
	RbHzxw+YosVpXfisvChX/WzhE4P9V5kaPRALSbVW4i/BwmDC7OoPy4+YtUt3d5+ZjESY
	CM4RnteCuopA5OEzetHZG7vkR4sw0xvtePKWq89JPCsQx+bHNMJoR4tuBj4jn65F8QHY
	O/Sf//7LfkNG+stFnfNgnPdoHPJRQulCHoGooT3yCdCgUY8UXhMmlfl2jCpKEyb+lAHn
	F5ew==
MIME-Version: 1.0
X-Received: by 10.140.104.13 with SMTP id z13mr83062208qge.76.1426635539882;
	Tue, 17 Mar 2015 16:38:59 -0700 (PDT)
Received: by 10.140.82.72 with HTTP; Tue, 17 Mar 2015 16:38:59 -0700 (PDT)
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905814FFE9@DLEE11.ent.ti.com>
References: <4F9216F96E5DF9428610502835A9F4905814FFE9@DLEE11.ent.ti.com>
Date: Wed, 18 Mar 2015 00:38:59 +0100
Message-ID: <CAEHkU3XTfCB5DdmsOo4V1kRuR1+NzqoV-Rn-UsMM95ReK7zKrQ@mail.gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	sam.nelson@ti.com
Subject: Re: Query on meta-java layer: openjdk-7-jre: compilation issue with '-fuse-ld-bfd'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Mar 2015 23:38:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Sam

> I am using an openembedded setup and using the daisy branch.
> I am trying to use meta java: git://git.yoctoproject.org/meta-java  to compile openjdk-7-jre and seeing the following error:
>
> | arm-linux-gnueabihf-gcc: error: unrecognized command line option '-fuse-ld=bfd'
>
> Looks like the addition of '-fuse-ld=bfd" was introduced with the following commit in meta-java:
> commit cb351db824b0eb4a71514156bba543f6dde19740
> Author: Max Krummenacher <max.oss.09@gmail.com>
> Date:   Tue Jan 20 16:14:23 2015 +0100
>
> I am using linaro toolchain: gcc-linaro-arm-linx-gnueabihf-4.7-2013 and does not support "-fuse-ld" option. Any ideas on how this can be fixed?
>
The openemembedded built toolchain in daisy, both from the oe-core and
the linaro layers are gcc 4.8 based and do support the option.
So  having the toolchain built by oe or using a newer external
toolchain can fix your issue.

If you're looked to a 4.7 toolchain because of some other issue you
could go through the commit which introduced the -fuse-ld and remove
the -fuse-ld=bfd from the patches in
recipes-core/openjdk/openjdk-7-25b30/. I guess your toolchain by
default does link with the classic bfd linker rather than using gold.

If that is a bigger problem one could probably add support for your
use case, e.g. by trying to compile on failure without the option and
commit such a patch to meta-java. :

$(CC_COMPILE) -static -fuse-ld=bfd -o $@ $< $(COMPILE_DONE) ||
$(CC_COMPILE) -static -o $@ $< $(COMPILE_DONE)


Regards
Max

