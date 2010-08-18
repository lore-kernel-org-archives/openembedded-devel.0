Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1Oll8u-0001Th-Go
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 18:05:49 +0200
Received: from p5b035be8.dip.t-dialin.net ([91.3.91.232] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1Oll8H-0007bl-UD by authid <stefan@sostec.de> with cram_md5;
	Wed, 18 Aug 2010 18:05:09 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1Oll8F-0005ET-36; Wed, 18 Aug 2010 18:04:51 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Aug 2010 18:04:45 +0200
Message-Id: <1282147486-20078-3-git-send-email-stefan@datenfreihafen.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1282147486-20078-1-git-send-email-stefan@datenfreihafen.org>
References: <1282147486-20078-1-git-send-email-stefan@datenfreihafen.org>
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Stefan Schmidt <stefan@buglabs.net>
Subject: [PATCH][STABLE 3/4] pointercal: Add bug20 support and bump PR
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
X-List-Received-Date: Wed, 18 Aug 2010 16:05:49 -0000

From: Stefan Schmidt <stefan@buglabs.net>


Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
---
 recipes/pointercal/files/bug20/pointercal |  Bin 0 -> 46 bytes
 recipes/pointercal/pointercal_0.0.bb      |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 create mode 100644 recipes/pointercal/files/bug20/pointercal

diff --git a/recipes/pointercal/files/bug20/pointercal b/recipes/pointercal/files/bug20/pointercal
new file mode 100644
index 0000000000000000000000000000000000000000..ef4298bcce1bacae8df2d3eac65831c3ec1261e0
GIT binary patch
literal 46
ucmV~$0Sy2!2m`Q7nSm#;GZ_Ajy}fptcuX*yQw&rrZubt6vS=ACy*?k#xd^fV

literal 0
HcmV?d00001

diff --git a/recipes/pointercal/pointercal_0.0.bb b/recipes/pointercal/pointercal_0.0.bb
index dbb14c4..36aee53 100644
--- a/recipes/pointercal/pointercal_0.0.bb
+++ b/recipes/pointercal/pointercal_0.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Touchscreen calibration data"
 SECTION = "base"
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "file://pointercal"
 S = "${WORKDIR}"
-- 
1.7.1



