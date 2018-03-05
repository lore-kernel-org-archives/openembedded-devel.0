Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id A69706060F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 09:37:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="37481546"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Mar 2018 17:37:03 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 9851848AE761
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:37:01 +0800 (CST)
Received: from localhost.localdomain (10.167.225.156) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Mon, 5 Mar 2018 17:37:01 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 6 Mar 2018 02:20:26 +0800
Message-ID: <1520274026-127690-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.156]
X-yoursite-MailScanner-ID: 9851848AE761.A579D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] hexedit: 1.2.13 -> 1.4.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 09:37:03 -0000
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

Upgrade hexedit from 1.2.13 to 1.4.2

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../hexedit/0001-don-t-strip-when-installing.patch | 30 ----------------------
 .../{hexedit_1.2.13.bb => hexedit_1.4.2.bb}        | 11 ++++----
 2 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch
 rename meta-oe/recipes-extended/hexedit/{hexedit_1.2.13.bb => hexedit_1.4.2.bb} (51%)

diff --git a/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch b/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch
deleted file mode 100644
index a384b05..0000000
--- a/meta-oe/recipes-extended/hexedit/hexedit/0001-don-t-strip-when-installing.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From cc67246ca6839e5b3f6a286f10ed24c225b77a5e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Thu, 4 Jul 2013 12:34:32 +0200
-Subject: [PATCH] don't strip when installing
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Eric Bénard <eric@eukrea.com>
-
-Upstream-Status: Inappropriate [configuration]
----
- Makefile.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 159463e..735cc72 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -42,6 +42,6 @@ distclean: clean
- 
- install: $(PRODUCT)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(bindir)
--	$(INSTALL) -s -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
-+	$(INSTALL) -m 755 $(PRODUCT) $(DESTDIR)$(bindir)
- 	$(INSTALL) -d -m 755 $(DESTDIR)$(mandir)/man1
- 	$(INSTALL) -m 644 $(PRODUCT).1 $(DESTDIR)$(mandir)/man1
--- 
-1.7.10.4
-
diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
similarity index 51%
rename from meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
rename to meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
index 39df5b2..050b7da 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.2.13.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.4.2.bb
@@ -6,12 +6,11 @@ DEPENDS = "ncurses"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-SRC_URI = "http://rigaux.org/${BP}.src.tgz \
-    file://0001-don-t-strip-when-installing.patch "
+SRC_URI = "git://github.com/pixel/hexedit.git \
+    "
 
-SRC_URI[md5sum] = "a5af1378d028512a9cad27a5ba3e15f9"
-SRC_URI[sha256sum] = "6a126da30a77f5c0b08038aa7a881d910e3b65d13767fb54c58c983963b88dd7"
+SRCREV = "800e4b2e6280531a84fd23ee0b48e16baeb90878"
 
-inherit autotools-brokensep
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/${BPN}"
+inherit autotools-brokensep
-- 
2.7.4




