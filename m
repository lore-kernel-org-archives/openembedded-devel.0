Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 556F9755A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 09:38:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6O9cthp020959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:38:55 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 24 Jul 2018 02:38:54 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jul 2018 02:38:54 -0700
Message-ID: <20180724093854.17201-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] librelp: Upgrade to 1.2.16
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
X-List-Received-Date: Tue, 24 Jul 2018 09:38:55 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Add 0001-src-tcp.c-fix-jump-misses-init-error.patch
to fix -Werror=jump-misses-init error

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...src-tcp.c-fix-jump-misses-init-error.patch | 71 +++++++++++++++++++
 .../{librelp_1.2.14.bb => librelp_1.2.16.bb}  |  6 +-
 2 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.14.bb => librelp_1.2.16.bb} (59%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
new file mode 100644
index 000000000..68b686346
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
@@ -0,0 +1,71 @@
+From 3e5a0cb440c788e2383e40ab23ac1cf01d96961b Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Tue, 24 Jul 2018 01:30:25 -0700
+Subject: [PATCH] src/tcp.c: fix jump-misses-init error
+
+Fix below jump-misses-init error
+
+| In file included from ../../git/src/tcp.c:51:
+| ../../git/src/tcp.c: In function 'relpTcpConnect':
+| ../../git/src/relp.h:220:3: error: jump skips variable initialization [-Werror=jump-misses-init]
+|    goto finalize_it;  \
+|    ^~~~
+| ../../git/src/tcp.c:1951:3: note: in expansion of macro 'ABORT_FINALIZE'
+|    ABORT_FINALIZE(RELP_RET_IO_ERR);
+|    ^~~~~~~~~~~~~~
+| ../../git/src/tcp.c:2005:1: note: label 'finalize_it' defined here
+|  finalize_it:
+|  ^~~~~~~~~~~
+| ../../git/src/tcp.c:1991:6: note: 'r' declared here
+|   int r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
+|       ^
+| In file included from ../../git/src/tcp.c:51:
+| ../../git/src/relp.h:220:3: error: jump skips variable initialization [-Werror=jump-misses-init]
+|    goto finalize_it;  \
+|    ^~~~
+| ../../git/src/tcp.c:1951:3: note: in expansion of macro 'ABORT_FINALIZE'
+|    ABORT_FINALIZE(RELP_RET_IO_ERR);
+|    ^~~~~~~~~~~~~~
+| ../../git/src/tcp.c:2005:1: note: label 'finalize_it' defined here
+|  finalize_it:
+|  ^~~~~~~~~~~
+| ../../git/src/tcp.c:1989:12: note: 'len' declared here
+|   socklen_t len = sizeof so_error;
+|             ^~~
+
+Upstream-Status: Submitted[https://github.com/rsyslog/librelp/pull/117]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/tcp.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/tcp.c b/src/tcp.c
+index f35eb84..fb34dc7 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -1936,6 +1936,9 @@ relpTcpConnect(relpTcp_t *const pThis,
+ 	struct addrinfo hints;
+ 	struct addrinfo *reslocal = NULL;
+ 	struct pollfd pfd;
++	int so_error;
++	socklen_t len = sizeof so_error;
++	int r;
+ 
+ 	ENTER_RELPFUNC;
+ 	RELPOBJ_assert(pThis, Tcp);
+@@ -1985,10 +1988,8 @@ relpTcpConnect(relpTcp_t *const pThis,
+ 		ABORT_FINALIZE(RELP_RET_TIMED_OUT);
+ 	}
+ 
+-	int so_error;
+-	socklen_t len = sizeof so_error;
+ 
+-	int r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
++	r = getsockopt(pThis->sock, SOL_SOCKET, SO_ERROR, &so_error, &len);
+ 	if (r == -1 || so_error != 0) {
+ 		pThis->pEngine->dbgprint("socket has an error %d\n", so_error);
+ 		ABORT_FINALIZE(RELP_RET_IO_ERR);
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
similarity index 59%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
index 28047eb54..6c68f6040 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
@@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 
 DEPENDS = "gmp nettle libidn zlib gnutls"
 
-SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https"
+SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
+           file://0001-src-tcp.c-fix-jump-misses-init-error.patch \
+"
 
-SRCREV = "fc512e337bfc7c92770246dbff5f482b879498b9"
+SRCREV = "5e849ff060be0c7dce972e194c54fdacfee0adc2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


