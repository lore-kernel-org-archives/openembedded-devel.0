Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1TjJ2U-0001AW-RF
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Dec 2012 01:22:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBDMLjPm019708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2012 14:21:45 -0800 (PST)
Received: from localhost.localdomain (128.224.170.79) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 13 Dec 2012 14:21:45 -0800
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Dec 2012 00:21:35 +0200
Message-ID: <1355437295-27710-1-git-send-email-andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.170.79]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [meta-oe][PATCH] pixman: Sync with version from oe-core
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
X-List-Received-Date: Fri, 14 Dec 2012 00:22:07 -0000
Content-Type: text/plain

Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
---
 .../xorg-lib/pixman_0.27.2.bbappend                |    1 -
 .../xorg-lib/pixman_0.28.0.bbappend                |    1 +
 2 files changed, 1 insertion(+), 1 deletion(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend

diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
deleted file mode 100644
index d9f1c29..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/pixman_0.27.2.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
diff --git a/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend b/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
new file mode 100644
index 0000000..d9f1c29
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/pixman_0.28.0.bbappend
@@ -0,0 +1 @@
+PRINC := "${@int(PRINC) + 1}"
-- 
1.7.9.5



