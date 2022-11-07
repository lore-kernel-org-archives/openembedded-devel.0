Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C784C4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:32:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.1236.1667809915437078980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:31:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XfZtjFFC;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809913; i=@fujitsu.com;
	bh=WtgufT6w4QNMG3Z+eOQVEjOgoQ0zSYPFy27vOFJO9u4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XfZtjFFCOMVHQgRd6Q4qj5C8qnO1I8yZeKQ8CoxdNQMa8TfyRSUvf+ELiyeq98Dkd
	 rTXH5u2HT6RSTw5wkxNlSDvuWt7TpdAB2921k9v49h8/vAkX7ZI2XF/EtWU2FJwWyl
	 gmTnov3zebhum4DP/op33AOUsVtslrgdjybR2pbWCLot0wl4T6Rdyt0uSXBhdIF2Sj
	 y+BNDKDDrKcODjrGsW6keeN3rg5Z7QZmviG09vpkUosJMnwi7QJojzX5fd/TA2RpEk
	 L/S2GPCGf8+BzvKRzgP4jcGxirYStNi97DpgZ70YiKv7Ep6vQlJGTmyzOTd5xr4aQF
	 p9C8inOVLzdiQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRWlGSWpSXmKPExsViZ8OxWbfyUEa
  ywfxF3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bb30XMBRvFKt4//87SwPhfuIuRi0NI4CGj
  xNJbj1ggnMtMEs+PLoJydjNKXL3ZwNzFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAWuJI/u3gsVZgOLn//czgdi8Ak4SS45vAbMlBBQkpjx8D1bDKeAssXDRLkYQWwio5uXmd2
  wQ9YISJ2c+YYGYLyFx8MULZoheRYnZl5tZIOwKiVmz2qBmqklcPbeJeQKj4Cwk7bOQtC9gZFr
  FaFacWlSWWqRrrpdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yTopeX
  WrKJERi+KcUJP3cwblz2R+8QoyQHk5Io7+/lGclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhvb
  ATKCRalpqdWpGXmAGMJJi3BwaMkwhu2DyjNW1yQmFucmQ6ROsVozDHza9sBZo5N+7oOMAux5O
  XnpUqJ817bDVQqAFKaUZoHNwgW45cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMy7wGawpO
  ZVwK37xXQKUxAp1QXpIGcUpKIkJJqYCrQ2LvYSFOvesbEzE8Gq7jOGZxatPRMuN+rbm3Hq+l3
  i5WMV6oa2G9dulsjqM79hdRmeV7WKx1MNdtLec7Zp107ULNsf1h5i8QGyylXbecdVbYM+Nt21
  vNrSqEMS8X8Ca/sHX9qXzGw37RZs/9n7BTFXa6nXq07pn5U5Mfz2eET4oIt9b6EiK4ueD9pb+
  4Gwe1RRra5NzzNPzG2ugYJ7fy7hP2v4cWG92szDMMWOmw4yfBkp97Who7da0KL4k9tvD7xPBt
  DgM2T8GgxwchjFa8XTlxfce/GNXXNGunvC64wOwn9vC8T5PzPM22/b2Ck7A9WRdMUvzXrjpY8
  WL/22k5Vh+/PWh8qm/pdC97F+0eJpTgj0VCLuag4EQDblFq6bAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-728.messagelabs.com!1667809912!219094!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11753 invoked from network); 7 Nov 2022 08:31:53 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-10.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:31:53 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9D1D9152
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9111273
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:31:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] satyr: upgrade 0.39 -> 0.40
Date: Mon, 7 Nov 2022 16:31:29 +0800
Message-ID: <1667809891-30889-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
References: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99454

From: Wang Mingyu <wangmy@fujitsu.com>

0001-py_base_stacktrace.c-include-glib.h.patch
removed since it's included in 0.40

Changelog:
=========
py_base_stacktrace.c: include glib.h
Add support for fine-grained error location lines in Python tracebacks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-py_base_stacktrace.c-include-glib.h.patch | 29 -------------------
 .../satyr/{satyr_0.39.bb => satyr_0.40.bb}    |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch
 rename meta-oe/recipes-support/satyr/{satyr_0.39.bb => satyr_0.40.bb} (88%)

diff --git a/meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch b/meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch
deleted file mode 100644
index fe3b1c12d..000000000
--- a/meta-oe/recipes-support/satyr/files/0001-py_base_stacktrace.c-include-glib.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3b84fe4375292d00ebb605a5917e66129fe5f0cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 Aug 2022 23:26:46 -0700
-Subject: [PATCH] py_base_stacktrace.c: include glib.h
-
-This file has references to g_free from glib-2.0 which needs this header
-
-Upstream-Status: Submitted [https://github.com/abrt/satyr/pull/333]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- python/py_base_stacktrace.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/python/py_base_stacktrace.c b/python/py_base_stacktrace.c
-index b9bd16c..301db84 100644
---- a/python/py_base_stacktrace.c
-+++ b/python/py_base_stacktrace.c
-@@ -17,7 +17,7 @@
-     with this program; if not, write to the Free Software Foundation, Inc.,
-     51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
- */
--
-+#include <glib.h>
- #include "py_common.h"
- #include "py_base_thread.h"
- #include "py_base_stacktrace.h"
--- 
-2.37.2
-
diff --git a/meta-oe/recipes-support/satyr/satyr_0.39.bb b/meta-oe/recipes-support/satyr/satyr_0.40.bb
similarity index 88%
rename from meta-oe/recipes-support/satyr/satyr_0.39.bb
rename to meta-oe/recipes-support/satyr/satyr_0.40.bb
index be1ef3f79..5b44618b7 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.39.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.40.bb
@@ -9,9 +9,8 @@ inherit autotools-brokensep python3native pkgconfig
 
 SRC_URI = "git://github.com/abrt/satyr.git;branch=master;protocol=https \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
-           file://0001-py_base_stacktrace.c-include-glib.h.patch \
-"
-SRCREV = "f8a0dbfe7fcc6e44f03d66ca5c81363aea318380"
+           "
+SRCREV = "61addf12d15ef9d0bff5e3cc26e08d08a4f88094"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.25.1


