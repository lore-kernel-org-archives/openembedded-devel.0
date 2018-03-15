Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0AA7160069
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:33:15 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id x17so4726254ywj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2018 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vvuunK7Cj2fH2JqscJ57ozV1UDI/1PU6674UBAVIR1w=;
	b=V8kCq1liBNmrHNCxZzlXMhUxjQg2zr/cWPo7zOPNpnR1CGvaLDlQ2x1qbBfNID3aI/
	QZHo2vfVlCxluM8rWtsy6OorQSCtRnujQYvjWoZxce9ikGSeVAUG1kGWQjZr6iEYUqCM
	qOGOpFCpwTHi2bdJOttPCmBKLvbrHVBN6NJDA+4KFG3afy2yrX68RaKA4vIW2EqZ2GdK
	1icvAGhcrgDKOMJlclQXbosbDqQCnujZsi6esPF770bPZZ9UaLZZPM0pis7ac0oIs0o5
	YDbuYnYY5uZZq38OHA9Zffqvu4S8aOymqn1teiuO1DuFx1VNPgV1fIVWfMeEb4lbX2qJ
	DS8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vvuunK7Cj2fH2JqscJ57ozV1UDI/1PU6674UBAVIR1w=;
	b=rcmEzFIWQqSBNVWAGmZUlvRDpjIJzDjbJJWHGmU5wAuP6/9ZzjtchmO54Wy4Y9rX+M
	9Bl+C2Itm7Su1WF2bl7rMoNBrSC36dxoNCnmc7bHq92uH7iKblJHiXfZi91H+NV+XH4U
	73WfOtO/TMXV6QA9iyqUSegpCA9tEQHKMAeDyJqv66s//y6sZ/Hakyury6860Udvh24X
	Abwg1dxwbizGqk9sObbLBfD0kdNMK4nDtIuStgScQIJs3giGLOO3XX4aZWHQ3AqI6k2I
	28XtyDUeea25vKqGMWft3l8xdXKU6PJV1igo1SvUHL9IGtzGbMPMBI5yhMVotlcVgPs8
	1gdg==
X-Gm-Message-State: AElRT7HjMbEg2UmFN1hchn5jxnWNlO/z6kQG9vJzfB9a8pxfJX/Oj5dX
	XVWAuf9kt2Bgx6oWi/C7mxO+A97AQs9B3ZItixQ=
X-Google-Smtp-Source: AG47ELtJUx09QWyrBvobgf0kTD2gVCshzh67ppn8oHghy81UyyT8JGrrgh3iHOd66WN9Ljoy/cvGBxc8PRnA0bXbEvk=
X-Received: by 2002:a25:cccb:: with SMTP id
	l194-v6mr5716845ybf.237.1521124396846; 
	Thu, 15 Mar 2018 07:33:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Thu, 15 Mar 2018 07:33:15
	-0700 (PDT)
In-Reply-To: <20180313222055.47545-1-psaavedra@igalia.com>
References: <20180313222055.47545-1-psaavedra@igalia.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 15 Mar 2018 15:33:15 +0100
Message-ID: <CALbNGRRU1BZis6nTNj_q+gGX1nzvKCxjYpM_Sk7vdcK3km79Gw@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] networkmanager upgrade to 1.10.6
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
X-List-Received-Date: Thu, 15 Mar 2018 14:33:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 13, 2018 at 11:20 PM, Pablo Saavedra <psaavedra@igalia.com> wrote:
> * Upgraded to latest stable version [1]
> * Forward-port of the Yocto patches
> * Disabled 0004-Define-missing-features-to-cater-for-musl.patch
> * This version keeps fixed 'Fixed setting 802-1x.password-raw
>   property in nmcli' error. Fixed on 1.6.4 [2].
>
> References:
>
> [1] https://cgit.freedesktop.org/NetworkManager/NetworkManager/tree/NEWS?h=nm-1-10
> [2] https://cgit.freedesktop.org/NetworkManager/NetworkManager/tree/NEWS?h=1.6.4#n11
>
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  ...adjust-net-headers-for-musl-compatibility.patch |  32 +-
>  ...dns-resolved-add-systemd-resolved-backend.patch | 621 ---------------------
>  ...ed-also-check-for-etc-resolv-conf.systemd.patch |  29 -
>  ...o-run-sbin-dhclient-to-get-the-version-nu.patch |  36 --
>  ...stemd-xlocale.h-is-dropped-by-newer-glibc.patch |  29 -
>  .../0002-Fix-nm-version-macro-includes.patch       |  58 --
>  ...et-util.h-Include-linux-sockios.h-on-musl.patch |  14 +-
>  ...-string-in-g_dbus_message_new_method_erro.patch |  67 ---
>  .../networkmanager/0003-Define-ETH_ALEN.patch      |  10 +-
>  ...Define-missing-features-to-cater-for-musl.patch |  41 +-
>  ...emove-net-ethernet.h-seems-to-be-over-spe.patch |  44 +-
>  ... 0006-check-for-strndupa-before-using-it.patch} |  22 +-
>  ...figure.ac-Fix-pkgconfig-sysroot-locations.patch |  25 +
>  ...rkmanager_1.4.4.bb => networkmanager_1.10.6.bb} |  21 +-
>  14 files changed, 119 insertions(+), 930 deletions(-)
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-add-systemd-resolved-backend.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-Fix-nm-version-macro-includes.patch
>  delete mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0002-user-format-string-in-g_dbus_message_new_method_erro.patch
>  rename meta-networking/recipes-connectivity/networkmanager/networkmanager/{0001-check-for-strndupa-before-using-it.patch => 0006-check-for-strndupa-before-using-it.patch} (77%)
>  create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch
>  rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.4.4.bb => networkmanager_1.10.6.bb} (81%)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> similarity index 81%
> rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
> rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> index d5f456f37..6538e7b82 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
> @@ -5,7 +5,7 @@ SECTION = "net/misc"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
>                      file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
> -                    file://docs/api/html/license.html;md5=8eb8e72bab097b9d11763002cb003697 \
> +                    file://docs/api/html/license.html;md5=77b9e362690c149da196aefe7712db30 \
>  "
>
>  DEPENDS = " \
> @@ -20,6 +20,7 @@ DEPENDS = " \
>      libnewt \
>      polkit \
>      jansson \
> +    curl \
>  "
>
>  inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
> @@ -27,21 +28,15 @@ inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introsp
>  GI_DATA_ENABLED_libc-musl = "False"
>
>  SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
> -           file://0001-don-t-try-to-run-sbin-dhclient-to-get-the-version-nu.patch \
> -           file://0002-Fix-nm-version-macro-includes.patch \
>             file://0001-adjust-net-headers-for-musl-compatibility.patch \
>             file://0002-socket-util.h-Include-linux-sockios.h-on-musl.patch \
>             file://0003-Define-ETH_ALEN.patch \
> -           file://0004-Define-missing-features-to-cater-for-musl.patch \
>             file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
> -           file://0001-check-for-strndupa-before-using-it.patch \
> -           file://0001-dns-resolved-add-systemd-resolved-backend.patch \
> -           file://0001-dns-resolved-also-check-for-etc-resolv-conf.systemd.patch \
> -           file://0001-systemd-xlocale.h-is-dropped-by-newer-glibc.patch \
> -           file://0002-user-format-string-in-g_dbus_message_new_method_erro.patch \
> +           file://0006-check-for-strndupa-before-using-it.patch \
> +           file://0007-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
>             "
> -SRC_URI[md5sum] = "63f1e0d6d7e9099499d062c84c927a75"
> -SRC_URI[sha256sum] = "829378f318cc008d138a23ca6a9191928ce75344e7e47a2f2c35f4ac82133309"
> +SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
> +SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
>
>  S = "${WORKDIR}/NetworkManager-${PV}"
>
> @@ -49,6 +44,7 @@ EXTRA_OECONF = " \
>      --disable-ifcfg-rh \
>      --disable-ifnet \
>      --disable-ifcfg-suse \
> +    --disable-introspection \
^ Why disable introspection?
>      --disable-more-warnings \
>      --with-iptables=${sbindir}/iptables \
>      --with-tests \
> @@ -73,7 +69,6 @@ PACKAGECONFIG[systemd] = " \
>  PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
>  # consolekit is not picked by shlibs, so add it to RDEPENDS too
>  PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
> -PACKAGECONFIG[concheck] = "--with-libsoup=yes,--with-libsoup=no,libsoup-2.4"
>  PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
>  PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
>  # Use full featured dhcp client instead of internal one
> @@ -101,6 +96,8 @@ FILES_${PN} += " \
>      ${libexecdir} \
>      ${libdir}/pppd/*/nm-pppd-plugin.so \
>      ${libdir}/NetworkManager/*.so \
> +    ${libdir}/NetworkManager/VPN \
> +    ${libdir}/NetworkManager/conf.d \
>      ${datadir}/polkit-1 \
>      ${datadir}/dbus-1 \
>      ${base_libdir}/udev/* \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

