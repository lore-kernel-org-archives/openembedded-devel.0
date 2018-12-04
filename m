Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 210C06CA1C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 04:58:01 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v11so16667976qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 20:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ogur3/XMobZfQM8RXuR3MYqvT8EcsnhtEuVrjsR9DiA=;
	b=CVslvSiIzYwFVuGKLQkGYjgBEopHG9d+pSLWWdhgZPMTeK52HoWVmSMlSH2X/Jpw+M
	2mM9hHtspgw5iUnEIciTTAlfi3S71LZsVCtaFP8CTrU4DapehS7CXgg/RhtqAVXSsHjC
	x5hfPXTpQvwdHakIg5KiVPAaj5Aoabgp4uDjJt13fen2z4pEyVS4SexuilvaHmdKi/1x
	7ML0+nQIVu2ZO33OsmwwISUdqSXevdIfBvhbJg9aH4tV3R7uYX9JdI1R+sLzIOGh/WUx
	Xf+09LAMbL8ndPcTO/W3E9gwHhPN4TPLFPEdt+/FMQG5zoU6twOd2mfis0PrvmuEIS2i
	fByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ogur3/XMobZfQM8RXuR3MYqvT8EcsnhtEuVrjsR9DiA=;
	b=uEEmR5x36cOzNVf2AeBTFuacXcA+f1OTKmnhPqhihYdT2hxlAQUVth2RAr0gCFCF7u
	tos6euCpfoqn98lv/b77WFOhXa5I81aC1DHE/uroH08it1c/YZs5kbkWirQM4mtCASTx
	G1RtrN1ImmWxhwfDJFMaAMoCz6N3BoSt+kaDCSesFWD+Jjh7cbFFfXYXikg0JR24vptg
	MNwou0duBbQ7fBTMCHM+xXA2y5Hc7bjOsSyTRFBSvaIYfRNMk8Dg3+TYzzon3pUflDUy
	FdFsnoJdNZJ5lI1Z/blPMJgdf0DOYeaao5dSLkCllOp60rZBNL5iHDGj9eaXJAZbHJyR
	Hksw==
X-Gm-Message-State: AA+aEWbA44CsnXqe0tzQmcvxdL9kTX6y52iMCFWVG65uzeZHNrD9dovS
	joslQQnkB7lTHADCz48DwGQVqi98fMtITW2Ukplocbu9o2Q=
X-Google-Smtp-Source: AFSGD/XMsFsIoz5UgpcHzxml1uRZ+inwEtU39Ix9KMVQq8ZHVagmWdUvPR27BaknKHjQ6NlAUVIaBqDxWtEjiGAW2Yo=
X-Received: by 2002:a0c:98a1:: with SMTP id f30mr17951149qvd.224.1543899482727;
	Mon, 03 Dec 2018 20:58:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1543840903.git.psaavedra@igalia.com>
	<8b31d1e2ae4c91f272c1793e287e79a5f9deac4b.1543840903.git.psaavedra@igalia.com>
In-Reply-To: <8b31d1e2ae4c91f272c1793e287e79a5f9deac4b.1543840903.git.psaavedra@igalia.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 20:57:36 -0800
Message-ID: <CAMKF1sp=19A269xy9-Qc4RpN1mTc1B6uNt_Pt16tyHviFqmdQQ@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-openembedded][PATCH v4 4/7] ibus-anthy: add ibus-anthy recipe
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
X-List-Received-Date: Tue, 04 Dec 2018 04:58:02 -0000
Content-Type: text/plain; charset="UTF-8"

fails - http://errors.yoctoproject.org/Errors/Details/203282/
On Mon, Dec 3, 2018 at 4:46 AM Pablo Saavedra <psaavedra@igalia.com> wrote:
>
> It is a Japanese input engine for IBus.
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  .../ibus/ibus-anthy/fix_anthy_include_in_gir.patch | 19 +++++++++++
>  meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb  | 37 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
>  create mode 100644 meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
>
> diff --git a/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
> new file mode 100644
> index 000000000..9812be08f
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus-anthy/fix_anthy_include_in_gir.patch
> @@ -0,0 +1,19 @@
> +Index: ibus-anthy-1.5.10/gir/Makefile.am
> +===================================================================
> +--- ibus-anthy-1.5.10.orig/gir/Makefile.am
> ++++ ibus-anthy-1.5.10/gir/Makefile.am
> +@@ -68,12 +68,12 @@ Anthy_9000_gir_SCANNERFLAGS = \
> +       --warn-all \
> +       $(NULL)
> + Anthy_9000_gir_INCLUDES = GObject-2.0
> +-Anthy_9000_gir_LIBS = $(libanthygobject) anthy
> ++Anthy_9000_gir_LIBS = $(libanthygobject)
> + Anthy_9000_gir_CFLAGS = @ANTHY_CFLAGS@
> + Anthy_9000_gir_FILES = \
> +       $(libanthygobject_1_0_la_SOURCES) \
> +       $(anthyinclude_HEADERS) \
> +-      $(ANTHY_INCLUDEDIR)/anthy/anthy.h \
> ++      $(STAGING_DIR_HOST)$(ANTHY_INCLUDEDIR)/anthy/anthy.h \
> +       $(NULL)
> + INTROSPECTION_GIRS += Anthy-9000.gir
> +
> diff --git a/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> new file mode 100644
> index 000000000..d42f87ae5
> --- /dev/null
> +++ b/meta-oe/recipes-support/ibus/ibus-anthy_1.5.10.bb
> @@ -0,0 +1,37 @@
> +DESCRIPTION = "It is a Japanese input engine for IBus."
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> +SECTION = "inputmethods"
> +
> +SRC_URI = "https://github.com/ibus/${PN}/releases/download/${PV}/${PN}-${PV}.tar.gz \
> +    file://fix_anthy_include_in_gir.patch \
> +"
> +SRC_URI[md5sum] = "d7c2c410619edacfbaca6a9d02ed8982"
> +SRC_URI[sha256sum] = "cc33e0d1afe7e4a1f0a092d2a4575269ac21373771e49579c434afb4eef9f84a"
> +
> +# Needed to find the Anthy included headers (anthy/anthy.h)
> +export STAGING_DIR_HOST
> +
> +inherit autotools pkgconfig gettext gobject-introspection gtk-immodules-cache gtk-icon-cache gsettings qemu
> +
> +REQUIRED_DISTRO_FEATURES = "x11"
> +
> +DEPENDS = " anthy ibus gobject-introspection adwaita-icon-theme"
> +RDEPENDS_${PN} += " ibus takao-fonts anthy libanthy0"
> +
> +DEPENDS_append_class-target = " intltool-native qemu-native"
> +
> +do_configure_prepend() {
> +    export PYTHON=python2
> +}
> +
> +
> +FILES_${PN} += " \
> +    ${datadir}/icons/* \
> +    ${datadir}/ibus \
> +    ${datadir}/appdata \
> +    ${datadir}/ibus/component/anthy.xml \
> +    ${datadir}/appdata/ibus-anthy.appdata.xml \
> +    ${datadir}/gir-1.0/Anthy-9000.gir \
> +    ${datadir}/glib-2.0/schemas/org.freedesktop.ibus.engine.anthy.gschema.xml \
> +"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

