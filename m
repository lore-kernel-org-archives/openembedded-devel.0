Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
	[209.85.160.181])
	by mail.openembedded.org (Postfix) with ESMTP id E7A317CBCA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 04:25:53 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id y4so1127452qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jwp8FG5bEysyncsbEnlYH1saEWws92U3fUB455zRpZw=;
	b=NRr0eF6S//NykbzUskbfrBcz1Yp+Wn7nhaGx9hEIucJfF8gtTMm71ZEt7/ipCNs0t+
	s/0v0SN4J4ZpX1AHeoOzUyFDj8o3/nV+wqgFe7+8pWZSIOvHgn1fBxasKT75Yn6uasg/
	l/ZBq08RorDh3tJNaZlKRikmoPMKnzfNeIIpPmAD56cCdvpY5FQ7K4T8sFvImGM+JJAN
	BbUQmKvwgKsQDaq+IvxjUE8ycHynIIrExRAYCajVh86Ekka1oIS3dWXAadefr6PpUZXj
	rMz3kEUC2i2uKql6KqU6GP85prkOioUrDSgVMTA9kXOgy+p/3inSdh9V42mmnzF/CvcA
	FDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jwp8FG5bEysyncsbEnlYH1saEWws92U3fUB455zRpZw=;
	b=Le0GLCn6aELhHM/GY0mQGmaRFcUe+Df2PdZChVEuWwfvyDw3ztSX0q0M+1RqLurQtP
	jdTmEmXcLXqCCRmwxyyHi7LMcgcZ1ZeqpTOVVgJq7vf8xydqwvPxRf10PkdSws+LDce2
	jwXPjKZdQT7GJJ2bqaRn0HvhLZe4t1rHECQfUei0pB/2aSGPJ44XjdIhppOL8mFG5fA5
	xZmyyWateTJVX1i+k5iJxczrp/z8GufZUWoh97hFH0qKPMj4Ql/oZ7voMB0QPuaV+aGi
	levxu7YMEJNbwcpPAy8xDyXpUOGS1Wvm2OteIKeO20+1Bly6zNjCGkDiyaVDcgHHiIFK
	FH3Q==
X-Gm-Message-State: AHQUAuYAnlGvClJdzDc4xTBoJyNmgb+sAmHcVRwXy4p7VPxcjQD3ITss
	H3j/VXtNAE2nHjdZoYr4mJ60DZ3iiPGS4WKsq9E=
X-Google-Smtp-Source: AHgI3IZsyfTmsg9qaEsB6WdtvilX2LsmG9Npnzy+TissO/DvX2bwZ31oCUmHVfNo4URz+gVyB3zGhm8ofSDr2ErxMEM=
X-Received: by 2002:a0c:d80f:: with SMTP id h15mr1637592qvj.228.1550809554631; 
	Thu, 21 Feb 2019 20:25:54 -0800 (PST)
MIME-Version: 1.0
References: <35f095b0-e865-3794-e16f-f7d7ca17c770@viosoft.com>
In-Reply-To: <35f095b0-e865-3794-e16f-f7d7ca17c770@viosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 20:25:28 -0800
Message-ID: <CAMKF1sowGDE5y80P=U7oo-k7SQdz5gfm=sHw6XULE0KO4EWfXw@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Feb 2019 04:25:54 -0000
Content-Type: text/plain; charset="UTF-8"

Does not apply. Please rebase it on top of master or master-next and resend.

On Thu, Feb 21, 2019 at 6:11 PM Hoang Anh Tuan <tuanha@viosoft.com> wrote:
>
>
> Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
> ---
>   meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> index 9eec4bb..459ae82 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> @@ -50,6 +50,11 @@ do_install_append() {
>       ln -sf libtk${VER}.so ${D}${libdir}/libtk${VER}.so.0
>       oe_libinstall -so libtk${VER} ${D}${libdir}
>       ln -sf wish${VER} ${D}${bindir}/wish
> +
> +    sed -i "s;-L${B};-L${STAGING_LIBDIR};g" tkConfig.sh
> +    sed -i "s;'${WORKDIR};'${STAGING_INCDIR};g" tkConfig.sh
> +    install -d ${D}${bindir_crossscripts}
> +    install -m 0755 tkConfig.sh ${D}${bindir_crossscripts}
>   }
>
>   PACKAGECONFIG ??= "xft"
> @@ -69,3 +74,23 @@ BBCLASSEXTEND = "native nativesdk"
>
>   # Fix the path in sstate
>   SSTATE_SCAN_FILES += "*Config.sh"
> +
> +inherit binconfig
> +
> +SYSROOT_DIRS += "${bindir_crossscripts}"
> +
> +# Fix some paths that might be used by Tcl extensions
> +BINCONFIG_GLOB = "*Config.sh"
> +
> +# Cleanup host path from ${libdir}/tclConfig.sh and remove the
> +# ${bindir_crossscripts}/tclConfig.sh from target
> +PACKAGE_PREPROCESS_FUNCS += "tcl_package_preprocess"
> +tcl_package_preprocess() {
> +        sed -i -e "s;${DEBUG_PREFIX_MAP};;g" \
> +               -e "s;-L${STAGING_LIBDIR};-L${libdir};g" \
> +               -e "s;${STAGING_INCDIR};${includedir};g" \
> +               -e "s;--sysroot=${RECIPE_SYSROOT};;g" \
> +               ${PKGD}${libdir}/tkConfig.sh
> +
> +        rm -f ${PKGD}${bindir_crossscripts}/tkConfig.sh
> +}
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

