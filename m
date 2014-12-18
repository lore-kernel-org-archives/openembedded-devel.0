Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DE67C727AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 11:50:22 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so1300347wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Dec 2014 03:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jhPwL9qtrbxN3QdRjuLvuopbh4Q0kH3Squ4YYekzh3U=;
	b=FfquBDlFICEVGEEBC6DxBPIhDWLW4Efc+6pa4ly9CNCe9PmQLaMScrkCYTJYnle9Vw
	2y/kzTvnlHQzFpzkK9OEnmLyLA+24xgArQqG6Hkx9f695ID8xJXboq2cvsLwGQOwrCmI
	Z/jerIuPi2NsxxX8eNXmZNu6opQI/EnmOHq0clybOutdV22tvRjao4rArEytTuci3q6C
	N5fYJlg2fnc0ao2XWz31wvjcPaEEQqrjb0yHb2m1hQWIgBbCRBJd6XwxGkEEojiJpEQS
	8UdXRG6dp+d3Tf5uhJH4pJgVQm8cRTkqA4TxV9IQDF/RF/oPLgHu2Kq+T4tU2wj1c/X8
	89KQ==
X-Received: by 10.180.7.198 with SMTP id l6mr4481428wia.26.1418903422476;
	Thu, 18 Dec 2014 03:50:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ck7sm8662552wjb.13.2014.12.18.03.50.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Dec 2014 03:50:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 18 Dec 2014 12:50:25 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20141218115025.GA2462@jama>
References: <1418376695-7152-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1418376695-7152-1-git-send-email-lixin.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] system-setup-keyboard: add new recipe
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
X-List-Received-Date: Thu, 18 Dec 2014 11:50:28 -0000
X-Groupsio-MsgNum: 53372
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline

--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 12, 2014 at 05:31:35PM +0800, Li xin wrote:
> system-setup-keyboard is a daemon to monitor the keyboard layout
> configured in /etc/sysconfig/keyboard and transfer this into
> the matching xorg.conf.d snippet.

Fails to build in world:
| # /usr/lib/python2.7/encodings/ascii.pyc matches
/usr/lib/python2.7/encodings/ascii.py
| import encodings.ascii # precompiled from
/usr/lib/python2.7/encodings/ascii.pyc
| Python 2.7.3 (default, Feb 27 2014, 19:58:35)
| [GCC 4.6.3] on linux2
| Type "help", "copyright", "credits" or "license" for more information.
| Traceback (most recent call last):
|   File "get_layouts.py", line 28, in <module>
|     import system_config_keyboard.keyboard_models
| ImportError: No module named system_config_keyboard.keyboard_models

| make: *** [keyboards.h] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.


>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  ...modify-path-of-python-and-add-v-parameter.patch | 30 ++++++++++++++++=
++++++
>  .../system-setup-keyboard_0.8.8.bb                 | 26 ++++++++++++++++=
+++
>  2 files changed, 56 insertions(+)
>  create mode 100644 meta-oe/recipes-support/system-setup-keyboard/files/0=
001-modify-path-of-python-and-add-v-parameter.patch
>  create mode 100644 meta-oe/recipes-support/system-setup-keyboard/system-=
setup-keyboard_0.8.8.bb
>=20
> diff --git a/meta-oe/recipes-support/system-setup-keyboard/files/0001-mod=
ify-path-of-python-and-add-v-parameter.patch b/meta-oe/recipes-support/syst=
em-setup-keyboard/files/0001-modify-path-of-python-and-add-v-parameter.patch
> new file mode 100644
> index 0000000..4b56935
> --- /dev/null
> +++ b/meta-oe/recipes-support/system-setup-keyboard/files/0001-modify-pat=
h-of-python-and-add-v-parameter.patch
> @@ -0,0 +1,30 @@
> +From 3d2bbd78e5583ef4290b3a64e4ecc19bebd4a698 Mon Sep 17 00:00:00 2001
> +From: Li xin <lixin.fnst@cn.fujitsu.com>
> +Date: Tue, 11 Nov 2014 14:20:29 +0900
> +Subject: [PATCH] modify path of python and add -v parameter
> +
> +fix error: ImportError: No module named system_config_keyboard.keyboard_=
models
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 55c5b60..c528f36 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -5,7 +5,7 @@ MAN_SECTION=3D1
> + all: system-setup-keyboard
> +=20
> + keyboards.h:
> +-	python get_layouts.py > keyboards.h
> ++	/usr/bin/python -v get_layouts.py > keyboards.h
> +=20
> + system-setup-keyboard: keyboards.h system-setup-keyboard.c
> + 	$(CC) system-setup-keyboard.c `pkg-config --cflags --libs glib-2.0` $(=
CFLAGS) -o system-setup-keyboard
> +--=20
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-k=
eyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-set=
up-keyboard_0.8.8.bb
> new file mode 100644
> index 0000000..3b34167
> --- /dev/null
> +++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard=
_0.8.8.bb
> @@ -0,0 +1,26 @@
> +SUMMARY =3D "xorg.conf keyboard layout callout"
> +DESCRIPTION =3D "system-setup-keyboard is a daemon to monitor the keyboa=
rd layout configured in\
> +/etc/sysconfig/keyboard and transfer this into the matching xorg.conf.d =
snippet."
> +
> +HOMEPAGE =3D "https://git.fedorahosted.org/git/system-setup-keyboard.git"
> +SECTION =3D "Applications/System"
> +
> +SRC_URI =3D " \
> +    https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz \
> +    file://0001-modify-path-of-python-and-add-v-parameter.patch \
> +"
> +SRC_URI[md5sum] =3D "399003968ccc739cddd9cc370af377a0"
> +SRC_URI[sha256sum] =3D "1ef6ef79c3588e85d7f42e99eb80a2e459f966284cf029c2=
d6fc1b645abcb860"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbf57969a59612c5aca007b340c49d=
3a2"
> +
> +DEPENDS =3D "glib-2.0"
> +
> +do_install() {
> +    oe_runmake install DESTDIR=3D${D}
> +    install -d ${D}/etc/X11/xorg.conf.d
> +    touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
> +}
> +
> +FILES_${PN} +=3D "${systemd_unitdir}/system/${PN}.service"
> --=20
> 1.8.4.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSSv4EACgkQN1Ujt2V2gBxdWQCeKHlCfszJhO/s5bgqzTtEwSJc
q88AniMAGTMvX5mTTuM02z5zk6Kjk1cj
=Ckwl
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
