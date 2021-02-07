Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.15136.1612661189316084823
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:26:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,158,1610380800"; 
   d="scan'208";a="104284687"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 07 Feb 2021 09:26:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 4E3E24CE6033
	for <openembedded-devel@lists.openembedded.org>; Sun,  7 Feb 2021 09:26:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 7 Feb 2021 09:26:17 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gensio: upgrade 2.2.0 -> 2.2.3
Date: Sun, 7 Feb 2021 21:26:14 +0800
Message-ID: <1612704374-4499-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 4E3E24CE6033.A1B3E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
Removed since this is included in 2.2.3

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ameter-of-function-sctp_gensio_alloc.patch | 29 -------------------
 .../{gensio_2.2.0.bb => gensio_2.2.3.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.2.0.bb => gensio_2.2.3.bb} (79%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch b/meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
deleted file mode 100644
index 22a452508..000000000
--- a/meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b94eff3461e4fb99cd761d6858e8ed94cb6c5412 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@cn.fujitsu.com>
-Date: Tue, 8 Dec 2020 11:58:06 +0900
-Subject: [PATCH] 0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
-
-parameter type of declearation is const, definition should also be
-const.
-
-Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
----
- lib/gensio_sctp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/gensio_sctp.c b/lib/gensio_sctp.c
-index bd9437f..4278ff8 100644
---- a/lib/gensio_sctp.c
-+++ b/lib/gensio_sctp.c
-@@ -1092,7 +1092,7 @@ str_to_sctp_gensio_accepter(const char *str, const char * const args[],
- #else
- 
- int
--sctp_gensio_alloc(struct gensio_addr *iai, const char * const args[],
-+sctp_gensio_alloc(const struct gensio_addr *iai, const char * const args[],
- 		  struct gensio_os_funcs *o,
- 		  gensio_event cb, void *user_data,
- 		  struct gensio **new_gensio)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.2.0.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.3.bb
similarity index 79%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.2.0.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.3.bb
index 424e176ca..89d454989 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.2.0.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.3.bb
@@ -5,10 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "4ec19138aa968dea34e4bc4e022c1ad7ed4c43c0"
+SRCREV = "88fe56696b19ffff3e16be1d46d062e835879740"
 
-SRC_URI = "git://github.com/cminyard/gensio;protocol=https \
-           file://0001-Modify-parameter-of-function-sctp_gensio_alloc.patch"
+SRC_URI = "git://github.com/cminyard/gensio;protocol=https;branch=2.2.x"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



