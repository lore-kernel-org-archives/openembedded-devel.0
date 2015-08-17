Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 751FD60125
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 20:00:42 +0000 (UTC)
Received: by obbhe7 with SMTP id he7so122245479obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2015 13:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=do4X8nfMNX/u2Pk233M/fv2jgph0Gxt2uxv3CZz+aYo=;
	b=SHUrbfxfvz0SEMtAKShtsT8GiKuqajcm13CjOvuVQw2A/vMoCAgfzrWbf2mbf8Vd//
	P3nyBMUODWlILKdmrI3pusBb4z4ZlluVP097yHH4qkzNlV/OYe1UHiO8DSIDuvNjQyi8
	VomIJGrvDzwz7E/bsfKmJSx0VPa7syaHRNzns6POg9lWmVLpMzuaw44Mg2MIhMGqhofC
	CyiNxgGZDZRedxCgL2zqJrR2AZYywU1Bv15iZx6+ZK5XGLtG8QdPO//CGBRLFgYgrR0A
	qWU9C6irSQs2TgfpGbU4SV901gChUeyFLy4cYkxgq3NW/g+IhB8JWUT8ng3Ri4mB3kOD
	veHQ==
MIME-Version: 1.0
X-Received: by 10.182.108.170 with SMTP id hl10mr2580622obb.17.1439841642999; 
	Mon, 17 Aug 2015 13:00:42 -0700 (PDT)
Received: by 10.182.246.228 with HTTP; Mon, 17 Aug 2015 13:00:42 -0700 (PDT)
In-Reply-To: <CAP9ODKqkv6E=keu+mBSFxrPF_HXFMZL=t0Uki4Bx-rX88vXK8A@mail.gmail.com>
References: <CAOLEWZW_2DMvuxsaoKXxtQpg_Qy5=rVutJaOB9Lpnjqrpo6A9g@mail.gmail.com>
	<CAP9ODKqkv6E=keu+mBSFxrPF_HXFMZL=t0Uki4Bx-rX88vXK8A@mail.gmail.com>
Date: Mon, 17 Aug 2015 13:00:42 -0700
Message-ID: <CAOLEWZXQjQAJy-yDDWbEuiJ6XutapsT1QPeRKYtAybbdyrOUDg@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 17 Aug 2015 20:00:46 -0000
Content-Type: text/plain; charset=UTF-8

Sorry, I guess I said that on IRC but left it out of the email...

The failure is only with perl 5.22, and it doesn't matter whether it's
perl-native or the should-not-be-used-anyway build host perl (that's
what the patch is for).

It's only a warning in prior versions of perl, so you wouldn't see it
in either case above.

Steve

On Mon, Aug 17, 2015 at 2:59 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello Stephen,
>
> (Adding meta-freescale mailing list as it is the proper place for this
> discussion)
>
> On Sat, Aug 15, 2015 at 3:05 AM, Stephen Arnold
> <stephen.arnold42@gmail.com> wrote:
>> When building fsl-image-machine-test for imx28-evk with n00b defaults
>> using the fsl-community-bsp repo manifest thing, it fails on the old
>> kernel in meta-fsl-arm/recipes-kernel/linux/linux-imx_2.6.35.3.bb.
>>
>> There are a few things questionable/wrong here:
>>
>> 1) It uses the build host perl, which is why it fails here and not in
>> the upstream builder.
>
> The master branch has remove this old version; it now uses linux-fslc
> for mx23, mx28, mx5 SoCs.
>
>> 2) The dts file for the evk machine in 4.1 mainline looks complete
>> (along with several other imx28 machines) so why does it default to
>> such an old kernel?
>
> In fido it is used but dropped in next release.
>
> I want to understand why it failed on your system as it works in the
> autobuilder. What host distro are you using?
>
>> 3) Switching to newer kernel makes gst-fsl-plugins fail with the
>> "looking for kernel headers from user space" error because it can't
>> find the old framebuffer header (mxcfb.h).  It should depend on old
>> fsl kernel only.
>
> Yes and we got this fixed dropping mx28 support from those. We now
> rely on official GStreamer for those SoCs and stopped using Freescale
> codecs (in master).
>
>> 4) The old kernel recipe should depend on perl-native.
>
> Adding perl-native dependency fixes it?
>
>> The attached patch fixes the perl error in the the old kernel build
>> and the above test image completed fine with it.  Not an "official"
>> patch per se, just useful if you're stuck...
>
> Is this needed if using perl-native?
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

