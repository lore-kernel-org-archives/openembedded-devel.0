Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0922A60279
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 16:25:15 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id h8-v6so1995631otj.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Apr 2018 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4+tRPGOwUNoEkARZLd9NBzgDPNKBRWtvAyrh35lAEjo=;
	b=LBwtuU8wbt80+G/lNsvHP6YeJ2tdlrWnYWdz+mLrh/3oU3JTvU5eBxszN+30JzDM04
	YANOWLY7nn5HYNiu7Jxty3vE/yFXvq830T9oqHqYxpYuYZwFnsMpQvYH8Pt8glAwWVkq
	4H8YsBunBPhMVFAAr8qkf032uSDMgzqGV07o8TuR8a2QqSYu41Ucxvm+vYP0V4Uc/bis
	yWuqC19Sr2b+2xAGyIRQ86EoiyK1x+X3bd1+uF5o12yvE23Wtp/WldthTFec6FUZSkOJ
	eIPXo/0cDlqLMfL3psst2BfkS+4SLI+Xrq/ZJ4KPMInkX+3mOsSRUgWQwCEd2bYon9UN
	swSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4+tRPGOwUNoEkARZLd9NBzgDPNKBRWtvAyrh35lAEjo=;
	b=LKF15vFiI8clRwha1L04BvwK4/1bB2J29I1PoQhl+qgEbacv5+GIoju5BuG+HTefTL
	QmYu64psmqXo88HSQuIOtLBDtBCVf45V/D59LNZ+igTveOVOpEBes9grVCqYZWoIKRaT
	PJL+UzlLhitvZtXoXWw5Y9ZI7K8BqMPImceCIC0XtB7HpN8hOTmMtmVSlzwE5H1eGRmm
	q3n1FsIaksZtlrmPji8j3FSBtwopkLh4t55B0n9oYqxGvbPrcuhdD+NKbBvi4hs+YbfE
	3YXEaCHSkbTE6a4WFGchqW4UByL9o9kSaEK/9Du880uSrdcxNJRDO0+h5zZ0DSdq85K0
	K7Bw==
X-Gm-Message-State: ALQs6tBav8j604yH0IeR4cYUjMWLFgjwxWbsT+/4wiIezWZ/IQ8fi49V
	2ZwPqXjuuTt2/FW0sfYH9RSqJPvahDxL7WkY3F8=
X-Google-Smtp-Source: AIpwx480I+XnXjuHURdDfwsOAE2kFNhEp+/eiFuFllUY+aoq3Vb6ZjoRW7+76lO2vXoI9DOJ/4/BVy23Mj0nV5WU7q0=
X-Received: by 2002:a9d:1066:: with SMTP id
	o35-v6mr2958726oto.299.1523723116653; 
	Sat, 14 Apr 2018 09:25:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Sat, 14 Apr 2018 09:25:15 -0700 (PDT)
In-Reply-To: <1523715935-58545-1-git-send-email-hongxu.jia@windriver.com>
References: <1523715935-58545-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 14 Apr 2018 18:25:15 +0200
Message-ID: <CALbNGRQPmRTOA-h_+MnQKZtaDBGVxcui4ni+OfA9_E8rn_JCdw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-gnome V3] metacity: add 3.38.0
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
X-List-Received-Date: Sat, 14 Apr 2018 16:25:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Apr 14, 2018 at 4:25 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The metacity is still maintained on github which the latest version is
> based on gtk+3
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../metacity/0001-drop-zenity-detection.patch      | 33 +++++++++++++++++++++
>  .../recipes-gnome/metacity/metacity_3.38.0.bb      | 34 ++++++++++++++++++++++
>  2 files changed, 67 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
>  create mode 100644 meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
>
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
> new file mode 100644
> index 0000000..3493e51
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
> @@ -0,0 +1,33 @@
> +From ec0e52b49c9b6869413c9544c2ed44710ab91141 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Sat, 14 Apr 2018 16:15:59 +0800
> +Subject: [PATCH] drop zenity detection
> +
> +OE does not support zenity
> +
> +Upstream-Status: inappropriate [OE specific]
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + configure.ac | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 5f9e7e9..80b32c7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -359,11 +359,6 @@ fi
> +
> + AM_CONDITIONAL(HAVE_SM, test "$found_sm" = "yes")
> +
> +-AC_PATH_PROG(ZENITY, zenity, no)
> +-if test x"$ZENITY" = xno; then
> +-  AC_MSG_ERROR([zenity not found in your path - needed for dialogs])
> +-fi
> +-
> + dnl **************************************************************************
> + dnl Check for Vulkan support
> + dnl **************************************************************************
> +--
> +1.8.3.1
> +
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
> new file mode 100644
> index 0000000..48fc914
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.38.0.bb
> @@ -0,0 +1,34 @@
> +SECTION = "x11/wm"
> +SUMMARY = "Metacity is the boring window manager for the adult in you"
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b4cce53560b8e619ffa7c830fb8761aa \
> +                    file://src/include/main.h;endline=24;md5=72148ede07a6dadd01de6a882d20a9ad"
> +
> +DEPENDS = "gsettings-desktop-schemas startup-notification \
> +           gnome-doc-utils gdk-pixbuf-native \
> +           gtk+3 glib-2.0 libcanberra libgtop intltool-native"
> +
> +inherit autotools gettext gnomebase distro_features_check
> +# depends on startup-notification which depends on virtual/libx11
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +SRC_URI = "git://github.com/GNOME/metacity.git;branch=master \
> +           file://0001-drop-zenity-detection.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "c0d4b2fc0fcd6f2d3c37da935923f9e9ed5eb99f"
> +
> +EXTRA_OECONF += "--disable-xinerama"
> +
> +do_configure_prepend() {
> +    cd ${S}
> +    aclocal --install || exit 1
> +    autoreconf --verbose --force --install -Wno-portability || exit 1
> +    cd -
> +
> +}
> +
> +FILES_${PN} += "${datadir}/themes ${datadir}/gnome-control-center ${datadir}/gnome"
> +RDEPENDS_${PN} += "gsettings-desktop-schemas"
> +
> --
> 2.8.1
>
Thanks for updating

Andreas

