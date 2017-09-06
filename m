Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id A2C7A71B69
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 01:09:21 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y68so2387113pfd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Sep 2017 18:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wPbNAhMtoqBn4noiuCyX449G85iitb5O+DF7nVjgj8Q=;
	b=tI1u13gTIdNPy6TopYTxrVjD9iFUsce86lWF9+jKIvuFbLulrvRF5Zoc7+r/ZCcBeM
	jcnWSAI/SZUv7e/cWpwY7Gz+KS0IJhfKF4QrD8Bsy8faz1r6sJePwKYWRAW4b14ZdjPp
	MholQEc9Jmgtjo0sOeHuSVKCMTPSVN1+LZ4izhhwlvbjthPTC08xEbwQ6uusJgm/zgvk
	7SKpIRVrBgxseIee576Q6K4nOUL6YqB3cRZgTvYnYxAdD1IzrwG9B7cJ4HgK3hDJEZBt
	edvx7pz+2h9vuHyUl+couDEzopKF/nryD2Dvd+WKXLgBtC8uWjFJcs0jKdKUPy/9THuh
	eh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wPbNAhMtoqBn4noiuCyX449G85iitb5O+DF7nVjgj8Q=;
	b=Q7xvKLY4irQTHzLg+3cirsv1PG14encXQ6+KMP03KZox0+yeV6gioHxbnlS0vyzKJc
	YlcY+iOBjaQ4kOWf5ApZo2J6hJtqu3y29PnObI4jAyuHYlPa7TrM2Ab0UOIACiUd6odV
	YqFNJqT3lHs7lE3USzeK13GEx9unGzJrHD/FmIvneiRz61v1FpVAU4ELEicnTVS7xvam
	G6FJZ30v+wj/9Nq/Q8/+XPnTgXPb2Cx4nvWwv70rnk3TMsiHpfm6aKylcv7l3S6ra9KZ
	FGFpAMTXukdT5+PmMuQmO9U6LgGjOjMhIwCLKNQv/pXdlzXfcibsozsi+zVcxrdzx8e9
	tc2w==
X-Gm-Message-State: AHPjjUgAsoI2W5/lCKVTc+ivptQ/7MB1MU7crMnxMk1+bxYNNARRypTl
	Lqqult1B4MJouoeL+2BwCUjZjLWDXQ==
X-Google-Smtp-Source: ADKCNb4JYoJuKnv1pwsQchKt+DmTy5FddNfa9hOoFJEpby4Nju6KslmXFB7fOPfJEZvhP7CMkzwpV6Gzg6PLueUgtm0=
X-Received: by 10.84.246.201 with SMTP id j9mr1978676plt.114.1504660162542;
	Tue, 05 Sep 2017 18:09:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Tue, 5 Sep 2017 18:08:52 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B894A6D@ALA-MBC.corp.ad.wrs.com>
References: <cover.1503998700.git.jackie.huang@windriver.com>
	<6286ca12b20fb1972ee77d1fc217eb7ebbf60080.1503998700.git.jackie.huang@windriver.com>
	<CA+chaQcm0g_6Di-h93_Kn=v6i+h+C1D6HtaVFFaZuwbgrsfkWQ@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B894A6D@ALA-MBC.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Sep 2017 18:08:52 -0700
Message-ID: <CAMKF1srJm5Y4UonABYcOmD7MP6ocnWnpoktNwCbr7oV6m5eA5w@mail.gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
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
X-List-Received-Date: Wed, 06 Sep 2017 01:09:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

include security-flags.inc file in distro config. if you use poky for
distro then set DISTRO=3Dpoky-lsb and you will be able to reproduce it

On Tue, Sep 5, 2017 at 6:01 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
> Yes, sure, but I can=E2=80=99t reproduce this, could you show me the conf=
ig that had this issue? Thanks!
>
> Thanks,
> Jackie
>
> From: Martin Jansa [mailto:martin.jansa@gmail.com]
> Sent: Tuesday, September 05, 2017 20:30
> To: Huang, Jie (Jackie)
> Cc: openembedded-devel
> Subject: Re: [oe] [meta-oe][PATCH 2/2] corosync: add support for extra fe=
atures
>
> Can you please also fix:
> corosync-2.4.2: ELF binary '/tmp/work/core2-64-oe-linux/corosync/2.4.2-r0=
/packages-split/corosync/usr/sbin/corosync' has relocations in .text [textr=
el]
>
> it's been there for long time.
>
> On Tue, Aug 29, 2017 at 11:27 AM, <jackie.huang@windriver.com<mailto:jack=
ie.huang@windriver.com>> wrote:
> From: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.huang@windri=
ver.com>>
>
> * Add support for features: dbus qdevice qnetd snmp
> * Add related PACKAGECONFIG
> * inherit useradd to add proper user for qnetd service
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com<mailto:jackie.hua=
ng@windriver.com>>
> ---
>  .../recipes-extended/corosync/corosync_2.4.2.bb<http://corosync_2.4.2.bb=
>    | 30 +++++++++++++++++++---
>  1 file changed, 27 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb<http://c=
orosync_2.4.2.bb> b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb<htt=
p://corosync_2.4.2.bb>
> index 2f3aef299..7d5a87e4c 100644
> --- a/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb<http://corosync=
_2.4.2.bb>
> +++ b/meta-oe/recipes-extended/corosync/corosync_2.4.2.bb<http://corosync=
_2.4.2.bb>
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://corosync.github.io/corosync/"
>
>  SECTION =3D "base"
>
> -inherit autotools pkgconfig systemd
> +inherit autotools pkgconfig systemd useradd
>
>  SRC_URI =3D "http://build.clusterlabs.org/corosync/releases/${BP}.tar.gz=
<http://build.clusterlabs.org/corosync/releases/$%7bBP%7d.tar.gz>"
>  SRC_URI[md5sum] =3D "547fa78704da53aa35912be58d31035f"
> @@ -16,13 +16,23 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da85eb4ce24=
033adb6088dd1d6ffc5e5d<file:///\\LICENSE;md5=3Da85eb4ce24033adb6088dd1d6ffc=
5e5d>"
>
>  DEPENDS =3D "groff-native nss libqb"
>
> -SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service"
> +SYSTEMD_SERVICE_${PN} =3D "corosync.service corosync-notifyd.service \
> +                         ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b=
@bb.utils.contains('PACKAGECONFIG>', 'qdevice', 'corosync-qdevice.service',=
 '', d)} \
> +                         ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b=
@bb.utils.contains('PACKAGECONFIG>', 'qnetd', 'corosync-qnetd.service', '',=
 d)} \
> +"
>  SYSTEMD_AUTO_ENABLE =3D "enable"
>
>  INITSCRIPT_NAME =3D "corosync-daemon"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}<mailto:$%7b@bb.utils.filter('DISTRO_FEATURES',%20'systemd',%20d)%7d>"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
} \
> +                   dbus qdevice qnetd snmp \
> +<mailto:$%7b@bb.utils.filter('DISTRO_FEATURES',%20'systemd',%20d)%7d%20\=
%0b+ %20 %20 %20 %20 %20 %20 %20 %20 %20 dbus%20qdevice%20qnetd%20snmp%20\%=
0b+>"
>
> +PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,dbus"
> +PACKAGECONFIG[qdevice] =3D "--enable-qdevices,--disable-qdevices"
> +PACKAGECONFIG[qnetd] =3D "--enable-qnetd,--disable-qnetd"
> +PACKAGECONFIG[rdma] =3D "--enable-rdma,--disable-rdma"
> +PACKAGECONFIG[snmp] =3D "--enable-snmp,--disable-snmp,net-snmp"
>  PACKAGECONFIG[systemd] =3D "--enable-systemd --with-systemddir=3D${syste=
md_system_unitdir},--disable-systemd --without-systemddir,systemd"
>
>  EXTRA_OECONF =3D "ac_cv_path_BASHPATH=3D${base_bindir}/bash"
> @@ -43,12 +53,26 @@ do_install_append() {
>      install -d ${D}${sysconfdir}/default/volatiles
>      echo "d root root 0755 ${localstatedir}/log/cluster none" > ${D}${sy=
sconfdir}/default/volatiles/05_corosync
>
> +    if ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.contains=
('PACKAGECONFIG>', 'qnetd', 'true', 'false', d)}; then
> +        chown -R coroqnetd:coroqnetd ${D}${sysconfdir}/${BPN}/qnetd
> +        echo "d coroqnetd coroqnetd 0770 /var/run/corosync-qnetd none" >=
> ${D}${sysconfdir}/default/volatiles/05_corosync
> +    fi
> +
>      if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d=
)}<mailto:$%7b@bb.utils.contains('DISTRO_FEATURES','systemd','true','false'=
,d)%7d>; then
>          install -d ${D}${sysconfdir}/tmpfiles.d
>          echo "d ${localstatedir}/log/cluster - - - -" > ${D}${sysconfdir=
}/tmpfiles.d/corosync.conf
> +
> +        if ${@bb.utils.contains('PACKAGECONFIG<mailto:$%7b@bb.utils.cont=
ains('PACKAGECONFIG>', 'qnetd', 'true', 'false', d)}; then
> +            install -m 0644 ${S}/conf/tmpfiles.d/corosync-qnetd.conf ${D=
}${sysconfdir}/tmpfiles.d
> +        fi
>      fi
>  }
>
>  RDEPENDS_${PN} +=3D "bash"
>
>  FILES_${PN}-dbg +=3D "${libexecdir}/lcrso/.debug"
> +FILES_${PN}-doc +=3D "${datadir}/snmp/mibs/COROSYNC-MIB.txt"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +GROUPADD_PARAM_${PN} =3D "--system coroqnetd"
> +USERADD_PARAM_${PN} =3D "--system -d / -M -s /bin/nologin -c 'User for c=
orosync-qnetd' -g coroqnetd coroqnetd"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists=
.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

