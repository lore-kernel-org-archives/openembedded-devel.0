Return-Path: <akini@synapticon.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id AC8456D6F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 23:07:15 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id x18so5181823lbi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=U/XrNyRb0GD0JQwotdDZx8QEFsLQuEGpIlK8+qasUbw=;
	b=N9b7enjGidPsBeE1EJRkAAqD7NqZ4CuZpjNwoxxhqPI6oi0Jqw14mSP1eRok7QC8SZ
	gI8Mn14sZtqYkEDIHHeOLXdbYrqfDrFrgo1Uy5nJiygBNoWPLSlBOeLMgcssIFlHEdve
	daxnfXcnVT024wUBFTA6sApxNYocNSrGEh2PH9EUMgVw5y9KchJW++lcb1Ntnsr0ncga
	rddQcgWUC00XHmTkyMpzytrY2pWibVZlfTvHS4nvh3HuIRTU7m5VN3q3PBQKPoUpSf6d
	BoWSlTZBNcTlF/3khq+7ydhleLPotXPotReXf7+V7b/Kimdt3KhREzqJHtfcFXp4D9/C
	V5Hg==
X-Gm-Message-State: ALoCoQkqPyMgthH7slb7MMNswhx/kG0Bw8Iaa6PMYoyC3mTEkbr8T9zgGMGw7puRxvEXaeMX++04
MIME-Version: 1.0
X-Received: by 10.112.168.170 with SMTP id zx10mr28026355lbb.0.1384297636841; 
	Tue, 12 Nov 2013 15:07:16 -0800 (PST)
Received: by 10.114.18.139 with HTTP; Tue, 12 Nov 2013 15:07:16 -0800 (PST)
In-Reply-To: <CAP71Wjw81hCY3pWe=oiedTcCSCd0_ypZ0xyiJf7=Os5QiCp9fA@mail.gmail.com>
References: <CAKS01oniO3YHFg2CAarKKaXfkSXnkEhy_JCwZNobQGqcNdM=cw@mail.gmail.com>
	<1384273172.6460.13.camel@ted>
	<CAKS01okUK2TYZ6OrnGt71wqgVinNehY8Rs9buy3JZEUrJf26kg@mail.gmail.com>
	<CAP71Wjw81hCY3pWe=oiedTcCSCd0_ypZ0xyiJf7=Os5QiCp9fA@mail.gmail.com>
Date: Wed, 13 Nov 2013 00:07:16 +0100
Message-ID: <CAKS01onxqC9we0_RgSNqAWeK7xJv87iMKKQCnsdeFPquPsSGrA@mail.gmail.com>
From: Anup Kini <akini@synapticon.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: how to populate sysroot with dev packages.
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
X-List-Received-Date: Tue, 12 Nov 2013 23:07:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

I should have explained more clearly before.

I am trying to build ethercat master software with realtime feature for
xenomai enabled.
I first installed xenomai, but few of the files from the bin are picked and
placed in the xenomai-dev.deb

While building ethercat i need to provide the xenomai root dir i.e
xenomai-dir=${STAGING_DIR}/usr
STAGING_DIR = build/tmp/sysroot/$MACHINE/usr/bin/  -- (this is the sysroot
i mentioned in the previous mail)
I want to place xenomai-dev files also in the STAGING_DIR so that ethercat
pick those files too.

Kindly help me how to fix this.


On 12 November 2013 22:56, Nicolas Dechesne <nicolas.dechesne@linaro.org>wrote:

> On Tue, Nov 12, 2013 at 6:36 PM, Anup Kini <akini@synapticon.com> wrote:
>
> > I did try that, but it does not add the A-dev.deb.
> > It will only deploy the A.deb files.
> >
> > I want to populate the A-dev.deb also...
> >
> >
> i think you might be confused between sysroot and image (or rootfs) here,
> no? what is it that you are calling 'sysroot'? in fact packages (e.g. .deb
> files) are not installed in the sysroot, but in images. sysroot is being
> populated independently of packages. on the other hand A-dev.deb would
> indeed not be installed by default in an image that you create, unless you
> specifically add the package to IMAGE_INSTALL.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 


*Anup Kini*Systems Engineer
*------------------------------*

*Synapticon*  |  Cyber-Physical System Solutions

Mobile:

Direct:

+49 151 / 638 646 73

+49 7335 / 186 999 21

Fax:
+49 7335 / 186 999 1






synapticon.com <http://www.synapticon.com/>  |
@synapticon_co<https://twitter.com/#!/synapticon_co>

Synapticon GmbH  |  Hohlbachweg 2  |  73344 Gruibingen, DE
Secretary +49 7335 / 186 999 0  |  General Manager: Nikolai Ensslen
Registry Court Ulm HRB 725114  |  USt-ID DE271647127

This message and any files transmitted with it are confidential and
intended
solely for the use of the individual or entity to whom they are addressed.
Please notify the sender immediately if you have received this e-mail by
mistake and delete it from your system.

