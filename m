Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail.openembedded.org (Postfix) with ESMTP id BECF979C5E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 22:43:21 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id i10-v6so8684683oik.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 15:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tHj6AcVQqwTd21xwylbpvhMSw3yAs0JT4ZEB6JULylU=;
	b=Vg8eB8w2Q2kknhXGDRNaSrk/IZTzllwfy8yKHJWDRpvg/iOmx++yh+XgNHjDhbUtca
	YSvyY51AvSq8GfhTOGJVeO9Rt3UejJjGxw2E1ggJRKHObpogakPIK/QADw8KTnzVyYij
	hxgwmDUVB7zcnOgSs6a9n14StNp13v/lzb05GeICd+Aji3c7TlOCa83sgq6wSjeU44am
	dJjxRD/fUV1PIcWerVqI5sDsprKrywap4NlRNxtM/22PKV8D7riO7z0rAuvynKHqAwsC
	0++/M9g1VvGPn/7QEKETSYFpWkHy4Oe+eWvm2n3LGR+wa/dBya8u7Eowd825OARR7CXJ
	okhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tHj6AcVQqwTd21xwylbpvhMSw3yAs0JT4ZEB6JULylU=;
	b=TLKBa6bsQklTfhYj6EzF/FOU4roCYxEEBFjYJHBTG1Mxdcyl3NQsdNY8qp0v8iOICX
	XwjCnaAsW7RVwg3BfZ8uzXBoWdc8gIPES4rTQArWeP4SaWJE0JLRGZlcOYbRJVWkozFr
	DhvQLgBB8fZzi5HwYfHdZWZJLvczKUfracPiRTx9hU53DGJcQN/6TNak6OHQDMeJIAio
	4VQGC/FsQQaoairu71t/GLAqQA53ItiOFDmCndIPR4VanLUXRVR2HpBZvW9xRdyyUh4b
	wtb2gZ/PoiSzNslujlMNaHIdLlf3Xglvft7VqEBLixbw4ZVI+zbaC1LoCVFU5YiDVDvg
	m4OA==
X-Gm-Message-State: AGRZ1gLvdN+pqUarKWbTsRmgQsNeteUlabUlKGHY71OxLX373ujJcE1Q
	lNE0jia6qNTFfTtNDepmSHuVtSwXSon4t23Y3cM=
X-Google-Smtp-Source: AJdET5euSbE/YyOmgHceVTK7Y/hDXl+f0DQAXjXgwrlV9Tyx4xFLndeoP2YmnBAu79zixDMuCx8k2yi8y6BdGL7hoYw=
X-Received: by 2002:aca:1111:: with SMTP id
	17-v6mr10032784oir.278.1540853002608; 
	Mon, 29 Oct 2018 15:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<a3ce539915c9a45c2b8032260ea65d6ee5b00f6b.1540830650.git.brendank310@gmail.com>
In-Reply-To: <a3ce539915c9a45c2b8032260ea65d6ee5b00f6b.1540830650.git.brendank310@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Oct 2018 23:43:09 +0100
Message-ID: <CALbNGRSf1FU_cT0BEmBgNZmiDYEEAHDApy8a=6vvAsHF-1E0-w@mail.gmail.com>
To: brendank310@gmail.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC meta-gnome][PATCH 04/16] accountsservice: add recipe for Accounts Service
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
X-List-Received-Date: Mon, 29 Oct 2018 22:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> ---
>  .../accountsservice/0001-strip-out-intl.patch | 104 ++++++++++++++++++
>  .../gnome3/accountsservice_git.bb             |  24 ++++
>  2 files changed, 128 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
>  create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch b/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
> new file mode 100644
> index 000000000..622b3335d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-intl.patch
> @@ -0,0 +1,104 @@
> +accountsservice: Remove internationalization
> +
> +  The i18n internationalization fails within the OE
> +  environment.
> +
> +  Upstream-Status: Inappropriate [disable-feature]
> +
> +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index 4987937..6274e5d 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -28,15 +28,6 @@ configure_file(
> +
> + policy = act_namespace.to_lower() + '.policy'
> +
> +-i18n.merge_file(
> +-  policy,
> +-  input: policy + '.in',
> +-  output: policy,
> +-  po_dir: po_dir,
> +-  install: true,
> +-  install_dir: policy_dir,
> +-)
> +-
> + if install_systemd_unit_dir
> +   service = 'accounts-daemon.service'
> +
> +diff --git a/meson.build b/meson.build
> +index 77b6a3f..7da5d5d 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -25,8 +25,6 @@ act_pkgincludedir = join_paths(act_includedir, act_api_name)
> +
> + act_namespace = 'org.freedesktop.Accounts'
> +
> +-act_gettext = 'accounts-service'
> +-
> + soversion = 0
> + current = 0
> + revision = 0
> +@@ -35,11 +33,9 @@ libversion = '@0@.@1@.@2@'.format(soversion, current, revision)
> + act_buildtype = get_option('buildtype')
> +
> + gnome = import('gnome')
> +-i18n = import('i18n')
> + pkg = import('pkgconfig')
> +
> + data_dir = join_paths(meson.current_source_dir(), 'data')
> +-po_dir = join_paths(meson.current_source_dir(), 'po')
> +
> + top_inc = include_directories('.')
> +
> +@@ -52,9 +48,6 @@ config_h.set_quoted('VERSION', act_version)
> + config_h.set('_DEFAULT_SOURCE', true)
> + config_h.set('_GNU_SOURCE', true)
> +
> +-# i18n
> +-config_h.set_quoted('GETTEXT_PACKAGE', act_gettext)
> +-
> + # headers
> + check_headers = [
> +   'paths.h',
> +@@ -182,7 +175,6 @@ config_h.set('WITH_SYSTEMD', enable_systemd or enable_elogind)
> +
> + subdir('data')
> + subdir('src')
> +-subdir('po')
> +
> + enable_docbook = get_option('docbook')
> + if enable_docbook
> +diff --git a/src/libaccountsservice/act-user-manager.c b/src/libaccountsservice/act-user-manager.c
> +index 12be9cb..712db6c 100644
> +--- a/src/libaccountsservice/act-user-manager.c
> ++++ b/src/libaccountsservice/act-user-manager.c
> +@@ -35,7 +35,6 @@
> + #endif /* HAVE_PATHS_H */
> +
> + #include <glib.h>
> +-#include <glib/gi18n-lib.h>
> + #include <glib/gstdio.h>
> + #include <glib-object.h>
> + #include <gio/gio.h>
> +diff --git a/src/main.c b/src/main.c
> +index 9caec7f..acbd422 100644
> +--- a/src/main.c
> ++++ b/src/main.c
> +@@ -155,7 +155,6 @@ main (int argc, char *argv[])
> +         };
> +
> +         setlocale (LC_ALL, "");
> +-        bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> +
> + #if !GLIB_CHECK_VERSION (2, 35, 3)
> +         g_type_init ();
> +@@ -167,7 +166,6 @@ main (int argc, char *argv[])
> +         }
> +
> +         context = g_option_context_new ("");
> +-        g_option_context_set_translation_domain (context, GETTEXT_PACKAGE);
> +         g_option_context_set_summary (context, _("Provides D-Bus interfaces for querying and manipulating\nuser account information."));
> +         g_option_context_add_main_entries (context, entries, NULL);
> +         if (!g_option_context_parse (context, &argc, &argv, &error)) {
> diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
> new file mode 100644
> index 000000000..a019a8c6d
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
> @@ -0,0 +1,24 @@
> +DESCRIPTION = "Accounts Service"
> +LICENSE = "GPLv3"
> +DEPENDS = " \
> +            glib-2.0 \
> +            gsettings-desktop-schemas \
> +            polkit \
> +            dbus \
> +          "
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +SRC_URI = "git://anongit.freedesktop.org/accountsservice.git;protocol=git;branch=master \
> +           file://0001-strip-out-intl.patch \
> +           "
> +
> +FILES_${PN} += "${systemd_system_unitdir}"
> +FILES_${PN} += "${datadir}"
^ I hate styleguide nitpickers :) - but please put this into one
statement and to the end of the recipe.
> +FILES_${PN} += "${libdir}"
^ Is this required?
> +
> +SRCREV="${AUTOREV}"
^ No AUTOREV - set a commid ID
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig meson gobject-introspection
> +
> --
> 2.17.1
>

