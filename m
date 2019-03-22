Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94D186D545
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 06:02:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2M62XOO028885
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Mar 2019 23:02:33 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 21 Mar 2019 23:02:31 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Fri, 22 Mar 2019 14:02:26 +0800
Message-ID: <1553234546-33675-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] iscsi-initiator-utils: Fix 32bit build issues with Werror=format-truncation
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
X-List-Received-Date: Fri, 22 Mar 2019 06:02:33 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Backport a patch to fix 32bit build issues with
string length overflow as below:
| idbm.c:679:27: error: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 8 [-Werror=format-truncation=]
|   snprintf(passwd_len, 8, "%d", (int)strlen(value)); \

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...-build-issues-with-string-length-overflow.patch | 115 +++++++++++++++++++++
 .../iscsi-initiator-utils_2.0.876.bb               |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch
new file mode 100644
index 0000000..f945c63
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Fix-i586-build-issues-with-string-length-overflow.patch
@@ -0,0 +1,115 @@
+From 24ce8f62e042e69497e1299212504c356179e15b Mon Sep 17 00:00:00 2001
+From: Lee Duncan <lduncan@suse.com>
+Date: Tue, 6 Nov 2018 11:16:06 -0800
+Subject: [PATCH] Fix i586 build issues with string length overflow.
+
+Gcc7 warns of possible string print overflow, on i586,
+when printing password length (via a macro), generating
+errors like:
+
+[   59s]   ^~~~~~~~~~~~~~~~~~~~
+[   59s] In file included from /usr/include/stdio.h:862:0,
+[   59s]                  from idbm.h:27,
+[   59s]                  from context.h:22,
+[   59s]                  from idbm.c:59:
+[   59s] /usr/include/bits/stdio2.h:64:10: note:
+'__builtin___snprintf_chk' output between 2 and 11 bytes into a
+destination of size 8
+[   59s]    return __builtin___snprintf_chk (__s, __n,
+__USE_FORTIFY_LEVEL - 1,
+[   59s]           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+~~~~~~~~~~
+[   59s]         __bos (__s), __fmt, __va_arg_pack ());
+[   59s]         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+[   59s] cc1: all warnings being treated as errors
+[   59s] make[1]: *** [<builtin>: idbm.o] Error 1
+[   59s] make[1]: Leaving directory
+
+The fix is to limit the size of the string printed, so that no
+overflow is possible.
+
+The print macros in usr/idbm.c were updated, as well, to match
+the newer version in libopeniscsiusr/idbm.c, also to help the
+i586 build.
+
+Upstream-Status: Backport[https://github.com/open-iscsi/open-iscsi/commit/24ce8f62e042e69497e1299212504c356179e15b]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ libopeniscsiusr/idbm.c |  2 +-
+ usr/idbm.c             | 11 ++++++-----
+ 2 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/libopeniscsiusr/idbm.c b/libopeniscsiusr/idbm.c
+index 7724de2..055dd9a 100644
+--- a/libopeniscsiusr/idbm.c
++++ b/libopeniscsiusr/idbm.c
+@@ -676,7 +676,7 @@ updated:
+ 	if (!passwd_done && !strcmp(#_param, name)) { \
+ 		passwd_done = 1; \
+ 		name = #_param "_length"; \
+-		snprintf(passwd_len, 8, "%d", (int)strlen(value)); \
++		snprintf(passwd_len, 8, "%.7d", (int)strlen(value) & 0xffff); \
+ 		value = passwd_len; \
+ 		goto setup_passwd_len; \
+ 	}
+diff --git a/usr/idbm.c b/usr/idbm.c
+index a0207e2..89a6c27 100644
+--- a/usr/idbm.c
++++ b/usr/idbm.c
+@@ -30,6 +30,7 @@
+ #include <fcntl.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
++#include <inttypes.h>
+ 
+ #include "idbm.h"
+ #include "idbm_fields.h"
+@@ -65,7 +66,7 @@ static struct idbm *db;
+ #define __recinfo_int(_key, _info, _rec, _name, _show, _n, _mod) do { \
+ 	_info[_n].type = TYPE_INT; \
+ 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
+-	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
++	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIi32, _rec->_name); \
+ 	_info[_n].data = &_rec->_name; \
+ 	_info[_n].data_len = sizeof(_rec->_name); \
+ 	_info[_n].visible = _show; \
+@@ -76,7 +77,7 @@ static struct idbm *db;
+ #define __recinfo_uint8(_key, _info, _rec, _name, _show, _n, _mod) do { \
+ 	_info[_n].type = TYPE_UINT8; \
+ 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
+-	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
++	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIu8, _rec->_name); \
+ 	_info[_n].data = &_rec->_name; \
+ 	_info[_n].data_len = sizeof(_rec->_name); \
+ 	_info[_n].visible = _show; \
+@@ -87,7 +88,7 @@ static struct idbm *db;
+ #define __recinfo_uint16(_key, _info, _rec, _name, _show, _n, _mod) do { \
+ 	_info[_n].type = TYPE_UINT16; \
+ 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
+-	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
++	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIu16, _rec->_name); \
+ 	_info[_n].data = &_rec->_name; \
+ 	_info[_n].data_len = sizeof(_rec->_name); \
+ 	_info[_n].visible = _show; \
+@@ -98,7 +99,7 @@ static struct idbm *db;
+ #define __recinfo_uint32(_key, _info, _rec, _name, _show, _n, _mod) do { \
+ 	_info[_n].type = TYPE_UINT32; \
+ 	strlcpy(_info[_n].name, _key, NAME_MAXVAL); \
+-	snprintf(_info[_n].value, VALUE_MAXVAL, "%d", _rec->_name); \
++	snprintf(_info[_n].value, VALUE_MAXVAL, "%" PRIu32, _rec->_name); \
+ 	_info[_n].data = &_rec->_name; \
+ 	_info[_n].data_len = sizeof(_rec->_name); \
+ 	_info[_n].visible = _show; \
+@@ -1041,7 +1042,7 @@ updated:
+ 	if (!passwd_done && !strcmp(#_param, name)) { \
+ 		passwd_done = 1; \
+ 		name = #_param "_length"; \
+-		snprintf(passwd_len, 8, "%d", (int)strlen(value)); \
++		snprintf(passwd_len, 8, "%.7" PRIi32, (int)strlen(value) & 0xffff); \
+ 		value = passwd_len; \
+ 		goto setup_passwd_len; \
+ 	}
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
index e6a87a3..48b0783 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.876.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SRCREV ?= "bd79e4ed1004a6035d2538a308c5930890421a22"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi \
+           file://0001-Fix-i586-build-issues-with-string-length-overflow.patch \
            file://initd.debian \
            file://99_iscsi-initiator-utils \
            file://iscsi-initiator \
-- 
2.7.4


