Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 75193737F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 09:59:17 +0000 (UTC)
Received: by iodv127 with SMTP id v127so129257413iod.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=k6zbKKVsXWoxjBxcnqkIaCCtaiAcoLk0aqd31ZV2LmA=;
	b=HkVfLYSNNSe+r9XzdPhXKZ2rH22zvpRc94wVGwS8Spoyqnpe1PtyUeHMkTELTgTKhp
	TtTfgk+coactvq1fE4Zm27fQs7p6xDHXAMmw3wr3LOzcdtds1Ii2mYCkJaTk5So7eHfC
	0QBwGq/MkeWJn9orPiGg50+yt3xtB2lUrkoafpVae5RpqPUVjOUAWvDH21FPianMgAyY
	zlpSDo7XDT6lFzWkMqLqmzEdYv/D28QP6HOumGxViPoAAxrdMaW4Vp61SoiwM6sibNPX
	GVFf+PETu7hcUABp0EZH5+riFW9QNIytOyGQUQ+v+wAj2etJU8HpGIDCz+6ERUAztPtU
	3fhw==
X-Gm-Message-State: ALoCoQkwu677ZF0tTzAWIQFi5W8KPptRe3QzJhBrZsm+Uv4GyW7Jy9DcYvvgG2XVNeoE0zcOAX/+
X-Received: by 10.107.130.156 with SMTP id m28mr638865ioi.56.1439805558029;
	Mon, 17 Aug 2015 02:59:18 -0700 (PDT)
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com.
	[209.85.223.181]) by smtp.gmail.com with ESMTPSA id
	c91sm12313616ioj.43.2015.08.17.02.59.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Aug 2015 02:59:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodb91 with SMTP id b91so144694821iod.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 02:59:16 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr478551ioi.192.1439805556766;
	Mon, 17 Aug 2015 02:59:16 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Mon, 17 Aug 2015 02:59:16 -0700 (PDT)
In-Reply-To: <CAOLEWZW_2DMvuxsaoKXxtQpg_Qy5=rVutJaOB9Lpnjqrpo6A9g@mail.gmail.com>
References: <CAOLEWZW_2DMvuxsaoKXxtQpg_Qy5=rVutJaOB9Lpnjqrpo6A9g@mail.gmail.com>
Date: Mon, 17 Aug 2015 06:59:16 -0300
Message-ID: <CAP9ODKqkv6E=keu+mBSFxrPF_HXFMZL=t0Uki4Bx-rX88vXK8A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Subject: Re: [PATCH][meta-fsl-arm] 2.6.35 kernel build error with perl 5.22
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
X-List-Received-Date: Mon, 17 Aug 2015 09:59:23 -0000
Content-Type: text/plain; charset=UTF-8

Hello Stephen,

(Adding meta-freescale mailing list as it is the proper place for this
discussion)

On Sat, Aug 15, 2015 at 3:05 AM, Stephen Arnold
<stephen.arnold42@gmail.com> wrote:
> When building fsl-image-machine-test for imx28-evk with n00b defaults
> using the fsl-community-bsp repo manifest thing, it fails on the old
> kernel in meta-fsl-arm/recipes-kernel/linux/linux-imx_2.6.35.3.bb.
>
> There are a few things questionable/wrong here:
>
> 1) It uses the build host perl, which is why it fails here and not in
> the upstream builder.

The master branch has remove this old version; it now uses linux-fslc
for mx23, mx28, mx5 SoCs.

> 2) The dts file for the evk machine in 4.1 mainline looks complete
> (along with several other imx28 machines) so why does it default to
> such an old kernel?

In fido it is used but dropped in next release.

I want to understand why it failed on your system as it works in the
autobuilder. What host distro are you using?

> 3) Switching to newer kernel makes gst-fsl-plugins fail with the
> "looking for kernel headers from user space" error because it can't
> find the old framebuffer header (mxcfb.h).  It should depend on old
> fsl kernel only.

Yes and we got this fixed dropping mx28 support from those. We now
rely on official GStreamer for those SoCs and stopped using Freescale
codecs (in master).

> 4) The old kernel recipe should depend on perl-native.

Adding perl-native dependency fixes it?

> The attached patch fixes the perl error in the the old kernel build
> and the above test image completed fine with it.  Not an "official"
> patch per se, just useful if you're stuck...

Is this needed if using perl-native?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

