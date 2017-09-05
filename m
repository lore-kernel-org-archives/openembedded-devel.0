Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8655478093
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Sep 2017 12:30:05 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id t10so1019918vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Sep 2017 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iaePT1NfOcdhKp68ZQY1AyZOkcccluhTIDTh4hZtUjU=;
	b=G3N42Uw9C/IfdPxU7FTPdXildoyxKvHRTsWUn6x/GkJshogmxYNb2gsF9jRCB/MxJS
	4HIcECm1Hv21WIs5ABwuHW851Vmm5Odn3GUs9DPUc3niVLJwHL9Kk7HJQhLT8JnVzT+2
	BMzbEVGN3/GkT2BQYm3m5UNaCGWgZ+NWZSh+kZkWI4FFri7iV079BQ1u5c15sy8DeGts
	EtcCM5+CoBKWmWrEIAp3TLWvdHY0fhk9zlm4Y5dCZSHwbRp2/wt2mFnIJEOo64UHFdFe
	meLPzOiMu6GTSgRLVwGJVm7VULfi1dAUBwUNJ7SLhVSV50QfG9PNxZsVdZwUL1HnDkAE
	esfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iaePT1NfOcdhKp68ZQY1AyZOkcccluhTIDTh4hZtUjU=;
	b=BajNNcy66d/V1h1o4Tyvwz1+0EMbVTKLCuMpWycN4xwoVKpodnZ3E7RXUMRwrP2gEL
	MRMLIzF92kIWOOGcSIt1wfYMnkbRC4UTpZKz5rbwOncLNPceE8BZGZfVXCrofJ3dAQOi
	zBjGxgIiQAS9yIXuj58hrayQh7AuiCmJhFsmT7PPHsnlUurA9lt3X5R/zlxg4o5tLxhe
	2hjdXopeWFQOYhfVee1CTsp/NOWAcOfsWe8R43uFX7DyUwP0f4xT2q5VH5u6UcQHj9QH
	JkQolMwQPwNEqr71oJ9fojW0WMJ4j888msEKoETuobHOnx1G3skRhTXeqNOs3KPySY6J
	V6YQ==
X-Gm-Message-State: AHPjjUh1ZmBMO9N0Wti2j35bJUgH4s4mRAbNmHv6NOgS2q2NbjiTsImQ
	V4aQGM8alRjGuAe1nti5Gd0rOWPz9A==
X-Google-Smtp-Source: ADKCNb6MD9b3aqZtm8e3eMeBS3M3fG03xImy1PA4Yin80auu6WnPdtJF7zbVGVjBzKbIJda0ia6W6yeuwo+gM8CBQoo=
X-Received: by 10.31.231.1 with SMTP id e1mr2307045vkh.90.1504614606393; Tue,
	05 Sep 2017 05:30:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.15.69 with HTTP; Tue, 5 Sep 2017 05:30:05 -0700 (PDT)
In-Reply-To: <6286ca12b20fb1972ee77d1fc217eb7ebbf60080.1503998700.git.jackie.huang@windriver.com>
References: <cover.1503998700.git.jackie.huang@windriver.com>
	<6286ca12b20fb1972ee77d1fc217eb7ebbf60080.1503998700.git.jackie.huang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 5 Sep 2017 14:30:05 +0200
Message-ID: <CA+chaQcm0g_6Di-h93_Kn=v6i+h+C1D6HtaVFFaZuwbgrsfkWQ@mail.gmail.com>
To: JackieHuang <jackie.huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] corosync: add support for extra features
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
X-List-Received-Date: Tue, 05 Sep 2017 12:30:05 -0000
Content-Type: text/plain; charset="UTF-8"

Can you please also fix:
corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/
corosync/2.4.2-r0/packages-split/corosync/usr/sbin/corosync' has
relocations in .text [textrel]

it's been there for long time.

On Tue, Aug 29, 2017 at 11:27 AM, <jackie.huang@windriver.com> wrote:

> From: Jackie Huang <jackie.huang@windriver.com>
>
> * Add support for features: dbus qdevice qnetd snmp
> * Add related PACKAGECONFIG
> * inherit useradd to add proper user for qnetd service
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../recipes-extended/corosync/corosync_2.4.2.bb    | 30
> +++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
> b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
> index 2f3aef299..7d5a87e4c 100644
> --- a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
> +++ b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://corosync.github.io/corosync/"
>
>  SECTION = "base"
>
> -inherit autotools pkgconfig systemd
> +inherit autotools pkgconfig systemd useradd
>
>  SRC_URI = "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz"
>  SRC_URI[md5sum] = "547fa78704da53aa35912be58d31035f"
> @@ -16,13 +16,23 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> a85eb4ce24033adb6088dd1d6ffc5e5d"
>
>  DEPENDS = "groff-native nss libqb"
>
> -SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service"
> +SYSTEMD_SERVICE_${PN} = "corosync.service corosync-notifyd.service \
> +                         ${@bb.utils.contains('PACKAGECONFIG',
> 'qdevice', 'corosync-qdevice.service', '', d)} \
> +                         ${@bb.utils.contains('PACKAGECONFIG', 'qnetd',
> 'corosync-qnetd.service', '', d)} \
> +"
>  SYSTEMD_AUTO_ENABLE = "enable"
>
>  INITSCRIPT_NAME = "corosync-daemon"
>
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +                   dbus qdevice qnetd snmp \
> +"
>
> +PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
> +PACKAGECONFIG[qdevice] = "--enable-qdevices,--disable-qdevices"
> +PACKAGECONFIG[qnetd] = "--enable-qnetd,--disable-qnetd"
> +PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
> +PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
>  PACKAGECONFIG[systemd] = "--enable-systemd --with-systemddir=${systemd_
> system_unitdir},--disable-systemd --without-systemddir,systemd"
>
>  EXTRA_OECONF = "ac_cv_path_BASHPATH=${base_bindir}/bash"
> @@ -43,12 +53,26 @@ do_install_append() {
>      install -d ${D}${sysconfdir}/default/volatiles
>      echo "d root root 0755 ${localstatedir}/log/cluster none" >
> ${D}${sysconfdir}/default/volatiles/05_corosync
>
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true', 'false',
> d)}; then
> +        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
> +        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >>
> ${D}${sysconfdir}/default/volatiles/05_corosync
> +    fi
> +
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)};
> then
>          install -d ${D}${sysconfdir}/tmpfiles.d
>          echo "d ${localstatedir}/log/cluster - - - -" >
> ${D}${sysconfdir}/tmpfiles.d/corosync.conf
> +
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'qnetd', 'true',
> 'false', d)}; then
> +            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf
> ${D}${sysconfdir}/tmpfiles.d
> +        fi
>      fi
>  }
>
>  RDEPENDS_${PN} += "bash"
>
>  FILES_${PN}-dbg += "${libexecdir}/lcrso/.debug"
> +FILES_${PN}-doc += "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM_${PN} = "--system coroqnetd"
> +USERADD_PARAM_${PN} = "--system -d / -M -s /bin/nologin -c 'User for
> corosync-qnetd' -g coroqnetd coroqnetd"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

