Received: from mail-pa0-f52.google.com ([209.85.220.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U5pKP-00012P-W3
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 04:17:47 +0100
Received: by mail-pa0-f52.google.com with SMTP id fb1so1045514pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2013 19:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xuxvtrik4ik/R+SAQmjCxavSpFJTaxI7UfAY7R1kV8c=;
	b=S/+LtXQJlV6bsMKjTQy6MAjMEa07w40aGPTOba59yyARME0y/TU7RZwMowRF9cBkB0
	SHAVkMuSPNe6LmMY4K2OS/iRsMUV1vh3wnvECNEhZPYzwtJrM7hECBjmzrRSmQ+WZNvf
	UQpM9ScVS06hYRh9qPnZTN8Y+ZyxhBz/s9fDPF2NRViee+Dq4lTJGTe5g/f1+PZrk+CU
	cSR3Y6yUIFua8UL+k25VvFSOXVcwGyAkh9qFowEDPdDaeu+Gp0xmjpXuelRkFY4eoYfN
	Dud9TSq2lS/5GCrk/nK0PRQcsnmLjTpw5IaQ8O4sGWA2INH/uSHFghlMxUoMIXo7XOMj
	ln2g==
X-Received: by 10.66.82.35 with SMTP id f3mr69706956pay.49.1360810899301;
	Wed, 13 Feb 2013 19:01:39 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id o1sm11214762pax.2.2013.02.13.19.01.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 19:01:37 -0800 (PST)
Date: Thu, 14 Feb 2013 04:01:33 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130214030133.GG3300@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<1360776335-21633-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1360776335-21633-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-systemd][PATCH 2/2] meta-systemd: Append ${PN} to SYSTEMD_SERVICE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 03:17:48 -0000
X-Groupsio-MsgNum: 43142
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline

--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 13, 2013 at 09:25:35AM -0800, Khem Raj wrote:
> When using systemd class from OE-Core we also need
> to install the units explicitly.
>=20
> systemd packages ending with -systemd are consumed
> and now provided by package proper.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../meta-efl/recipes-efl/efl/entrance_svn.bbappend |   16 +++++++++-----
>  .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    5 +++--
>  .../recipes-multimedia/musicpd/mpd_0.17.1.bbappend |    5 +++--
>  .../recipes-daemons/autofs/autofs_5.0.7.bbappend   |    5 +++--
>  .../recipes-support/nis/yp-tools_2.12.bbappend     |   10 +++++++--
>  .../recipes-support/nis/ypbind-mt_1.36.bbappend    |   10 ++++++---
>  .../recipes-support/ntp/ntp_4.2.6p5.bbappend       |    8 ++++---
>  .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |   11 ++++++++--
>  .../cherokee/cherokee_1.2.98.bbappend              |   11 ++++++++--
>  .../dnsmasq/dnsmasq_2.55.bbappend                  |   11 ++++++++--
>  .../gateone/gateone_git.bbappend                   |    9 ++++++--
>  .../networkmanager/networkmanager_0.9.2.0.bbappend |    3 +--
>  .../recipes-core/busybox/busybox_1.20.2.bbappend   |    6 +++---
>  .../dropbear/dropbear_2012.55.bbappend             |    9 ++++++--
>  .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |    6 ++++++
>  .../meta-oe/recipes-extended/at/at_3.1.13.bbappend |    9 ++++++--
>  .../recipes-extended/atftp/atftp_git.bbappend      |   11 ++++++++--
>  .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   11 ++++++++--
>  .../net-snmp/net-snmp_5.7.1.bbappend               |   13 ++++++++++--
>  .../rpcbind/rpcbind_0.2.0.bbappend                 |   10 +++++++--
>  .../rsyslog/rsyslog_5.8.0.bbappend                 |    5 +++--
>  .../recipes-extended/zram/zram_0.1.bbappend        |   11 ++++++++--
>  .../recipes-graphics/lxdm/lxdm_git.bbappend        |    5 +++--
>  .../xinput-calibrator_git.bbappend                 |   11 ++++++++--
>  .../xserver-nodm-init_2.0.bbappend                 |   11 ++++++----
>  .../recipes-navigation/gpsd/gpsd_3.7.bbappend      |    5 +++--
>  .../nonworking/syslog-ng/syslog-ng_3.2.5.bbappend  |    5 +++--
>  .../pcsc-lite/pcsc-lite_1.8.6.bbappend             |    5 +++--
>  .../strongswan/strongswan_5.0.0.bbappend           |    5 +++--
>  .../recipes-support/udisks/udisks_1.0.4.bbappend   |    5 +++--
>  .../avahi/avahi_0.6.31.bbappend                    |    7 ++++---
>  .../bluez/bluez4_4.101.bbappend                    |    5 +++--
>  .../connman/connman_1.10.bbappend                  |    5 +++--
>  .../recipes-connectivity/dhcp/dhcp_4.2.5.bbappend  |   22 ++++++++++++++=
++----
>  .../recipes-connectivity/ofono/ofono_1.12.bbappend |    5 +++--
>  .../openssh/openssh_6.1p1.bbappend                 |   13 ++++++++++--
>  .../portmap/portmap_6.0.bbappend                   |   10 +++++++--
>  .../util-linux/util-linux_2.22.2.bbappend          |    5 +++--
>  .../lighttpd/lighttpd_1.4.32.bbappend              |    7 +++++++
>  .../systemd/systemd-machine-units_1.0.bb           |    2 +-
>  40 files changed, 242 insertions(+), 86 deletions(-)
>=20
> diff --git a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend =
b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
> index df96e34..89f3565 100644
> --- a/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
> +++ b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
> @@ -1,13 +1,19 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PRINC :=3D "${@int(PRINC) + 2}"
> =20
>  inherit systemd
> =20
>  SRC_URI +=3D "file://entrance.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "entrance.service"
> +RPROVIDES_${PN} +=3D "${PN}"

This one looks incorrect.

Thanks for doing this! I'll merge it as soon as I can get it built.

> =20
> -RCONFLICTS_${PN}-systemd +=3D "xserver-nodm-init-systemd"
> -RREPLACES_${PN}-systemd +=3D "xserver-nodm-init-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "entrance.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/syst=
em
> +}
> +
> +RCONFLICTS_${PN} +=3D "xserver-nodm-init-systemd"
> +RREPLACES_${PN} +=3D "xserver-nodm-init-systemd"
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappen=
d b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> index 45b47c3..6ea753d 100644
> --- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> +++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> @@ -14,5 +14,6 @@ do_install_append() {
>  		> ${D}${systemd_unitdir}/system/gdm.service
>  }
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "gdm.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "gdm.service"
> diff --git a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_=
0.17.1.bbappend b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/m=
pd_0.17.1.bbappend
> index eee4cdd..e19723a 100644
> --- a/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.=
bbappend
> +++ b/meta-systemd/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.=
bbappend
> @@ -10,5 +10,6 @@ do_install_append() {
>          ${D}/${systemd_unitdir}/system/mpd.service
>  }
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "mpd.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "mpd.service"
> diff --git a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5=
=2E0.7.bbappend b/meta-systemd/meta-networking/recipes-daemons/autofs/autof=
s_5.0.7.bbappend
> index 3d318fb..f6792f1 100644
> --- a/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb=
append
> +++ b/meta-systemd/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb=
append
> @@ -2,5 +2,6 @@ inherit systemd
> =20
>  PRINC :=3D "${@int(PRINC) + 1}"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "autofs.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "autofs.service"
> diff --git a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.=
12.bbappend b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.1=
2.bbappend
> index 041ca83..76dd4ba 100644
> --- a/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbap=
pend
> +++ b/meta-systemd/meta-networking/recipes-support/nis/yp-tools_2.12.bbap=
pend
> @@ -7,6 +7,12 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> =20
>  SRC_URI +=3D "file://domainname.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "domainname.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "domainname.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/sy=
stem
> +}
> =20
> diff --git a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1=
=2E36.bbappend b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt=
_1.36.bbappend
> index 14dbaac..cd3b98e 100644
> --- a/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bba=
ppend
> +++ b/meta-systemd/meta-networking/recipes-support/nis/ypbind-mt_1.36.bba=
ppend
> @@ -7,6 +7,10 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> =20
>  SRC_URI +=3D "file://ypbind.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "ypbind.service"
> -
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "ypbind.service"
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
> +}
> diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5=
=2Ebbappend b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.=
bbappend
> index c6cd031..4580cf7 100644
> --- a/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappe=
nd
> +++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bbappe=
nd
> @@ -4,9 +4,11 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd ntpdate-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "ntpd.service"
> -SYSTEMD_SERVICE_ntpdate-systemd =3D "ntpdate.service"
> +SYSTEMD_PACKAGES =3D "${PN} ntpdate"
> +SYSTEMD_SERVICE_${PN} =3D "ntpd.service"
> +SYSTEMD_SERVICE_ntpdate =3D "ntpdate.service"
> +
> +FILES_ntpdate +=3D "${systemd_unitdir}/system/ntpdate.service"
> =20
>  SRC_URI +=3D " \
>  	file://ntpdate.service \
> diff --git a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappen=
d b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
> index 7f336a1..c8d0d3d 100644
> --- a/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
> +++ b/meta-systemd/meta-oe/recipes-bsp/keymaps/keymaps_1.0.bbappend
> @@ -4,5 +4,12 @@ PRINC :=3D "${@int(PRINC) + 6}"
>  SRC_URI +=3D " file://keymaps.service"
> =20
>  inherit systemd
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_=
1.2.98.bbappend b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherok=
ee_1.2.98.bbappend
> index 7cc7dd8..c8571b7 100644
> --- a/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.=
bbappend
> +++ b/meta-systemd/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.=
bbappend
> @@ -6,5 +6,12 @@ inherit systemd
> =20
>  SRC_URI +=3D "file://cherokee.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "cherokee.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "cherokee.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/cherokee.service ${D}${systemd_unitdir}/syst=
em
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.=
55.bbappend b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.5=
5.bbappend
> index 0a9c77e..799b3cd 100644
> --- a/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbap=
pend
> +++ b/meta-systemd/meta-oe/recipes-connectivity/dnsmasq/dnsmasq_2.55.bbap=
pend
> @@ -6,5 +6,12 @@ inherit systemd
> =20
>  SRC_URI +=3D "file://dnsmasq.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "dnsmasq.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_gi=
t.bbappend b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.=
bbappend
> index dd5fea1..489528b 100644
> --- a/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbapp=
end
> +++ b/meta-systemd/meta-oe/recipes-connectivity/gateone/gateone_git.bbapp=
end
> @@ -7,5 +7,10 @@ inherit systemd
>  SRC_URI +=3D "file://gateone.service"
> =20
>  NATIVE_SYSTEMD_SUPPORT =3D "1"
> -SYSTEMD_PACKAGES =3D "${PN}"
> -SYSTEMD_SERVICE =3D "gateone.service"
> +SYSTEMD_SERVICE_${PN} =3D "gateone.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/gateone.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/net=
workmanager_0.9.2.0.bbappend b/meta-systemd/meta-oe/recipes-connectivity/ne=
tworkmanager/networkmanager_0.9.2.0.bbappend
> index 6ae5d75..0510b23 100644
> --- a/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkman=
ager_0.9.2.0.bbappend
> +++ b/meta-systemd/meta-oe/recipes-connectivity/networkmanager/networkman=
ager_0.9.2.0.bbappend
> @@ -4,8 +4,7 @@ inherit systemd
> =20
>  DEPENDS +=3D "systemd"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}"
> -SYSTEMD_SERVICE =3D "NetworkManager.service"
> +SYSTEMD_SERVICE_${PN} =3D "NetworkManager.service"
>  SYSTEMD_UNITDIR =3D "${systemd_unitdir}/system"
> =20
>  # NetworkManager-wait-online is not catched by systemd.bbclass
> diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bba=
ppend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> index a0ae2ce..c212104 100644
> --- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> +++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
> @@ -8,8 +8,8 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>  SRC_URI +=3D "file://busybox-syslog.service.in \
>              file://busybox-klogd.service.in"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-syslog-systemd"
> -SYSTEMD_SERVICE_${PN}-syslog-systemd =3D "busybox-syslog.service"
> +SYSTEMD_PACKAGES =3D "${PN}-syslog"
> +SYSTEMD_SERVICE_${PN}-syslog =3D "busybox-syslog.service"
> =20
>  do_install_append() {
>  	install -d ${D}${systemd_unitdir}/system
> @@ -20,4 +20,4 @@ do_install_append() {
> =20
>  	ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
>  }
> -FILES_${PN}-syslog-systemd =3D "${systemd_unitdir}/system/syslog.service"
> +FILES_${PN}-syslog +=3D "${systemd_unitdir}/system/syslog.service"
> diff --git a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.=
bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbap=
pend
> index 15546e1..c46e981 100644
> --- a/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
> +++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
> @@ -9,9 +9,14 @@ SRC_URI +=3D "file://dropbearkey.service \
>              file://dropbear@.service \
>              file://dropbear.socket"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "dropbear.socket"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "dropbear.socket"
> =20
>  do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${systemd_unitdir}/s=
ystem
> +	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/sys=
tem
> +	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
>  	ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service
>  }
> diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbap=
pend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
> index 777d2f4..dc32172 100644
> --- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
> +++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
> @@ -10,4 +10,10 @@ inherit systemd
> =20
>  NATIVE_SYSTEMD_SUPPORT =3D "1"
>  SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "cloud9.service"
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend =
b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
> index d80cfff..2e63c69 100644
> --- a/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/at/at_3.1.13.bbappend
> @@ -7,6 +7,11 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  SRC_URI +=3D "file://atd.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "atd.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "atd.service"
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/atd.service ${D}${systemd_unitdir}/system
> +}
> =20
> diff --git a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappe=
nd b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
> index 3706d9f..9707abf 100644
> --- a/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/atftp/atftp_git.bbappend
> @@ -6,5 +6,12 @@ inherit systemd
> =20
>  SRC_URI +=3D "file://atftpd.service"
> =20
> -SYSTEMD_PACKAGES =3D "atftpd-systemd"
> -SYSTEMD_SERVICE_atftpd-systemd =3D "atftpd.service"
> +SYSTEMD_PACKAGES =3D "atftpd"
> +SYSTEMD_SERVICE_atftpd =3D "atftpd.service"
> +FILES_atftpd +=3D "${systemd_unitdir}/system/atftpd.service"
> +RPROVIDES_atftpd +=3D "atftpd-systemd"
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bb=
append b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> index 66db466..0ffba65 100644
> --- a/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> @@ -5,7 +5,14 @@ PRINC :=3D "${@int(PRINC) + 3}"
> =20
>  inherit systemd
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "crond.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "crond.service"
> =20
>  SRC_URI +=3D "file://crond.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/crond.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.=
1.bbappend b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.=
bbappend
> index f221c1d..dfe68f2 100644
> --- a/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbapp=
end
> +++ b/meta-systemd/meta-oe/recipes-extended/net-snmp/net-snmp_5.7.1.bbapp=
end
> @@ -9,11 +9,20 @@ SRC_URI +=3D " \
>          file://snmpd.service \
>          file://snmptrapd.service \
>  "
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/sys=
tem
> +}
> =20
>  EXTRA_OECONF +=3D "--with-systemd"
> =20
>  SYSTEMD_PACKAGES =3D "${PN}-server-snmpd-systemd \
>                      ${PN}-server-snmptrapd-systemd"
> =20
> -SYSTEMD_SERVICE_${PN}-server-snmpd-systemd =3D "snmpd.service"
> -SYSTEMD_SERVICE_${PN}-server-snmptrapd-systemd =3D  "snmptrapd.service"
> +SYSTEMD_SERVICE_${PN}-server-snmpd =3D "snmpd.service"
> +SYSTEMD_SERVICE_${PN}-server-snmptrapd =3D  "snmptrapd.service"
> +RPROVIDES_${PN}-server-snmpd +=3D "${PN}-server-snmpd-systemd"
> +RPROVIDES_${PN}-server-snmptrapd +=3D "${PN}-server-snmptrapd-systemd"
> +FILES_${PN}-server-snmpd +=3D "${systemd_unitdir}/system/snmpd.service"
> +FILES_${PN}-server-snmptrapd +=3D "${systemd_unitdir}/system/snmptrapd.s=
ervice"
> diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.=
bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbap=
pend
> index 0fa7f97..fb31f92 100644
> --- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend
> @@ -7,6 +7,12 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  SRC_URI +=3D "file://rpcbind.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "rpcbind.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "rpcbind.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_unitdir}/system
> +}
> =20
> diff --git a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.=
bbappend b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbap=
pend
> index b813a50..85d99ed 100644
> --- a/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog_5.8.0.bbappend
> @@ -6,5 +6,6 @@ DEPENDS +=3D "systemd"
> =20
>  SYSTEMD_UNITDIR =3D "${systemd_unitdir}/system"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> diff --git a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend=
 b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
> index cc98fe1..34b82f7 100644
> --- a/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
> +++ b/meta-systemd/meta-oe/recipes-extended/zram/zram_0.1.bbappend
> @@ -8,5 +8,12 @@ SRC_URI +=3D " \
>          file://zram.service \
>  "
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "zram.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "zram.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend=
 b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
> index 2828a70..6fe4b9f 100644
> --- a/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
> +++ b/meta-systemd/meta-oe/recipes-graphics/lxdm/lxdm_git.bbappend
> @@ -4,5 +4,6 @@ PRINC :=3D "${@int(PRINC) + 1}"
>  inherit systemd
> =20
>  SYSTEMD_UNITDIR =3D "${systemd_unitdir}/system"
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "lxdm.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "lxdm.service"
> diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinp=
ut-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-c=
alibrator/xinput-calibrator_git.bbappend
> index 5bc5bc3..5f829ac 100644
> --- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-cali=
brator_git.bbappend
> +++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-cali=
brator_git.bbappend
> @@ -6,5 +6,12 @@ inherit systemd
> =20
>  SRC_URI +=3D "file://xinput-calibrator.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/xinput-calibrator.service ${D}${systemd_unit=
dir}/system
> +}
> +
> diff --git a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xser=
ver-nodm-init_2.0.bbappend b/meta-systemd/meta-oe/recipes-graphics/xserver-=
nodm-init/xserver-nodm-init_2.0.bbappend
> index b6b77c9..9310513 100644
> --- a/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nod=
m-init_2.0.bbappend
> +++ b/meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nod=
m-init_2.0.bbappend
> @@ -10,12 +10,15 @@ SRC_URI +=3D "file://xserver-nodm.service \
> =20
>  do_install_append() {
>          install -d ${D}${sysconfdir}/default
> +	install -d ${D}${systemd_unitdir}/system
>          install xserver-nodm.conf ${D}${sysconfdir}/default/xserver-nodm
> +	install -m 0644 ${WORKDIR}/xserver-nodm.service ${D}${systemd_unitdir}/=
system
>  }
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "xserver-nodm.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "xserver-nodm.service"
> =20
> -FILES_${PN}-systemd +=3D "${sysconfdir}/default/xserver-nodm"
> +FILES_${PN} +=3D "${sysconfdir}/default/xserver-nodm"
> =20
> -RDEPENDS_${PN}-systemd +=3D "xserver-common (>=3D 1.30) xinit"
> +RDEPENDS_${PN} +=3D "xserver-common (>=3D 1.30) xinit"
> diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappe=
nd b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
> index 9504761..23e0bc3 100644
> --- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
> +++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
> @@ -6,8 +6,9 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  SRC_URI +=3D "file://gpsd.service"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.socket"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.socket"
>  SYSTEMD_OESCONS =3D "true"
> =20
>  do_install_append() {
> diff --git a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/sy=
slog-ng_3.2.5.bbappend b/meta-systemd/meta-oe/recipes-support/nonworking/sy=
slog-ng/syslog-ng_3.2.5.bbappend
> index 92c2e77..95e2f7a 100644
> --- a/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng=
_3.2.5.bbappend
> +++ b/meta-systemd/meta-oe/recipes-support/nonworking/syslog-ng/syslog-ng=
_3.2.5.bbappend
> @@ -7,5 +7,6 @@ EXTRA_OECONF +=3D " \
>    --with-systemdsystemunitdir=3D${systemd_unitdir}/system \
>  "
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> diff --git a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8=
=2E6.bbappend b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.=
8.6.bbappend
> index b8150b7..74e5ae8 100644
> --- a/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbap=
pend
> +++ b/meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbap=
pend
> @@ -2,5 +2,6 @@ inherit systemd
> =20
>  PRINC :=3D "${@int(PRINC) + 1}"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "pcscd.socket"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "pcscd.socket"
> diff --git a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5=
=2E0.0.bbappend b/meta-systemd/meta-oe/recipes-support/strongswan/strongswa=
n_5.0.0.bbappend
> index a60a109..5334fff 100644
> --- a/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb=
append
> +++ b/meta-systemd/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb=
append
> @@ -4,5 +4,6 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  SYSTEMD_UNITDIR =3D "${systemd_unitdir}/system"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "${PN}.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "${PN}.service"
> diff --git a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bba=
ppend b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
> index 9d0f18c..87eb3bb 100644
> --- a/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
> +++ b/meta-systemd/meta-oe/recipes-support/udisks/udisks_1.0.4.bbappend
> @@ -9,6 +9,7 @@ DEPENDS +=3D "systemd"
> =20
>  SRC_URI +=3D "file://add-systemd-support.patch"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "udisks-daemon.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "udisks-daemon.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31=
=2Ebbappend b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.=
bbappend
> index d41ca93..ec0f08d 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappe=
nd
> +++ b/meta-systemd/oe-core/recipes-connectivity/avahi/avahi_0.6.31.bbappe=
nd
> @@ -2,8 +2,9 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  inherit systemd
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "avahi-daemon.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "avahi-daemon.service"
>  SYSTEMD_AUTO_ENABLE =3D "enable"
> =20
> -FILES_${PN}-systemd +=3D "${systemd_unitdir}/system/"
> +FILES_${PN} +=3D "${systemd_unitdir}/system/"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101=
=2Ebbappend b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.=
bbappend
> index 8945a6d..004c494 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd
> +++ b/meta-systemd/oe-core/recipes-connectivity/bluez/bluez4_4.101.bbappe=
nd
> @@ -4,6 +4,7 @@ inherit systemd
> =20
>  EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "bluetooth.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "bluetooth.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.=
10.bbappend b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.1=
0.bbappend
> index a9d13e6..dd0469a 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbap=
pend
> +++ b/meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbap=
pend
> @@ -4,5 +4,6 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  EXTRA_OECONF +=3D "--with-systemdunitdir=3D${systemd_unitdir}/system/"
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN}-systemd =3D "connman.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "connman.service"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bb=
append b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
> index fde2426..aec1dfb 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
> +++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.5.bbappend
> @@ -5,12 +5,26 @@ inherit systemd
> =20
>  PRINC :=3D "${@int(PRINC) + 1}"
> =20
> -SYSTEMD_PACKAGES =3D "dhcp-server-systemd dhcp-relay-systemd dhcp-client=
-systemd"
> -SYSTEMD_SERVICE_dhcp-server-systemd =3D "dhcpd.service"
> -SYSTEMD_SERVICE_dhcp-relay-systemd =3D "dhcrelay.service"
> -SYSTEMD_SERVICE_dhcp-client-systemd =3D "dhclient.service"
> +SYSTEMD_PACKAGES =3D "dhcp-server dhcp-relay dhcp-client"
> +SYSTEMD_SERVICE_dhcp-server =3D "dhcpd.service"
> +SYSTEMD_SERVICE_dhcp-relay =3D "dhcrelay.service"
> +SYSTEMD_SERVICE_dhcp-client =3D "dhclient.service"
> +
> +FILES_dhcp-server +=3D "${systemd_unitdir}/system/dhcpd.service"
> +FILES_dhcp-relay +=3D "${systemd_unitdir}/system/dhrelay.service"
> +FILES_dhcp-client +=3D "${systemd_unitdir}/system/dhclient.service"
> +RPROVIDES_dhcp-server +=3D "dhcp-server-systemd"
> +RPROVIDES_dhcp-relay +=3D "dhcp-relay-systemd"
> +RPROVIDES_dhcp-client +=3D "dhcp-client-systemd"
> =20
>  SRC_URI +=3D "file://dhcpd.service \
>              file://dhclient.service \
>              file://dhcrelay.service \
>             "
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/syst=
em
> +	install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/syst=
em
> +}
> +
> diff --git a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.b=
bappend b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappe=
nd
> index a061b52..9923708 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
> +++ b/meta-systemd/oe-core/recipes-connectivity/ofono/ofono_1.12.bbappend
> @@ -2,6 +2,7 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  inherit systemd
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "ofono.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "ofono.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> diff --git a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.=
1p1.bbappend b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.=
1p1.bbappend
> index a459065..fe5c919 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bba=
ppend
> +++ b/meta-systemd/oe-core/recipes-connectivity/openssh/openssh_6.1p1.bba=
ppend
> @@ -2,9 +2,18 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> =20
>  PRINC :=3D "${@int(PRINC) + 1}"
> =20
> -SYSTEMD_PACKAGES =3D "openssh-sshd-systemd"
> -SYSTEMD_SERVICE =3D "sshd.socket"
> +SYSTEMD_PACKAGES =3D "openssh-sshd"
> +SYSTEMD_SERVICE_openssh-sshd =3D "sshd.socket"
> +FILES_openssh-sshd +=3D "${systemd_unitdir}/system/sshd.socket"
> +RPROVIDES_openssh-sshd +=3D "openssh-sshd-systemd"
> =20
>  inherit systemd
> =20
>  SRC_URI +=3D "file://sshd.socket file://sshd@.service file://sshdgenkeys=
=2Eservice"
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd_unitdir}/s=
ystem
> +}
> +
> diff --git a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.=
0.bbappend b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.=
bbappend
> index c0276a3..281c440 100644
> --- a/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbapp=
end
> +++ b/meta-systemd/oe-core/recipes-connectivity/portmap/portmap_6.0.bbapp=
end
> @@ -4,8 +4,14 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  inherit systemd
> =20
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "portmap.service"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "portmap.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
>  SRC_URI_append =3D " file://portmap.service"
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/portmap.service ${D}${systemd_unitdir}/system
> +}
> +
> diff --git a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22=
=2E2.bbappend b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.2=
2.2.bbappend
> index 809a554..e0b1aba 100644
> --- a/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbap=
pend
> +++ b/meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.2.bbap=
pend
> @@ -4,5 +4,6 @@ PRINC :=3D "${@int(PRINC) + 1}"
> =20
>  SYSTEMD_UNITDIR =3D "${systemd_unitdir}/system"
>  EXTRA_OECONF +=3D "--enable-socket-activation --with-systemdsystemunitdi=
r=3D${SYSTEMD_UNITDIR}"
> -SYSTEMD_PACKAGES =3D "${PN}-systemd"
> -SYSTEMD_SERVICE =3D "uuidd.socket"
> +SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} =3D "uuidd.socket"
> diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.=
32.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.3=
2.bbappend
> index 0e08358..89079dc 100644
> --- a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbap=
pend
> +++ b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.32.bbap=
pend
> @@ -7,4 +7,11 @@ inherit systemd
>  SRC_URI +=3D "file://lighttpd.service"
> =20
>  SYSTEMD_PACKAGES =3D "${PN}"
> +RPROVIDES_${PN} +=3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN} =3D "lighttpd.service"
> +
> +do_install_append() {
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/syst=
em
> +}
> +
> diff --git a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.=
bb b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
> index f33b2a9..3b3c1dc 100644
> --- a/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
> +++ b/meta-systemd/recipes-core/systemd/systemd-machine-units_1.0.bb
> @@ -8,7 +8,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>  PR =3D "r1"
> =20
>  inherit systemd
> -SYSTEMD_SERVICE =3D ""
> +SYSTEMD_SERVICE_${PN} =3D ""
>  SYSTEMD_PACKAGES =3D "${PN}"
>  NATIVE_SYSTEMD_SUPPORT =3D "1"
>  ALLOW_EMPTY_${PN} =3D "1"
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEcU40ACgkQN1Ujt2V2gBxDzACdHCqRP/WN0giPVWvR6lzBQoKs
iHkAnjDuu1+DAhOV5hawpiHYB8Kr2y+v
=QJrU
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--
