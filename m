Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PMODW-0003xO-3F
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 18:05:43 +0100
Received: from localhost.localdomain (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 472D01B421;
	Sat, 27 Nov 2010 18:05:44 +0100 (CET)
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 18:04:26 +0100
Message-Id: <1290877466-21034-1-git-send-email-schwarzkopf@sensortherm.de>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libgsasl: fixed SRC_URI
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
X-List-Received-Date: Sat, 27 Nov 2010 17:05:43 -0000

---
 recipes/libgsasl/libgsasl_1.4.0.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/libgsasl/libgsasl_1.4.0.bb b/recipes/libgsasl/libgsasl_1.4.0.bb
index 2e6b461..f1ba25b 100644
--- a/recipes/libgsasl/libgsasl_1.4.0.bb
+++ b/recipes/libgsasl/libgsasl_1.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gsasl/"
 DEPENDS = "libidn"  
 PR = "r0"
 
-SRC_URI = "${GNU_MIRROR}/${PN}/${P}.tar.gz;name=libgsasl"
+SRC_URI = "${GNU_MIRROR}/gsasl/${P}.tar.gz;name=libgsasl"
 SRC_URI[libgsasl.md5sum] = "e1e5ffac3f260a0412b8820d8e5229ab"
 SRC_URI[libgsasl.sha256sum] = "1e3d42c414e09a8fb16fb3ce5fac2a3b3324048e123b7f682fb05b12c51bede8"
 
-- 
1.7.0.4



