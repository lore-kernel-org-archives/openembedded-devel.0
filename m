Received: from mail.kernelconcepts.de ([212.60.202.196])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>) id 1Rl7SL-0008H2-AW
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 00:19:45 +0100
Received: from [192.168.2.78] (helo=localhost.localdomain)
	by mail.kernelconcepts.de with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.72)
	(envelope-from <florian.boor@kernelconcepts.de>)
	id 1Rl7s6-0007wV-9X; Thu, 12 Jan 2012 00:46:22 +0100
From: Florian Boor <florian.boor@kernelconcepts.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Jan 2012 00:11:39 +0100
Message-Id: <1326323499-17505-1-git-send-email-florian.boor@kernelconcepts.de>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] ca-certificates: Change URI to an actually fetchable one.
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
X-List-Received-Date: Wed, 11 Jan 2012 23:19:45 -0000

Signed-off-by: Florian Boor <florian.boor@kernelconcepts.de>
---
 .../ca-certificates/ca-certificates_20111025.bb    |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb b/meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb
index 10848b4..32afb45 100644
--- a/meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb
+++ b/meta-oe/recipes-support/ca-certificates/ca-certificates_20111025.bb
@@ -4,7 +4,7 @@ SECTION = "misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=6275b491c91b57d92ebe11205ebf4dfe"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
+SRC_URI = "http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/c/ca-certificates/ca-certificates_${PV}.tar.gz \
            file://remove-c-rehash.patch"
 
 SRC_URI[md5sum] = "dfd593c9f89e64351aae78b9be588696"
-- 
1.7.2.5



