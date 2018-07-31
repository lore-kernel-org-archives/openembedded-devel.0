Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C982E78D81
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2018 01:40:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6V1efjK022491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 30 Jul 2018 18:40:41 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 30 Jul 2018 18:40:28 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Mon, 30 Jul 2018 18:40:28 -0700
Message-ID: <20180731014028.37580-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <5B5E6B70.9090307@windriver.com>
References: <5B5E6B70.9090307@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] librelp: Upgrade to 1.2.16
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
X-List-Received-Date: Tue, 31 Jul 2018 01:40:40 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add 0001-src-tcp.c-fix-jump-misses-init-error.patch
  to fix -Werror=jump-misses-init error
* Add 0001-src-tcp.c-increase-the-size-of-szHname.patch
  to fix -Werror=format-truncation error when
  security_flags turned on

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...src-tcp.c-fix-jump-misses-init-error.patch | 71 +++++++++++++++++++
 ...c-tcp.c-increase-the-size-of-szHname.patch | 53 ++++++++++++++
 .../{librelp_1.2.14.bb => librelp_1.2.16.bb}  |  7 +-
 3 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-fix-jump-misses-init-error.patch
 create mode 100644 meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.2.14.bb => librelp_1.2.16.bb} (52%)

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
diff --git a/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch
new file mode 100644
index 000000000..5a62e1584
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/librelp/0001-src-tcp.c-increase-the-size-of-szHname.patch
@@ -0,0 +1,53 @@
+From d8950ad273d79ec516468289adbd427e681dbc66 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 30 Jul 2018 01:22:56 -0700
+Subject: [PATCH] src/tcp.c: increase the size of szHname
+
+Increase the size of szHname to fix below
+error:
+| ../../git/src/tcp.c: In function 'relpTcpSetRemHost':
+| ../../git/src/tcp.c:352:57: error: '%s' directive output may be truncated writing up to 1024 bytes into a region of size 1011 [-Werror=format-truncation=]
+|      snprintf((char*)szHname, NI_MAXHOST, "[MALICIOUS:IP=%s]", szIP);
+|                                                          ^~    ~~~~
+| In file included from /poky-build/tmp/work/i586-poky-linux/librelp/1.2.16-r0/recipe-sysroot/usr/include/stdio.h:862,
+|                  from ../../git/src/tcp.c:38:
+| /poky-build/tmp/work/i586-poky-linux/librelp/1.2.16-r0/recipe-sysroot/usr/include/bits/stdio2.h:64:10: note: '__builtin___snprintf_chk' output between 16 and 1040 bytes into a destination of size 1025
+|    return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
+|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|         __bos (__s), __fmt, __va_arg_pack ());
+|         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| cc1: all warnings being treated as errors
+| Makefile:536: recipe for target 'librelp_la-tcp.lo' failed
+
+Upstream-Status: Submitted[https://github.com/rsyslog/librelp/pull/118]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/tcp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tcp.c b/src/tcp.c
+index fb34dc7..2c38b0b 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -319,7 +319,7 @@ relpTcpSetRemHost(relpTcp_t *const pThis, struct sockaddr *pAddr)
+ 	relpEngine_t *pEngine;
+ 	int error;
+ 	unsigned char szIP[NI_MAXHOST] = "";
+-	unsigned char szHname[NI_MAXHOST] = "";
++	unsigned char szHname[1045] = "";
+ 	struct addrinfo hints, *res;
+ 	size_t len;
+ 	
+@@ -349,7 +349,7 @@ relpTcpSetRemHost(relpTcp_t *const pThis, struct sockaddr *pAddr)
+ 			if(getaddrinfo((char*)szHname, NULL, &hints, &res) == 0) {
+ 				freeaddrinfo (res);
+ 				/* OK, we know we have evil, so let's indicate this to our caller */
+-				snprintf((char*)szHname, NI_MAXHOST, "[MALICIOUS:IP=%s]", szIP);
++				snprintf((char*)szHname, sizeof(szHname), "[MALICIOUS:IP=%s]", szIP);
+ 				pEngine->dbgprint("Malicious PTR record, IP = \"%s\" HOST = \"%s\"", szIP, szHname);
+ 				iRet = RELP_RET_MALICIOUS_HNAME;
+ 			}
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
similarity index 52%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
index 28047eb54..17478efe4 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.2.14.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.2.16.bb
@@ -6,9 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 
 DEPENDS = "gmp nettle libidn zlib gnutls"
 
-SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https"
+SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https \
+           file://0001-src-tcp.c-fix-jump-misses-init-error.patch \
+           file://0001-src-tcp.c-increase-the-size-of-szHname.patch \
+"
 
-SRCREV = "fc512e337bfc7c92770246dbff5f482b879498b9"
+SRCREV = "5e849ff060be0c7dce972e194c54fdacfee0adc2"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


