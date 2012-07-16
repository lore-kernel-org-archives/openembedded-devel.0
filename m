Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqfnj-00033Z-Or
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 09:33:03 +0200
Received: by wgbdr1 with SMTP id dr1so1322492wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CHYaQh9gt+pMjUXvkefbtg89D2y6DI8LZZpyctqu8D0=;
	b=FJfEt1BGoMjKl+64jU1m2eRAbGhORD4C1WSp60k9IdNJi0byjpTSwJZKbuwmb9jbyr
	qfcYwDlWTrS58+r529+0zrQInXz9aMDzZeLRClZ1jo6JkjRzWFBFKEfs2MwQ2jQIG6h8
	p1gEEzG1RfQPDPwC+7QyIGvVft5wf8TqA6eY1keeOZ/4MU5fbB17QO08rsijDtDh98mg
	e8+Z+SdrFN7GZXas+qZSM4phNwzAp64tdbP818rcO20DbarsqrX+uWOUw3egMl/0sF9T
	cRpydATlEfrvCgejGxpQgaWSJxyQE3juQGMFNb/jHizNA3ndQWx96Qjy6Dzh7sRA+86j
	3MNg==
Received: by 10.216.113.4 with SMTP id z4mr4912843weg.201.1342423306014;
	Mon, 16 Jul 2012 00:21:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm20189532wiz.0.2012.07.16.00.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 00:21:44 -0700 (PDT)
Date: Mon, 16 Jul 2012 09:21:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120716072152.GB3729@jama.jama.net>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe,V2 00/32] transit to meta-systemd
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
X-List-Received-Date: Mon, 16 Jul 2012 07:33:03 -0000
X-Groupsio-MsgNum: 39671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 10:30:08AM +0200, Andreas M=FCller wrote:
> v1->v2:
> * rebase to latest head
> * 4 meta-oe/layer.conf: systemd-serialgetty moved to meta-systemd
> * 5 append systemd package to RRECOMMENDS
> * remove warning in case systemd-stuff is packed in ${PN}
> * 7+8 make tasks usable without meta-systemd
> * xserver-nodm-init: include Martin's patch [1]
> * use FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:" for multiple bbapp=
ends

I haven't tested this V2, because I was away on holidays, but from my
tests with V1 I would say:

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

and then we can resolve possible minor issues :).

Cheers,

>=20
> The series can be pulled from [2] branch systemd
>=20
> [1] http://patches.openembedded.org/patch/30383/
> [2] git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.g=
it
>=20
> Andreas M=FCller (32):
>   systemd.bbclass: move to meta-systemd
>   move systemd recipes to meta-systemd
>   layer.conf/README: search directory structure for bbappends changed
>   meta-oe/layer.conf: systemd-serialgetty moved to meta-systemd
>   systemd.bbclass: add *-systemd packages to RRECOMMENDS
>   systemd.bbclass: do not warn for systemd files are in ${PN}
>   task-basic: move systemd support to meta systemd
>   task-x11: in case meta-systemd is part of BBLAYERS,
>     xserver-nodm-init-systemd is recommended automatically
>   polkit: meta-systemd rework
>   gdm: move systemd support to meta-systemd
>   busybox: move systemd support to meta-systemd
>   ntp: move systemd support to meta-systemd
>   syslog-ng: move systemd support to meta-systemd
>   udisks: move systemd support to meta-systemd
>   lighttpd: move systemd support to meta-systemd
>   cronie: move systemd support to meta-systemd
>   elsa: move systemd support to meta-systemd
>   net-snmp: move systemd support to meta-systemd
>   atftp: move systemd support to meta-systemd
>   dhcp: move systemd support to meta-systemd
>   connman: move systemd support to meta-systemd
>   gateone: move systemd support to meta-systemd
>   cherokee: move systemd support to meta-systemd
>   openssh: move systemd support to meta-systemd
>   cloud9: move systemd support to meta-systemd
>   xinput-calibrator: : move systemd support to meta-systemd
>   xserver-nodm-init: move systemd support to meta-systemd
>   dropbear: move systemd support to meta-systemd
>   keymaps: move systemd support to meta-systemd
>   rsyslog: move systemd support to meta-systemd
>   gpsd: move systemd support to meta-systemd
>   networkmanager: move systemd support to meta-systemd
>=20
>  meta-efl/recipes-efl/efl/elsa_svn.bb               |    9 +----
>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    8 +---
>  meta-oe/conf/layer.conf                            |    1 -
>  .../cherokee/cherokee_1.2.98.bb                    |   10 ++----
>  .../recipes-connectivity/gateone/gateone_git.bb    |    9 +----
>  .../networkmanager/networkmanager_0.9.2.0.bb       |   13 +++----
>  .../recipes-core/busybox/busybox_1.19.4.bbappend   |   20 +----------
>  meta-oe/recipes-core/tasks/task-basic.bb           |    7 ++--
>  meta-oe/recipes-core/tasks/task-x11_1.0.bb         |    6 ++--
>  meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    9 +----
>  meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 ++----
>  .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   17 +--------
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 +-
>  meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 +++---
>  .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 +---
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   16 +--------
>  meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   15 ++------
>  meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   15 ++------
>  meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 ++------
>  meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   18 +---------
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 +----
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 ++----
>  meta-systemd/README                                |    5 +++
>  {meta-oe =3D> meta-systemd}/classes/systemd.bbclass  |   35 ++++++++++++=
+------
>  meta-systemd/conf/layer.conf                       |    2 +-
>  .../recipes-efl/efl/elsa/xserver-nodm.service      |    0
>  .../meta-efl/recipes-efl/efl/elsa_svn.bbappend     |   13 +++++++
>  .../meta-gnome}/recipes-gnome/gdm/gdm/gdm.service  |    0
>  .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +++++++
>  .../recipes-bsp/keymaps/keymaps/keymaps.service    |    0
>  .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
>  .../cherokee/cherokee/cherokee.service             |    0
>  .../cherokee/cherokee_1.2.98.bbappend              |   10 ++++++
>  .../connman/connman_1.0.bbappend                   |    2 +
>  .../recipes-connectivity/dhcp/dhcp}/dhcpd.service  |    0
>  .../dhcp/dhcp}/dhcrelay.service                    |    0
>  .../dhcp/dhcp_4.2.3-P2.bbappend                    |    4 +-
>  .../gateone/gateone/gateone.service                |    0
>  .../gateone/gateone_git.bbappend                   |   11 ++++++
>  .../networkmanager/networkmanager_0.9.2.0.bbappend |   14 ++++++++
>  .../openssh/openssh/sshd.socket                    |    0
>  .../openssh/openssh/sshd@.service                  |    0
>  .../openssh/openssh/sshdgenkeys.service            |    0
>  .../openssh/openssh_6.0p1.bbappend                 |    2 +-
>  .../busybox/busybox/busybox-klogd.service.in       |    0
>  .../busybox/busybox/busybox-syslog.service.in      |    0
>  .../recipes-core/busybox/busybox_1.19.4.bbappend   |   23 +++++++++++++
>  .../recipes-core/dropbear/dropbear/dropbear.socket |    0
>  .../dropbear/dropbear/dropbear@.service            |    0
>  .../dropbear/dropbear/dropbearkey.service          |    0
>  .../dropbear/dropbear_2012.55.bbappend             |    4 +-
>  .../meta-oe/recipes-core/tasks/task-basic.bbappend |    6 +++
>  .../recipes-devtools/cloud9/cloud9/cloud9.service  |    0
>  .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |   13 +++++++
>  .../recipes-extended/atftp/atftp}/atftpd.service   |    0
>  .../recipes-extended/atftp/atftp_0.7.bbappend      |   10 ++++++
>  .../recipes-extended/cronie/cronie/crond.service   |    0
>  .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    4 +-
>  .../lighttpd/lighttpd/lighttpd.service             |    0
>  .../lighttpd/lighttpd_1.4.31.bbappend              |    4 +-
>  .../net-snmp/net-snmp}/snmpd.service               |    0
>  .../net-snmp/net-snmp}/snmptrapd.service           |    0
>  .../net-snmp/net-snmp}/systemd-support.patch       |    0
>  .../net-snmp/net-snmp_5.7.1.bbappend               |   19 +++++++++++
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 ++
>  .../rsyslog/rsyslog_5.8.0.bbappend                 |   10 ++++++
>  .../xinput-calibrator/xinput-calibrator.service    |    0
>  .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++
>  .../xserver-nodm-init}/xserver-nodm.conf           |    0
>  .../xserver-nodm-init}/xserver-nodm.service        |    0
>  .../xserver-nodm-init_2.0.bbappend                 |   21 ++++++++++++
>  .../recipes-navigation/gpsd/gpsd/gpsd.service      |    0
>  .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   18 ++++++++++
>  .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   18 ++++++++++
>  .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++
>  .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
>  .../recipes-support/ntp/ntp}/ntpdate.service       |    0
>  .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   20 +++++++++++
>  .../syslog-ng/syslog-ng_3.2.5.bbappend             |   11 ++++++
>  .../udisks/udisks/add-systemd-support.patch        |    0
>  .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++
>  .../recipes-core/systemd/systemd-compat-units.bb   |    0
>  .../systemd/systemd-compat-units/machineid.service |    0
>  .../systemd-compat-units/run-postinsts.service     |    0
>  .../systemd/systemd-machine-units_1.0.bb           |    0
>  .../recipes-core/systemd/systemd-serialgetty.bb    |    0
>  .../systemd/systemd-serialgetty/LICENSE            |    0
>  .../systemd-serialgetty/serial-getty@.service      |    0
>  .../recipes-core/systemd/systemd-speed-hacks.bb    |    0
>  .../systemd/systemd-systemctl-native.bb            |    0
>  .../systemd/systemd-systemctl-native/systemctl     |    0
>  .../systemd/systemd/format-replace-m-uclibc.patch  |    0
>  .../systemd/systemd/paper-over-mkostemp.patch      |    0
>  .../recipes-core/systemd/systemd_git.bb            |    0
>  94 files changed, 369 insertions(+), 203 deletions(-)
>  rename {meta-oe =3D> meta-systemd}/classes/systemd.bbclass (85%)
>  rename {meta-efl =3D> meta-systemd/meta-efl}/recipes-efl/efl/elsa/xserve=
r-nodm.service (100%)
>  create mode 100644 meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappe=
nd
>  rename {meta-gnome =3D> meta-systemd/meta-gnome}/recipes-gnome/gdm/gdm/g=
dm.service (100%)
>  create mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.=
bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps/k=
eymaps.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps_1=
=2E0.bbappend (85%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/cherokee=
/cherokee/cherokee.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/cherokee/ch=
erokee_1.2.98.bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/connman/=
connman_1.0.bbappend (84%)
>  rename {meta-oe/recipes-connectivity/dhcp/files =3D> meta-systemd/meta-o=
e/recipes-connectivity/dhcp/dhcp}/dhcpd.service (100%)
>  rename {meta-oe/recipes-connectivity/dhcp/files =3D> meta-systemd/meta-o=
e/recipes-connectivity/dhcp/dhcp}/dhcrelay.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/dhcp/dhc=
p_4.2.3-P2.bbappend (79%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/gateone/=
gateone/gateone.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/gateone/gat=
eone_git.bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/networkmana=
ger/networkmanager_0.9.2.0.bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openssh/=
openssh/sshd.socket (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openssh/=
openssh/sshd@.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openssh/=
openssh/sshdgenkeys.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openssh/=
openssh_6.0p1.bbappend (88%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/busybox/busybox/=
busybox-klogd.service.in (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/busybox/busybox/=
busybox-syslog.service.in (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-core/busybox/busybox_1.1=
9.4.bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropbea=
r/dropbear.socket (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropbea=
r/dropbear@.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropbea=
r/dropbearkey.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropbea=
r_2012.55.bbappend (81%)
>  create mode 100644 meta-systemd/meta-oe/recipes-core/tasks/task-basic.bb=
append
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-devtools/cloud9/cloud=
9/cloud9.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0=
=2E6.bbappend
>  rename {meta-oe/recipes-extended/atftp/files =3D> meta-systemd/meta-oe/r=
ecipes-extended/atftp/atftp}/atftpd.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-extended/atftp/atftp_0.7=
=2Ebbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/cronie/croni=
e/crond.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/cronie/croni=
e_1.4.8.bbappend (69%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/lighttpd/lig=
httpd/lighttpd.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/lighttpd/lig=
httpd_1.4.31.bbappend (62%)
>  rename {meta-oe/recipes-extended/net-snmp/files =3D> meta-systemd/meta-o=
e/recipes-extended/net-snmp/net-snmp}/snmpd.service (100%)
>  rename {meta-oe/recipes-extended/net-snmp/files =3D> meta-systemd/meta-o=
e/recipes-extended/net-snmp/net-snmp}/snmptrapd.service (100%)
>  rename {meta-oe/recipes-extended/net-snmp/files =3D> meta-systemd/meta-o=
e/recipes-extended/net-snmp/net-snmp}/systemd-support.patch (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-extended/net-snmp/net-sn=
mp_5.7.1.bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit_0=
=2E104.bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-extended/rsyslog/rsyslog=
_5.8.0.bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-graphics/xinput-calib=
rator/xinput-calibrator/xinput-calibrator.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibrat=
or/xinput-calibrator_0.7.5.bbappend
>  rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0=
 =3D> meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-=
init}/xserver-nodm.conf (100%)
>  rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2.0=
 =3D> meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-=
init}/xserver-nodm.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-in=
it/xserver-nodm-init_2.0.bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-navigation/gpsd/gpsd/=
gpsd.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4=
=2Ebbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5=
=2Ebbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git=
=2Ebbappend
>  rename {meta-oe/recipes-support/ntp/files =3D> meta-systemd/meta-oe/reci=
pes-support/ntp/ntp}/ntpd.service (100%)
>  rename {meta-oe/recipes-support/ntp/files =3D> meta-systemd/meta-oe/reci=
pes-support/ntp/ntp}/ntpdate.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p3.=
bbappend
>  create mode 100644 meta-systemd/meta-oe/recipes-support/syslog-ng/syslog=
-ng_3.2.5.bbappend
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-support/udisks/udisks=
/add-systemd-support.patch (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-support/udisks/udisks_1.=
0.4.bbappend
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-compat-u=
nits.bb (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-compat-u=
nits/machineid.service (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-compat-u=
nits/run-postinsts.service (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-machine-=
units_1.0.bb (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-serialge=
tty.bb (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-serialge=
tty/LICENSE (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-serialge=
tty/serial-getty@.service (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-speed-ha=
cks.bb (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-systemct=
l-native.bb (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-systemct=
l-native/systemctl (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd/format-r=
eplace-m-uclibc.patch (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd/paper-ov=
er-mkostemp.patch (100%)
>  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd_git.bb (=
100%)
>=20
> --=20
> 1.7.6.5
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dTy3Mrz/UPE2dbVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlADwRAACgkQN1Ujt2V2gBw6/gCfULkvjdj9UyEzD6D+3Ls+BLEr
tvcAn0BffkAz0vYUdUnQ/KwEDdMEal2K
=hB6v
-----END PGP SIGNATURE-----

--dTy3Mrz/UPE2dbVg--
