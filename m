Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4210070016
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:30:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 133so13384954wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 00:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=flG70T9waY6vROps0XoIyidaIt0w4u+dmrMnFWsugLM=;
	b=0WXOI8ZEXkOchpEYU1xKAzgnZqrvsNTV5LNn/SfQke1fQQCwJhq9VDwuxqaUfDK5A0
	waMEttD0HyCIgfAILMInPi9VngevJoq+P+NiFVIkqk4vKJW1bcfLR7ZwUQlwnpvspICY
	zLbQYyjnHSWbhDmFEYOcqG81JBwEVhCNV8TmqDdXhapTkNlqdppejEKzY3B0tAGsNC3I
	IkKsvF9989tdOSm5pJmB3b4gPIOqL2k2Daz0T55nM55329BZZW/0+BYkQYH4PO11FFay
	Zt3tVsf5Af79w+ytyXFWlD2ipTe1+WwcylBjr6UMxsih028u8PPutbGfV4He2miZtvT3
	+qSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=flG70T9waY6vROps0XoIyidaIt0w4u+dmrMnFWsugLM=;
	b=Hs7Muflh8MizsaZm6HgGkWMwaG3AhGuYQyU+2JWP5ZmoqQEs8js4F9tChbWrlMs96W
	JDk06kGtt17Xfwgln/xxmc2IRAG3zeIZWpAGxqMOVAwlxTTsWuorVmMu/wikSJ2Mza4z
	JrdOCOekv84E+Yaflrd2STyafrr7qyyH6sNRAT0zn39pdVIVbiKffE2LlzsPRMpDt2oD
	jz1AjwflJsm++8ovbKZ1KdHj5l7tATGMv5xCuS87wthGeh/XQeSaXerT6MR0dZyo5XGe
	EECq9wW0ee9W3n0WFhXKUN94ZmeBLgqHZkuelLHmL4kiaF+yKSDQYMj5cISdv/O66OUh
	sdOw==
X-Gm-Message-State: AE9vXwONUHKy4t7kD7jZATERqKgeIzWkJm2CXAmfm7BtIw/d19Kt1kx2Vr6+3POHgx+hB76DP+Tus28rdO6fxg==
X-Received: by 10.194.164.102 with SMTP id yp6mr22236009wjb.50.1474270202902; 
	Mon, 19 Sep 2016 00:30:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.109.139 with HTTP; Mon, 19 Sep 2016 00:30:02 -0700 (PDT)
In-Reply-To: <1473675160-13440-1-git-send-email-zeenix@gmail.com>
References: <1473675160-13440-1-git-send-email-zeenix@gmail.com>
From: Zeeshan Ali <zeenix@gmail.com>
Date: Mon, 19 Sep 2016 09:30:02 +0200
Message-ID: <CAAa3hFMCbP2b21+iPzGa2SGnOPtKoN5G0dSX6h9-C_6-THEU6g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Zeeshan Ali <zeeshan.ali@pelagicore.com>
Subject: Re: [meta-oe] [PATCH v2] geoclue: Update to 2.4.4
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
X-List-Received-Date: Mon, 19 Sep 2016 07:30:03 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon, Sep 12, 2016 at 12:12 PM, Zeeshan Ali <zeenix@gmail.com> wrote:
> From: Zeeshan Ali <zeeshan.ali@pelagicore.com>
>
> Also drop redundant and now unusable patch.
>
> Signed-off-by: Zeeshan Ali <zeeshan.ali@pelagicore.com>
> ---

Is this patch good now?

>  .../geoclue/files/soup-session-fix.patch           | 30 ------------
>  .../recipes-navigation/geoclue/geoclue_2.0.0.bb    | 33 --------------
>  .../recipes-navigation/geoclue/geoclue_2.4.4.bb    | 53 ++++++++++++++++++++++
>  3 files changed, 53 insertions(+), 63 deletions(-)
>  delete mode 100644 meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
>  delete mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
>  create mode 100644 meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
>
> diff --git a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch b/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
> deleted file mode 100644
> index 70fe3f5..0000000
> --- a/meta-oe/recipes-navigation/geoclue/files/soup-session-fix.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -Upstream-Status: Upstream-Status: Inappropriate [poky 9.0 has older libsoup]
> -
> -Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> -
> -diff --git a/src/gclue-ipclient.c b/src/gclue-ipclient.c
> -index 09add30..1771d5c 100644
> ---- a/src/gclue-ipclient.c
> -+++ b/src/gclue-ipclient.c
> -@@ -83,7 +83,7 @@ gclue_ipclient_init (GClueIpclient *ipclient)
> - {
> -         ipclient->priv = G_TYPE_INSTANCE_GET_PRIVATE ((ipclient), GCLUE_TYPE_IPCLIENT, GClueIpclientPrivate);
> -
> --        ipclient->priv->soup_session = soup_session_new ();
> -+        ipclient->priv->soup_session = soup_session_sync_new ();
> - }
> -
> - /**
> -diff --git a/src/geoip-server/geoip-update.c b/src/geoip-server/geoip-update.c
> -index 6cce7b2..ef672ba 100644
> ---- a/src/geoip-server/geoip-update.c
> -+++ b/src/geoip-server/geoip-update.c
> -@@ -214,7 +214,7 @@ main (int argc, char **argv)
> -                         path = GEOIP_DATABASE_PATH;
> -         }
> -
> --        session = soup_session_new ();
> -+        session = soup_session_sync_new ();
> -
> -         for (i = 0; i < G_N_ELEMENTS (db_info_map); i++) {
> -                 SoupMessage *msg = NULL;
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
> deleted file mode 100644
> index 90e8533..0000000
> --- a/meta-oe/recipes-navigation/geoclue/geoclue_2.0.0.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -SUMMARY = "The Geolocation Service"
> -DESCRIPTION = "Geoclue is a D-Bus service that provides location information. \
> -The primary goal of the Geoclue project is to make creating location-aware applications \
> -as simple as possible, while the secondary goal is to ensure that no application \
> -can access location information without explicit permission from user."
> -LICENSE = "GPLv2.0+"
> -SECTION = "console/network"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
> -
> -DEPENDS = "glib-2.0 dbus dbus-glib json-glib libsoup-2.4 intltool-native"
> -
> -inherit autotools pkgconfig gtk-doc
> -
> -SRC_URI = " \
> -    http://www.freedesktop.org/software/geoclue/releases/2.0/geoclue-${PV}.tar.xz \
> -    file://soup-session-fix.patch \
> -"
> -
> -SRC_URI[md5sum] = "401ff99d530b177c62afacef0a33efd9"
> -SRC_URI[sha256sum] = "4a82f184e55a163d86e0ad69bbe1bba9960bb5094220fe1f01350bceda8c67a1"
> -
> -PACKAGECONFIG[geoip] = "--enable-geoip-server,--disable-geoip-server,geoip"
> -
> -EXTRA_OECONF += " \
> -    --with-dbus-service-user=root \
> -    --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
> -"
> -
> -FILES_${PN} += " \
> -    ${datadir}/dbus-1/system-services/org.freedesktop.GeoClue2.service \
> -    ${datadir}/geoclue-2.0/geoclue-interface.xml \
> -"
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
> new file mode 100644
> index 0000000..3170d44
> --- /dev/null
> +++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.4.4.bb
> @@ -0,0 +1,53 @@
> +SUMMARY = "The Geolocation Service"
> +DESCRIPTION = "Geoclue is a D-Bus service that provides location information. \
> +The primary goal of the Geoclue project is to make creating location-aware applications \
> +as simple as possible, while the secondary goal is to ensure that no application \
> +can access location information without explicit permission from user."
> +LICENSE = "GPLv2.0+"
> +SECTION = "console/network"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=8114b83a0435d8136b47bd70111ce5cd"
> +
> +DEPENDS = "glib-2.0 dbus json-glib libsoup-2.4 intltool-native"
> +
> +inherit autotools pkgconfig gtk-doc
> +
> +SRC_URI = " \
> +    http://www.freedesktop.org/software/geoclue/releases/2.4/geoclue-${PV}.tar.xz \
> +"
> +
> +SRC_URI[md5sum] = "d2a5b05f4bad032673fe23afbce27926"
> +SRC_URI[sha256sum] = "9c43fb9d0c12067ea64400500abb0640194947d4c2c55e38545afe5d9c5c315c"
> +
> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_INCDIR
> +export STAGING_LIBDIR
> +
> +# Without this line, package is delcared a library and named libgeoclue*
> +AUTO_LIBNAME_PKGS = ""
> +
> +PACKAGECONFIG ??= "3g modem-gps cdma nmea lib"
> +PACKAGECONFIG[3g] = "--enable-3g-source,--disable-3g-source,modemmanager"
> +PACKAGECONFIG[modem-gps] = "--enable-modem-gps-source,--disable-modem-gps-source,modemmanager"
> +PACKAGECONFIG[cdma] = "--enable-cdma-source,--disable-cdma-source,modemmanager"
> +PACKAGECONFIG[nmea] = "--enable-nmea-source,--disable-nmea-source,avahi"
> +PACKAGECONFIG[lib] = "--enable-libgeoclue,--disable-libgeoclue,gobject-introspection"
> +
> +EXTRA_OECONF += " \
> +    --with-dbus-service-user=root \
> +    --with-dbus-sys-dir=${sysconfdir}/dbus-1/system.d \
> +    --enable-demo-agent=no \
> +"
> +
> +FILES_${PN} += " \
> +    ${datadir}/dbus-1/system-services \
> +    ${libdir} \
> +    ${systemd_unitdir} \
> +    ${prefix}/libexec \
> +"
> +
> +FILES_${PN}-dev += " \
> +    ${datadir}/dbus-1/interfaces \
> +    ${datadir}/gir-1.0 \
> +"
> --
> 2.7.4
>



-- 
Regards,

Zeeshan Ali

