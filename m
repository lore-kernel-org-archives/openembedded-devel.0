Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5173F60601
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 15:16:26 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id p10so19598356wes.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oCOaIuDb6/siwNEHibHKRioOo5/DxhSGiIwmcSi5OOg=;
	b=tPCl2a837NKsnsJkculeHwBhrVvsiXtbqaZsliUhMDSUFYJGxPheYgiyPm1kPUe+LP
	91Lu7BTfcEdgaxClAKILle9cu6pD3v40I1IqI2lo3GMp+Nva1uOtz27PnqeiHkvi0mxl
	dSKWDkCcqhlDCYbFl43OmJO7meWmBX9DNU4tN1/ZFGaqyAGw7y0MGsvcZwAhX60utWq3
	5+fDGiPIKSTNXU2z/Vr4cv2l53KmgWj85ox6ZYvK8iAR3A0fzCrilh8tnkRgF2/j0ovh
	yXHc0Jy65lMxuegZI+g8qdIGAA36eP9APe9ZR6+Nx2G3NYCyeKJqoac/YEW/0R75kPOL
	Sr7Q==
X-Received: by 10.180.76.144 with SMTP id k16mr30742110wiw.3.1421075786995;
	Mon, 12 Jan 2015 07:16:26 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f1sm21982716wjw.30.2015.01.12.07.16.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Jan 2015 07:16:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jan 2015 16:16:25 +0100
Message-Id: <1421075785-31199-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
Subject: [meta-oe][PATCH] rsyslog: fix build with json-0.12
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Jan 2015 15:16:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../rsyslog/rsyslog/json-0.12-fix.patch            | 45 ++++++++++++++++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
new file mode 100644
index 0000000..7390a7f
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/json-0.12-fix.patch
@@ -0,0 +1,45 @@
+json-c-0.12 unlike 0.11 doesn't install json -> json-c symlink in include
+
+* Resolved in Version 7.6.4 [v7.6-stable] 2014-09-12
+  https://github.com/rsyslog/rsyslog/blob/v7-stable/ChangeLog
+* permits to build against json-c 0.12
+  Unfortunately, json-c had an ABI breakage, so this is necessary. Note
+  that versions prior to 0.12 had security issues (CVE-2013-6370,
+  CVE-2013-6371) and so it is desirable to link against the new version.
+  Thanks to Thomas D. for the patch. Note that at least some distros
+  have fixed the security issue in older versions of json-c, so this
+  seems to apply mostly when building from sources.
+
+Upstream-Status: Backport
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+diff -uNr rsyslog-7.4.4.orig/plugins/ommongodb/ommongodb.c rsyslog-7.4.4/plugins/ommongodb/ommongodb.c
+--- rsyslog-7.4.4.orig/plugins/ommongodb/ommongodb.c	2013-09-03 11:54:20.000000000 +0200
++++ rsyslog-7.4.4/plugins/ommongodb/ommongodb.c	2015-01-12 16:11:51.542591825 +0100
+@@ -33,9 +33,9 @@
+ #include <stdint.h>
+ #include <time.h>
+ #include <mongo.h>
+-#include <json.h>
++#include <json-c/json.h>
+ /* For struct json_object_iter, should not be necessary in future versions */
+-#include <json/json_object_private.h>
++#include <json-c/json_object_private.h>
+ 
+ #include "rsyslog.h"
+ #include "conf.h"
+diff -uNr rsyslog-7.4.4.orig/runtime/msg.c rsyslog-7.4.4/runtime/msg.c
+--- rsyslog-7.4.4.orig/runtime/msg.c	2013-09-03 12:31:42.000000000 +0200
++++ rsyslog-7.4.4/runtime/msg.c	2015-01-12 16:12:00.403592142 +0100
+@@ -41,9 +41,9 @@
+ #endif
+ #include <netdb.h>
+ #include <libestr.h>
+-#include <json.h>
++#include <json-c/json.h>
+ /* For struct json_object_iter, should not be necessary in future versions */
+-#include <json/json_object_private.h>
++#include <json-c/json_object_private.h>
+ #if HAVE_MALLOC_H
+ #  include <malloc.h>
+ #endif
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index aeca09a..a9d9464 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            file://rsyslog-fix-ptest-not-finish.patch \
            file://rsyslog-use-serial-tests-config-needed-by-ptest.patch \
+           file://json-0.12-fix.patch \
 "
 
 SRC_URI[md5sum] = "ebcc010a6205c28eb505c0fe862f32c6"
-- 
2.2.1


