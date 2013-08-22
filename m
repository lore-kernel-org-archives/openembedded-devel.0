Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id F12A56B9F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2013 07:51:46 +0000 (UTC)
Received: from e6520eb (unknown [88.170.243.169])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id AF4B14B0091;
	Thu, 22 Aug 2013 09:51:40 +0200 (CEST)
Date: Thu, 22 Aug 2013 09:51:39 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: martin.jansa@gmail.com
Message-ID: <20130822095139.3291a90a@e6520eb>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.2 (GTK+ 2.24.19; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][dylan][PATCH 00/60] Backports for deterministic dependencies
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
X-List-Received-Date: Thu, 22 Aug 2013 07:51:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Thu, 15 Aug 2013 09:18:40 +0200,
Martin Jansa <martin.jansa@gmail.com> a =E9crit :

> The following changes since commit 13ae5105ee30410136beeae66ec41ee4a8a2e2=
b0:
>=20
>   icon-slicer: fix native build by depending on gdk-pixbuf only (2013-05-=
28 09:58:04 +0200)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/dylan-backpo=
rts
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/dylan-backports
>=20
> Martin Jansa (57):
>   vsftpd: add missing dependency on openssl
>   fbida: define -I when checking jpeg version
>   xorg-sgml-doctools: add missing dependency on util-macros
>   gypsy: add dependency on libxslt-native
>   media-ctl: inherit pkgconfig
>   rsyslog: inherit pkgconfig
>   libspatialite: add missing dependency on sqlite3
>   ruby: add missing dependency on ruby-native
>   cpufrequtils: inherit gettext
>   cryptsetup: add missing dependency on libgcrypt
>   gsoap: add missing dependency on zlib
>   wbxml2: add missing dependency on expat
>   iso-codes: add missing dependency on gettext-native
>   portaudio: explicitly disable oss, add PACKAGECONFIG for alsa and jack
>   mysql5: prevent using bundled zlib at all costs
>   portaudio: inherit pkgconfig
>   f2fs-tools: add util-linux dependency
>   lcdproc5: add PACKAGECONFIG for libftdi, libusb
>   openldap: convert to PACKAGECONFIGs, explicitly disable openssl
>   samba: use more specific LICENSE
>   samba: add dependency on zlib popt, PACKAGECONFIG for pam
>   jack: add dependency on libsaplerate0 and readline
>   glog: add dependency on libunwind
>   lvm2: add PACKAGECONFIG for readline
>   libunwind: add PACKAGECONFIG for lzma
>   ntp: add PACKAGECONFIG for libcap and readline
>   vim: add PACKAGECONFIG for acl
>   mkvtoolnix: inherit gettext and export RUBYLIB
>   rrdtool: add PACKAGECONFIG for dbi
>   loudmouth: add dependency on libidn
>   cifs-utils: add PACKAGECONFIG for libcap
>   atftp: add PACKAGECONFIG for pcre, readline, tcp-wrapper
>   fbida: add dependency on curl libungif tiff
>   mbuffer: add PACKAGECONFIG for md5
>   inetutils: add PACKAGECONFIG for ftp and uucpd
>   jasper: add PACKAGECONFIG for jpeg
>   joe: add PACKAGECONFIG for joe
>   krb5: add PACKAGECONFIG for openssl and libedit
>   libass: add PACKAGECONFIG for harfbuzz
>   links: add PACKAGECONFIG for bzip2, lzma
>   quagga: add PACKAGECONFIG for capabilities
>   sox: add PACKAGECONFIG for magic and wavpack
>   usbmuxd: add PACKAGECONFIG for plist
>   usbmuxd: fix unpackaged files
>   libav: add PACKAGECONFIG for bzip2 and jack
>   libnice: add PACKAGECONFIG for gupnp
>   farsight2: add PACKAGECONFIG for gupnp
>   x264: explicitly disable swscale
>   libftdi: add PACKAGECONFIG for cpp-wrapper
>   ntfs-3g-ntfsprogs: add packageconfig for uuid
>   openldap: add dependency on util-linux
>   smbnetfs: add packageconfig for gnome-keyring
>   libgphoto2: add configure option for gd and add PACKAGECONFIG
>   libgphoto2: add PACKAGECONFIG for serial
>   samba: add packageconfig for fam
>   ruby: add dependency on db gdbm readline
>   cifs-utils: inherit pkgconfig
>=20
> Mihai Prica (1):
>   python-feedparser: Changed from distutils to setuptools
>=20
> Paul Barker (1):
>   fluidsynth: added dependency on glib
>=20
> Roy.Li (1):
>   cyrus-sasl: Avoid to call AC_TRY_RUN
>=20
pushed to dylan-next

Thanks !

Eric

