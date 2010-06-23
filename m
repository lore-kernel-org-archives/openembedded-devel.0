Received: from mail.asoft.ru ([91.205.86.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1ORTO7-0006ND-Md
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:05:59 +0200
Received: from lighthouse.office.asoft.ru (office.asoft.ru [62.205.175.245])
	(authenticated bits=0)
	by mail.asoft.ru (8.14.3/8.14.3) with ESMTP id o5NH0dGH028612
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 21:00:47 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jun 2010 21:00:37 +0400
Message-Id: <1277312438-326-3-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
References: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.3
	(mail.asoft.ru [91.205.86.207]);
	Wed, 23 Jun 2010 21:00:47 +0400 (MSD)
X-SA-Exim-Connect-IP: 91.205.86.207
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/3] jbig2dec-0.11: new recipe
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
X-List-Received-Date: Wed, 23 Jun 2010 17:06:13 -0000

jbig2dec is a decoder implementation of the JBIG2 image compression
format. JBIG2 is designed for lossy or lossless encoding of monochrome
images at moderately high resolution, in particular scanned paper documents.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 recipes/jpeg/jbig2dec_0.11.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/jpeg/jbig2dec_0.11.bb

diff --git a/recipes/jpeg/jbig2dec_0.11.bb b/recipes/jpeg/jbig2dec_0.11.bb
new file mode 100644
index 0000000..ccdeedd
--- /dev/null
+++ b/recipes/jpeg/jbig2dec_0.11.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Decoder implementation of the JBIG2 image compression format"
+HOMEPAGE = "http://jbig2dec.sourceforge.net/"
+SECTION = "libs"
+LICENSE = "GPL"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/jbig2dec/${PN}-${PV}.tar.gz"
+
+inherit autotools
+
+PACKAGES =+ "jbig2dec-tools "
+FILES_jbig2dec-tools = "${bindir}/*"
+
+SRC_URI[md5sum] = "1f61e144852c86563fee6e5ddced63f1"
+SRC_URI[sha256sum] = "7e2d8330b36f2765da22043d174827bee0f30db8d78c330904f363275c7dd0b9"
-- 
1.7.1



