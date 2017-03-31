Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0C077E51
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:26 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 81so18581805pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QUZkyQt7bg10jalvJI9jrSYyK20FNMrf+qZ2a1MN1g4=;
	b=n+zrqDAsS3xRgjpXs6+e35Rd2b+uO2VkmGDiDDQ18YoJvHaFT+9Ml71pL+lR515Tsf
	IJ/i8/zNPJVnJMo3URtxGhJrynWTP7PEMB2OcBnqqK20EnReRszZLTyN2dGkFhlpMeST
	YcOGW0fcODs+GMKdT5KAC2eb2D4VfWieC+ihtsuhkeeuhCe3hjqi99eIevMvwCfnXGy2
	cDPZhZUOR0OPZYemVCaLOisYJyGArdPdgr2RzcpKQCbCOC2ezJvC1nL7lPUzAoupeYd/
	diS1lcjEFK1Bq9TqPWyqNQtSc9FVydE92BmeEnSLVlOKjJjybRjD/sdd5P6zMbIECLuZ
	tpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QUZkyQt7bg10jalvJI9jrSYyK20FNMrf+qZ2a1MN1g4=;
	b=Cous3bVujcrfcsPw9vzMs2guw2Bwi2lcXNkOxSx4gdz5mj4uEnsTLllx8p6wR4gK+F
	amwTiOGTfk4/xNEk6A4T8h/eUciSom2PtTzwVC42+qazZozbyjI/E40OnhtlZ7RfeR+u
	eGcpioPL10yoiPpmRDWpOSfwyEIp+sbEWfgWt/jfQnTCQPt+YJfR2LMFDf1dEQGOnAq5
	2lRajMG2kTZWzi03nHMqK9Yvjp/77Q2ZqCu5gM1rOhASdh1QRDrDBfoNPFNBAW+f8Xy8
	V9Ik2Hlzr/s4yxyjUiPPXXUoJsyl2f6yaJ1yAH6ALGD9FdonfHE8kBngcni8W34+AzQA
	Al/Q==
X-Gm-Message-State: AFeK/H3FWW0HEJyExbrWkoLXQsfaRd+HSFbvV5/ufFqHC29jV7crdW3CSP39+okaMBIGNw==
X-Received: by 10.98.87.216 with SMTP id i85mr3812458pfj.151.1490978607160;
	Fri, 31 Mar 2017 09:43:27 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:26 -0700
Message-Id: <20170331164247.5052-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 22/43] openl2tp: Fix build with musl
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch  | 29 +++++++++++++++++
 .../0001-l2tp_api-Included-needed-headers.patch    | 34 ++++++++++++++++++++
 ...02-cli-include-fcntl.h-for-O_CREAT-define.patch | 25 +++++++++++++++
 .../openl2tp/0002-user-ipv6-structures.patch       | 33 ++++++++++++++++++++
 ...fine-_GNU_SOURCE-for-getting-sighandler_t.patch | 35 +++++++++++++++++++++
 ...linux-kernel-headers-assumptions-on-glibc.patch | 36 ++++++++++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     | 17 +++++++++-
 7 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch
new file mode 100644
index 000000000..d1ee3c591
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-Use-1-instead-of-WAIT_ANY.patch
@@ -0,0 +1,29 @@
+From 1f8d336a5cd88b87e15596d05980f6fe77a0f226 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 11:28:41 -0700
+Subject: [PATCH 1/4] Use -1 instead of WAIT_ANY
+
+WAIT_ANY is not supported by POSIX and some C libraries
+e.g. musl do not define this.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ usl/usl_pid.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/usl/usl_pid.c b/usl/usl_pid.c
+index 103458b..9819473 100644
+--- a/usl/usl_pid.c
++++ b/usl/usl_pid.c
+@@ -78,7 +78,7 @@ int usl_pid_reap_children(int waitfor)
+ 
+ 	/* Wait for processes in our process group. */
+ 
+-	while (((pid = waitpid(WAIT_ANY, &status, (waitfor ? 0: WNOHANG))) != -1) && (pid != 0)) {
++	while (((pid = waitpid(-1, &status, (waitfor ? 0: WNOHANG))) != -1) && (pid != 0)) {
+ 		have_callback = 0;
+ 		usl_list_for_each(walk, tmp, &usl_child_list) {
+ 			child = usl_list_entry(walk, struct usl_pid_child, list);
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch
new file mode 100644
index 000000000..c50f68e65
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api-Included-needed-headers.patch
@@ -0,0 +1,34 @@
+From 25dce20a75bc84ae9e4ec640590cef0c12750789 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 17:48:13 -0700
+Subject: [PATCH 1/2] l2tp_api: Included needed headers
+
+These are flagged by musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ l2tp_api.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/l2tp_api.c b/l2tp_api.c
+index d16f80e..9d6f60a 100644
+--- a/l2tp_api.c
++++ b/l2tp_api.c
+@@ -22,9 +22,12 @@
+  * Each module implements the required RPC xxx_1_svc() callbacks which
+  * are called directly by the RPC library.
+  */
+-
++#define _GNU_SOURCE
++#include <sys/types.h>
++#include <rpc/types.h>
++#include <rpc/xdr.h>
+ #include <rpc/pmap_clnt.h>
+-#include <net/ethernet.h>
++//#include <netinet/in.h>
+ 
+ #include "usl.h"
+ 
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch
new file mode 100644
index 000000000..9df32658a
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-cli-include-fcntl.h-for-O_CREAT-define.patch
@@ -0,0 +1,25 @@
+From 2d633f4c18ff3cb52234449fd86a0a63b55d669b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 11:31:55 -0700
+Subject: [PATCH 2/4] cli: include fcntl.h for O_CREAT define
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cli/cli_readline.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cli/cli_readline.c b/cli/cli_readline.c
+index 097ed6a..127136c 100644
+--- a/cli/cli_readline.c
++++ b/cli/cli_readline.c
+@@ -24,6 +24,7 @@
+ #include <sys/file.h>
+ #include <sys/stat.h>
+ #include <sys/errno.h>
++#include <fcntl.h>
+ #include <signal.h>
+ 
+ #include <readline/readline.h>
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
new file mode 100644
index 000000000..3f8bcaa48
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0002-user-ipv6-structures.patch
@@ -0,0 +1,33 @@
+From a41cbeee3cf660663a9baac80545050a8d960898 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 18:09:58 -0700
+Subject: [PATCH 2/2] user ipv6 structures
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ l2tp_api.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/l2tp_api.c b/l2tp_api.c
+index 9d6f60a..f0946fd 100644
+--- a/l2tp_api.c
++++ b/l2tp_api.c
+@@ -450,10 +450,12 @@ int l2tp_api_rpc_check_request(SVCXPRT *xprt)
+ 	 * non-loopback interface, reject the request.
+ 	 */
+ 	if ((!l2tp_opt_remote_rpc) &&
+-	    ((xprt->xp_raddr.sin_addr.s_addr != htonl(INADDR_LOOPBACK)) &&
+-	     (xprt->xp_raddr.sin_addr.s_addr != htonl(INADDR_ANY)))) {
++	    ((xprt->xp_raddr.sin6_addr.s6_addr != htonl(INADDR_LOOPBACK)) &&
++	     (xprt->xp_raddr.sin6_addr.s6_addr != htonl(INADDR_ANY)))) {
++		char straddr[INET6_ADDRSTRLEN];
++		inet_ntop(AF_INET6, &xprt->xp_raddr.sin6_addr, straddr, sizeof(straddr));
+ 		if (l2tp_opt_trace_flags & L2TP_DEBUG_API) {
+-			l2tp_log(LOG_ERR, "Rejecting RPC request from %s", inet_ntoa(xprt->xp_raddr.sin_addr));
++			l2tp_log(LOG_ERR, "Rejecting RPC request from %s", straddr);
+ 		}
+ 		svcerr_auth(xprt, AUTH_TOOWEAK);
+ 		return -EPERM;
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch
new file mode 100644
index 000000000..e05be1bbb
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch
@@ -0,0 +1,35 @@
+From 74fe72583472bcc3c89a52839cac2ebbad6c8a74 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 11:34:52 -0700
+Subject: [PATCH 3/4] cli: Define _GNU_SOURCE for getting sighandler_t
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cli/cli_readline.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cli/cli_readline.c b/cli/cli_readline.c
+index 127136c..931779b 100644
+--- a/cli/cli_readline.c
++++ b/cli/cli_readline.c
+@@ -17,7 +17,7 @@
+  *  Boston, MA 02110-1301 USA
+  *
+  *****************************************************************************/
+-
++#define _GNU_SOURCE
+ #include <stdio.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+@@ -634,7 +634,7 @@ static void cli_rl_uninstall_signal_handlers(void)
+ 
+ static int cli_rl_install_signal_handlers(void)
+ {
+-	__sighandler_t handler;
++	sighandler_t handler;
+ 
+ 	rl_catch_signals = 0;
+ 	rl_clear_signals();
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
new file mode 100644
index 000000000..0fcba6546
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch
@@ -0,0 +1,36 @@
+From ede4ae8e25f9fb746a6f4e076d0ef029938d2880 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 Mar 2017 11:46:56 -0700
+Subject: [PATCH 4/4] Adjust for linux-kernel headers assumptions on glibc
+
+Fixes build issues e.g.
+
+In file included from /mnt/a/build/tmp-musl/work/cortexa7hf-neon-vfpv4-oe-linux-musleabi/openl2tp/1.8-r0/recipe-sysroot/usr/include/linux/if_pppox.h:24:
+/mnt/a/build/tmp-musl/work/cortexa7hf-neon-vfpv4-oe-linux-musleabi/openl2tp/1.8-r0/recipe-sysroot/usr/include/linux/if.h:97:2: error: expected identifier
+        IFF_LOWER_UP                    = 1<<16, /* __volatile__ */
+        ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plugins/ppp_unix.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/plugins/ppp_unix.c b/plugins/ppp_unix.c
+index 869066f..5c1e44f 100644
+--- a/plugins/ppp_unix.c
++++ b/plugins/ppp_unix.c
+@@ -21,6 +21,11 @@
+  * Plugin to use the standard UNIX pppd
+  */
+ 
++/* hack to make sure kernel headers understand that libc (musl)
++ * does define IFF_LOWER_UP et al.
++ */
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
++
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/types.h>
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 67118d8d6..e1670b3ae 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -16,14 +16,28 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
            file://openl2tp-simplify-gcc-warning-hack.patch \
            file://Makefile-obey-LDFLAGS.patch \
            file://0001-test-pppd_dummy.c-Fix-return-value.patch \
+           file://0001-Use-1-instead-of-WAIT_ANY.patch \
+           file://0002-cli-include-fcntl.h-for-O_CREAT-define.patch \
+           file://0003-cli-Define-_GNU_SOURCE-for-getting-sighandler_t.patch \
+           file://0001-l2tp_api-Included-needed-headers.patch \
+           "
+
+SRC_URI_append_libc-musl = "\
+           file://0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch \
+           file://0002-user-ipv6-structures.patch \
            "
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
 
 inherit autotools-brokensep pkgconfig
 
+DEPENDS_append_libc-musl = " libtirpc"
+CPPFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc"
+LDFLAGS_append_libc-musl = " -ltirpc"
+
 PARALLEL_MAKE = ""
-EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-unused-but-set-variable"'
+EXTRA_OEMAKE = 'CFLAGS="${CFLAGS} -Wno-unused-but-set-variable" CPPFLAGS="${CPPFLAGS}" OPT_CFLAGS="${CFLAGS}"'
 
 do_compile_prepend() {
     sed -i -e "s:SYS_LIBDIR=.*:SYS_LIBDIR=${libdir}:g" \
@@ -34,5 +48,6 @@ do_compile_prepend() {
         -e 's:$(CROSS_COMPILE)nm:${NM}:g' \
         -e 's:$(CROSS_COMPILE)strip:${STRIP}:g' \
         -e 's:$(CROSS_COMPILE)install:install:g' \
+        -e 's:CPPFLAGS-y:CPPFLAGS:g' \
         ${S}/Makefile
 }
-- 
2.12.1


