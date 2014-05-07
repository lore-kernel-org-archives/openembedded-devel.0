Return-Path: <sgh@sgh.dk>
X-Greylist: delayed 633 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 May 2014 09:36:53 UTC
Received: from mx-aarh-1.stofanet.dk (mx-aarh-1.stofanet.dk [212.10.10.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EEA8609A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 09:36:53 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx-aarh-2.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1Why7H-0008Kr-19; Wed, 07 May 2014 11:26:19 +0200
Received: from koontz.lgs-net.com (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTP id 1C7A87EC22;
	Wed,  7 May 2014 11:26:19 +0200 (CEST)
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 May 2014 11:26:17 +0200
Message-Id: <1399454777-2868-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
Subject: [meta-networking][PATCH] ifplugd: Added ifplugd recipe.
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
X-List-Received-Date: Wed, 07 May 2014 09:36:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: S=C3=B8ren Holm <sgh@sgh.dk>
---
 .../ifplugd/files/ifplugd.conf                     | 42 ++++++++++++++++=
++++++
 .../recipes-connectivity/ifplugd/ifplugd_0.28.bb   | 23 ++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ifplugd/files/if=
plugd.conf
 create mode 100644 meta-networking/recipes-connectivity/ifplugd/ifplugd_=
0.28.bb

diff --git a/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.c=
onf b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf
new file mode 100644
index 0000000..1e0f83a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ifplugd/files/ifplugd.conf
@@ -0,0 +1,42 @@
+# -*-sh-*-
+# $Id: ifplugd.conf 43 2003-09-13 11:25:11Z lennart $
+
+# This file is part of ifplugd.
+#
+# ifplugd is free software; you can redistribute it and/or modify it und=
er
+# the terms of the GNU General Public License as published by the Free
+# Software Foundation; either version 2 of the License, or (at your
+# option) any later version.
+#
+# ifplugd is distributed in the hope that it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with ifplugd; if not, write to the Free Software Foundation,
+# Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+
+# ifplugd configuration file
+
+# Please note that this is a bourne shell fragment sourced by the
+# init script of ifplugd.
+
+# Specify the interfaces to control here, separated by spaces.
+# Ifplugd processes will be started for each of these interfaces when
+# the ifplugd init script is called with the "start" argument. You may
+# use the magic string "auto" to make the init script start or stop
+# ifplugd processes for ALL eth and wlan interfaces that are available
+# according to /proc/net/dev. Note that the list of interfaces
+# appearing in /proc/net/dev may depend on which kernel modules you
+# have loaded.
+INTERFACES=3D"eth0"
+
+# Additional parameters for ifplugd.
+# (Run "ifplugd -h" for further information.)
+ARGS=3D"-fwI -u0 -d10"
+
+# Additional parameters for ifplugd for the specified interface.  Note
+# that $ARGS is ignored, when a variable like this is set for an
+# interface
+#ARGS_wlan0=3D"-MwI -u5 -d5"
diff --git a/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb=
 b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
new file mode 100644
index 0000000..340d5f4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ifplugd/ifplugd_0.28.bb
@@ -0,0 +1,23 @@
+DESCRIPTION =3D "Daemon for monitoring ethernet device link state"
+SRC_URI     =3D "http://0pointer.de/lennart/projects/ifplugd/ifplugd-0.2=
8.tar.gz \
+               file://ifplugd.conf"
+DEPENDS     =3D "libdaemon"
+LICENSE     =3D "GPLv2"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+
+SRC_URI[md5sum] =3D "df6f4bab52f46ffd6eb1f5912d4ccee3"
+SRC_URI[sha256sum] =3D "474754ac4ab32d738cbf2a4a3e87ee0a2c71b9048a38bdcd=
7df1e4f9fd6541f0"
+
+EXTRA_OECONF_append =3D "--disable-lynx"
+
+
+INITSCRIPT_PACKAGES =3D "${PN}"
+INITSCRIPT_NAME_${PN} =3D "${PN}"
+INITSCRIPT_PARAMS_${PN} =3D "defaults 90"
+
+do_install_append() {
+	install -m 644 ${WORKDIR}/ifplugd.conf ${D}${sysconfdir}/ifplugd/
+}
+
+inherit autotools update-rc.d
\ No newline at end of file
--=20
1.9.1


