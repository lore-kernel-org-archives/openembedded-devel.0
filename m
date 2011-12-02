Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RWRIc-0005vG-U4
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 12:29:11 +0100
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 41749D1A064
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2011 12:21:43 +0100 (CET)
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id F3C8D4B0235;
	Fri,  2 Dec 2011 12:21:37 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:55 +0100
Message-Id: <1322824856-15965-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1322824856-15965-1-git-send-email-eric@eukrea.com>
References: <1322824856-15965-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe 2/3] atftp: correctly handle init script
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
X-List-Received-Date: Fri, 02 Dec 2011 11:29:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

else it's affected to atftp package which is the client
and not the server, but the init file is only in the server
package thus leading to the following log at boot :
Configuring atftp.
update-rc.d: /etc/init.d/atftpd: file does not exist

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-extended/atftp/atftp_0.7.bb |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bb b/meta-oe/recipe=
s-extended/atftp/atftp_0.7.bb
index c541634..ab14a28 100644
--- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
+++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
@@ -3,6 +3,7 @@ SECTION =3D "network"
 HOMEPAGE =3D "http://packages.debian.org/atftp"
 LICENSE =3D "GPLv2"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
+PR =3D "r1"
=20
 SRC_URI =3D "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;=
name=3Darchive \
            ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;nam=
e=3Dpatch \
@@ -16,11 +17,12 @@ inherit autotools update-rc.d systemd useradd
 SYSTEMD_PACKAGES =3D "atftpd-systemd"
 SYSTEMD_SERVICE_atftpd-systemd =3D "atftpd.service"
=20
-INITSCRIPT_NAME =3D "atftpd"
-INITSCRIPT_PARAMS =3D "defaults 80"
+INITSCRIPT_PACKAGES =3D "${PN}d"
+INITSCRIPT_NAME_${PN}d =3D "atftpd"
+INITSCRIPT_PARAMS_${PN}d =3D "defaults 80"
=20
-USERADD_PACKAGES =3D "atftpd"
-USERADD_PARAM_atftpd =3D "--system --no-create-home --shell /bin/false \
+USERADD_PACKAGES =3D "${PN}d"
+USERADD_PARAM_${PN}d =3D "--system --no-create-home --shell /bin/false \
                         --user-group nobody"
=20
 do_install_append() {
--=20
1.7.6.4



