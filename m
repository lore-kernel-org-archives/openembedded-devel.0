Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0A88278200
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Dec 2017 19:23:14 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id l24so5405818pfj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 11:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=od4DsQCm7Vo8D6g0kARdFjiF+wpwBL8JLIPEqxIVOTM=;
	b=XqU+BxSDEtlDi/D/SbUssh4IpOCxE8l3TKtKzEeqJtD0ZU/7Eawa3i71NgnG8shFo6
	fitSB5tubRw45G9EdcIa494WvnliExJkkFKpQZw1MGQl1ci3zzlRnmyA7W7H8CeunV1T
	PuveCOxH1KZHqIopyFXw2j/oufWz7BLGpjf26muvPh9/oWyZVR1KKY33XCsPc5CSGfPr
	aWzDPnzfGzCJwKqu3l1zCj6uxKMd/2/DbNoEhtqwNNmd1OnTG6Hmto5+9utGJz0q/c/e
	LFOqVHjQzVACaQczimaphRFOzRtJK/OwnUfhNUl26moFlYkYiTvSo6qEBbl2O6Bcg6v2
	l8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=od4DsQCm7Vo8D6g0kARdFjiF+wpwBL8JLIPEqxIVOTM=;
	b=LKGOW3nXZP96qcxFfrLza/fm+siPpE/BNJoDycaJlDcsHGaYfATH9tRup2qCPMl2iI
	91XQPc+d7hXUPZSwYcvef77FFrvh8umMWBrI6W/6srPE5/I06LaZ1xo1JdDPDI6PI6q6
	vp85edVKPtquVWbC146TBfwu8f4SZ6VPE7zAiSvUSK87TyEszZO3BOx7lYnu7g/PYdOM
	gUmynbWriWjS78Ld87Th+4f2eIbi+uTHqTS3fiarcmgVEoAHqT+DeO7s/xiMDLB5joiT
	bofErlXV6vubImAm18C09zq1KRMO0m0f43itTcHYU1gHJrUZEo5YQVkQNhOZOW6TBy3r
	zvfg==
X-Gm-Message-State: AJaThX4oRGrfg2sxtEa6ICi6mJSFOtr8mRQPHLF44dJsxqzIdTlU33Ky
	KH1yd3Rzki0sUMvVdU++Tf4b8u027GqOv/g93pg=
X-Google-Smtp-Source: AGs4zMYJra42SxnfXvH6hgcivbvTGta/rvaFs9xiohgMlZZdgiBOFsi6BjaJ3ni9bXbGuf+UKQsMbhZYjIJndc8Je3M=
X-Received: by 10.99.129.73 with SMTP id t70mr26460313pgd.227.1512674595939;
	Thu, 07 Dec 2017 11:23:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 7 Dec 2017 11:22:45 -0800 (PST)
In-Reply-To: <1512652745-22945-1-git-send-email-dmitri.vorobiev@movial.com>
References: <1512652745-22945-1-git-send-email-dmitri.vorobiev@movial.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2017 11:22:45 -0800
Message-ID: <CAMKF1so1QVxOL7V0mJMxGmX5A2ccduwY00XveGU+954XcPQ11w@mail.gmail.com>
To: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 07 Dec 2017 19:23:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 7, 2017 at 5:19 AM, Dmitri Vorobiev
<dmitri.vorobiev@movial.com> wrote:
> Use the latest version of usb-modeswitch (2.5.1) and
> usb-modeswitch-data (20170806).
>
> Signed-off-by: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
> ---
>  ...-modeswitch-data_20140529.bb => usb-modeswitch-data_20170806.bb} | 6 +++---
>  .../{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.1.bb}            | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20140529.bb => usb-modeswitch-data_20170806.bb} (66%)
>  rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.2.0.bb => usb-modeswitch_2.5.1.bb} (79%)
>
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
> similarity index 66%
> rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
> rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
> index a265411..3926feb 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20170806.bb
> @@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  inherit allarch
>
>  SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "dff94177781298aaf0b3c2a3c3dea6b2"
> -SRC_URI[sha256sum] = "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6ec8417aa9a587e536"
> +SRC_URI[md5sum] = "fb50d15b52e909d742dd16f0a9882316"
> +SRC_URI[sha256sum] = "ce413ef2a50e648e9c81bc3ea6110e7324a8bf981034fc9ec4467d3562563c2c"
>
>  do_install() {
>      oe_runmake install DESTDIR=${D}
>  }
>
> -RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
> +RDEPENDS_${PN} = "usb-modeswitch (>= 2.4.0)"

is versions specific dep still needed.

>  FILES_${PN} += "${base_libdir}/udev/rules.d/ \
>                  ${datadir}/usb_modeswitch"
> diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> similarity index 79%
> rename from meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> rename to meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> index 425f66b..e2d211b 100644
> --- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
> +++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.5.1.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "libusb1"
>
>  SRC_URI = "http://www.draisberghof.de/usb_modeswitch/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
> -SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
> +SRC_URI[md5sum] = "7e6435a2afe7aed8574fe59cf09a3503"
> +SRC_URI[sha256sum] = "f6e44bfc6e8d531ac6759791cf79ee9c618e7894fcf37170c8a5559718f9abd2"
>
>  EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

