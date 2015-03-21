Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 591A36AC3A;
	Sat, 21 Mar 2015 16:51:02 +0000 (UTC)
Received: by igbud6 with SMTP id ud6so11727388igb.1;
	Sat, 21 Mar 2015 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=CiWudaQHYGMCRnIqS9+QGOPQ2mrmfQPINBKOYMhmGXg=;
	b=myV94ZV2R7TScoayyFlcOpBJv6ZceBR9nbEX8W46DM5sQtL0V/STsY/oSRcX2F4jmZ
	1Y79bKLmuB4p+4vOVr9nbArkEVwkoRXK/SUh4GSjzfXM76NCBWjWUpaFpQiXfWU8QVMH
	1fGQFrPGw1b7eV4FpEXc19BeVgGNpjkPiF8Iv/gTMqdSCoRmefQ64xhico2wNs+qBNtn
	FZYz+qZny7dkk4iPaOzdLbLHF0b/dxGjLWq/4Q27W7khRKSPlY9ZU4kj0jGETw8M47Sy
	LO+CJm+aUINCjl7Y9Kr63HLW1+rJesMPnrICbbvf8DLufP7G6MsDHt6TSQQiCF80osid
	U0+Q==
X-Received: by 10.50.141.199 with SMTP id rq7mr4269329igb.4.1426956663695;
	Sat, 21 Mar 2015 09:51:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Sat, 21 Mar 2015 09:50:32 -0700 (PDT)
In-Reply-To: <20150321153345.GL4738@jama>
References: <20150303074258.52BFE50424@opal.openembedded.org>
	<20150321153022.GI4738@jama> <20150321153345.GL4738@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 21 Mar 2015 09:50:32 -0700
Message-ID: <CAMKF1sq9KzWzthTuQmB-ZNXWvT7ffY2qkRL1v8MoePnYbWNjzw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Khem Raj : lirc: Add recipe for 0.9.2
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
X-List-Received-Date: Sat, 21 Mar 2015 16:51:04 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Mar 21, 2015 at 8:33 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Please fix following undeterministic dependencies:
>> lirc-0.9.2: lirc rdepends on libx11, but it isn't a build dependency? [build-deps]
>> lirc-0.9.2: lirc-plugins rdepends on libjack, but it isn't a build dependency? [build-deps]
>> lirc-0.9.2: lirc-plugins rdepends on libusb-compat, but it isn't a build dependency? [build-deps]
>> lirc-0.9.2: lirc-plugins rdepends on portaudio-v19, but it isn't a build dependency? [build-deps]
>
> and
> lirc-0.9.2: lirc requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]

thanks for letting me know.

