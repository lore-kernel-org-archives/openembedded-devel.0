Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3845078401
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 18:24:20 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id m18so2234013wrm.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 11:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0anvquFwUuw6zjGJ/uIrDoFUgL57uL9yhck9z0QMf24=;
	b=Y/djXbO9mfX5uKouTDN2hwyRc9OGtTjtVnBpi2QhawKUPKy4bMUx8CZAbbP7yOQI65
	rEqszSsmkyAIAhT2REtBshvOV9jGk94XfIZNWHjUtKdGoc65v0Z5Y3K3l9C0mCsmOk6Y
	31oGcW39EpSI2XgjeYer97s6lO6WRjkYm501NMfIRjtA3pA256qDOqxz8jjfaE0jjlWO
	ATAuSD+N9KyCyvdbYmmNLJs8ZUt9AhSmeJE4bBPem6GcA2RglM8RSKA9eR+DSFPIkXr4
	/VHsEczj8buD1kQC/izrvcxknyhxulqf7FYmB1l66TrdQzDeKR7WZYu8gJRhbJISkMCY
	sxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0anvquFwUuw6zjGJ/uIrDoFUgL57uL9yhck9z0QMf24=;
	b=fE0dI47iIbpp/6uksGJTCOVcgfpe+hQDtFaeOG4ObYnS9YbVk6rpwJVj3n4vS4QbE8
	KhYIFEbJQ9OxIlx58fp8n2SWrQp+uesLIkyOanpyLK6ZlKThEcZxyTR0lR+xF/R4LP2b
	SROPlgWOG1gRFHgPS1CtVhAm6xfQmOtw07+ClXmmDiIMQQdhtxVvTb2tfbevAm2qa63w
	GEn5sufXiXNPGwhyStUi7eYYkSG/6fi1T9zkYkhbfnOerVPeijH9c0Y2lsR5WxU2vuij
	J8lTHPh4w5hQUda362JpDfFcrr3Xo04EjC4Tkqtclod8jAHh8Kfruak53E4KA3BGWRD7
	oRiA==
X-Gm-Message-State: AHPjjUjtFWUnGaQ9fXRt/LPhX72gStpe0gh4jM7eCgB5pdkuGwDgmNTW
	g6ZYfT972kYeWSG00CjHJ8ST+y2TxxurZ2GaVLI=
X-Google-Smtp-Source: ADKCNb7Ddj8OEL3vsCaydjNOOYaAEKtoVDaQl4WerpQ2i9au+OVAHnu1sJZB+aDNJa5SCayGaFP0HXfs3IRLgsZxIm0=
X-Received: by 10.223.186.6 with SMTP id o6mr15127890wrg.263.1505327061991;
	Wed, 13 Sep 2017 11:24:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.141.198 with HTTP; Wed, 13 Sep 2017 11:24:21 -0700 (PDT)
In-Reply-To: <20170913174419.34815-1-raj.khem@gmail.com>
References: <20170913174419.34815-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Sep 2017 11:24:21 -0700
Message-ID: <CAJ86T=VWQ_9OK+ftw5j=cz_G1HMdviQRQz2D_k8UpSKJCMtnmg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH V3] klibc.bbclass: Add -mfloat-abi on arm
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
X-List-Received-Date: Wed, 13 Sep 2017 18:24:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 13, 2017 at 10:44 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Default toolchain is not configured for hard float
> therefore we need to pass the right -mfloat-abi option
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> Changes in V3: Append -mfloat-abi only on armv6

The change seems to be for armv7a and armv7ve, not armv6 ?

>  meta-initramfs/classes/klibc.bbclass                         | 2 ++
>  meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
> index c9de58cec..1ec7b2b05 100644
> --- a/meta-initramfs/classes/klibc.bbclass
> +++ b/meta-initramfs/classes/klibc.bbclass
> @@ -5,6 +5,8 @@ DEPENDS =+ "klcc-cross"
>  # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
>  CC_forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
>  CC_forcevariable_armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
> +CC_append_armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
> +CC_append_armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
>
>  CPP_forcevariable = "${CC} -E"
>
> diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
> index 867407723..8ca1ca727 100644
> --- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
> +++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5.1.bb
> @@ -21,7 +21,6 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;tag=b7455d847ab4f9eeeb6a729efc3
>  S = "${WORKDIR}/git/"
>
>  EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
> -CFLAGS += "${TUNE_CCARGS}"
>
>  do_install () {
>
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

