Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PnsSu-0001BO-HE
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 13:51:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 4DA67314D9F1;
	Fri, 11 Feb 2011 13:50:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6hZ5I88Qgtzx; Fri, 11 Feb 2011 13:49:57 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id D99C3314D3FC;
	Fri, 11 Feb 2011 13:49:56 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 11 Feb 2011 12:49:56 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:49:55 +0000
Message-Id: <1297428596-27694-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [PATCH 1/2] netkit-base-0.17: use update-alternatives
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
X-List-Received-Date: Fri, 11 Feb 2011 12:51:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* Give netkit-inetd a priority of 70.
* Add inetd.conf to CONFFILES_${PN}.
* RPROVIDE inetd.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/netkit-base/netkit-base_0.17.bb |   13 +++++++++++--
 1 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/recipes/netkit-base/netkit-base_0.17.bb b/recipes/netkit-bas=
e/netkit-base_0.17.bb
index 8ab8935..19fdaee 100644
--- a/recipes/netkit-base/netkit-base_0.17.bb
+++ b/recipes/netkit-base/netkit-base_0.17.bb
@@ -1,7 +1,8 @@
 SECTION =3D "base"
 DESCRIPTION =3D "netkit-base includes the inetd daemon."
 LICENSE =3D "BSD"
-PR =3D "r2"
+RPROVIDES_${PN} =3D "inetd"
+PR =3D "r3"
=20
 SRC_URI =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/netkit-b=
ase-${PV}.tar.gz \
            file://configure.patch \
@@ -28,10 +29,18 @@ do_compile () {
 do_install () {
 	install -d ${D}${sysconfdir}/init.d ${D}${sbindir}
 	install -m 0755 inetd/inetd ${D}${sbindir}/inetd
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/inetd
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/inetd.${PN}
 	install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}
 }
=20
+pkg_prerm_${PN} () {
+        update-alternatives --remove inetd-init inetd.${PN}
+}
+pkg_postinst_${PN} () {
+        update-alternatives --install ${sysconfdir}/init.d/inetd inetd-i=
nit inetd.${PN} 70
+}
+
+CONFFILES_${PN} =3D "${sysconfdir}/inetd.conf"
=20
 SRC_URI[md5sum] =3D "1f0193358e92559ec0f598b09ccbc0ec"
 SRC_URI[sha256sum] =3D "16dd81625ebfc8f5dcb0dfd2e6bac223aad325a9405d66a5=
56fe349446b3c332"
--=20
1.7.2.3



