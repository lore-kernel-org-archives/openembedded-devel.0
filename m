Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <noor_ahsan@mentor.com>) id 1TtFt2-00014M-Hl
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:01:30 +0100
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id r0AAj3aF018870;
	Thu, 10 Jan 2013 04:45:04 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 15:44:51 +0500
Message-Id: <1357814691-1724-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-networking][PATCH] autofs: Remove systemd related things.
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
X-List-Received-Date: Thu, 10 Jan 2013 11:01:37 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* Autofs was being inherited from systemd. This class is only
present in meta-systemd. So bitbake was giving parse error
about systemd class. So removed systemd from inherit and
removed SYSTEMD_PACKAGES and SYSTEMD_SERVICE.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 .../recipes-daemons/autofs/autofs_5.0.7.bb         |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index c1b0b46..ad737e3 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 DEPENDS += "openldap libtirpc flex-native bison-native"
 
-inherit autotools systemd
+inherit autotools
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch \
@@ -40,9 +40,6 @@ inherit update-rc.d
 INITSCRIPT_NAME = "autofs"
 INITSCRIPT_PARAMS = "defaults"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "autofs.service"
-
 # FIXME: modules/Makefile has crappy rules that don't obey LDFLAGS
 CFLAGS += "${LDFLAGS}"
 
-- 
1.7.9.5



