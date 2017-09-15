Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1679960745
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 22:58:33 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id i130so1997765pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 15:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=FNuIftGOYUsYDV3ZGYwLQ4YgfzY5uAkOj/MuMzVMq+s=;
	b=kRKq8a6ABl8OdDoV6TKhRFDIdNnXT0ofmnSwhDbbRx+94drIZ4mcI6K5hhRs1NhwoA
	Jr394UDWWhYkHDtIPaDk5fv8gBOEzDDJQMCBcSTQpOzr0RW2xy1zkMLuR91sFlRsvCx3
	i50yWSLb/mzFyYqbs/C0f6EiRcAGNWIhncovvL02Hyu5/bNNiCz4Mx1Cib66rKR9Gw8Q
	QbJaFMaax66GNwTjL5Sj55sAIBlzBQLXJg/RAfqAdH+XNrlzU4IetHwiPKRjlzH/m1mj
	+KRNPqEg6acjz2csd7Hsx+L9HZX4csJAgntw1gMeePhGeqLL0slFbI/NLneKrVGMhpw1
	IT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FNuIftGOYUsYDV3ZGYwLQ4YgfzY5uAkOj/MuMzVMq+s=;
	b=npI0Q1ySgW1TSu+WbZM454bDxuW4KAwL7Uwr9JGy1BnhrJPkX/yIF0QnmlAlUz3O/s
	KOjJONcHStdQ2PaywkyUBDYda95atNmPU7zC7Wm8rnxj+ChULvKDXgZCnXbFWxalXJ0F
	N4iexuMDK7/qdSklUxNDQkHfhHonFzzhZlX+2b+pUSqKVScSFWytU5t+iVYFzYUyajBC
	0JsMBDVuJFzccqLaQSqrZIeZqy7xK89TrYlzwJ/2msSJWu0REM60sIzKbQXDqstrl0FO
	9rw5vdVLM+QXhD3DbK13B7P88pod9haA8x7CLfqTEU0Fz2PvCmHqMRFBCGgFC1WC0YRI
	qAlA==
X-Gm-Message-State: AHPjjUhG9Hd0/5tr09AwfkbzIRwFNvx9nwVVE8XbGljGEMop1v2EwhEq
	DO7flhAVY7geAyFm
X-Google-Smtp-Source: AOwi7QAT8Hzv25riThT5fOjvPs2X185PIYrQO7qI4qwFtJ4vOiSHvrXFVCLcFYH1p9zqwLWlm0Mkew==
X-Received: by 10.99.3.22 with SMTP id 22mr12707402pgd.77.1505516315051;
	Fri, 15 Sep 2017 15:58:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	q73sm4477183pfl.147.2017.09.15.15.58.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Sep 2017 15:58:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:58:26 -0700
Message-Id: <20170915225827.12328-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-networking][PATCH 1/2] opensaf: Upgrade to 5.17.07
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
X-List-Received-Date: Fri, 15 Sep 2017 22:58:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opensaf/0001-Remove-unused-variables.patch     |  43 --------
 ..._dump.cc-Use-sys-wait.h-instead-of-wait.h.patch |  34 ++++++
 ...sing-header-limits.h-for-_POSIX_HOST_NAME.patch | 122 +++++++++++++++++++++
 .../{opensaf_5.2.0.bb => opensaf_5.17.07.bb}       |   7 +-
 4 files changed, 160 insertions(+), 46 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.2.0.bb => opensaf_5.17.07.bb} (89%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch
deleted file mode 100644
index 1c88b81cd..000000000
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Remove-unused-variables.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a441a75fbb8451268a8a57616c7158cddc1823aa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Apr 2017 12:40:19 -0700
-Subject: [PATCH] Remove unused variables
-
-Fixes build errors with gcc7 e.g.
-
-../opensaf-5.2.0/src/amf/amfd/imm.cc: In member function 'bool ImmObjCreate::immobj_update_required()':
-../opensaf-5.2.0/src/amf/amfd/imm.cc:2174:28: error: unused variable 'pos' [-Werror=unused-variable]
-     std::string::size_type pos;
-                            ^~~
-../opensaf-5.2.0/src/amf/amfd/imm.cc:2215:28: error: unused variable 'pos' [-Werror=unused-variable]
-     std::string::size_type pos;
-                            ^~~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/amf/amfd/imm.cc | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/amf/amfd/imm.cc b/src/amf/amfd/imm.cc
-index 7932364..4f47b65 100644
---- a/src/amf/amfd/imm.cc
-+++ b/src/amf/amfd/imm.cc
-@@ -2171,7 +2171,6 @@ bool ImmObjCreate::immobj_update_required() {
-   if (class_type == AVSV_SA_AMF_SI_ASSIGNMENT) {
-     std::string su_name;
-     std::string sisu_name;
--    std::string::size_type pos;
-     while ((attribute = attrValues_[i++]) != nullptr) {
-       if (!strcmp(attribute->attrName, "safSISU")) {
-         sisu_name = Amf::to_string(
-@@ -2212,7 +2211,6 @@ bool ImmObjCreate::immobj_update_required() {
-   } else if (class_type == AVSV_SA_AMF_CSI_ASSIGNMENT) {
-     std::string comp_name;
-     std::string csicomp_name;
--    std::string::size_type pos;
-     AVD_CSI *csi = nullptr;
-     AVD_COMP *comp = nullptr;
-     AVD_COMP_CSI_REL *compcsi = nullptr;
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
new file mode 100644
index 000000000..76c47c658
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
@@ -0,0 +1,34 @@
+From 508ea7c0d67243feb1684eaa83569cb687561d64 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Sep 2017 10:09:03 -0700
+Subject: [PATCH] immpbe_dump.cc: Use sys/wait.h instead of wait.h
+
+Fixes
+redirecting incorrect #include <wait.h> to <sys/wait.h>
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/imm/common/immpbe_dump.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/imm/common/immpbe_dump.cc b/src/imm/common/immpbe_dump.cc
+index 100222f37..33e47ce3c 100644
+--- a/src/imm/common/immpbe_dump.cc
++++ b/src/imm/common/immpbe_dump.cc
+@@ -26,12 +26,12 @@
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <time.h>
+-#include <wait.h>
+ #include <unistd.h>
+ #include <iostream>
+ #include <sstream>
+ #include <stdint.h>
+ #include <sys/stat.h>
++#include <sys/wait.h>
+ #include <libgen.h>
+ 
+ #include <saAis.h>
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
new file mode 100644
index 000000000..4a2a825f9
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
@@ -0,0 +1,122 @@
+From 6442b57a855e273aa5a3d93e8596783cea128073 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Sep 2017 09:39:40 -0700
+Subject: [PATCH] src: Add missing header limits.h for _POSIX_HOST_NAME_MAX
+
+Use _GNU_SOURCE instead of libc internal __USE_GNU
+Do not use the deprecated headers under include/sys
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/base/os_defs.h        | 5 +++--
+ src/mds/mds_dt_tcp.c      | 1 -
+ src/mds/mds_dt_tcp_disc.h | 2 +-
+ src/mds/mds_dt_tipc.c     | 1 -
+ src/mds/mds_dt_tipc.h     | 2 +-
+ src/mds/mds_dt_trans.c    | 1 -
+ src/ntf/ntfd/NtfLogger.cc | 2 +-
+ 7 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/src/base/os_defs.h b/src/base/os_defs.h
+index 50a9bf5fc..af6842863 100644
+--- a/src/base/os_defs.h
++++ b/src/base/os_defs.h
+@@ -47,17 +47,18 @@
+ #include <sys/stat.h>
+ #include <sys/msg.h> /* Added for message-queues : PM : 28/10/03 */
+ #include <syslog.h>
+-#ifndef __USE_GNU
++#include <limits.h>
++#ifndef _GNU_SOURCE
+ struct msgbuf {
+   long int mtype;
+   char mtext[1];
+ };
+ #endif /* else defined in <sys/msg.h> */
+ #include <sys/time.h>
+-#include <sys/fcntl.h>
+ #include <sys/socket.h>
+ #include <netinet/in.h>
+ 
++#include <fcntl.h>
+ #include <signal.h>
+ #include <pthread.h>
+ 
+diff --git a/src/mds/mds_dt_tcp.c b/src/mds/mds_dt_tcp.c
+index 1407eb1ab..a87c22faa 100644
+--- a/src/mds/mds_dt_tcp.c
++++ b/src/mds/mds_dt_tcp.c
+@@ -27,7 +27,6 @@
+ 
+ #include <stdlib.h>
+ #include <sched.h>
+-#include <sys/poll.h>
+ #include <poll.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+diff --git a/src/mds/mds_dt_tcp_disc.h b/src/mds/mds_dt_tcp_disc.h
+index a6249d73e..574f52681 100644
+--- a/src/mds/mds_dt_tcp_disc.h
++++ b/src/mds/mds_dt_tcp_disc.h
+@@ -24,7 +24,7 @@
+ #include "base/ncssysf_tsk.h"
+ #include "base/ncssysf_mem.h"
+ #include "mds_dt_tcp_disc.h"
+-#include "sys/poll.h"
++#include <poll.h>
+ 
+ /*  mds_indentifire + mds_version   + msg_type + scope_type + server_type +
+    server_instance_lower + server_instance_upper + sub_ref_val + sub_ref_val  +
+diff --git a/src/mds/mds_dt_tipc.c b/src/mds/mds_dt_tipc.c
+index 37745e7f0..9b3255567 100644
+--- a/src/mds/mds_dt_tipc.c
++++ b/src/mds/mds_dt_tipc.c
+@@ -35,7 +35,6 @@
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <sched.h>
+-#include <sys/poll.h>
+ #include <poll.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+diff --git a/src/mds/mds_dt_tipc.h b/src/mds/mds_dt_tipc.h
+index e73a11b09..401d208c2 100644
+--- a/src/mds/mds_dt_tipc.h
++++ b/src/mds/mds_dt_tipc.h
+@@ -32,7 +32,7 @@
+ #include <assert.h>
+ #include <string.h>
+ #include <sys/param.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <netdb.h>
+ #include <errno.h>
+ #include <fcntl.h>
+diff --git a/src/mds/mds_dt_trans.c b/src/mds/mds_dt_trans.c
+index 6f621e04e..5aacbd33e 100644
+--- a/src/mds/mds_dt_trans.c
++++ b/src/mds/mds_dt_trans.c
+@@ -26,7 +26,6 @@
+ #include "mds_core.h"
+ #include "base/osaf_utility.h"
+ 
+-#include <sys/poll.h>
+ #include <poll.h>
+ 
+ #define MDS_PROT_TCP 0xA0
+diff --git a/src/ntf/ntfd/NtfLogger.cc b/src/ntf/ntfd/NtfLogger.cc
+index 84014b578..31b1ccc6c 100644
+--- a/src/ntf/ntfd/NtfLogger.cc
++++ b/src/ntf/ntfd/NtfLogger.cc
+@@ -20,7 +20,7 @@
+  *   INCLUDE FILES
+  * ========================================================================
+  */
+-#include <sys/poll.h>
++#include <poll.h>
+ 
+ #include "base/osaf_utility.h"
+ #include <saAis.h>
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb
similarity index 89%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb
index be79ba8cb..74483d778 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.2.0.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.17.07.bb
@@ -22,10 +22,11 @@ SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-configure-Pass-linker-specific-options-with-Wl.patch \
            file://0001-configure-Disable-format-overflow-if-supported-by-gc.patch \
-           file://0001-Remove-unused-variables.patch \
+           file://0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch \
+           file://0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch \
 "
-SRC_URI[md5sum] = "08991fd467ae9dcea3c8747be8e3981e"
-SRC_URI[sha256sum] = "903478244afe37e329be93050f1d48fa18c84ea17862134c4217b920e267a04a"
+SRC_URI[md5sum] = "125bcd9aabd7412aedcbfbf73f4e6196"
+SRC_URI[sha256sum] = "3fb2239bb2c9328c8b45368ff8d8de979ea286a27edc9871d218200e88bb91cc"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.14.1


