Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F20FA0C48
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 07:19:17 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13243.1776237547868116234
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 00:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CEvf9bps;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776237548; x=1807773548;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XNlK4ZtNihokQ6kRAwiGB3xzjkh2DMWcdsueRVxSDN8=;
  b=CEvf9bpspMzcYtj8dENwT9wcoFmjI95A3b7KaTKEcpSvjA0vYeiQyRRN
   1i1oBqLdQyfiRUbnVOKyGvHIppcw0LEKDOxOSGWvhUWzFr+7VC9Dkhifq
   ZAaNg723z/GgdtGzC2gIKFyAro5dWR7gP/EhspUl409Mhop3do8h5Ky8R
   W5Y+NEZYHmTDX0SjuDNCvaY4b+PRsiEJmC2amMfFLdolJJRhry9P0Djll
   /RWbg+O1fpy0lAlkmwfOwXvIkLvqIqw+xVG7xOOhueFHm4uGje2aIatEZ
   xccd3HVOKp6IyelnMjIYZ/XLrYTuJm73L3OPQiMnNNpwMlqZL6tw3GdHu
   g==;
X-CSE-ConnectionGUID: r+HH+e0xSAWIOHoAY4acGw==
X-CSE-MsgGUID: YzLk+dQYS4CQW8eFCyrRRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="241455392"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="241455392"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 16:19:06 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1A3041002B85
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:06 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BE5E81400359
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:05 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 6E82F18005D3
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:03 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH] onboard: upgrade 1.4.3-9 -> 1.4.4-1
Date: Wed, 15 Apr 2026 15:18:55 +0800
Message-ID: <20260415071900.6767-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
References: <20260415071900.6767-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 07:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126345

1.ChangeLog
  https://github.com/onboard-osk/onboard/releases/tag/1.4.4-1

2.Remove 0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch as error has been solved in 1.4.4-1.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ine-error-API-if-platform-does-not-h.patch | 69 -------------------
 ...{onboard_1.4.3-9.bb => onboard_1.4.4-1.bb} |  5 +-
 2 files changed, 2 insertions(+), 72 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
 rename meta-gnome/recipes-support/onboard/{onboard_1.4.3-9.bb => onboard_1.4.4-1.bb} (89%)

diff --git a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch b/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
deleted file mode 100644
index 9fb2cd6814..0000000000
--- a/meta-gnome/recipes-support/onboard/onboard/0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 71804c06c7179333f44b57e04ba268f37fe54f62 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jul 2017 09:01:04 -0700
-Subject: [PATCH] pypredict/lm: Define error API if platform does not have it
-
-error() API is not implemented across all libcs on linux
-e.g. musl does not provide it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Onboard/pypredict/lm/lm.cpp         |  1 -
- Onboard/pypredict/lm/lm.h           | 13 +++++++++++++
- Onboard/pypredict/lm/lm_dynamic.cpp |  2 --
- 3 files changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/Onboard/pypredict/lm/lm.cpp b/Onboard/pypredict/lm/lm.cpp
-index 2e642965..37ae241e 100644
---- a/Onboard/pypredict/lm/lm.cpp
-+++ b/Onboard/pypredict/lm/lm.cpp
-@@ -19,7 +19,6 @@
- 
- #include <stdlib.h>
- #include <stdio.h>
--#include <error.h>
- #include <algorithm>
- #include <cmath>
- #include <string>
-diff --git a/Onboard/pypredict/lm/lm.h b/Onboard/pypredict/lm/lm.h
-index ed4164a4..b8b63ee8 100644
---- a/Onboard/pypredict/lm/lm.h
-+++ b/Onboard/pypredict/lm/lm.h
-@@ -32,6 +32,19 @@
- #include <algorithm>
- #include <string>
- 
-+#if defined(HAVE_ERROR_H)
-+#include <error.h>
-+#else
-+#include <err.h>
-+#define _onboard_error(S, E, F, ...) do { \
-+       if (E) \
-+               err(S, F ": %s", ##__VA_ARGS__, strerror(E)); \
-+       else \
-+               err(S, F, ##__VA_ARGS__); \
-+} while(0)
-+
-+#define error _onboard_error
-+#endif
- 
- // break into debugger
- // step twice to come back out of the raise() call into known code
-diff --git a/Onboard/pypredict/lm/lm_dynamic.cpp b/Onboard/pypredict/lm/lm_dynamic.cpp
-index 7c628240..e7c7f40e 100644
---- a/Onboard/pypredict/lm/lm_dynamic.cpp
-+++ b/Onboard/pypredict/lm/lm_dynamic.cpp
-@@ -17,8 +17,6 @@
-  * along with this program. If not, see <http://www.gnu.org/licenses/>.
-  */
- 
--#include <error.h>
--
- #include "lm_dynamic.h"
- 
- using namespace std;
--- 
-2.34.1
-
diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
similarity index 89%
rename from meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb
rename to meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
index d544f169f8..a069fb692e 100644
--- a/meta-gnome/recipes-support/onboard/onboard_1.4.3-9.bb
+++ b/meta-gnome/recipes-support/onboard/onboard_1.4.4-1.bb
@@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING.GPL3;md5=8521fa4dd51909b407c5150498d34f4e \
                     file://COPYING.BSD3;md5=f56403ae5b2d6b82ad136d753c05a82e \
                    "
 
-SRC_URI = "git://github.com/onboard-osk/onboard.git;protocol=https;branch=main \
-           file://0001-pypredict-lm-Define-error-API-if-platform-does-not-h.patch \
+SRC_URI = "git://github.com/onboard-osk/onboard.git;protocol=https;branch=main;tag=${PV} \
            file://0002-toggle-onboard-hoverclick-use-bin-sh-default-shell-i.patch \
           "
-SRCREV = "350f7643576bc8c5f2cff9c6ddce0e1e7cff995d"
+SRCREV = "02b19e2aee88e4bf2cdc7094813ddd4a6c05d1e7"
 
 inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings mime-xdg
 
-- 
2.43.0


