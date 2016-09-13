Return-Path: <raj.khem@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2827326D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 21:24:14 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id u124so178237ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Sep 2016 14:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=d6hCqynI6TMpbcKhaN2yDjepXay1lw7EwGt0inXJuKk=;
	b=hi+MJiZhnr2Th/C2tpNwcR+BaLMJL/S7yvZu8dQX10KsY8ZNK9RpHru1O2TswENb9l
	4wNqCy6MilKLDrmqQSSfw3oUde/SPH2lv4z80WGyXl1D7JnV8+uvvJCjUXzn9XF96CKs
	e+VF25ZCrdd0VBytiM27CFkuGnP4UA4z/z2BTz1OQxjq76EPHPSkq9htq0uFzlrtDP5U
	59+aYwHaUxYWsp5LKi6bFHrtiqlu2gP6XnGP6Qy7sQ4jQma4z02UGNm9PD/1AkMB7Ina
	BNZuOhMskuA7AeZyOfjcuCcgBKBrvTGos8kLISnIIbYT/OQfM/lxcXzwrJrbJ3VNAd+0
	dVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=d6hCqynI6TMpbcKhaN2yDjepXay1lw7EwGt0inXJuKk=;
	b=dxoYHyygCpUHZ+d8LX2bvXlkYLfvWhyEAHCVRJDhQm71q7zL2RlnONLW1EV/C0ZLRE
	/fDsPNFMDOX8VP5NnqQik2k+JUNiqMcuhXophbk8jCDMXgFgEJRGcOVFfRZk5B5lXEqX
	o8I31DXRXoTE7+8tJ9jt7K4ilIuuf3IDGtUXkofsCtgalHgXmCDN63qV2hN5IOp7wX1Y
	EJ/HoIHqcVFbRtAkY4AvuP7h4Gyv7pvD/OAjb2CdMt6iQd6NpvwGRxmy9oonX/kVY0bW
	5cq25HNd7if+DpYD8/YvP7F9i05/78MVaGe3VWYqt1oadyw8AiCRCUtny58B0y1BJEsS
	zrFw==
X-Gm-Message-State: AE9vXwO3ztovE4ZhNnOf7kL5bKhHNa8xhTedEdrBCvxQkhU7+E+hG1UoIGv8unoTEnAYJtaAtpVg5EpNotXCIQ==
X-Received: by 10.13.197.195 with SMTP id h186mr2940786ywd.54.1473801854419;
	Tue, 13 Sep 2016 14:24:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.120 with HTTP; Tue, 13 Sep 2016 14:23:43 -0700 (PDT)
In-Reply-To: <CA+chaQfs2hsvgLM=S8oYPHGNX=iGOt3-XnjugGA+iiKTXiMxYw@mail.gmail.com>
References: <20160912170647.14289-1-Martin.Jansa@gmail.com>
	<CAMKF1sqY8tOj5y0kMNkVESWfZcddU3p9Lw2ZrxFOETGMC6rY8Q@mail.gmail.com>
	<bdbed90b-1aa2-b42e-2279-716cb2259bef@gmail.com>
	<CA+chaQfs2hsvgLM=S8oYPHGNX=iGOt3-XnjugGA+iiKTXiMxYw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Sep 2016 14:23:43 -0700
Message-ID: <CAMKF1spdGtNZsOxV3CCZ5cdkipmRVFGeHLVkoWu6Wm4GXkg+yw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][meta-networking][PATCH] iscsitarget, netmap-moduls, vboxguestdrivers: Blacklist, not compatible with default kernel version 4.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 21:24:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 12, 2016 at 11:00 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> linux-libc-headers are 4.8% by default since:
> http://git.openembedded.org/openembedded-core/commit/?id=253bf0332bd979b9fd9cf6fdc44682892f0bacf7
>
> qemuarm is using 4.8% by default for kernel as well, since:
> http://git.openembedded.org/openembedded-core/commit/?id=fd31e30f97ee9bd128d5b7b748987b0a6427b279
>
> That's why it's now failing in world builds...

hmmm, ok I didnt pay attention that OE-core has got 4.8 now, then I
guess this is fine in interim.

>
> On Mon, Sep 12, 2016 at 7:33 PM, akuster808 <akuster808@gmail.com> wrote:
>
>>
>>
>> On 09/12/2016 10:12 AM, Khem Raj wrote:
>>
>>> 4.8 isnt released yet. So I would suggest to wait merging this until its
>>> released
>>>
>>
>> 4.8-rc5 is so this patch is valid IMHO.
>>
>> -armin
>>
>> On Sep 12, 2016 10:07 AM, "Martin Jansa" <martin.jansa@gmail.com> wrote:
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>>   .../recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>>>>   |
>>>> 3 +++
>>>>   meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>>>   |
>>>> 3 +++
>>>>   meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>>>>  |
>>>> 3 +++
>>>>   3 files changed, 9 insertions(+)
>>>>
>>>> diff --git a/meta-networking/recipes-extended/iscsitarget/
>>>> iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-
>>>> extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
>>>> index ba51c25..4b5622b 100644
>>>> --- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>>>> svn502.bb
>>>> +++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+
>>>> svn502.bb
>>>> @@ -56,3 +56,6 @@ FILES_${PN} += "${sbindir} \
>>>>
>>>>   RDEPENDS_${PN} = "kernel-module-iscsi-trgt"
>>>>   RRECOMMENDS_${PN} = "kernel-module-crc32c kernel-module-libcrc32c"
>>>> +
>>>> +# http://errors.yoctoproject.org/Errors/Details/83334/
>>>> +PNBLACKLIST[iscsitarget] ?= "BROKEN: not compatible with default kernel
>>>> version 4.8"
>>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>>> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>>> index 6544bb5..e9eea56 100644
>>>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>>> @@ -87,3 +87,6 @@ do_install () {
>>>>       cd ${S}/LINUX
>>>>       oe_runmake install
>>>>   }
>>>> +
>>>> +# http://errors.yoctoproject.org/Errors/Details/83335/
>>>> +PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
>>>> kernel version 4.8"
>>>> diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>>>> ers_5.1.4.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdriv
>>>> ers_5.1.4.bb
>>>> index 66068d1..1d1b1d8 100644
>>>> --- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>>>> +++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.4.bb
>>>> @@ -63,3 +63,6 @@ FILES_${PN} = "${base_sbindir}"
>>>>
>>>>   # autoload if installed
>>>>   KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
>>>> +
>>>> +# http://errors.yoctoproject.org/Errors/Details/83333/
>>>> +PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default
>>>> kernel version 4.8"
>>>> --
>>>> 2.10.0
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>>
>>>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

