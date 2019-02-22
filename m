Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 576597CBDD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:17:52 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id s1so3333566qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=+Ha9TwVe6T1X5uHaRXpozWXMgQf889IQbxowqDA9dq0=;
	b=Lwo7fhQjOALg6w7FQlDUMgpmn4d8bPaaVmvYMup3DKPCknNgCQ+scWdtRzlXYMZxNI
	URMmnTCnRzzhBXWDBOOjIUqz52Ex4ZGQBOUZYlae1Lpw1thZ6Kl1s3gbd5emsT7Dveef
	KEXg7qdceqo22771BR+kNcBaH0V32s/Vp5lKYlWRa4xBJyQfD0tuDzxa8bm+EE1MAFlI
	FbROlcKxJ+26kgEkKsbSxa4IyhE/nfOhOhVMYDrKtQpP0cwHqvadnkvdEXPIw4kUnxtj
	yepoMp+ozQJ91ytOT8H7680ixoyBEqcJ9HpncoAI5gFlGpbRyP0b/Llnxrp1JNUgkFu/
	98YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+Ha9TwVe6T1X5uHaRXpozWXMgQf889IQbxowqDA9dq0=;
	b=qmXTWFUzEsqWDDeqoW2C/sGhbr6f/HnSI8ymJwJAE6qtVpFg42D0b6la48ceiX09pb
	9gSioapOgL6H/5jk3V1dvWnY3bjgbtdLYy2PJAe0aIRxm/GB503CCLqrA2zOvPEIHh97
	8vK2IEI4BYx9/rFq5J0g5XB1w84s10ehwYTs5bPl/snClCzHhTZ45kU5MkU45iB6Fh0a
	ESPizptUv6YzJgEoiBSy3GEfhDj+Gz1HMyiMZIQF/JnGsobpwBh9B//6BXT1tBhKMBxh
	ZBCvLh7S+6ryj0MZbSdRjNovBeFmq15EISlyrnk52FaNrPwrcMVQfd5KI2sucfKdyyDS
	zNqw==
X-Gm-Message-State: AHQUAuYqwgKkRRWTHR02dgfYH3lSIjr1TPIgkPb8i0XKm1yM/hKCPhT9
	0KH8rX4CNa73aXK63/8nh7bQbfQNzLehDS6BoHGfUxFa
X-Google-Smtp-Source: AHgI3IarLPZRyuyfAvhssqyzT0sdz/WvXY6dF2tdwpNDthoArdd25zVriKvrqk61cb2/XdVOpS67B3CV3F6dOOvNS40=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr3817434qta.254.1550855873017; 
	Fri, 22 Feb 2019 09:17:53 -0800 (PST)
MIME-Version: 1.0
References: <35f095b0-e865-3794-e16f-f7d7ca17c770@viosoft.com>
	<CAMKF1sowGDE5y80P=U7oo-k7SQdz5gfm=sHw6XULE0KO4EWfXw@mail.gmail.com>
	<53f8f596-93a9-845e-2364-051044fab99d@viosoft.com>
In-Reply-To: <53f8f596-93a9-845e-2364-051044fab99d@viosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Feb 2019 09:17:26 -0800
Message-ID: <CAMKF1sovc3S5PisVyZaxunowch5+XWoKb1n8oOgCK9FzxWsupg@mail.gmail.com>
To: Hoang Anh Tuan <tuanha@viosoft.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 1/2] tk_8.6.9: Add tkConfig.sh in crossscript
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
X-List-Received-Date: Fri, 22 Feb 2019 17:17:52 -0000
Content-Type: text/plain; charset="UTF-8"

I use patchwork to fetch patches can you try it from patchwork ? wget
the following and then do git am

https://patchwork.openembedded.org/patch/158998/mbox/
https://patchwork.openembedded.org/patch/158999/mbox/

On Fri, Feb 22, 2019 at 1:35 AM Hoang Anh Tuan <tuanha@viosoft.com> wrote:
>
> I tried to apply on master or master-next and it worked. What do I have
> to do now?
>
> On 22/02/2019 11:25, Khem Raj wrote:
> > Does not apply. Please rebase it on top of master or master-next and resend.
> >
> > On Thu, Feb 21, 2019 at 6:11 PM Hoang Anh Tuan <tuanha@viosoft.com> wrote:
> >>
> >> Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
> >> ---
> >>    meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb | 25 +++++++++++++++++++++++++
> >>    1 file changed, 25 insertions(+)
> >>
> >> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> >> b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> >> index 9eec4bb..459ae82 100644
> >> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> >> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> >> @@ -50,6 +50,11 @@ do_install_append() {
> >>        ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
> >>        oe_libinstall -so libtk${VER} ${D}${libdir}
> >>        ln -sf wish${VER} ${D}${bindir}/wish
> >> +
> >> +    sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
> >> +    sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tkConfig.sh
> >> +    install -d ${D}${bindir_crossscripts}
> >> +    install -m 0755 tkConfig.sh ${D}${bindir_crossscripts}
> >>    }
> >>
> >>    PACKAGECONFIG ??= "xft"
> >> @@ -69,3 +74,23 @@ BBCLASSEXTEND = "native nativesdk"
> >>
> >>    # Fix the path in sstate
> >>    SSTATE_SCAN_FILES += "*Config.sh"
> >> +
> >> +inherit binconfig
> >> +
> >> +SYSROOT_DIRS += "${bindir_crossscripts}"
> >> +
> >> +# Fix some paths that might be used by Tcl extensions
> >> +BINCONFIG_GLOB = "*Config.sh"
> >> +
> >> +# Cleanup host path from ${libdir}/tclConfig.sh and remove the
> >> +# ${bindir_crossscripts}/tclConfig.sh from target
> >> +PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
> >> +tcl_package_preprocess() {
> >> +        sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
> >> +               -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
> >> +               -e "s;${STAGING_INCDIR};${includedir};g" \
> >> +               -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
> >> +               ${PKGD}${libdir}/tkConfig.sh
> >> +
> >> +        rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh
> >> +}
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

