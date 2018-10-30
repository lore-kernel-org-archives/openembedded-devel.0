Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11D6F79C76
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 11:48:55 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d17-v6so11932666wre.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 04:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3q6w9tcDUUxK4q2tJXRp9vofqpwtIZIrD7gcAAvKvNw=;
	b=qrljIrk4U7i3PknsNtytN8HkdFvIFOmbqvpWWvWLvdfSHukSo/+u7oidwtk2MDZDFV
	deNXe2PIGOnXCMFZUNs8GC6BY3aM+eTMBNBHCPrBV9kJWQXCWfIl9YStnAdNt339LbDn
	VfKffdYlWohVAV6CHc8ERCzTvm5bmdWnj8k9Qqv7BveKOt++7iTB8demjFrZsmXsLRlU
	6ZsIATRkU+1Z3RM0acBPnpZwCCYt4SQOepIS9GyNIbPIRzVe36vQ66WNu/9Vq8vkREAo
	J7DUF5nbaBjHB7eMpC/k3guqE7FGkvfNc4eFdNnPCCEot+sBLzE5iBZe3ALI8A2bhE9X
	x/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3q6w9tcDUUxK4q2tJXRp9vofqpwtIZIrD7gcAAvKvNw=;
	b=tYl09h4ksxSBp7Qo1WrRLeMfBOG0bJYK1duU0obyUnU4a/hXnztxUeQHldrhf84AJa
	9EU/eLXeAZ9Fv5Os9aKn5UXsbblxRRVcJkxWaS0ENfRww8GB09MOFMV48ZjIfpREkVvI
	Z15xeXpuNt+Va30jlLoMtcfOc3ThmI/DDWsmwZF0F6NCYQGw5WjRgKvGx4L6OHjqdXmH
	aZvH+/uz2SEUwWsFwRuh0Rt0I4+EoC3auXXFOtMyntOZeH/IuEyCyy3BJIO+RO9hAkEg
	PlpEmgKYB3bj4PjNNfv+sAgM/bxunqgZxwhdOq1qjGxQ0DcIKObqglJmfjOOS2obk0b5
	6K3A==
X-Gm-Message-State: AGRZ1gLCE22JVro92LiSm7jogX9BV16umB5NCspyQAymsppJ8thl3Xnq
	ED9ThtUv0XmqvKKD2RhQ4FQm+x01
X-Google-Smtp-Source: AJdET5cWttbUUSPGAkagzh5Pf9kzvmD0Zxok7G29KG3taFZ0YHTzbC5GcbPzKUJ17OPPID4rb7rbwg==
X-Received: by 2002:adf:80a3:: with SMTP id
	32-v6mr19088489wrl.231.1540900136569; 
	Tue, 30 Oct 2018 04:48:56 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u15-v6sm1941451wrt.53.2018.10.30.04.48.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Oct 2018 04:48:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 30 Oct 2018 12:48:58 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20181030114858.GA1380@jama>
References: <cover.1540830650.git.brendank310@gmail.com>
	<a3ce539915c9a45c2b8032260ea65d6ee5b00f6b.1540830650.git.brendank310@gmail.com>
	<CALbNGRSf1FU_cT0BEmBgNZmiDYEEAHDApy8a=6vvAsHF-1E0-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSf1FU_cT0BEmBgNZmiDYEEAHDApy8a=6vvAsHF-1E0-w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Tue, 30 Oct 2018 11:48:56 -0000
X-Groupsio-MsgNum: 75225
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 29, 2018 at 11:43:09PM +0100, Andreas M=FCller wrote:
> On Mon, Oct 29, 2018 at 5:41 PM brendank310 <brendank310@gmail.com> wrote:
> >
> > From: Brendan Kerrigan <kerriganb@ainfosec.com>
> >
> > Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> > ---
> >  .../accountsservice/0001-strip-out-intl.patch | 104 ++++++++++++++++++
> >  .../gnome3/accountsservice_git.bb             |  24 ++++
> >  2 files changed, 128 insertions(+)
> >  create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice/000=
1-strip-out-intl.patch
> >  create mode 100644 meta-gnome/recipes-gnome/gnome3/accountsservice_git=
=2Ebb
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip=
-out-intl.patch b/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-stri=
p-out-intl.patch
> > new file mode 100644
> > index 000000000..622b3335d
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/gnome3/accountsservice/0001-strip-out-in=
tl.patch
> > @@ -0,0 +1,104 @@
> > +accountsservice: Remove internationalization
> > +
> > +  The i18n internationalization fails within the OE
> > +  environment.
> > +
> > +  Upstream-Status: Inappropriate [disable-feature]
> > +
> > +  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> > +
> > +diff --git a/data/meson.build b/data/meson.build
> > +index 4987937..6274e5d 100644
> > +--- a/data/meson.build
> > ++++ b/data/meson.build
> > +@@ -28,15 +28,6 @@ configure_file(
> > +
> > + policy =3D act_namespace.to_lower() + '.policy'
> > +
> > +-i18n.merge_file(
> > +-  policy,
> > +-  input: policy + '.in',
> > +-  output: policy,
> > +-  po_dir: po_dir,
> > +-  install: true,
> > +-  install_dir: policy_dir,
> > +-)
> > +-
> > + if install_systemd_unit_dir
> > +   service =3D 'accounts-daemon.service'
> > +
> > +diff --git a/meson.build b/meson.build
> > +index 77b6a3f..7da5d5d 100644
> > +--- a/meson.build
> > ++++ b/meson.build
> > +@@ -25,8 +25,6 @@ act_pkgincludedir =3D join_paths(act_includedir, act=
_api_name)
> > +
> > + act_namespace =3D 'org.freedesktop.Accounts'
> > +
> > +-act_gettext =3D 'accounts-service'
> > +-
> > + soversion =3D 0
> > + current =3D 0
> > + revision =3D 0
> > +@@ -35,11 +33,9 @@ libversion =3D '@0@.@1@.@2@'.format(soversion, curr=
ent, revision)
> > + act_buildtype =3D get_option('buildtype')
> > +
> > + gnome =3D import('gnome')
> > +-i18n =3D import('i18n')
> > + pkg =3D import('pkgconfig')
> > +
> > + data_dir =3D join_paths(meson.current_source_dir(), 'data')
> > +-po_dir =3D join_paths(meson.current_source_dir(), 'po')
> > +
> > + top_inc =3D include_directories('.')
> > +
> > +@@ -52,9 +48,6 @@ config_h.set_quoted('VERSION', act_version)
> > + config_h.set('_DEFAULT_SOURCE', true)
> > + config_h.set('_GNU_SOURCE', true)
> > +
> > +-# i18n
> > +-config_h.set_quoted('GETTEXT_PACKAGE', act_gettext)
> > +-
> > + # headers
> > + check_headers =3D [
> > +   'paths.h',
> > +@@ -182,7 +175,6 @@ config_h.set('WITH_SYSTEMD', enable_systemd or ena=
ble_elogind)
> > +
> > + subdir('data')
> > + subdir('src')
> > +-subdir('po')
> > +
> > + enable_docbook =3D get_option('docbook')
> > + if enable_docbook
> > +diff --git a/src/libaccountsservice/act-user-manager.c b/src/libaccoun=
tsservice/act-user-manager.c
> > +index 12be9cb..712db6c 100644
> > +--- a/src/libaccountsservice/act-user-manager.c
> > ++++ b/src/libaccountsservice/act-user-manager.c
> > +@@ -35,7 +35,6 @@
> > + #endif /* HAVE_PATHS_H */
> > +
> > + #include <glib.h>
> > +-#include <glib/gi18n-lib.h>
> > + #include <glib/gstdio.h>
> > + #include <glib-object.h>
> > + #include <gio/gio.h>
> > +diff --git a/src/main.c b/src/main.c
> > +index 9caec7f..acbd422 100644
> > +--- a/src/main.c
> > ++++ b/src/main.c
> > +@@ -155,7 +155,6 @@ main (int argc, char *argv[])
> > +         };
> > +
> > +         setlocale (LC_ALL, "");
> > +-        bind_textdomain_codeset (GETTEXT_PACKAGE, "UTF-8");
> > +
> > + #if !GLIB_CHECK_VERSION (2, 35, 3)
> > +         g_type_init ();
> > +@@ -167,7 +166,6 @@ main (int argc, char *argv[])
> > +         }
> > +
> > +         context =3D g_option_context_new ("");
> > +-        g_option_context_set_translation_domain (context, GETTEXT_PAC=
KAGE);
> > +         g_option_context_set_summary (context, _("Provides D-Bus inte=
rfaces for querying and manipulating\nuser account information."));
> > +         g_option_context_add_main_entries (context, entries, NULL);
> > +         if (!g_option_context_parse (context, &argc, &argv, &error)) {
> > diff --git a/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb b/m=
eta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
> > new file mode 100644
> > index 000000000..a019a8c6d
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/gnome3/accountsservice_git.bb
> > @@ -0,0 +1,24 @@
> > +DESCRIPTION =3D "Accounts Service"
> > +LICENSE =3D "GPLv3"
> > +DEPENDS =3D " \
> > +            glib-2.0 \
> > +            gsettings-desktop-schemas \
> > +            polkit \
> > +            dbus \
> > +          "
> > +
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47f=
ae504"
> > +
> > +SRC_URI =3D "git://anongit.freedesktop.org/accountsservice.git;protoco=
l=3Dgit;branch=3Dmaster \

protocol=3Dgit and branch=3Dmaster are default, please drop them.

> > +           file://0001-strip-out-intl.patch \
> > +           "
> > +
> > +FILES_${PN} +=3D "${systemd_system_unitdir}"
> > +FILES_${PN} +=3D "${datadir}"
> ^ I hate styleguide nitpickers :) - but please put this into one
> statement and to the end of the recipe.

Please while doing these styleguide changes, please use 4 spaces for
indentation *everywhere* and the closing " for multiline variables
should be first character on separate line (not indented).

This does apply to other changes in this patch series as well.

> > +FILES_${PN} +=3D "${libdir}"
> ^ Is this required?
> > +
> > +SRCREV=3D"${AUTOREV}"
> ^ No AUTOREV - set a commid ID

And set PV to something meaningful while doing that.

> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit pkgconfig meson gobject-introspection
> > +
> > --
> > 2.17.1
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW9hFKgAKCRA3VSO3ZXaA
HHkDAKC08L+/hpKV8bRI3Pe5AD0zxVbqrACdF9UwAeXYK5xwFarbKeL25tIVVYE=
=E/pf
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
