Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id CDFAE7F883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Dec 2019 16:48:05 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id a137so3885427qkc.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Dec 2019 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1lJOOPjubdMiXtQSqsf7rMDrjLzGQRYwi9O6ynsAu9Q=;
	b=OmpByQXvBrqOSOlWnUWL33q5632b9oxp0vyfvdQedGL6301PHWCH1T3QA+KuZvxUV2
	OgeEOnyOCbNBoa0pTOVNooiHD3cFo5Z4VyLEfZtXgiHHDi7inN1lp7IkcazFpzn3Ktj5
	gxHHWithUPXcgYdxgxVqRhXRevRVhO+zUgUimu2gG1EpRfp6/rjnsw8B6IASD4kRPBlD
	6YdabYBCLzbJEtqc0Xo+f/DApWnkOMGBfej1NwejdR8tyZnpU1DSFV24tPI0Ux70dME1
	/TYHLmaoFZzPq/K1HV7egINd5/Z2HIoNa3KGYAHgSU0DrBWj4xbS+vtM243hk4oxOzbw
	+29Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1lJOOPjubdMiXtQSqsf7rMDrjLzGQRYwi9O6ynsAu9Q=;
	b=UHUI5sUVXNYGSb0VgeomVUSIHaZxFoymHebmtYo6zdWPN+nTCDKkgGDMeF9pVM48UO
	4BB8Q0plefrioUEj9HkQfPRiHlOmN5FM1bC1UlCFFy4SqitgA/FdLAkG8dAYxpop4npw
	frqqw41BtEMiXGs2FjqQJbzazR+YIRFz2EYQ/V+QhsboApmaeviqduoHW+zKyzCx/oSD
	TNqgcNO0gL0ceKZicBufQ3pKx7WdvyOjBLICvJkairsPExTL4EJc3BgxNuQIAuDmWXeN
	I5MBZ4pdYaAZp7Yt0hb+CxRlFCfsv80WmLW3rXVMTLzwgnJlM3n7p0kg0HbD46j+oOAG
	uiLw==
X-Gm-Message-State: APjAAAUHUDdbEfDEEiOICy5wuAdCu8t+XOpMIu3OfE8+trIFSY5b6ZLQ
	ILg3RttPio95xXJ9KBpvLU7oVNmK//D516mNrpY=
X-Google-Smtp-Source: APXvYqxd2uN2gRLr0IAQ1w8+yhXfEj40iQHHiFPVkopa9sJkqrQXVfPKNH97zqDFQBskZ8bx2Cl/yhATVLp04lWwoeg=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr9580119qke.9.1575564484916; 
	Thu, 05 Dec 2019 08:48:04 -0800 (PST)
MIME-Version: 1.0
References: <1575562475-1830-1-git-send-email-jacopo.dallaglio@kynetics.com>
In-Reply-To: <1575562475-1830-1-git-send-email-jacopo.dallaglio@kynetics.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Dec 2019 08:47:35 -0800
Message-ID: <CAMKF1srGhF7HHCn0r8BVV3MRXrQkD7cJAKreVBAz91yG3y_Fjw@mail.gmail.com>
To: "Jacopo Dall'Aglio" <jacopo.dallaglio@kynetics.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] netplan: add recipe
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
X-List-Received-Date: Thu, 05 Dec 2019 16:48:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 5, 2019 at 8:15 AM Jacopo Dall'Aglio
<jacopo.dallaglio@kynetics.com> wrote:
>
> Canonical's Netplan is a network configuration abstraction renderer written in
> Python. It's compatible with NetworkManager and systemd-networkd.
>
> Signed-off-by: Jacopo Dall'Aglio <jacopo.dallaglio@kynetics.com>
> ---
> Resending patch with correct header and with correction applied for building
> with sysV init manager. This patch depends on "[meta-python][PATCH]
> python-netifaces: add recipes".
> ---
>  .../recipes-connectivity/netplan/netplan_0.98.bb   | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
>
> diff --git a/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> new file mode 100644
> index 0000000..860762c
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/netplan/netplan_0.98.bb
> @@ -0,0 +1,58 @@
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

why is this needed ? Can we fix it in sourcecode itself

> +
> +EXTRA_OEMAKE = "generate"
> +EXTRA_OEMAKE =+ "${@bb.utils.contains('DISTRO_FEATURES','systemd','netplan-dbus dbus/io.netplan.Netplan.service','',d)}"
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
> +       if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +               install -d ${D}${datadir}/dbus-1/system.d ${D}${datadir}/dbus-1/system-services
> +               install -m 755 ${S}/netplan-dbus ${D}${base_libdir}/netplan
> +               install -m 644 ${S}/dbus/io.netplan.Netplan.conf ${D}${datadir}/dbus-1/system.d
> +               install -m 644 ${S}/dbus/io.netplan.Netplan.service ${D}${datadir}/dbus-1/system-services
> +       fi
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

