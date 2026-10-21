Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7543.1792574990334489475
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jFJ/5jB+;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15943c9c005so628093c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574990; x=1793179790; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWHSEGhn65ZHQj4gikc3tmOBP0zoM5i3QBpymrh2M/8=;
        b=jFJ/5jB+jY2V0gDSTkBV4mFAe3lkHTlbHji3P4Arv1n/Y4P1fYX/dwiZUUDvRBz9t1
         evAQXssbGV3v2Z5lfpLqC9UYac1OgkYGV5bqpu24MgXmyZ0pbgRqL3YfWfx+PJNshKRN
         2ihwMbYbKv9nZBf1Nv4XZ9Aqc3mT1ySn4Od0SOs+gP0BeLks0AqqiPimcYxJ2tgLipM2
         8A4iupnr2VFJgrQ1x93yDXTcs7XXqmWlAJ+sTLM48YVXnHIt0LvWjp4Dajqu12QFvKkA
         bWE7KvGpCi3ZTipT9QShsM/FlPXB75KIct+jP1963l6H9BO+5UnBZXl3flLkUlLY6jDg
         BokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574990; x=1793179790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWHSEGhn65ZHQj4gikc3tmOBP0zoM5i3QBpymrh2M/8=;
        b=kq90BBwM0V5cHWvL791ZDiUFy9AZSq8mDf2SCI7Iti2F8nMd8ug5/xcnaPoqxpMY9V
         Stk7Ujk2saBOexjJndS/otg1vDZujwsaTrCXR903lqrbBHTHC3B50pBuEZyO8QPoEHwu
         ppe4kbHgn8TjG5mDRNiDyNhaxpA444Y/eYEW8ESBLMzT3sV7pCnMaXxrij0A3ZcBSwFg
         35x7tzKMq7hjh4Am210Sao1bxr+MrV6V2ZqNxyEaYuOu06D2MkBwuUi7Ip2QWo13Svt1
         OXKPIbsMJXBkIH+sXyBfxrFbWYcpQjWww8eU013ijR+oVnRXQNkwuJuAw7ZO1aIp2qPt
         HZlA==
X-Gm-Message-State: AFq9FYIBnQNxB54LIU0UI57oXmkXrkmDCYZUzpa7PZ8iGgldyROoibAY
	0MUDesIwf4sUX8Q6JPD9cd6tQGBlWuWMWpaYmQibwnWfvmqG3XmGfkhe1onl2g==
X-Gm-Gg: AYBFou1heQLirZY/zVYKI8txlRwk4AhZ3fMT75z/WKYCznRw3H/TOZpwcd38BbFXFJU
	6YfuPsKJdjvd2cdsKLshe0iXhGMCYT5B4Xphncn/cveBF4F1tYQOzFpuSmI8oz0FQ/xwAPFPpse
	PhWnedzl5YuEJEFRaj4V4TaLcUkMT1sujbH4IB5FG7bhME77UuQNzwq/gX0ZkBy3xgwBn1vwXPg
	l2FCey4BvBxxag2nY9CwgPY6Ra1jYznyTj8MxkWAoP+IncWN4dFahssVvuj/liMm96AVKIuW/J4
	vrHNwXnHNcOm/QXY7yhBwHTvtoxkjqAhuMqAKx/5LzO9GTyetk0AywbBGBqkPo72brblV9IOZ7j
	1TnZ58jC6qxozkGI3x0VcZV+PWc/ISSrN6uvSPmxfIjz5P7jDan9caCQkW/nhGQyNgHNHv4mGzg
	e2Pg0FxLV7xcfDm38csXYkHz9624dcjEWzt0GFEgx4/tVGuvD+qSX2o7q55Hcnxla5efVlC1tf6
	I6Co4Tv/qR480PuO4vrqOTOBlhneDyJJomiti5qAGq0JS8EUWeMatFSTqy9DeWDkzS2K0wtiT+V
	8shHylbupTk/xmlSPAUffnAblF8NSxk=
X-Received: by 2002:a05:7022:61a8:b0:168:3243:c910 with SMTP id a92af1059eb24-190a6adcc45mr3014038c88.13.1792574989619;
        Wed, 21 Oct 2026 02:29:49 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 20/44] poppler: patch CVE-2026-102621
Date: Wed, 21 Oct 2026 22:28:33 +1300
Message-ID: <20261021092857.3585453-20-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131207
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-102621

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../poppler/poppler/CVE-2026-102621.patch     | 40 +++++++++++++++++++
 .../poppler/poppler_26.08.0.bb                |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch
new file mode 100644
index 0000000000..823c3a33db
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2026-102621.patch
@@ -0,0 +1,40 @@
+From eaeeb2fe58aad490bc82aa33d75217dead0dd0de Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Sat, 8 Aug 2026 15:02:27 +0200
+Subject: [PATCH] Fix integer overflow in SplashClip::clipToPath
+
+Issue #1763
+
+(cherry picked from commit 323c91036d99926a8b90dc14329f7b40aece22f8)
+
+CVE: CVE-2026-102621
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/323c91036d99926a8b90dc14329f7b40aece22f8]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ splash/SplashClip.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/splash/SplashClip.cc b/splash/SplashClip.cc
+index 78249652c..b096beebd 100644
+--- a/splash/SplashClip.cc
++++ b/splash/SplashClip.cc
+@@ -23,6 +23,8 @@
+ #include <config.h>
+ 
+ #include <algorithm>
++#include "goo/GooCheckedOps.h"
++#include "goo/GooLikely.h"
+ #include "SplashErrorCodes.h"
+ #include "SplashMath.h"
+ #include "SplashPath.h"
+@@ -211,7 +213,9 @@ SplashError SplashClip::clipToPath(const SplashPath &path, const std::array<doub
+     } else {
+         if (antialias) {
+             xPath.aaScale();
+-            yMinAA = yMinI * splashAASize;
++            if (unlikely(checkedMultiply(yMinI, splashAASize, &yMinAA))) {
++                return SplashError::Generic;
++            }
+             yMaxAA = (yMaxI + 1) * splashAASize - 1;
+         } else {
+             yMinAA = yMinI;
diff --git a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
index 8b0783d001..f24ca34366 100644
--- a/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.08.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
+           file://CVE-2026-102621.patch \
            "
 SRC_URI[sha256sum] = "dc906e68cea698109706ac6aa3d2c9d4512fcfcac42d90b8afcda486d1b9abd0"
 
