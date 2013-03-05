Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UD0Ou-00055h-0Q
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Mar 2013 23:32:10 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so5088027pbc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2013 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=wum14juGzg72cu1cJp6SXx0AWbNZAPT0q1SEZi3Of3w=;
	b=KKtxnyPldvthGBV0L57lL1JNOOZ7VtZakag/MEfoY9r00VR+wiG/kfbbZnCPa27Leh
	g6B1eg9TW3eomPink6l3fApG8Naiw0LKrJCFA7F0z47NAA8OPPPjs482VhMY5u7K2imm
	VCCe6kFERhND98Xzv1oiPZcpMYpyNGus7iygfAjIWkgneKukQ8HnFP4qgbxXUmwmLIrV
	8tr4x46etuAs92RkRptuzYMWmqRgE3DtkouMzruQHs0lLbhLdebMn8RbFjr8Yt6ow5Pf
	ody4Mcgte8wnsI7OHiCV17rhmnxqH6XAEaR0P2tsAEwfeU921Wkq6C/29iPP6gE6yTc0
	AqMA==
X-Received: by 10.68.198.34 with SMTP id iz2mr38196070pbc.148.1362521729396;
	Tue, 05 Mar 2013 14:15:29 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ip8sm2725425pbc.39.2013.03.05.14.15.24
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 14:15:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Mar 2013 23:15:04 +0100
Message-Id: <1362521704-25965-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCHv2] poppler: upgrade to 0.18.4
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
X-List-Received-Date: Tue, 05 Mar 2013 22:32:50 -0000

* 0.18.0 was failing to build after libpng was upgraded to 1.6 in oe-core

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/poppler/poppler_0.18.0.bb | 12 ------------
 meta-oe/recipes-support/poppler/poppler_0.18.4.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 12 deletions(-)
 delete mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.0.bb
 create mode 100644 meta-oe/recipes-support/poppler/poppler_0.18.4.bb

diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb b/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
deleted file mode 100644
index 1217d6c..0000000
--- a/meta-oe/recipes-support/poppler/poppler_0.18.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require poppler.inc
-
-PR = "r4"
-
-DEPENDS += "lcms"
-
-EXTRA_OECONF_append = " --disable-abiword-output "
-
-RDEPENDS_${PN} = "poppler-data"
-
-SRC_URI[md5sum] = "4cd3bf2a0a13fa8eaf00d31368915f77"
-SRC_URI[sha256sum] = "9019b15ef10a878e607e4088a27fb4967f61cdfada7806d0fee97954f76648e8"
diff --git a/meta-oe/recipes-support/poppler/poppler_0.18.4.bb b/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
new file mode 100644
index 0000000..2f4927b
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler_0.18.4.bb
@@ -0,0 +1,10 @@
+require poppler.inc
+
+DEPENDS += "lcms"
+
+EXTRA_OECONF_append = " --disable-abiword-output "
+
+RDEPENDS_${PN} = "poppler-data"
+
+SRC_URI[md5sum] = "12658f3308597e57f3faff538cc73baf"
+SRC_URI[sha256sum] = "33421148cdc8e043da291dece2cce1cea6220d49a50c00c56d56d6435501d42e"
-- 
1.8.1.5



