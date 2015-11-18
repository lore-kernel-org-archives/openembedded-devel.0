Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 508A360DF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2015 07:33:19 +0000 (UTC)
Received: by wmec201 with SMTP id c201so264077921wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2015 23:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=x3ldU5weH8n79gsgyQCF3qDYtI9SMNI/SD4Ue+QEfhU=;
	b=M7rm9N7JiXWXvhQkw5qrzaK984LwUr2Hwfnwq+zF6UzsFiOpclL3dgHQfGvyduVz8I
	Z+Jnfhfipvb4pCKLTpVpau154jtGoW/0VvNEn1f2TSU/5shp6qppV/wiHqdMq2mF2MO4
	6tNb9EC+EsghIAzLtwwrmvbEIoXmlhIiE8gpjxcgsRRxf7nqNRjchC9+naAmAhdTSuKP
	riYKjDqkzB9Eo1B9sRA+lZkpmcfXDv4KSm8WDRW5DsEt1HMCvrNeVYdmtNJK6hIniqRW
	EEAVGizt/7A5nVzXz0cFwdpZRYF+SjnEeCu6B9pazwEK5Mp1Gqu7Oqj31C/iN6f2m+97
	t+Jg==
MIME-Version: 1.0
X-Received: by 10.28.142.205 with SMTP id q196mr7830380wmd.42.1447832000236;
	Tue, 17 Nov 2015 23:33:20 -0800 (PST)
Received: by 10.194.154.232 with HTTP; Tue, 17 Nov 2015 23:33:20 -0800 (PST)
In-Reply-To: <1447796692.2296.21.camel@gmail.com>
References: <1447271300-4153-1-git-send-email-adrian.freihofer@gmail.com>
	<1447271300-4153-8-git-send-email-adrian.freihofer@gmail.com>
	<20151116213457.GG2240@jama> <1447796692.2296.21.camel@gmail.com>
Date: Wed, 18 Nov 2015 08:33:20 +0100
Message-ID: <CA+chaQf8ZY2=RF_vjMf_G+DUnW4vVAVkU9+Cw91KpmK9u72k-w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 07/17] networkmanager: support gnutls and nss
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
X-List-Received-Date: Wed, 18 Nov 2015 07:33:21 -0000
Content-Type: text/plain; charset=UTF-8

OK, will apply both fix-ups before next jenkins build.

On Tue, Nov 17, 2015 at 10:44 PM, Adrian Freihofer <
adrian.freihofer@gmail.com> wrote:

> On Mon, 2015-11-16 at 22:34 +0100, Martin Jansa wrote:
> > On Wed, Nov 11, 2015 at 08:48:10PM +0100, Adrian Freihofer wrote:
> > > Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
> > > ---
> > >  .../0002-add-pkg-config-for-libgcrypt.patch        | 41
> ++++++++++++++++++++++
> > >  .../networkmanager/networkmanager_1.0.6.bb         | 14 ++++++--
> > >  2 files changed, 52 insertions(+), 3 deletions(-)
> > >  create mode 100644
> meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for
> > > -libgcrypt.patch
> > >
> > > diff --git
> a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
> > >
> b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
> > > new file mode 100644
> > > index 0000000..bb95eaa
> > > --- /dev/null
> > > +++
> b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0002-add-pkg-config-for-libgcrypt.patch
> > > @@ -0,0 +1,41 @@
> > > +From a9261fee4a41045c42e0d292237cee532e11982c Mon Sep 17 00:00:00 2001
> > > +From: Adrian <adrian.freihofer@gmail.com>
> > > +Date: Thu, 27 Nov 2014 15:43:26 +0100
> > > +Subject: [PATCH] add pkg config for libgcrypt
> > > +
> > > +---
> > > + configure.ac | 18 +++++++-----------
> > > + 1 file changed, 7 insertions(+), 11 deletions(-)
> > > +
> > > +diff --git a/configure.ac b/configure.ac
> > > +index 94b0758..654a015 100644
> > > +--- a/configure.ac
> > > ++++ b/configure.ac
> > > +@@ -480,17 +480,13 @@ if test x"$ac_crypto" = xnss; then
> > > +   with_nss=yes
> > > + elif test x"$ac_crypto" = xgnutls; then
> > > +   PKG_CHECK_MODULES(GNUTLS, [gnutls >= 1.2])
> > > +-  AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
> > > +-  if test x"$LIBGCRYPT_CONFIG" = xno; then
> > > +-    AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found
> on system])
> > > +-  else
> > > +-    AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
> > > +-    LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG --cflags`
> > > +-    LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG --libs`
> > > +-    AC_SUBST(LIBGCRYPT_CFLAGS)
> > > +-    AC_SUBST(LIBGCRYPT_LIBS)
> > > +-    with_gnutls=yes
> > > +-  fi
> > > ++  AC_DEFINE(HAVE_GNUTLS, 1, [Define if you have libgnutls])
> > > ++  PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= 1.1.42], [
> > > ++      AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is
> available.])
> > > ++      with_gnutls=yes
> > > ++    ], [
> > > ++      AC_MSG_ERROR([gnutls explicitly requested but gcrypt not found
> on system])
> > > ++    ])
> > > + else
> > > +   AC_MSG_ERROR([Please choose either 'nss' or 'gnutls' for
> certificate and crypto operations])
> > > + fi
> > > +--
> > > +1.9.1
> > > +
> > > diff --git a/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb b/meta-oe/recipes
> > > -connectivity/networkmanager/networkmanager_1.0.6.bb
> > > index d529b4a..3a59f83 100644
> > > --- a/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb
> > > +++ b/meta-oe/recipes-connectivity/networkmanager/
> networkmanager_1.0.6.bb
> > > @@ -6,13 +6,14 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
> > >
> file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
> > >
> file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b"
> > >
> > > -DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools nss
> util-linux libndp"
> > > +DEPENDS = "libnl dbus dbus-glib libgudev wireless-tools util-linux
> libndp"
> > >
> > >  inherit gnomebase gettext systemd
> > >
> > >  SRC_URI = " \
> > >
> ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz
> \
> > >
> file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
> > > +    file://0002-add-pkg-config-for-libgcrypt.patch \
> > >  "
> > >
> > >  SRC_URI[md5sum] = "00f5f9ec69725a9f9b99366853c6f73e"
> > > @@ -26,7 +27,6 @@ EXTRA_OECONF = " \
> > >      --disable-ifnet \
> > >      --disable-ifcfg-suse \
> > >      --with-netconfig \
> > > -    --with-crypto=nss \
> > >      --disable-more-warnings \
> > >      --with-dhclient=${base_sbindir}/dhclient \
> > >      --with-iptables=${sbindir}/iptables \
> > > @@ -34,7 +34,13 @@ EXTRA_OECONF = " \
> > >      --with-dnsmasq=${bindir}/dnsmasq \
> > >  "
> > >
> > > -PACKAGECONFIG ??=
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}"
> > > +# If you need a different configuration for networkmanager, add lines
> similar to
> > > +# the following example to your local.conf or distro config
> > > +# PACKAGECONFIG_remove_pn-networkmanager = "nss"
> > > +# PACKAGECONFIG_append_pn-networkmanager = " gnutls modemmanager ppp"
> > > +PACKAGECONFIG ??= "nss \
> > > +
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','consolekit',d)}
> \
> > > +"
> > >  PACKAGECONFIG[systemd] = " \
> > >      --with-systemdsystemunitdir=${systemd_unitdir}/system
> --with-session-tracking=systemd --enable-polkit, \
> > >      --without-systemdsystemunitdir, \
> > > @@ -46,6 +52,8 @@ PACKAGECONFIG[bluez5] =
> "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
> > >  PACKAGECONFIG[concheck] =
> "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
> > >  PACKAGECONFIG[modemmanager] =
> "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
> > >  PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp"
> > > +PACKAGECONFIG[nss] = "--with-crypto=nss,,nss"
> >
> > won't it detect nss when available in sysroot?
>
> Why is nss available in sysroot if not because of networkmanager depends
> on it?
>
> >
> > > +PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls
> libgcrypt,gnutls libgcrypt"
> >
> > Why do you need to add gnutls and libgcrypt manually to RDEPENDS?
>
> Your are right. Should be:
> +PACKAGECONFIG[gnutls] = "--with-crypto=gnutls,,gnutls libgcrypt"
> May you apply another fixup for me? (Sorry, I can't see a way how I could
> do this task.)
>
> >
> > >
> > >  PACKAGES =+ "libnmutil libnmglib libnmglib-vpn ${PN}-tests
> ${PN}-bash-completion"
> > >
> > > --
> > > 2.4.3
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

