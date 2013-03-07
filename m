Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UDccd-00006O-HE
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:20:59 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 16:04:10 +0100
Message-Id: <1362668650-19705-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <5138A514.3080303@opendreambox.org>
References: <5138A514.3080303@opendreambox.org>
Subject: [meta-oe][PATCH v2] samba: fix install for older samba versions
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
X-List-Received-Date: Thu, 07 Mar 2013 15:21:03 -0000

* Samba 3.0 doesn't build libnss_*.so
* base_sbindir may contain mount.cifs

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-oe/recipes-connectivity/samba/samba.inc |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 3ee43ad..42ddce5 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -87,10 +87,12 @@ do_install_append() {
 	install -d ${D}/var/spool/samba
 
 	# Install other stuff not installed by "make install"
-	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
-	install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
+	if [ -d ${WORKDIR}/${PN}-${PV}/nsswitch ]; then
+		install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
+		install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
+	fi
 
-	rmdir ${D}${base_sbindir}
+	rmdir --ignore-fail-on-non-empty ${D}${base_sbindir}
 	sed -i -e '1s,#!.*perl,#!${USRBINPATH}/env perl,' ${D}${bindir}/findsmb
 }
 
-- 
1.7.10.4



