Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web11.4810.1607407891932472706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Dec 2020 22:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,401,1599494400"; 
   d="scan'208";a="102166333"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Dec 2020 14:11:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 00AA24CE6008
	for <openembedded-devel@lists.openembedded.org>; Tue,  8 Dec 2020 14:11:16 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 8 Dec 2020 14:11:14 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-oe][PATCH] gensio: 2.1.4 -> 2.2.0
Date: Tue, 8 Dec 2020 14:11:11 +0800
Message-ID: <1607407872-2317-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 00AA24CE6008.A8DD9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
added to resolve compile error.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ameter-of-function-sctp_gensio_alloc.patch | 29 +++++++++++++++++++
 .../{gensio_2.1.4.bb => gensio_2.2.0.bb}      |  4 +--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
 rename meta-oe/recipes-connectivity/gensio/{gensio_2.1.4.bb => gensio_2.2.0.bb} (85%)

diff --git a/meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch b/meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
new file mode 100644
index 000000000..22a452508
--- /dev/null
+++ b/meta-oe/recipes-connectivity/gensio/gensio/0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
@@ -0,0 +1,29 @@
+From b94eff3461e4fb99cd761d6858e8ed94cb6c5412 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@cn.fujitsu.com>
+Date: Tue, 8 Dec 2020 11:58:06 +0900
+Subject: [PATCH] 0001-Modify-parameter-of-function-sctp_gensio_alloc.patch
+
+parameter type of declearation is const, definition should also be
+const.
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
+---
+ lib/gensio_sctp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/gensio_sctp.c b/lib/gensio_sctp.c
+index bd9437f..4278ff8 100644
+--- a/lib/gensio_sctp.c
++++ b/lib/gensio_sctp.c
+@@ -1092,7 +1092,7 @@ str_to_sctp_gensio_accepter(const char *str, const char * const args[],
+ #else
+ 
+ int
+-sctp_gensio_alloc(struct gensio_addr *iai, const char * const args[],
++sctp_gensio_alloc(const struct gensio_addr *iai, const char * const args[],
+ 		  struct gensio_os_funcs *o,
+ 		  gensio_event cb, void *user_data,
+ 		  struct gensio **new_gensio)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/gensio/gensio_2.1.4.bb b/meta-oe/recipes-connectivity/gensio/gensio_2.2.0.bb
similarity index 85%
rename from meta-oe/recipes-connectivity/gensio/gensio_2.1.4.bb
rename to meta-oe/recipes-connectivity/gensio/gensio_2.2.0.bb
index 9d73da90d..424e176ca 100644
--- a/meta-oe/recipes-connectivity/gensio/gensio_2.1.4.bb
+++ b/meta-oe/recipes-connectivity/gensio/gensio_2.2.0.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a0fd36908af843bcee10cb6dfc47fa67 \
                     file://COPYING;md5=bae3019b4c6dc4138c217864bd04331f \
                     "
 
-SRCREV = "998a017076a86179696a3ad811e2bae9155e46cb"
+SRCREV = "4ec19138aa968dea34e4bc4e022c1ad7ed4c43c0"
 
 SRC_URI = "git://github.com/cminyard/gensio;protocol=https \
-           "
+           file://0001-Modify-parameter-of-function-sctp_gensio_alloc.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1



