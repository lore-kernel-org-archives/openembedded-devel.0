Return-Path: <Joe_MacDonald@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7AE73231
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 00:54:14 +0000 (UTC)
Received: from svr-orw-fem-06.mgc.mentorg.com ([147.34.97.120])
	by relay1.mentorg.com with esmtp 
	id 1ZM418-0005fB-E5 from Joe_MacDonald@mentor.com ;
	Sun, 02 Aug 2015 17:54:14 -0700
Received: from burninator (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 2 Aug 2015 17:54:13 -0700
Received: by burninator (Postfix, from userid 1000)	id 77E77582BA5; Sun,  2
	Aug 2015 20:53:38 -0400 (EDT)
Date: Sun, 2 Aug 2015 20:53:38 -0400
From: Joe MacDonald <Joe_MacDonald@mentor.com>
To: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <20150803005338.GG5208@mentor.com>
References: <1438050989-15233-1-git-send-email-rongqing.li@windriver.com>
	<20150730165734.GD6457@mentor.com> <55BAC984.5@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55BAC984.5@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-704 http://www.vim.org
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] ypbind-mt: get parameters from dhcp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Aug 2015 00:54:15 -0000
X-Groupsio-MsgNum: 56500
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ofZMSlrAVk9bLeVm"
Content-Disposition: inline

--ofZMSlrAVk9bLeVm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH 1/2] ypbind-mt: get parameters from dhcp] On 15.07.31 (Fri=
 09:04) Rongqing Li wrote:

>=20
>=20
> On 2015=E5=B9=B407=E6=9C=8831=E6=97=A5 00:57, Joe MacDonald wrote:
> >[[oe] [PATCH 1/2] ypbind-mt: get parameters from dhcp] On 15.07.28 (Tue =
10:36) rongqing.li@windriver.com wrote:
> >
> >>From: Li Wang <li.wang@windriver.com>
> >>
> >>adopt a script nis.sh from
> >>https://git.centos.org/raw/rpms!ypbind.git/5a592e88374f067679276488430e=
bdf51152c358/SOURCES!nis.sh
> >>it is dhclient-script plugin for NIS settings.
> >>
> >>Signed-off-by: Li Wang <li.wang@windriver.com>
> >>Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >>---
> >>  .../recipes-support/nis/ypbind-mt/nis.sh           | 108 ++++++++++++=
+++++++++
> >>  .../recipes-support/nis/ypbind-mt_1.38.bb          |   4 +
> >>  .../recipes-support/nis/ypbind-mt_2.2.bb           |   4 +
> >>  3 files changed, 116 insertions(+)
> >>  create mode 100755 meta-networking/recipes-support/nis/ypbind-mt/nis.=
sh
> >>
> >>diff --git a/meta-networking/recipes-support/nis/ypbind-mt/nis.sh b/met=
a-networking/recipes-support/nis/ypbind-mt/nis.sh
> >>new file mode 100755
> >>index 0000000..a1e338c
> >>--- /dev/null
> >>+++ b/meta-networking/recipes-support/nis/ypbind-mt/nis.sh
> >>@@ -0,0 +1,108 @@
> >>+#!/bin/sh
> >>+#
> >>+# nis.sh: dhclient-script plugin for NIS settings,
> >>+#         place in /etc/dhcp/dhclient.d and 'chmod +x nis.sh' to enable
> >>+#
> >>+# Copyright (C) 2008 Red Hat, Inc.
> >>+#
> >>+# This program is free software; you can redistribute it and/or modify
> >>+# it under the terms of the GNU General Public License as published by
> >>+# the Free Software Foundation; either version 2 of the License, or
> >>+# (at your option) any later version.
> >>+#
> >>+# This program is distributed in the hope that it will be useful,
> >>+# but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>+# GNU General Public License for more details.
> >>+#
> >>+# You should have received a copy of the GNU General Public License
> >>+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
> >>+#
> >>+# Author(s): David Cantrell <dcantrell@redhat.com>
> >>+
> >>+CONF=3D/etc/yp.conf
> >
> >This should probably be substituted with @SYSCONFDIR@ so it's still
> >functional for anyone who changes ${sysconfdir}.  Just thinking out loud
>=20
> thanks, Joe
>=20
> I will change it

Great, thank you.

> >now, but what's the systemd equivalent here?  Do we already have one?
> >
>=20
> this script is not called by initvscript or systemd,  it is called by
> dhclient once dhclient run and  gets configuration, so it is not related
> to systemd

Right, right, I wasn't thinking.  Thanks, so obviously no changes
required there, just a little tweak to support different sysconfdir
locations.

Thanks Roy.
-J.

>=20
> -Roy
>=20
> >That's not a barrier to accepting this patch, either way.  I'd just like
> >to see this hard-coded path be slightly less hard-coded.
> >
> >-J.
> >
> >>+SAVECONF=3D${SAVEDIR}/${CONF##*/}.predhclient.${interface}
> >>+
> >>+fix_context() {
> >>+    if [ -x /sbin/restorecon ]; then
> >>+        /sbin/restorecon ${1} >/dev/null 2>&1
> >>+    fi
> >>+}
> >>+
> >>+save_config_file() {
> >>+    if [ ! -d ${SAVEDIR} ]; then
> >>+        mkdir -p ${SAVEDIR}
> >>+    fi
> >>+
> >>+    if [ -e ${CONF} ]; then
> >>+        # cp+rm instead of mv: preserve SELinux context
> >>+        # rhbz#509240
> >>+        # Do not rely on restorecon.
> >>+        cp -c ${CONF} ${SAVECONF}
> >>+        rm ${CONF}
> >>+    else
> >>+        echo > ${SAVECONF}
> >>+        # Try restorecon
> >>+        fix_context ${SAVECONF}
> >>+    fi
> >>+}
> >>+
> >>+nis_config() {
> >>+    if [ ! "${PEERNIS}" =3D "no" ]; then
> >>+        if [ -n "${new_nis_domain}" ]; then
> >>+            domainname "${new_nis_domain}"
> >>+            save_config_file
> >>+            let contents=3D0
> >>+            echo '# generated by /sbin/dhclient-script' > ${CONF}
> >>+            fix_context ${CONF}
> >>+
> >>+            if [ -n "${new_nis_servers}" ]; then
> >>+                for i in ${new_nis_servers} ; do
> >>+                    echo "domain ${new_nis_domain} server ${i}" >> ${C=
ONF}
> >>+                    let contents=3Dcontents+1
> >>+                done
> >>+            else
> >>+                echo "domain ${new_nis_domain} broadcast" >> ${CONF}
> >>+                let contents=3Dcontents+1
> >>+            fi
> >>+
> >>+            if [ ${contents} -gt 0 ]; then
> >>+                service ypbind condrestart >/dev/null 2>&1
> >>+            fi
> >>+        elif [ -n "${new_nis_servers}" ]; then
> >>+            save_config_file
> >>+            echo '# generated by /sbin/dhclient-script' > ${CONF}
> >>+            fix_context ${CONF}
> >>+            let contents=3D0
> >>+
> >>+            for i in ${new_nis_servers} ; do
> >>+                echo "ypserver ${i}" >> ${CONF}
> >>+                let contents=3Dcontents+1
> >>+            done
> >>+
> >>+            if [ $contents -gt 0 ]; then
> >>+                service ypbind condrestart >/dev/null 2>&1
> >>+            fi
> >>+        fi
> >>+    fi
> >>+}
> >>+
> >>+nis_restore() {
> >>+    if [ ! "${PEERNIS}" =3D "no" ]; then
> >>+        if [ -f ${SAVECONF} ]; then
> >>+            rm -f ${CONF}
> >>+            # cp+rm instead of mv: preserve SELinux context
> >>+            # rhbz#509240
> >>+            cp -c ${SAVECONF} ${CONF}
> >>+            rm ${SAVECONF}
> >>+            fix_context ${CONF} # Restorecon again to be sure.
> >>+            service ypbind condrestart >/dev/null 2>&1
> >>+        fi
> >>+    fi
> >>+}
> >>+
> >>+# Local Variables:
> >>+# indent-tabs-mode: nil
> >>+# sh-basic-offset: 4
> >>+# show-trailing-whitespace: t
> >>+# End:
> >>diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/me=
ta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> >>index d25ef5c..5391b5b 100644
> >>--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> >>+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
> >>@@ -28,6 +28,7 @@ PROVIDES +=3D "ypbind"
> >>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz=
2 \
> >>             file://ypbind-yocto.init \
> >>             file://ypbind.service \
> >>+           file://nis.sh \
> >>  "
> >>  SRC_URI[md5sum] =3D "094088c0e282fa7f3b3dd6cc51d0a4e1"
> >>  SRC_URI[sha256sum] =3D "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b=
575199fa915559b7746"
> >>@@ -48,6 +49,9 @@ do_install_append () {
> >>
> >>      install -d ${D}${systemd_unitdir}/system
> >>      install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/=
system
> >>+
> >>+    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
> >>+    install -m 755 ${WORKDIR}/nis.sh ${D}/${sysconfdir}/dhcp/dhclient.=
d/
> >>  }
> >>
> >>
> >>diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/met=
a-networking/recipes-support/nis/ypbind-mt_2.2.bb
> >>index 4f8bf48..6d5ab2d 100644
> >>--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> >>+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
> >>@@ -23,6 +23,7 @@ PNBLACKLIST[ypbind-mt] ?=3D "BROKEN: Depends on broke=
n yp-tools"
> >>  SRC_URI =3D "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz=
2 \
> >>             file://ypbind-yocto.init \
> >>             file://ypbind.service \
> >>+           file://nis.sh \
> >>  "
> >>  SRC_URI[md5sum] =3D "54e2040d8266ae7d302d081ca310c8a8"
> >>  SRC_URI[sha256sum] =3D "dc2f7d97c94dcab0acfdcd115cd8b464eb8c427e4bb0f=
e68404ae7465f517cd3"
> >>@@ -45,6 +46,9 @@ do_install_append () {
> >>
> >>      install -d ${D}${systemd_unitdir}/system
> >>      install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/=
system
> >>+
> >>+    install -d ${D}/${sysconfdir}/dhcp/dhclient.d
> >>+    install -m 755 ${WORKDIR}/nis.sh ${D}/${sysconfdir}/dhcp/dhclient.=
d/
> >>  }
> >>
> >>
> >>--
> >>2.1.4
> >>
>=20
--=20
-Joe MacDonald.
:wq

--ofZMSlrAVk9bLeVm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJVvruPAAoJEEn8ffcsOfaWgAIIAJRh0bXwsVR/lJWbmG+rjLYE
2CCseoKBsrpjxZ0OD4w5UuXMyWYadjISuKGT2J3loEVghP7BJ67G/qgK09iSdB4q
er9wsFaw89r5kiWarhVU421jX1WhAez8U2SCyfc8aNfTNFCM509le+eVDItrY6tw
SwLWeF8fsYqSnV5WoZZ+S/JWHVCWOZH6Ria5WDwRTsnMy8ln35pwhNM/d5XbtS+X
G4czLaApncfKuAwAOp4eqJuxMJrjT3ryrZ8EH8ZiiTO7XVO/u3eWCyjDe8ROSQBs
ObMdy+jqMPoJ8QbV+hqdDp4GRqzCs+Dz7pVw5VUqTCE7NVCMjWW8+m2wfu8+4Ms=
=MXza
-----END PGP SIGNATURE-----

--ofZMSlrAVk9bLeVm--
