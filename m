Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sfwmb-0006xQ-Sh
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 19:27:33 +0200
Received: by wgbdr1 with SMTP id dr1so3591604wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=it/6jJiZwGOMFC2BXTP6V01FU0HepZQfQDxPN/yXl+M=;
	b=Ai+yWBOZgT7ER0v4/IC4kHiySDGa/s+eiJujqLlC5FIu6BrGfUqfpqxeUYjS2VFTMc
	toSRRxbhMo5WHLy6GPRIZhJykNKoKhtHYF8DQ8F6rk6XmjwiRtt0em3/3+nA62ZfZPCd
	a3bjc4MhnrbiAAw67AG9V2rZ9Wpc69HOMbRHRCA76vn2y0jt8BizRU+wdmTHI8RoMUoQ
	bWi2ja7uf/RWeypwsVryUJrZNh8rnKn6uSqwxq1qbTl74TG1q+BPp/X2wZtOsRbMEWtG
	Y4q2sJefU6vl4gzEjNSr8xUwUL7cVkGSK/Zw8gQNZT+B2UtlEelngb1Uo3P9FaZ4kAe+
	+lmA==
Received: by 10.180.83.197 with SMTP id s5mr12431207wiy.9.1339867013915;
	Sat, 16 Jun 2012 10:16:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j4sm12122436wiz.1.2012.06.16.10.16.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 10:16:52 -0700 (PDT)
Date: Sat, 16 Jun 2012 19:16:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120616171651.GB3178@jama.jama.net>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC, meta-oe 00/27] transit to meta-systemd (cover-letter-only)
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
X-List-Received-Date: Sat, 16 Jun 2012 17:27:34 -0000
X-Groupsio-MsgNum: 39257
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E39vaYmALEf/7YXx"
Content-Disposition: inline

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 10, 2012 at 11:46:33PM +0200, Andreas M=FCller wrote:
> This is the first part of the transition to meta-systemd for review. It
> contains the changes on all recipes inheriting systemd.

Looks like this patchset also depends on this patch for oe-core
http://patchwork.openembedded.org/patch/24179/

and there is missing space in elsa SRC_URI somewhere
WARNING: Unable to get checksum for elsa SRC_URI entry
xserver-nodm.servicefile: file could not be found
but looking at elsa change I don't see where (will debug and report
later).

Cheers,

>=20
> The following tests were performed:
> * build all recipes touched by this series from scratch without this seri=
es
> * build all recipes touched by this series from scratch without this seri=
es
>   and check buildhistory diff for unexpected side effects
> * set BBMASK =3D "meta-systemd|meta-ti/recipes-misc|meta-angstrom/recipes=
-core/led|meta-angstrom/recipes-core/systemd|meta-nokia/recipes-core/system=
d|meta-openmoko/recipes-core/systemd"
>   and build all recipes touched from scratch an check if there is no=20
>   reference to systemd or unexpeted left-over. These tests are still in p=
rogress.
>=20
> I think there are basically two parties affected by this patch:
>=20
> 1.systemd users: These will not see any difference from the situation bef=
ore
>   this patch
> 2.non-systemd-users: They should now grab recipes from meta-oe wihout fea=
ring
>   systemd grabbed in. Tasks and images need further decisions/efforts for=
 them (see 2. below)
>=20
> After this patch series the following steps need to be done:
>=20
> 1.Automatic RRECOMMENDS on *-systemd packages or put systemd stuff in base
>   packages. This is required to make tasks/images independent of using sy=
stemd
>   or not. Here is still a discussions/decision pending. I see two ways to=
 go:
>   1.1. If a package with *-systemd package extension is required, the *-s=
ystemd
>        package is added to RRECOMMENDS. The decision is only made by addi=
ng=20
>        meta-systemd to BBLAYERS.
>   1.2. The *-system packages are removed and their contents move to their=
 base
>        packages. Same here: The decision is only made by adding meta-syst=
emd
>        to BBLAYERS.
>   There were distro-features mentioned in previous discussions. Are condi=
tional
>   BBMASKS available e.g masking out whole meta-systemd if 'systemd' is no=
t found
>   in distro feature?
>   To make these patches make sense and enable non systemd users to use me=
ta-oe
>   we need a decision on how to continue on this.
> 2. task-basic/task-x11/images: replace *-systemd packages by their base p=
ackages
> 3. move systemd extensions of from other layers to meta-systemd OR use co=
nditional
>    BBMASK as mentioned above (if avaliable)
> 3. slim/udev/avahi: remove systemd from base packages and move to meta-sy=
stemd
> 4. dietsplash: Believing in it's description it should be moved to meta-s=
ystemd.
>=20
> This patch series can be pulled from=20
> git://gitorious.org/schnitzeltony-oe-meta/meta-oe.git
> branch systemd
>=20
> Andreas M=FCller (27):
>   systemd.bbclass: move to meta-systemd
>   move systemd recipes to meta-systemd
>   layer.conf/README: search directory structure for bbappends changed
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
>  meta-efl/recipes-efl/efl/elsa_svn.bb               |    9 +-------
>  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    8 +-----
>  .../cherokee/cherokee_1.2.98.bb                    |   10 ++------
>  .../recipes-connectivity/gateone/gateone_git.bb    |    9 +------
>  .../networkmanager/networkmanager_0.9.2.0.bb       |   13 +++++------
>  .../recipes-core/busybox/busybox_1.19.4.bbappend   |   20 +-------------=
--
>  meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    9 +-------
>  meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 ++------
>  .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   17 +-------------
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 +-
>  meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 ++++----
>  .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 +-----
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   11 ++-------
>  meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   13 +++-------
>  meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   14 +++--------
>  meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 +++--------
>  meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   17 +-------------
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 +------
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 ++------
>  meta-systemd/README                                |    5 ++++
>  {meta-oe =3D> meta-systemd}/classes/systemd.bbclass  |    0
>  meta-systemd/conf/layer.conf                       |    2 +-
>  .../recipes-efl/efl/elsa/xserver-nodm.service      |    0
>  .../meta-efl/recipes-efl/efl/elsa_svn.bbappend     |   13 +++++++++++
>  .../meta-gnome}/recipes-gnome/gdm/gdm/gdm.service  |    0
>  .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +++++++++++
>  .../recipes-bsp/keymaps/keymaps/keymaps.service    |    0
>  .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
>  .../cherokee/cherokee/cherokee.service             |    0
>  .../cherokee/cherokee_1.2.98.bbappend              |   10 ++++++++
>  .../connman/connman_0.79.bbappend                  |    2 +
>  .../recipes-connectivity/dhcp/dhcp}/dhcpd.service  |    0
>  .../dhcp/dhcp}/dhcrelay.service                    |    0
>  .../dhcp/dhcp_4.2.3-P2.bbappend                    |    4 +-
>  .../gateone/gateone/gateone.service                |    0
>  .../gateone/gateone_git.bbappend                   |   11 +++++++++
>  .../networkmanager/networkmanager_0.9.2.0.bbappend |   14 ++++++++++++
>  .../openssh/openssh/sshd.socket                    |    0
>  .../openssh/openssh/sshd@.service                  |    0
>  .../openssh/openssh/sshdgenkeys.service            |    0
>  .../openssh/openssh_6.0p1.bbappend                 |    2 +-
>  .../busybox/busybox/busybox-klogd.service.in       |    0
>  .../busybox/busybox/busybox-syslog.service.in      |    0
>  .../recipes-core/busybox/busybox_1.19.4.bbappend   |   23 ++++++++++++++=
++++++
>  .../recipes-core/dropbear/dropbear/dropbear.socket |    0
>  .../dropbear/dropbear/dropbear@.service            |    0
>  .../dropbear/dropbear/dropbearkey.service          |    0
>  .../dropbear/dropbear_2012.55.bbappend             |    2 +-
>  .../recipes-devtools/cloud9/cloud9/cloud9.service  |    0
>  .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |   13 +++++++++++
>  .../recipes-extended/atftp/atftp}/atftpd.service   |    0
>  .../recipes-extended/atftp/atftp_0.7.bbappend      |   10 ++++++++
>  .../recipes-extended/cronie/cronie/crond.service   |    0
>  .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    2 +-
>  .../lighttpd/lighttpd/lighttpd.service             |    0
>  .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
>  .../net-snmp/net-snmp}/snmpd.service               |    0
>  .../net-snmp/net-snmp}/snmptrapd.service           |    0
>  .../net-snmp/net-snmp}/systemd-support.patch       |    0
>  .../net-snmp/net-snmp_5.7.1.bbappend               |   19 ++++++++++++++=
++
>  .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 ++
>  .../rsyslog/rsyslog_5.8.0.bbappend                 |   12 ++++++++++
>  .../xinput-calibrator/xinput-calibrator.service    |    0
>  .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++++
>  .../xserver-nodm-init}/xserver-nodm.service        |    0
>  .../xserver-nodm-init_2.0.bbappend                 |   12 ++++++++++
>  .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   14 ++++++++++++
>  .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   14 ++++++++++++
>  .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++++++
>  .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
>  .../recipes-support/ntp/ntp}/ntpdate.service       |    0
>  .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   21 ++++++++++++++=
++++
>  .../syslog-ng/syslog-ng_3.2.5.bbappend             |   11 +++++++++
>  .../udisks/udisks/add-systemd-support.patch        |    0
>  .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++++++
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
>  88 files changed, 317 insertions(+), 171 deletions(-)
>  rename {meta-oe =3D> meta-systemd}/classes/systemd.bbclass (100%)
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
connman_0.79.bbappend (84%)
>  rename {meta-oe/recipes-connectivity/dhcp/files =3D> meta-systemd/meta-o=
e/recipes-connectivity/dhcp/dhcp}/dhcpd.service (100%)
>  rename {meta-oe/recipes-connectivity/dhcp/files =3D> meta-systemd/meta-o=
e/recipes-connectivity/dhcp/dhcp}/dhcrelay.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/dhcp/dhc=
p_4.2.3-P2.bbappend (81%)
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
r_2012.55.bbappend (92%)
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
e_1.4.8.bbappend (87%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/lighttpd/lig=
httpd/lighttpd.service (100%)
>  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/lighttpd/lig=
httpd_1.4.30.bbappend (84%)
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
init}/xserver-nodm.service (100%)
>  create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-in=
it/xserver-nodm-init_2.0.bbappend
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
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E39vaYmALEf/7YXx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/cv4MACgkQN1Ujt2V2gBxsuwCdGD9/1dWTVdWXrCe4sDWhcr/J
FlAAnRPQHjIMt5v+MPMWKXF9TAhYMuTV
=ve/3
-----END PGP SIGNATURE-----

--E39vaYmALEf/7YXx--
