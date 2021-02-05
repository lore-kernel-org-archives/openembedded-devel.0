Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.5296.1612511697242613173
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 1157shfA012141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Feb 2021 23:54:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 4 Feb 2021 23:54:41 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 4 Feb 2021 23:54:41 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH V2] lksctp-tools: make conpatible to autoconf-2.70
Date: Thu, 4 Feb 2021 23:54:41 -0800
Message-ID: <20210205075441.92817-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

...
./configure: line 16398: syntax error: unexpected end of file
...

Backport a commit from upstream to fix it

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ....m4-make-conpatible-to-autoconf-2.70.patch | 89 +++++++++++++++++++
 .../lksctp-tools/lksctp-tools_1.0.18.bb       |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch

diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
new file mode 100644
index 000000000..484af4e0f
--- /dev/null
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools/0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch
@@ -0,0 +1,89 @@
+From d6d7130f0a2e3b81880fca29966e42c1b2be40a7 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyfox@gentoo.org>
+Date: Fri, 8 Jan 2021 22:22:52 +0000
+Subject: [PATCH] m4/sctp.m4: make conpatible to autoconf-2.70
+
+On recently released `autoconf-2.70` generated `./configure`
+fails as:
+
+```
+$ ./configure
+...
+checking for struct sctp_event_subscribe.sctp_stream_reset_event... yes
+checking for gcc options needed to detect all undeclared functions... none needed
+./configure: line 16464: syntax error: unexpected end of file
+```
+
+This happens becuase new autoconf generates less whitespace:
+
+```
+{
+if ...
+...
+fi}
+```
+
+It requires at least whitespace between `fi` and `}`.
+
+As input already has newlines the change just drops extra `{}`.
+
+Tested on `autoconf-2.69` and `autoconf-2.70`.
+
+Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
+Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+
+Upstream-Status: Backport [git://github.com/sctp/lksctp-tools.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ m4/sctp.m4 | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/m4/sctp.m4 b/m4/sctp.m4
+index 6593517..94527a6 100644
+--- a/m4/sctp.m4
++++ b/m4/sctp.m4
+@@ -6,7 +6,7 @@
+ 
+ # Macros to assist on probing kernel features
+ #   Probes if a type is defined
+-AC_DEFUN([LKSCTP_CHECK_TYPE], [{
++AC_DEFUN([LKSCTP_CHECK_TYPE], [
+ AC_CHECK_TYPE([$1],
+ 	AC_DEFINE([$2], 1,
+ 		  [Define if $1 is present.])
+@@ -22,10 +22,10 @@ AC_CHECK_TYPE([$1],
+ #ifdef HAVE_LINUX_SCTP_H
+ # include <linux/sctp.h>
+ #endif
+-])}])
++])])
+ 
+ #   Probes if a struct has a given member
+-AC_DEFUN([LKSCTP_CHECK_MEMBER], [{
++AC_DEFUN([LKSCTP_CHECK_MEMBER], [
+ AC_CHECK_MEMBER([$1],
+ 	AC_DEFINE([$2], 1,
+ 		  [Define if $1 is present.])
+@@ -41,10 +41,10 @@ AC_CHECK_MEMBER([$1],
+ #ifdef HAVE_LINUX_SCTP_H
+ # include <linux/sctp.h>
+ #endif
+-])}])
++])])
+ 
+ #   Probes if a declaration is present
+-AC_DEFUN([LKSCTP_CHECK_DECL], [{
++AC_DEFUN([LKSCTP_CHECK_DECL], [
+ AC_CHECK_DECL([$1],
+ 	AC_DEFINE([$2], 1,
+ 		  [Define if $1 is present.])
+@@ -60,4 +60,4 @@ AC_CHECK_DECL([$1],
+ #ifdef HAVE_LINUX_SCTP_H
+ # include <linux/sctp.h>
+ #endif
+-])}])
++])])
+-- 
+2.27.0
+
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
index 1e2c644b4..f481ffee1 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.18.bb
@@ -15,6 +15,7 @@ LK_REL = "1.0.18"
 
 SRC_URI = " \
     git://github.com/sctp/lksctp-tools.git \
+    file://0001-m4-sctp.m4-make-conpatible-to-autoconf-2.70.patch \
     file://run-ptest \
     file://v4test.sh \
     file://v6test.sh \
-- 
2.29.2

