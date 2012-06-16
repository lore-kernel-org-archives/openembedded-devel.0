Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfxSA-0008Uh-Ml
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Jun 2012 20:10:30 +0200
Received: by wibhm14 with SMTP id hm14so485019wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ne0cCtOhBAgu5pdOl8BEfifd0sxOThF2BV9Zit7VKbo=;
	b=f+uv/e9b5oeET+kmmQ0O+hqanZI7S6orejaUgz/EDdst6+q3ZpXmY1Z2vFIfPKVsUQ
	JFlj7fR7fpPgoq9iILFg1fI+InyWIUG+2Muz66p09sxUu2j1U8S1q9R+pob2MuO12i7r
	YPEoW3yTNvCEdK7mw93hYGKl+dg3bGSannPALuHF89g0PCp7S3NcZ+ayBc6Xl5zFBT+p
	cjuKWlveVbgRPHD255QP0Aa/i7txiGCL6Cnx+7rR+sHkcKEqJZlGg4eCskzjp2D9cGUr
	OqySXxg3DLIIfPxCYySQ2O9+JlCsh9gpmhv/RppxloymaTKC07QaIqyZhrzVuCs5XqXq
	cmUA==
Received: by 10.180.80.97 with SMTP id q1mr12567264wix.13.1339869590739;
	Sat, 16 Jun 2012 10:59:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv7sm21125196wib.0.2012.06.16.10.59.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 16 Jun 2012 10:59:49 -0700 (PDT)
Date: Sat, 16 Jun 2012 19:59:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120616175947.GD3178@jama.jama.net>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
	<20120616171651.GB3178@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120616171651.GB3178@jama.jama.net>
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
X-List-Received-Date: Sat, 16 Jun 2012 18:10:30 -0000
X-Groupsio-MsgNum: 39259
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bajzpZikUji1w+G9"
Content-Disposition: inline

--bajzpZikUji1w+G9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 16, 2012 at 07:16:51PM +0200, Martin Jansa wrote:
> On Sun, Jun 10, 2012 at 11:46:33PM +0200, Andreas M=FCller wrote:
> > This is the first part of the transition to meta-systemd for review. It
> > contains the changes on all recipes inheriting systemd.
>=20
> Looks like this patchset also depends on this patch for oe-core
> http://patchwork.openembedded.org/patch/24179/
>=20
> and there is missing space in elsa SRC_URI somewhere
> WARNING: Unable to get checksum for elsa SRC_URI entry
> xserver-nodm.servicefile: file could not be found
> but looking at elsa change I don't see where (will debug and report
> later).

you can ignore this one, it was caused by
meta-smartphone/meta-shr/recipes-efl/efl/elsa_svn.bbappend
SRC_URI_append_shr =3D "file://elsa.conf"
which worked only because of trailing space in SRC_URI, fixed in
meta-shr..

Cheers,

> Cheers,
>=20
> >=20
> > The following tests were performed:
> > * build all recipes touched by this series from scratch without this se=
ries
> > * build all recipes touched by this series from scratch without this se=
ries
> >   and check buildhistory diff for unexpected side effects
> > * set BBMASK =3D "meta-systemd|meta-ti/recipes-misc|meta-angstrom/recip=
es-core/led|meta-angstrom/recipes-core/systemd|meta-nokia/recipes-core/syst=
emd|meta-openmoko/recipes-core/systemd"
> >   and build all recipes touched from scratch an check if there is no=20
> >   reference to systemd or unexpeted left-over. These tests are still in=
 progress.
> >=20
> > I think there are basically two parties affected by this patch:
> >=20
> > 1.systemd users: These will not see any difference from the situation b=
efore
> >   this patch
> > 2.non-systemd-users: They should now grab recipes from meta-oe wihout f=
earing
> >   systemd grabbed in. Tasks and images need further decisions/efforts f=
or them (see 2. below)
> >=20
> > After this patch series the following steps need to be done:
> >=20
> > 1.Automatic RRECOMMENDS on *-systemd packages or put systemd stuff in b=
ase
> >   packages. This is required to make tasks/images independent of using =
systemd
> >   or not. Here is still a discussions/decision pending. I see two ways =
to go:
> >   1.1. If a package with *-systemd package extension is required, the *=
-systemd
> >        package is added to RRECOMMENDS. The decision is only made by ad=
ding=20
> >        meta-systemd to BBLAYERS.
> >   1.2. The *-system packages are removed and their contents move to the=
ir base
> >        packages. Same here: The decision is only made by adding meta-sy=
stemd
> >        to BBLAYERS.
> >   There were distro-features mentioned in previous discussions. Are con=
ditional
> >   BBMASKS available e.g masking out whole meta-systemd if 'systemd' is =
not found
> >   in distro feature?
> >   To make these patches make sense and enable non systemd users to use =
meta-oe
> >   we need a decision on how to continue on this.
> > 2. task-basic/task-x11/images: replace *-systemd packages by their base=
 packages
> > 3. move systemd extensions of from other layers to meta-systemd OR use =
conditional
> >    BBMASK as mentioned above (if avaliable)
> > 3. slim/udev/avahi: remove systemd from base packages and move to meta-=
systemd
> > 4. dietsplash: Believing in it's description it should be moved to meta=
-systemd.
> >=20
> > This patch series can be pulled from=20
> > git://gitorious.org/schnitzeltony-oe-meta/meta-oe.git
> > branch systemd
> >=20
> > Andreas M=FCller (27):
> >   systemd.bbclass: move to meta-systemd
> >   move systemd recipes to meta-systemd
> >   layer.conf/README: search directory structure for bbappends changed
> >   polkit: meta-systemd rework
> >   gdm: move systemd support to meta-systemd
> >   busybox: move systemd support to meta-systemd
> >   ntp: move systemd support to meta-systemd
> >   syslog-ng: move systemd support to meta-systemd
> >   udisks: move systemd support to meta-systemd
> >   lighttpd: move systemd support to meta-systemd
> >   cronie: move systemd support to meta-systemd
> >   elsa: move systemd support to meta-systemd
> >   net-snmp: move systemd support to meta-systemd
> >   atftp: move systemd support to meta-systemd
> >   dhcp: move systemd support to meta-systemd
> >   connman: move systemd support to meta-systemd
> >   gateone: move systemd support to meta-systemd
> >   cherokee: move systemd support to meta-systemd
> >   openssh: move systemd support to meta-systemd
> >   cloud9: move systemd support to meta-systemd
> >   xinput-calibrator: : move systemd support to meta-systemd
> >   xserver-nodm-init: move systemd support to meta-systemd
> >   dropbear: move systemd support to meta-systemd
> >   keymaps: move systemd support to meta-systemd
> >   rsyslog: move systemd support to meta-systemd
> >   gpsd: move systemd support to meta-systemd
> >   networkmanager: move systemd support to meta-systemd
> >=20
> >  meta-efl/recipes-efl/efl/elsa_svn.bb               |    9 +-------
> >  meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    8 +-----
> >  .../cherokee/cherokee_1.2.98.bb                    |   10 ++------
> >  .../recipes-connectivity/gateone/gateone_git.bb    |    9 +------
> >  .../networkmanager/networkmanager_0.9.2.0.bb       |   13 +++++------
> >  .../recipes-core/busybox/busybox_1.19.4.bbappend   |   20 +-----------=
----
> >  meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      |    9 +-------
> >  meta-oe/recipes-extended/atftp/atftp_0.7.bb        |   10 ++------
> >  .../recipes-extended/net-snmp/net-snmp_5.7.1.bb    |   17 +-----------=
--
> >  .../recipes-extended/polkit/polkit_0.104.bbappend  |    4 +-
> >  meta-oe/recipes-extended/rsyslog/rsyslog.inc       |   10 ++++----
> >  .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |    8 +-----
> >  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   11 ++-------
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   13 +++-------
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   14 +++--------
> >  meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 +++--------
> >  meta-oe/recipes-support/ntp/ntp_4.2.6p3.bb         |   17 +-----------=
--
> >  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |    9 +------
> >  meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 ++------
> >  meta-systemd/README                                |    5 ++++
> >  {meta-oe =3D> meta-systemd}/classes/systemd.bbclass  |    0
> >  meta-systemd/conf/layer.conf                       |    2 +-
> >  .../recipes-efl/efl/elsa/xserver-nodm.service      |    0
> >  .../meta-efl/recipes-efl/efl/elsa_svn.bbappend     |   13 +++++++++++
> >  .../meta-gnome}/recipes-gnome/gdm/gdm/gdm.service  |    0
> >  .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +++++++++++
> >  .../recipes-bsp/keymaps/keymaps/keymaps.service    |    0
> >  .../recipes-bsp/keymaps/keymaps_1.0.bbappend       |    2 +-
> >  .../cherokee/cherokee/cherokee.service             |    0
> >  .../cherokee/cherokee_1.2.98.bbappend              |   10 ++++++++
> >  .../connman/connman_0.79.bbappend                  |    2 +
> >  .../recipes-connectivity/dhcp/dhcp}/dhcpd.service  |    0
> >  .../dhcp/dhcp}/dhcrelay.service                    |    0
> >  .../dhcp/dhcp_4.2.3-P2.bbappend                    |    4 +-
> >  .../gateone/gateone/gateone.service                |    0
> >  .../gateone/gateone_git.bbappend                   |   11 +++++++++
> >  .../networkmanager/networkmanager_0.9.2.0.bbappend |   14 ++++++++++++
> >  .../openssh/openssh/sshd.socket                    |    0
> >  .../openssh/openssh/sshd@.service                  |    0
> >  .../openssh/openssh/sshdgenkeys.service            |    0
> >  .../openssh/openssh_6.0p1.bbappend                 |    2 +-
> >  .../busybox/busybox/busybox-klogd.service.in       |    0
> >  .../busybox/busybox/busybox-syslog.service.in      |    0
> >  .../recipes-core/busybox/busybox_1.19.4.bbappend   |   23 ++++++++++++=
++++++++
> >  .../recipes-core/dropbear/dropbear/dropbear.socket |    0
> >  .../dropbear/dropbear/dropbear@.service            |    0
> >  .../dropbear/dropbear/dropbearkey.service          |    0
> >  .../dropbear/dropbear_2012.55.bbappend             |    2 +-
> >  .../recipes-devtools/cloud9/cloud9/cloud9.service  |    0
> >  .../recipes-devtools/cloud9/cloud9_0.6.bbappend    |   13 +++++++++++
> >  .../recipes-extended/atftp/atftp}/atftpd.service   |    0
> >  .../recipes-extended/atftp/atftp_0.7.bbappend      |   10 ++++++++
> >  .../recipes-extended/cronie/cronie/crond.service   |    0
> >  .../recipes-extended/cronie/cronie_1.4.8.bbappend  |    2 +-
> >  .../lighttpd/lighttpd/lighttpd.service             |    0
> >  .../lighttpd/lighttpd_1.4.30.bbappend              |    2 +-
> >  .../net-snmp/net-snmp}/snmpd.service               |    0
> >  .../net-snmp/net-snmp}/snmptrapd.service           |    0
> >  .../net-snmp/net-snmp}/systemd-support.patch       |    0
> >  .../net-snmp/net-snmp_5.7.1.bbappend               |   19 ++++++++++++=
++++
> >  .../recipes-extended/polkit/polkit_0.104.bbappend  |    3 ++
> >  .../rsyslog/rsyslog_5.8.0.bbappend                 |   12 ++++++++++
> >  .../xinput-calibrator/xinput-calibrator.service    |    0
> >  .../xinput-calibrator_0.7.5.bbappend               |   10 ++++++++
> >  .../xserver-nodm-init}/xserver-nodm.service        |    0
> >  .../xserver-nodm-init_2.0.bbappend                 |   12 ++++++++++
> >  .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   14 ++++++++++++
> >  .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   14 ++++++++++++
> >  .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++++++
> >  .../meta-oe/recipes-support/ntp/ntp}/ntpd.service  |    0
> >  .../recipes-support/ntp/ntp}/ntpdate.service       |    0
> >  .../recipes-support/ntp/ntp_4.2.6p3.bbappend       |   21 ++++++++++++=
++++++
> >  .../syslog-ng/syslog-ng_3.2.5.bbappend             |   11 +++++++++
> >  .../udisks/udisks/add-systemd-support.patch        |    0
> >  .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13 +++++++++++
> >  .../recipes-core/systemd/systemd-compat-units.bb   |    0
> >  .../systemd/systemd-compat-units/machineid.service |    0
> >  .../systemd-compat-units/run-postinsts.service     |    0
> >  .../systemd/systemd-machine-units_1.0.bb           |    0
> >  .../recipes-core/systemd/systemd-serialgetty.bb    |    0
> >  .../systemd/systemd-serialgetty/LICENSE            |    0
> >  .../systemd-serialgetty/serial-getty@.service      |    0
> >  .../recipes-core/systemd/systemd-speed-hacks.bb    |    0
> >  .../systemd/systemd-systemctl-native.bb            |    0
> >  .../systemd/systemd-systemctl-native/systemctl     |    0
> >  .../systemd/systemd/format-replace-m-uclibc.patch  |    0
> >  .../systemd/systemd/paper-over-mkostemp.patch      |    0
> >  .../recipes-core/systemd/systemd_git.bb            |    0
> >  88 files changed, 317 insertions(+), 171 deletions(-)
> >  rename {meta-oe =3D> meta-systemd}/classes/systemd.bbclass (100%)
> >  rename {meta-efl =3D> meta-systemd/meta-efl}/recipes-efl/efl/elsa/xser=
ver-nodm.service (100%)
> >  create mode 100644 meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbap=
pend
> >  rename {meta-gnome =3D> meta-systemd/meta-gnome}/recipes-gnome/gdm/gdm=
/gdm.service (100%)
> >  create mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.=
2.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps=
/keymaps.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-bsp/keymaps/keymaps=
_1.0.bbappend (85%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/cherok=
ee/cherokee/cherokee.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/cherokee/=
cherokee_1.2.98.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/connma=
n/connman_0.79.bbappend (84%)
> >  rename {meta-oe/recipes-connectivity/dhcp/files =3D> meta-systemd/meta=
-oe/recipes-connectivity/dhcp/dhcp}/dhcpd.service (100%)
> >  rename {meta-oe/recipes-connectivity/dhcp/files =3D> meta-systemd/meta=
-oe/recipes-connectivity/dhcp/dhcp}/dhcrelay.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/dhcp/d=
hcp_4.2.3-P2.bbappend (81%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/gateon=
e/gateone/gateone.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/gateone/g=
ateone_git.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-connectivity/networkma=
nager/networkmanager_0.9.2.0.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openss=
h/openssh/sshd.socket (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openss=
h/openssh/sshd@.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openss=
h/openssh/sshdgenkeys.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-connectivity/openss=
h/openssh_6.0p1.bbappend (88%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/busybox/busybo=
x/busybox-klogd.service.in (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/busybox/busybo=
x/busybox-syslog.service.in (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-core/busybox/busybox_1=
=2E19.4.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropb=
ear/dropbear.socket (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropb=
ear/dropbear@.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropb=
ear/dropbearkey.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-core/dropbear/dropb=
ear_2012.55.bbappend (92%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-devtools/cloud9/clo=
ud9/cloud9.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9=
_0.6.bbappend
> >  rename {meta-oe/recipes-extended/atftp/files =3D> meta-systemd/meta-oe=
/recipes-extended/atftp/atftp}/atftpd.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-extended/atftp/atftp_0=
=2E7.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/cronie/cro=
nie/crond.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/cronie/cro=
nie_1.4.8.bbappend (87%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/lighttpd/l=
ighttpd/lighttpd.service (100%)
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-extended/lighttpd/l=
ighttpd_1.4.30.bbappend (84%)
> >  rename {meta-oe/recipes-extended/net-snmp/files =3D> meta-systemd/meta=
-oe/recipes-extended/net-snmp/net-snmp}/snmpd.service (100%)
> >  rename {meta-oe/recipes-extended/net-snmp/files =3D> meta-systemd/meta=
-oe/recipes-extended/net-snmp/net-snmp}/snmptrapd.service (100%)
> >  rename {meta-oe/recipes-extended/net-snmp/files =3D> meta-systemd/meta=
-oe/recipes-extended/net-snmp/net-snmp}/systemd-support.patch (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-extended/net-snmp/net-=
snmp_5.7.1.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-extended/polkit/polkit=
_0.104.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-extended/rsyslog/rsysl=
og_5.8.0.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-graphics/xinput-cal=
ibrator/xinput-calibrator/xinput-calibrator.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-graphics/xinput-calibr=
ator/xinput-calibrator_0.7.5.bbappend
> >  rename {meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init-2=
=2E0 =3D> meta-systemd/meta-oe/recipes-graphics/xserver-nodm-init/xserver-n=
odm-init}/xserver-nodm.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-graphics/xserver-nodm-=
init/xserver-nodm-init_2.0.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3=
=2E4.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3=
=2E5.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_g=
it.bbappend
> >  rename {meta-oe/recipes-support/ntp/files =3D> meta-systemd/meta-oe/re=
cipes-support/ntp/ntp}/ntpd.service (100%)
> >  rename {meta-oe/recipes-support/ntp/files =3D> meta-systemd/meta-oe/re=
cipes-support/ntp/ntp}/ntpdate.service (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-support/ntp/ntp_4.2.6p=
3.bbappend
> >  create mode 100644 meta-systemd/meta-oe/recipes-support/syslog-ng/sysl=
og-ng_3.2.5.bbappend
> >  rename {meta-oe =3D> meta-systemd/meta-oe}/recipes-support/udisks/udis=
ks/add-systemd-support.patch (100%)
> >  create mode 100644 meta-systemd/meta-oe/recipes-support/udisks/udisks_=
1.0.4.bbappend
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-compat=
-units.bb (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-compat=
-units/machineid.service (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-compat=
-units/run-postinsts.service (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-machin=
e-units_1.0.bb (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-serial=
getty.bb (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-serial=
getty/LICENSE (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-serial=
getty/serial-getty@.service (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-speed-=
hacks.bb (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-system=
ctl-native.bb (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd-system=
ctl-native/systemctl (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd/format=
-replace-m-uclibc.patch (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd/paper-=
over-mkostemp.patch (100%)
> >  rename {meta-oe =3D> meta-systemd}/recipes-core/systemd/systemd_git.bb=
 (100%)
> >=20
> > --=20
> > 1.7.4.4
> >=20
> >=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bajzpZikUji1w+G9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/cyZMACgkQN1Ujt2V2gBz41ACePxFUKSU/V+ta9OYD4KmfWDdf
lM8AoIpNLwNGXPk8PTpZy0Vx/Z5EgwRO
=jkuk
-----END PGP SIGNATURE-----

--bajzpZikUji1w+G9--
