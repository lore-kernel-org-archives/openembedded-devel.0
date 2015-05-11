Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7E1AA6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 09:16:11 +0000 (UTC)
Received: by wgic8 with SMTP id c8so95351725wgi.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=qmfmhs/NRVtbPAfDuaDt4VtGBN+rBiQr+KiAja7ZYWM=;
	b=EmUbMgO/wBH/VLACDhXCEtHSn22U5KMfLy7ofhSCkmpkqgpirFWLJXFZIMEiLcxnb6
	YjY4FkiuV71MTGZWJY1mYcRqAdWVS5rAYMtEkP+pJZLY6DKsNuqrwK9cPgy4LCZy/Rbz
	tXNtBGLjkO6l6uB08EnW9i70NTJK32dt2mIHuXMpYAhZUC7KsOWg7z3XHwD3JtlabZBw
	xL/BTsXx6dC9M6nHJnGFAC0Gt6bqyA/nyZcsGJKqIbj4LtKtJEb2TrNoC2mZez+Ky2RY
	gQO7KQu3e9x64Wf1/DCf91+6JNuG3ebiJUscSVvw7NNeuAEu+KBeiR3B+NZlIa1eUhz1
	Qk7w==
X-Received: by 10.194.77.44 with SMTP id p12mr18730735wjw.1.1431335772591;
	Mon, 11 May 2015 02:16:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id dg8sm21827095wjc.9.2015.05.11.02.16.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 May 2015 02:16:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 May 2015 11:16:43 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150511091643.GG2400@jama>
References: <1430852951-18707-1-git-send-email-raj.khem@gmail.com>
	<1430852951-18707-7-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430852951-18707-7-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][meta-gnome][PATCH 7/7] obex, gnome-bluetooth: Depend on bluez5
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
X-List-Received-Date: Mon, 11 May 2015 09:16:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 12:09:11PM -0700, Khem Raj wrote:
> bluez4 is removed from oe-core
> this needs runtime testing

Please send v2 with PNBLACKLISTs removal once the runtime testing is
done.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-gnome/recipes-connectivity/obex/obexd_0.48.bb                 | 4 +=
+--
>  meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb | 2 +-
>  meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb        | 3 +=
--
>  meta-oe/recipes-connectivity/obex/openobex_1.5.bb                  | 2 +-
>  4 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb b/meta-gn=
ome/recipes-connectivity/obex/obexd_0.48.bb
> index f28f77b..02b364e 100644
> --- a/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
> +++ b/meta-gnome/recipes-connectivity/obex/obexd_0.48.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "OBEX Server and Client"
>  # obexd was integrated into bluez5
> -DEPENDS =3D "glib-2.0 dbus bluez4 libical"
> -RCONFLICTS_${PN} =3D "bluez5"
> +DEPENDS =3D "glib-2.0 dbus bluez5 libical"
> +#RCONFLICTS_${PN} =3D "bluez5"
> =20
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4c=
a7e"
> diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.3=
2.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
> index 8711b8a..ddc78e6 100644
> --- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539fee=
f013de476e68b5c50a \
>  PR =3D "r1"
> =20
>  SECTION =3D "x11/gnome"
> -DEPENDS =3D "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbu=
s-glib libunique libnotify bluez4 gnome-keyring virtual/libx11 libxi intlto=
ol-native"
> +DEPENDS =3D "obexd gnome-doc-utils-native gnome-doc-utils gconf gtk+ dbu=
s-glib libunique libnotify bluez5 gnome-keyring virtual/libx11 libxi intlto=
ol-native"
> =20
>  inherit gnomebase gtk-icon-cache
> =20
> diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb =
b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> index afe6106..8bb5374 100644
> --- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> +++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> @@ -2,8 +2,7 @@ DESCRIPTION =3D "obex-data-server is a D-Bus service prov=
iding high-level OBEX cli
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
> -DEPENDS =3D "gtk+ bluez4 dbus-glib imagemagick openobex"
> -RCONFLICTS_${PN} =3D "bluez5"
> +DEPENDS =3D "gtk+ bluez5 dbus-glib imagemagick openobex"
> =20
>  SRC_URI =3D "http://tadas.dailyda.com/software/obex-data-server-${PV}.ta=
r.gz"
>  SRC_URI[md5sum] =3D "961ca5db6fe9c97024e133cc6203cc4d"
> diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb b/meta-oe/=
recipes-connectivity/obex/openobex_1.5.bb
> index b07779d..f4744c0 100644
> --- a/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> +++ b/meta-oe/recipes-connectivity/obex/openobex_1.5.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The Openobex project is an open source i=
mplementation of the \
>  Object Exchange (OBEX) protocol."
>  HOMEPAGE =3D "http://openobex.triq.net"
>  SECTION =3D "libs"
> -DEPENDS =3D "virtual/libusb0 bluez4"
> +DEPENDS =3D "virtual/libusb0 bluez5"
>  LICENSE =3D "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a \
>                      file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffcea4f398e=
37343 \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

