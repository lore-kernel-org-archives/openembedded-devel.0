Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D193160234
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Sep 2018 08:55:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w838tedE004070
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Sep 2018 01:55:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Sep 2018 01:55:40 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Sep 2018 16:55:33 +0800
Message-ID: <1535964933-273206-2-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535964933-273206-1-git-send-email-mingli.yu@windriver.com>
References: <1535964933-273206-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2 2/2] freediameter: update the old sctp api check
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
X-List-Received-Date: Mon, 03 Sep 2018 08:55:39 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

The initial sctp api check for freediameter as below:
===
commit d3c5e991cb532ea09684d69fb4d0d58e9bc39a0c
Author: Sebastien Decugis <sdecugis@freediameter.net>
Date:   Mon Jun 3 12:05:37 2013 +0800

    Add some compliancy to RFC6458. Not tested however as Ubuntu does not support this yet

 [snip]
 +/* Use old draft-ietf-tsvwg-sctpsocket-17 API ? If not defined, RFC6458 API will be used */
 +/* #define OLD_SCTP_SOCKET_API */
 +
 +/* Automatically fallback to old API if some of the new symbols are not defined */
 +#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_RECVRCVINFO)) || (!defined(SCTP_SNDINFO)))
 +# define OLD_SCTP_SOCKET_API
 +#endif
===

SCTP_RECVRCVINFO is defined in <linux/sctp.h>,
but <linux/sctp.h> is't included in the source code
previouly. So defined(SCTP_RECVRCVINFO) can be 0
and it makes old sctp socket api definition in
effect as below:
 # define OLD_SCTP_SOCKET_API

After lksctp-tools upgrade to 1.0.18, there is below
commit introduced in lksctp-tools git:
===
commit 3c8bd0d26b64611c690f33f5802c734b0642c1d8
Author: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Date:   Tue Apr 17 20:17:14 2018 -0300

    sctp.h: make use kernel UAPI header

    and with that, remove tons of duplicated declarations. These were
    lagging behind the kernel header, which is always the most updated one,
    and as the library is intended to be run only on Linux, there is no
    reason that we cannot re-use what is in there.

    That said, this patch drops all duplicated declarations and includes
    linux/sctp.h to bring them into lksctp-tools.

    Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>

 [snip]
 #include <stdint.h>
 #include <linux/types.h>
 #include <sys/socket.h>
+#include <linux/sctp.h>
 [snip]
===

And above logic make defined(SCTP_RECVRCVINFO) to
be 1 and the old sctp socket api macro as below
won't be defined.
 # define OLD_SCTP_SOCKET_API

And it encouters below build error:
| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1262:9: error: 'SCTP_SEND_FAILED_EVENT' undeclared (first use in this function); did you mean 'SCTP_SEND_FAILED'?
    case SCTP_SEND_FAILED_EVENT:
         ^~~~~~~~~~~~~~~~~~~~~~
         SCTP_SEND_FAILED
| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1262:9: note: each undeclared identifier is reported only once for each function it appears in
| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1274:9: error: 'SCTP_NOTIFICATIONS_STOPPED_EVENT' undeclared (first use in this function); did you mean 'SCTP_AUTHENTICATION_EVENT'?
    case SCTP_NOTIFICATIONS_STOPPED_EVENT:

Update the old sctp socket api check to fix
the above build error.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...core-sctp.c-update-the-old-sctp-api-check.patch | 97 ++++++++++++++++++++++
 .../freediameter/freediameter_1.2.1.bb             |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch

diff --git a/meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch b/meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch
new file mode 100644
index 0000000..d5e242a
--- /dev/null
+++ b/meta-networking/recipes-protocols/freediameter/files/0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch
@@ -0,0 +1,97 @@
+From d527a0b7b63e43263384540b5525714484bb089f Mon Sep 17 00:00:00 2001
+From: Mingli Yu <Mingli.Yu@windriver.com>
+Date: Mon, 3 Sep 2018 14:40:56 +0800
+Subject: [PATCH] libfdcore/sctp.c: update the old sctp api check
+
+The initial sctp api check for freediameter as below:
+ ===
+ commit d3c5e991cb532ea09684d69fb4d0d58e9bc39a0c
+  Author: Sebastien Decugis <sdecugis@freediameter.net>
+  Date:   Mon Jun 3 12:05:37 2013 +0800
+    
+    Add some compliancy to RFC6458. Not tested however as Ubuntu does not support this yet
+    
+    [snip]
+    +/* Use old draft-ietf-tsvwg-sctpsocket-17 API ? If not defined, RFC6458 API will be used */
+    +/* #define OLD_SCTP_SOCKET_API */
+    +
+    +/* Automatically fallback to old API if some of the new symbols are not defined */
+    +#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_RECVRCVINFO)) || (!defined(SCTP_SNDINFO)))
+    +# define OLD_SCTP_SOCKET_API
+    +#endif
+ ===
+
+SCTP_RECVRCVINFO is defined in <linux/sctp.h>,
+but <linux/sctp.h> is't included in the source code
+previouly. So defined(SCTP_RECVRCVINFO) can be 0 
+and it make old sctp socket api definiton in effect 
+as below:
+ # define OLD_SCTP_SOCKET_API
+
+After lksctp-tools upgrade to 1.0.18, there is below
+commit introduced:
+===
+commit 3c8bd0d26b64611c690f33f5802c734b0642c1d8
+Author: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+Date:   Tue Apr 17 20:17:14 2018 -0300
+
+    sctp.h: make use kernel UAPI header
+
+    and with that, remove tons of duplicated declarations. These were
+    lagging behind the kernel header, which is always the most updated one,
+    and as the library is intended to be run only on Linux, there is no
+    reason that we cannot re-use what is in there.
+
+    That said, this patch drops all duplicated declarations and includes
+    linux/sctp.h to bring them into lksctp-tools.
+
+    Signed-off-by: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
+
+ [snip]
+ #include <stdint.h>
+ #include <linux/types.h>
+ #include <sys/socket.h>
++#include <linux/sctp.h>
+ [snip]
+===
+
+And above logic make defined(SCTP_RECVRCVINFO) to
+be 1 and the old sctp socket api macro as below
+won't be defined.
+ # define OLD_SCTP_SOCKET_API
+
+And it encouters below build error:
+| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1262:9: error: 'SCTP_SEND_FAILED_EVENT' undeclared (first use in this function); did you mean 'SCTP_SEND_FAILED'?
+    case SCTP_SEND_FAILED_EVENT:
+         ^~~~~~~~~~~~~~~~~~~~~~
+         SCTP_SEND_FAILED
+| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1262:9: note: each undeclared identifier is reported only once for each function it appears in
+| /build/freediameter/1.2.1-r0/freeDiameter-1.2.1/libfdcore/sctp.c:1274:9: error: 'SCTP_NOTIFICATIONS_STOPPED_EVENT' undeclared (first use in this function); did you mean 'SCTP_AUTHENTICATION_EVENT'?
+    case SCTP_NOTIFICATIONS_STOPPED_EVENT:
+
+Update the old sctp socket api check to fix
+the above build error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
+---
+ libfdcore/sctp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libfdcore/sctp.c b/libfdcore/sctp.c
+index c80a497..83440c7 100644
+--- a/libfdcore/sctp.c
++++ b/libfdcore/sctp.c
+@@ -48,7 +48,7 @@
+ /* #define OLD_SCTP_SOCKET_API */
+ 
+ /* Automatically fallback to old API if some of the new symbols are not defined */
+-#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_RECVRCVINFO)) || (!defined(SCTP_SNDINFO))) 
++#if (!defined(SCTP_CONNECTX_4_ARGS) || (!defined(SCTP_NOTIFICATIONS_STOPPED_EVENT)) || (!defined(SCTP_SNDINFO)))
+ # define OLD_SCTP_SOCKET_API
+ #endif
+ 
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
index 670d8b0..b8818fa 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.2.1.bb
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://freediameter.init \
     ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://install_test.patch file://run-ptest file://pass-ptest-env.patch', '', d)} \
     file://freeDiameter.conf \
+    file://0001-libfdcore-sctp.c-update-the-old-sctp-api-check.patch \
     "
 
 SRC_URI[md5sum] = "61b1062aa144b5f12eed514611e6d697"
-- 
2.7.4


