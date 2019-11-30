Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id DD4A460879
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 08:10:53 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id v23so19858085qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 00:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=al449eSy5YYIiDHBrYel2d1G+Kd/OVOY/8+i6SjMb/o=;
	b=iUjudgw3dJfUpWEccd2ZnRK5uIJb/hkMx6GtNKetxbbImAlOf5ymcKn1xc0CveemMd
	3Cmk4Iif3tsLd49tG0dNbHT6GVQ1yFJSzM5RPfaaNO/UiIVzpuq5koP/vMkm5UGq69Zw
	0vmfNrAzJnwUIjx7t9//dfOcRo1WXhWskuDJseWDb6mADo44BBh2BA56DLDKJ6jpqOOL
	RBI2qlwtsJddVcqmAFtIaL0bbGQLrLgMgFKFRPPYCNPt0FBu23UhB8SQYWK/ICDOfqhG
	vK/QSfETHbOco9/II0+x7Q053fYi2pp/q0eS6Nsr4MePbX2TJ9L8iJSBeovbuhNZYrCT
	Cnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=al449eSy5YYIiDHBrYel2d1G+Kd/OVOY/8+i6SjMb/o=;
	b=iLftf1oPNRaZ5N80CD2FDc+Hr/jWv4Csc7KGZlXCMmRxviQFCACcJpWIPr31M2Bz8J
	pI6oN5DNO/Ya3WTQmjXaWljsW0tLbTUOwumbrEJVxOI/lyfe5qOvKE36a7BXuG06W14E
	R2K4PQp6x83CkllEVJy1mCT4tREPAL6KV25iMxp6LmVYtJVWvlgCjfVBfYfdBQsiMXOX
	GwlPBzBEnML7iRbGgtRoY3ms3xKaYKGVFEnPR2bLJWClMF3Z5VV+B2llJTp4wuZBDVBd
	xU6fuN31Jhiz4qtYwAFrEr6EffFlO6LFMOSXbQUTPqOA4tg93D/hC6V9jQOGotW7tZWJ
	wH3w==
X-Gm-Message-State: APjAAAULqXhQnChBs7J3aEpnWM3QkUDmkTiqtSQVM3KeISDJIOJK+lM5
	vo7vBO6os8e/k1ddN2RyhCslqf6Tx9I7j5OZ7fXUILzk3H8=
X-Google-Smtp-Source: APXvYqw97/3aBQGE6XgHhZIlpuo1w0hDE3QOVa1P8WJDfVK4sxheIv38S2T0VMz44ShXA333EKwIKraUWLaFy/oiBv8=
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr5786522qkg.71.1575101454275; 
	Sat, 30 Nov 2019 00:10:54 -0800 (PST)
MIME-Version: 1.0
References: <1575033276-1496-1-git-send-email-jacopo.dallaglio@kynetics.com>
In-Reply-To: <1575033276-1496-1-git-send-email-jacopo.dallaglio@kynetics.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 30 Nov 2019 00:10:28 -0800
Message-ID: <CAMKF1sq7svb+GBsnsnxJTs5bfOdpRS2uOh7qQQcADvMm1m8Pxg@mail.gmail.com>
To: "Jacopo Dall'Aglio" <jacopo.dallaglio@kynetics.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] netplan: add recipe
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
X-List-Received-Date: Sat, 30 Nov 2019 08:10:54 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build on mips/sysvinit/glibc

https://errors.yoctoproject.org/Errors/Details/289626/

On Fri, Nov 29, 2019 at 5:14 AM Jacopo Dall'Aglio
<jacopo.dallaglio@kynetics.com> wrote:
>
> Canonical's Netplan is a network configuration abstraction renderer written in
> Python. It's compatible with NetworkManager and systemd-networkd.
>
> Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
> ---
> Resending patch to correct mailing-list. This patch depends on
> "[meta-python][PATCH] python-netifaces: add recipes".
> ---
>  .../recipes-connectivity/netplan/netplan_0.98.bb   | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
>
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> new file mode 100644
> index 0000000..1251de3
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> @@ -0,0 +1,55 @@
> +SUMMARY = "The network configuration abstraction renderer"
> +DESCRIPTION = "Netplan is a utility for easily configuring networking on a \
> +linux system. You simply create a YAML description of the required network \
> +interfaces and what each should be configured to do. From this description \
> +Netplan will generate all the necessary configuration for your chosen renderer \
> +tool."
> +HOMEPAGE = "https://netplan.io"
> +SECTION = "net/misc"
> +
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "5d22e9d22c4a3724d27b80b0cd9b898ae8f59d2b"
> +PV = "0.98+git${SRCPV}"
> +
> +SRC_URI = " \
> +        git://github.com/CanonicalLtd/netplan.git \
> +"
> +
> +DEPENDS = "glib-2.0 libyaml"
> +RDEPENDS_${PN} = "python3 python3-core python3-pyyaml python3-netifaces python3-nose python3-coverage python3-pycodestyle python-pyflakes util-linux-libuuid"
> +
> +inherit pkgconfig systemd
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +EXTRA_OEMAKE = "generate netplan-dbus dbus/io.netplan.Netplan.service"
> +
> +do_install() {
> +       install -d ${D}${sbindir} ${D}${base_libdir}/netplan ${D}${datadir}/netplan/netplan/cli/commands ${D}${sysconfdir}/netplan
> +       install -m 755 ${S}/generate ${D}${base_libdir}/netplan/
> +       install -m 644 ${S}/netplan/*.py ${D}${datadir}/netplan/netplan
> +       install -m 644 ${S}/netplan/cli/*.py ${D}${datadir}/netplan/netplan/cli
> +       install -m 644 ${S}/netplan/cli/commands/*.py ${D}${datadir}/netplan/netplan/cli/commands
> +       install -m 755 ${S}/src/netplan.script ${D}${datadir}/netplan/
> +       ln -srf ${D}${datadir}/netplan/netplan.script ${D}${sbindir}/netplan
> +
> +       install -d ${D}/${systemd_unitdir}/system ${D}${systemd_unitdir}/system-generators
> +       install -m 644 ${S}/src/netplan-wpa@.service ${D}${systemd_unitdir}/system/
> +       ln -srf ${D}/${base_libdir}/netplan/generate ${D}${systemd_unitdir}/system-generators
> +
> +       install -d ${D}${datadir}/dbus-1/system.d ${D}${datadir}/dbus-1/system-services
> +       install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
> +       install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
> +       install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
> +}
> +
> +SYSTEMD_SERVICE_${PN} = "netplan-wpa@.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +PACKAGES += "${PN}-dbus"
> +
> +FILES_${PN} = "${sbindir} ${base_libdir}/netplan/generate ${datadir}/netplan ${sysconfdir}/netplan ${systemd_unitdir}"
> +FILES_${PN}-dbus = "${base_libdir}/netplan/netplan-dbus ${datadir}/dbus-1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

