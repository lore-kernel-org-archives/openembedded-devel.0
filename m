Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB78C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 05:56:48 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.919.1790143004568092490
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 22:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YqR5cUay;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab22370so454416d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790143003; cv=none;
        d=google.com; s=arc-20260327;
        b=NEVdqrMaFJkaIF8BvfsUAtJbjGPPdf5jYXeY0X+LpOx/6cWnjCG1VOC/3x9Fw3YTL9
         32SI23b9ZgiULwZ07/hFn8bklZ6GyynqxUkdCvMQkKw9VnhnAaXk/+461J5uQrlA5Ck5
         S1RT5I9hrcrKx7GrNHb9aZ7iBZOitHRoWpjwYC7Sq+RWjND1XnXgYYEIzNt4/NcQDDl9
         ZS04gBLIm+7QFR0q4JdFYVnycATg6QzUBXaa446m4AJMSLsmJ3UX/sZJSBt9E6fjf/ZX
         zqANBldCK65SXU20t0lmYTTIhHTJSYolgSh6PYhpRjAal3S1UqMdhf5xAy1VORYGEoDg
         yT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UCtCfNTRoFaLMDdkeRomhbErF4tiLS4Hf9zuK8eGH+w=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=oUPWQqWu5p9I876CHeW/rVFPQytY3RY8dJMgzBXml6K3UktK0HLzQfjKmKmoPwUA9N
         zCIoPeAX2gvG59AQzlnrwvxsjRJWQ+DZH9B1LZWOB/1fjqNYIZu7TeuzM1k2Bq8YLLnq
         vYE8UjUoxJ9eSXAC4N1FKRo7/fkeRWboPO+z4vZlAEzVI5T07uxmO1a78YYbthSA3op0
         pKQvqweQZMnQX4MS40FjV2HfZtYUKIBQPFBHdAIjjPaGgNMPX38a3NE3NJYIi0n4BRMd
         lvMZ1/VAFoSaWxifuU+NyTEaFc5THNh/44MVFIsFF6gr7C4MnGH2SVznZD+tytA2qEAq
         qqig==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790143003; x=1790747803; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCtCfNTRoFaLMDdkeRomhbErF4tiLS4Hf9zuK8eGH+w=;
        b=YqR5cUay5d/Z+upL6sN6YKwLLzw9JpJLQstdd0gsvlO394HHzEdfUMJWrvJK/EAVmt
         72aquBCAAEbjQZGrSCngB1m/ed9Y5c31pvrw5zo7yhJ7BSLXBUkqModnUHYQ/gAcA1q0
         W7uBjjf2171c05xFpszOgIwLoPnJQyoKVKnWKan7CtrPYV+/1kRApODtTtKKQ0whdMlV
         CCy4TTBykiNqfWswjyyE7nyC7r1NsX36b2tz+c8WDdcjMcPCvQWWzZn33fxrYy9TwTzR
         3wU0Qxzr/G5oCxW5tuGv8kbCoQNA7JcnzF0N+5Roh025g7sMZsI+TaXtCN47Ihhj+sLJ
         hRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790143003; x=1790747803;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UCtCfNTRoFaLMDdkeRomhbErF4tiLS4Hf9zuK8eGH+w=;
        b=FXDE24QQo/QebY3q1GGznqRX+nYlWPyX+VfL3cC9U1s02lN7cNcbHdnFPn2BF3Ch0b
         RqPNPMX4jHR5pRv9ovTsbvspczQgTgCJW2hhR+D/q84bkA8OiWyk+TYvf4VpSz/4PHes
         gSfUtBM4/+yZlnRLaSx78YnvxEj3G+K22Wg6gxqk/zIU3Rc4iFpJtJOspNtGgsV56MDr
         Oco1KONr5wdpfW2WCvQRIvHnsqSfan2ySVZ5L+jsfCQzoLnFzeLRJz5YooWtcQYSA/39
         n9pcSQy5ZupHSBjdxFSO+ZGoom7q3k6gwUe90vSx/YSzYNh4MzxOyw63swe0VG4i21TA
         d+oQ==
X-Gm-Message-State: AFuF++lRF6pm/OW5URXBRvHFqg3mGGeR181OVuLvuNCuvGbN1vas2i7d
	PMD7mAOpcZkbkZMY3kBJCHpS7Ixk0vqIASNxoHPrQmMQMMUbJqDUHX1LNsEXKQLeqMNcvAd99Ft
	etgP6/iuZAjRYpEo0W+wD7O1KYXV5URU=
X-Gm-Gg: AYBFou2rJ+7735Ir8n9mBz0LH5d3OR7Dnfhd6y17kazDoO9LLfx372SiqdNse/4OxP6
	iA4CebAMYJzoGA882qbkuxyPx/Va2VTD9VVxJ4GJKuV4HTQhLHlmJRmUg9/m4bt5l7JXiEK45YE
	lmfmm6wNN0iYLMpL22YZKs7bhlTJ1yyp8DVrxhz1wH5nrGEnQdQ9BW/YDvqkCkenz67IIa4u6SC
	wIy5BqCvs2TMN2J7yw4g0j2+XfDcTEF9Kmvrbc85fg21j+RHvm4x3XqimwgC1hhxty18Pw8EJOp
	8yYQgwmXzev//EqrU9sgyc3BumIE1NIfn06qTxX3R1PO2SENpCxtv7YnSQW8MdlwpmY3f1dx9gy
	Iqtc0ABPRj5YwFDqHWI3eAH62n1gbI2jd6uQhFnVc0XjgPSx6MJ+hlyUBfrgGrGSzJAjmoUNIxl
	2ZXEIYCNqLYkDEjF84XZjAjgRQCmnO6I/OlAo/ZSXV//1yKrLLWeWr1u3F0XRHJJ0GaYUQavS1z
	dyHnM6BpQei+Ddq+3Kw+wM+/TZUWf8x41P5V+Y6/+E5xKrf6jUEjSEKFK1FOXq1u4Vt0YYRWqss
	XE/Azsg/zYRqbILelsGQValErcsxOGJUq5cvezzx
X-Received: by 2002:a05:690e:4401:b0:66f:c1be:315d with SMTP id
 956f58d0204a3-672d595346emr398234d50.52.1790143003378; Tue, 22 Sep 2026
 22:56:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260922072619.228493-1-f_l_k@t-online.de> <20260922072619.228493-3-f_l_k@t-online.de>
In-Reply-To: <20260922072619.228493-3-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Sep 2026 22:56:16 -0700
X-Gm-Features: AcwNN1Un7aoQQ3QLkLhcvdpwhEtmkWY3urJys6yJWV8g0yDvlCp0CEI2zpX8ecs
Message-ID: <CAMKF1sq+2HF4tyd0R7VUzYeE9B3b-PJ=6nK=-FQbu_fGR_p6Bw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2 3/3] convey: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d0486a065c202565"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 05:56:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130185

--000000000000d0486a065c202565
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

when built for qemuarm64 on an arm64 build host it ends up with

https://errors.yoctoproject.org/Errors/Details/972887/

On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Markus Volk via lists.openembedded=
.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> Convey is a fork of geary ported to GTK4, libadwaita, gcr-4 and
> webkitgtk 6.0. The patches keep build paths out of the binary, drop
> host checks that do not apply when cross-compiling and let the vala-unit
> subproject find g-ir-compiler through the cross file.
>
> AI-Generated: Uses Claude Code (Claude Fable 5.1)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-not-store-build-paths-in-the-binary.patch | 40 +++++++++++++
>  ...ck-for-the-iso-xml-files-and-the-C.u.patch | 39 ++++++++++++
>  ...k-up-g-ir-compiler-with-find_program.patch | 34 +++++++++++
>  .../convey/convey_50.2.bb                     | 59 +++++++++++++++++++
>  4 files changed, 172 insertions(+)
>  create mode 100644
> meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-not-store-bui=
ld-paths-in-the-binary.patch
>  create mode 100644
> meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-not-check-for=
-the-iso-xml-files-and-the-C.u.patch
>  create mode 100644
> meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-look-up-g-ir=
-compiler-with-find_program.patch
>  create mode 100644 meta-gnome/recipes-connectivity/convey/convey_50.2.bb
>
> diff --git
> a/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-not-store-b=
uild-paths-in-the-binary.patch
> b/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-not-store-b=
uild-paths-in-the-binary.patch
> new file mode 100644
> index 0000000000..91e21fd0ec
> --- /dev/null
> +++
> b/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-not-store-b=
uild-paths-in-the-binary.patch
> @@ -0,0 +1,40 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 22 Sep 2026 07:43:41 +0200
> +Subject: [PATCH] meson: do not store build paths in the binary
> +
> +The build root and source root are only used when convey runs
> +uninstalled, but storing them puts TMPDIR into the binary and breaks
> +reproducibility. Point them to /usr/src and the schema directory to the
> +installed location instead.
> +
> +AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + src/meson.build | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/meson.build b/src/meson.build
> +index 87690ada..ce722126 100644
> +--- a/src/meson.build
> ++++ b/src/meson.build
> +@@ -4,8 +4,8 @@ conf =3D configuration_data()
> + conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
> + conf.set_quoted('G_LOG_DOMAIN', meson.project_name())
> + conf.set_quoted('APP_ID', convey_id)
> +-conf.set_quoted('BUILD_ROOT_DIR', meson.project_build_root())
> +-conf.set_quoted('GSETTINGS_DIR', meson.project_build_root() / 'desktop'=
)
> ++conf.set_quoted('BUILD_ROOT_DIR', '/usr/src')
> ++conf.set_quoted('GSETTINGS_DIR', data_dir / 'glib-2.0' / 'schemas')
> + conf.set_quoted('INSTALL_PREFIX', convey_prefix)
> + conf.set_quoted('ISO_CODE_3166_XML', iso_3166_xml)
> + conf.set_quoted('ISO_CODE_639_XML', iso_639_xml)
> +@@ -14,7 +14,7 @@ conf.set_quoted('NAME_SUFFIX', name_suffix)
> + conf.set_quoted('PLUGINS_DIR', plugins_dir)
> + conf.set_quoted('PROFILE', profile)
> + conf.set_quoted('REVNO', revno)
> +-conf.set_quoted('SOURCE_ROOT_DIR', meson.project_source_root())
> ++conf.set_quoted('SOURCE_ROOT_DIR', '/usr/src')
> + conf.set_quoted('VERSION', convey_version)
> + conf.set_quoted('WEB_EXTENSIONS_DIR', web_extensions_dir)
> + config_h =3D configure_file(output: 'config.h', configuration: conf)
> diff --git
> a/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-not-check-f=
or-the-iso-xml-files-and-the-C.u.patch
> b/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-not-check-f=
or-the-iso-xml-files-and-the-C.u.patch
> new file mode 100644
> index 0000000000..15836a7c52
> --- /dev/null
> +++
> b/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-not-check-f=
or-the-iso-xml-files-and-the-C.u.patch
> @@ -0,0 +1,39 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 22 Sep 2026 09:15:56 +0200
> +Subject: [PATCH] meson: do not check for the iso xml files and the C.utf=
8
> + locale during build
> +
> +The iso xml files are needed at runtime and live in the staging area
> +when cross-compiling, and the locale check runs the host's locale
> +command against the host's locales. Neither says anything about the
> +target, so drop both build-time checks.
> +
> +AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +Upstream-Status: Pending
> +---
> + meson.build | 11 -----------
> + 1 file changed, 11 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index dfd919a7..51ab9015 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -195,17 +195,6 @@ if iso_3166_xml =3D=3D ''
> +   iso_3166_xml =3D iso_codes_dir / 'iso_3166.xml'
> + endif
> +
> +-files(iso_639_xml, iso_3166_xml) # Check to make sure these exist
> +-
> +-# Make sure the locale C.UTF-8 is installed on the system
> +-
> +-c_utf8_check =3D run_command('locale', '-a', check: true).stdout()
> +-have_c_utf8 =3D 'C.utf8' in c_utf8_check.split('\n')
> +-
> +-if not have_c_utf8
> +-  warning('C.utf8 locale not available on this system.')
> +-endif
> +-
> + # Post-install script
> + gnome.post_install(
> +   gtk_update_icon_cache: true,
> diff --git
> a/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-look-up-g-=
ir-compiler-with-find_program.patch
> b/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-look-up-g-=
ir-compiler-with-find_program.patch
> new file mode 100644
> index 0000000000..a07887c67c
> --- /dev/null
> +++
> b/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-look-up-g-=
ir-compiler-with-find_program.patch
> @@ -0,0 +1,34 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Tue, 22 Sep 2026 09:15:10 +0200
> +Subject: [PATCH] vala-unit: look up g-ir-compiler with find_program
> +
> +The path taken from the g_ir_compiler pkg-config variable is the
> +target path and is not usable when cross-compiling. find_program
> +honours the cross file, which is where the wrapper is set.
> +
> +AI-Generated: Uses Claude Code (Claude Fable 5.1)
> +Upstream-Status: Pending
> +---
> + subprojects/vala-unit/meson.build | 8 +-------
> + 1 file changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/subprojects/vala-unit/meson.build
> b/subprojects/vala-unit/meson.build
> +index a1822aa8..d04cc307 100644
> +--- a/subprojects/vala-unit/meson.build
> ++++ b/subprojects/vala-unit/meson.build
> +@@ -31,13 +31,7 @@ gee =3D dependency('gee-0.8')
> + gio =3D dependency('gio-2.0')
> + glib =3D dependency('glib-2.0', version: '>=3D' + target_glib)
> + gobject =3D dependency('gobject-2.0')
> +-gobject_introspection =3D dependency('gobject-introspection-1.0',
> required: false)
> +-
> +-if gobject_introspection.found()
> +-  g_ir_compiler =3D gobject_introspection.get_variable('g_ir_compiler')
> +-else
> +-  g_ir_compiler =3D find_program('g-ir-compiler')
> +-endif
> ++g_ir_compiler =3D find_program('g-ir-compiler')
> + if enable_valadoc
> +   valadoc =3D find_program('valadoc')
> + endif
> diff --git a/meta-gnome/recipes-connectivity/convey/convey_50.2.bb
> b/meta-gnome/recipes-connectivity/convey/convey_50.2.bb
> new file mode 100644
> index 0000000000..2a28f5aef5
> --- /dev/null
> +++ b/meta-gnome/recipes-connectivity/convey/convey_50.2.bb
> @@ -0,0 +1,59 @@
> +SUMMARY =3D "Email application built around conversations for the GNOME
> desktop"
> +HOMEPAGE =3D "https://gitlab.gnome.org/donnybeelo/convey"
> +SECTION =3D "network"
> +LICENSE =3D "LGPL-2.1-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2a2244d5a13871ad950c55877546a=
6a2"
> +
> +DEPENDS =3D " \
> +    appstream-native \
> +    cairo \
> +    desktop-file-utils-native \
> +    enchant2 \
> +    folks \
> +    gcr \
> +    gmime \
> +    gnome-online-accounts \
> +    gstreamer1.0 \
> +    gstreamer1.0-plugins-bad \
> +    gtk4 \
> +    icu \
> +    iso-codes \
> +    json-glib \
> +    libadwaita \
> +    libpeas \
> +    libsecret \
> +    libsoup \
> +    libstemmer \
> +    libxml2 \
> +    sqlite3 \
> +    webkitgtk \
> +"
> +
> +inherit meson pkgconfig mime-xdg gsettings gtk-icon-cache
> gobject-introspection gnome-help vala features_check
> +
> +SRC_URI =3D " \
> +    git://
> gitlab.gnome.org/donnybeelo/convey.git;protocol=3Dhttps;branch=3Dmain;tag=
=3D${PV}-1
> <http://gitlab.gnome.org/donnybeelo/convey.git;protocol=3Dhttps;branch=3D=
main;tag=3D$%7BPV%7D-1>
> \
> +    file://0001-meson-do-not-store-build-paths-in-the-binary.patch \
> +
> file://0002-meson-do-not-check-for-the-iso-xml-files-and-the-C.u.patch \
> +    file://0003-vala-unit-look-up-g-ir-compiler-with-find_program.patch =
\
> +"
> +SRCREV =3D "2a0b661bf1d7fde57b6dfcb7e09ce33d7b4b9f42"
> +
> +REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl"
> +
> +GTKIC_VERSION =3D "4"
> +GIR_MESON_OPTION =3D ""
> +
> +EXTRA_OEMESON =3D " \
> +    -Dprofile=3Drelease \
> +    -Drevno=3D${PV} \
> +    -Diso_639_xml=3D${datadir}/xml/iso-codes/iso_639.xml \
> +    -Diso_3166_xml=3D${datadir}/xml/iso-codes/iso_3166.xml \
> +    -Dvaladoc=3Ddisabled \
> +"
> +
> +PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[libunwind] =3D
> "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabled,libunwind"
> +PACKAGECONFIG[tnef] =3D "-Dtnef=3Denabled,-Dtnef=3Ddisabled,libytnef"
> +
> +FILES:${PN} +=3D "${datadir}"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130175):
> https://lists.openembedded.org/g/openembedded-devel/message/130175
> Mute This Topic: https://lists.openembedded.org/mt/121371091/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d0486a065c202565
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">when built for qemuarm64 on an arm64 build host it ends up=
 with<div><br></div><div><a href=3D"https://errors.yoctoproject.org/Errors/=
Details/972887/">https://errors.yoctoproject.org/Errors/Details/972887/</a>=
</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Sep 22, 2026 at 12:26=E2=80=AFAM Mark=
us Volk via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-o=
nline.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Convey is a fork of geary ported to GTK4, =
libadwaita, gcr-4 and<br>
webkitgtk 6.0. The patches keep build paths out of the binary, drop<br>
host checks that do not apply when cross-compiling and let the vala-unit<br=
>
subproject find g-ir-compiler through the cross file.<br>
<br>
AI-Generated: Uses Claude Code (Claude Fable 5.1)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...-not-store-build-paths-in-the-binary.patch | 40 +++++++++++++<br>
=C2=A0...ck-for-the-iso-xml-files-and-the-C.u.patch | 39 ++++++++++++<br>
=C2=A0...k-up-g-ir-compiler-with-find_program.patch | 34 +++++++++++<br>
=C2=A0.../convey/<a href=3D"http://convey_50.2.bb" rel=3D"noreferrer" targe=
t=3D"_blank">convey_50.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 59 +++++++++++++++++++<br>
=C2=A04 files changed, 172 insertions(+)<br>
=C2=A0create mode 100644 meta-gnome/recipes-connectivity/convey/convey/0001=
-meson-do-not-store-build-paths-in-the-binary.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-connectivity/convey/convey/0002=
-meson-do-not-check-for-the-iso-xml-files-and-the-C.u.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-connectivity/convey/convey/0003=
-vala-unit-look-up-g-ir-compiler-with-find_program.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-connectivity/convey/<a href=3D"=
http://convey_50.2.bb" rel=3D"noreferrer" target=3D"_blank">convey_50.2.bb<=
/a><br>
<br>
diff --git a/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-no=
t-store-build-paths-in-the-binary.patch b/meta-gnome/recipes-connectivity/c=
onvey/convey/0001-meson-do-not-store-build-paths-in-the-binary.patch<br>
new file mode 100644<br>
index 0000000000..91e21fd0ec<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-not-store=
-build-paths-in-the-binary.patch<br>
@@ -0,0 +1,40 @@<br>
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 22 Sep 2026 07:43:41 +0200<br>
+Subject: [PATCH] meson: do not store build paths in the binary<br>
+<br>
+The build root and source root are only used when convey runs<br>
+uninstalled, but storing them puts TMPDIR into the binary and breaks<br>
+reproducibility. Point them to /usr/src and the schema directory to the<br=
>
+installed location instead.<br>
+<br>
+AI-Generated: Uses Claude Code (Claude Fable 5.1)<br>
+Upstream-Status: Inappropriate [oe-specific]<br>
+---<br>
+ src/meson.build | 6 +++---<br>
+ 1 file changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/meson.build b/src/meson.build<br>
+index 87690ada..ce722126 100644<br>
+--- a/src/meson.build<br>
++++ b/src/meson.build<br>
+@@ -4,8 +4,8 @@ conf =3D configuration_data()<br>
+ conf.set_quoted(&#39;GETTEXT_PACKAGE&#39;, meson.project_name())<br>
+ conf.set_quoted(&#39;G_LOG_DOMAIN&#39;, meson.project_name())<br>
+ conf.set_quoted(&#39;APP_ID&#39;, convey_id)<br>
+-conf.set_quoted(&#39;BUILD_ROOT_DIR&#39;, meson.project_build_root())<br>
+-conf.set_quoted(&#39;GSETTINGS_DIR&#39;, meson.project_build_root() / &#3=
9;desktop&#39;)<br>
++conf.set_quoted(&#39;BUILD_ROOT_DIR&#39;, &#39;/usr/src&#39;)<br>
++conf.set_quoted(&#39;GSETTINGS_DIR&#39;, data_dir / &#39;glib-2.0&#39; / =
&#39;schemas&#39;)<br>
+ conf.set_quoted(&#39;INSTALL_PREFIX&#39;, convey_prefix)<br>
+ conf.set_quoted(&#39;ISO_CODE_3166_XML&#39;, iso_3166_xml)<br>
+ conf.set_quoted(&#39;ISO_CODE_639_XML&#39;, iso_639_xml)<br>
+@@ -14,7 +14,7 @@ conf.set_quoted(&#39;NAME_SUFFIX&#39;, name_suffix)<br>
+ conf.set_quoted(&#39;PLUGINS_DIR&#39;, plugins_dir)<br>
+ conf.set_quoted(&#39;PROFILE&#39;, profile)<br>
+ conf.set_quoted(&#39;REVNO&#39;, revno)<br>
+-conf.set_quoted(&#39;SOURCE_ROOT_DIR&#39;, meson.project_source_root())<b=
r>
++conf.set_quoted(&#39;SOURCE_ROOT_DIR&#39;, &#39;/usr/src&#39;)<br>
+ conf.set_quoted(&#39;VERSION&#39;, convey_version)<br>
+ conf.set_quoted(&#39;WEB_EXTENSIONS_DIR&#39;, web_extensions_dir)<br>
+ config_h =3D configure_file(output: &#39;config.h&#39;, configuration: co=
nf)<br>
diff --git a/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-no=
t-check-for-the-iso-xml-files-and-the-C.u.patch b/meta-gnome/recipes-connec=
tivity/convey/convey/0002-meson-do-not-check-for-the-iso-xml-files-and-the-=
C.u.patch<br>
new file mode 100644<br>
index 0000000000..15836a7c52<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-not-check=
-for-the-iso-xml-files-and-the-C.u.patch<br>
@@ -0,0 +1,39 @@<br>
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 22 Sep 2026 09:15:56 +0200<br>
+Subject: [PATCH] meson: do not check for the iso xml files and the C.utf8<=
br>
+ locale during build<br>
+<br>
+The iso xml files are needed at runtime and live in the staging area<br>
+when cross-compiling, and the locale check runs the host&#39;s locale<br>
+command against the host&#39;s locales. Neither says anything about the<br=
>
+target, so drop both build-time checks.<br>
+<br>
+AI-Generated: Uses Claude Code (Claude Fable 5.1)<br>
+Upstream-Status: Pending<br>
+---<br>
+ meson.build | 11 -----------<br>
+ 1 file changed, 11 deletions(-)<br>
+<br>
+diff --git a/meson.build b/meson.build<br>
+index dfd919a7..51ab9015 100644<br>
+--- a/meson.build<br>
++++ b/meson.build<br>
+@@ -195,17 +195,6 @@ if iso_3166_xml =3D=3D &#39;&#39;<br>
+=C2=A0 =C2=A0iso_3166_xml =3D iso_codes_dir / &#39;iso_3166.xml&#39;<br>
+ endif<br>
+ <br>
+-files(iso_639_xml, iso_3166_xml) # Check to make sure these exist<br>
+-<br>
+-# Make sure the locale C.UTF-8 is installed on the system<br>
+-<br>
+-c_utf8_check =3D run_command(&#39;locale&#39;, &#39;-a&#39;, check: true)=
.stdout()<br>
+-have_c_utf8 =3D &#39;C.utf8&#39; in c_utf8_check.split(&#39;\n&#39;)<br>
+-<br>
+-if not have_c_utf8<br>
+-=C2=A0 warning(&#39;C.utf8 locale not available on this system.&#39;)<br>
+-endif<br>
+-<br>
+ # Post-install script<br>
+ gnome.post_install(<br>
+=C2=A0 =C2=A0gtk_update_icon_cache: true,<br>
diff --git a/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-l=
ook-up-g-ir-compiler-with-find_program.patch b/meta-gnome/recipes-connectiv=
ity/convey/convey/0003-vala-unit-look-up-g-ir-compiler-with-find_program.pa=
tch<br>
new file mode 100644<br>
index 0000000000..a07887c67c<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-look-up-=
g-ir-compiler-with-find_program.patch<br>
@@ -0,0 +1,34 @@<br>
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Tue, 22 Sep 2026 09:15:10 +0200<br>
+Subject: [PATCH] vala-unit: look up g-ir-compiler with find_program<br>
+<br>
+The path taken from the g_ir_compiler pkg-config variable is the<br>
+target path and is not usable when cross-compiling. find_program<br>
+honours the cross file, which is where the wrapper is set.<br>
+<br>
+AI-Generated: Uses Claude Code (Claude Fable 5.1)<br>
+Upstream-Status: Pending<br>
+---<br>
+ subprojects/vala-unit/meson.build | 8 +-------<br>
+ 1 file changed, 1 insertion(+), 7 deletions(-)<br>
+<br>
+diff --git a/subprojects/vala-unit/meson.build b/subprojects/vala-unit/mes=
on.build<br>
+index a1822aa8..d04cc307 100644<br>
+--- a/subprojects/vala-unit/meson.build<br>
++++ b/subprojects/vala-unit/meson.build<br>
+@@ -31,13 +31,7 @@ gee =3D dependency(&#39;gee-0.8&#39;)<br>
+ gio =3D dependency(&#39;gio-2.0&#39;)<br>
+ glib =3D dependency(&#39;glib-2.0&#39;, version: &#39;&gt;=3D&#39; + targ=
et_glib)<br>
+ gobject =3D dependency(&#39;gobject-2.0&#39;)<br>
+-gobject_introspection =3D dependency(&#39;gobject-introspection-1.0&#39;,=
 required: false)<br>
+-<br>
+-if gobject_introspection.found()<br>
+-=C2=A0 g_ir_compiler =3D gobject_introspection.get_variable(&#39;g_ir_com=
piler&#39;)<br>
+-else<br>
+-=C2=A0 g_ir_compiler =3D find_program(&#39;g-ir-compiler&#39;)<br>
+-endif<br>
++g_ir_compiler =3D find_program(&#39;g-ir-compiler&#39;)<br>
+ if enable_valadoc<br>
+=C2=A0 =C2=A0valadoc =3D find_program(&#39;valadoc&#39;)<br>
+ endif<br>
diff --git a/meta-gnome/recipes-connectivity/convey/<a href=3D"http://conve=
y_50.2.bb" rel=3D"noreferrer" target=3D"_blank">convey_50.2.bb</a> b/meta-g=
nome/recipes-connectivity/convey/<a href=3D"http://convey_50.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">convey_50.2.bb</a><br>
new file mode 100644<br>
index 0000000000..2a28f5aef5<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-connectivity/convey/<a href=3D"http://convey_50.2.=
bb" rel=3D"noreferrer" target=3D"_blank">convey_50.2.bb</a><br>
@@ -0,0 +1,59 @@<br>
+SUMMARY =3D &quot;Email application built around conversations for the GNO=
ME desktop&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://gitlab.gnome.org/donnybeelo/convey" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/donnybeelo/co=
nvey</a>&quot;<br>
+SECTION =3D &quot;network&quot;<br>
+LICENSE =3D &quot;LGPL-2.1-only&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2a2244d5a13871ad950c558775=
46a6a2&quot;<br>
+<br>
+DEPENDS =3D &quot; \<br>
+=C2=A0 =C2=A0 appstream-native \<br>
+=C2=A0 =C2=A0 cairo \<br>
+=C2=A0 =C2=A0 desktop-file-utils-native \<br>
+=C2=A0 =C2=A0 enchant2 \<br>
+=C2=A0 =C2=A0 folks \<br>
+=C2=A0 =C2=A0 gcr \<br>
+=C2=A0 =C2=A0 gmime \<br>
+=C2=A0 =C2=A0 gnome-online-accounts \<br>
+=C2=A0 =C2=A0 gstreamer1.0 \<br>
+=C2=A0 =C2=A0 gstreamer1.0-plugins-bad \<br>
+=C2=A0 =C2=A0 gtk4 \<br>
+=C2=A0 =C2=A0 icu \<br>
+=C2=A0 =C2=A0 iso-codes \<br>
+=C2=A0 =C2=A0 json-glib \<br>
+=C2=A0 =C2=A0 libadwaita \<br>
+=C2=A0 =C2=A0 libpeas \<br>
+=C2=A0 =C2=A0 libsecret \<br>
+=C2=A0 =C2=A0 libsoup \<br>
+=C2=A0 =C2=A0 libstemmer \<br>
+=C2=A0 =C2=A0 libxml2 \<br>
+=C2=A0 =C2=A0 sqlite3 \<br>
+=C2=A0 =C2=A0 webkitgtk \<br>
+&quot;<br>
+<br>
+inherit meson pkgconfig mime-xdg gsettings gtk-icon-cache gobject-introspe=
ction gnome-help vala features_check<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://gitlab.gnome.org/donnybeelo/convey.g=
it;protocol=3Dhttps;branch=3Dmain;tag=3D$%7BPV%7D-1" rel=3D"noreferrer" tar=
get=3D"_blank">gitlab.gnome.org/donnybeelo/convey.git;protocol=3Dhttps;bran=
ch=3Dmain;tag=3D${PV}-1</a> \<br>
+=C2=A0 =C2=A0 file://0001-meson-do-not-store-build-paths-in-the-binary.pat=
ch \<br>
+=C2=A0 =C2=A0 file://0002-meson-do-not-check-for-the-iso-xml-files-and-the=
-C.u.patch \<br>
+=C2=A0 =C2=A0 file://0003-vala-unit-look-up-g-ir-compiler-with-find_progra=
m.patch \<br>
+&quot;<br>
+SRCREV =3D &quot;2a0b661bf1d7fde57b6dfcb7e09ce33d7b4b9f42&quot;<br>
+<br>
+REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data opengl&quot;=
<br>
+<br>
+GTKIC_VERSION =3D &quot;4&quot;<br>
+GIR_MESON_OPTION =3D &quot;&quot;<br>
+<br>
+EXTRA_OEMESON =3D &quot; \<br>
+=C2=A0 =C2=A0 -Dprofile=3Drelease \<br>
+=C2=A0 =C2=A0 -Drevno=3D${PV} \<br>
+=C2=A0 =C2=A0 -Diso_639_xml=3D${datadir}/xml/iso-codes/iso_639.xml \<br>
+=C2=A0 =C2=A0 -Diso_3166_xml=3D${datadir}/xml/iso-codes/iso_3166.xml \<br>
+=C2=A0 =C2=A0 -Dvaladoc=3Ddisabled \<br>
+&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[libunwind] =3D &quot;-Dlibunwind=3Denabled,-Dlibunwind=3Ddis=
abled,libunwind&quot;<br>
+PACKAGECONFIG[tnef] =3D &quot;-Dtnef=3Denabled,-Dtnef=3Ddisabled,libytnef&=
quot;<br>
+<br>
+FILES:${PN} +=3D &quot;${datadir}&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130175): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130175" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130175</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121371091/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121371091/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d0486a065c202565--

