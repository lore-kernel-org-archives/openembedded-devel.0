Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A9BC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 16:28:12 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16638.1787761682669023146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 09:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WHjQGmp8;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3827; q=dns/txt;
  s=iport01; t=1787761682; x=1788971282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LL3EoR1yks5et4gEPNG4xf1t3zGjzhKncDVq0K6uqHw=;
  b=WHjQGmp8xGrD/+oEgsDHO0Q/q6cGqDroVJfdpDP7ETNZyImyrctrT2YU
   DORgSFOesbLsKo22QW4E/UghzrWrtwdyuD4VKuH+zjI0txVue3lzDhdhi
   7K5Gtsx7uad7Tu2kW/1inM3IU/C4fviLSlPS7L0B+xVM77CLRRXiX0MBV
   nqvtRDl/BNZ+V15uGj4wqHHOO9GGTV+uZI7jhKlbx+l/xahhLZhlfb+5C
   SpAQ+C2CmI23Fuv3pGLS+0KJOpIhTVx24ZgoVWf8g7/tP4fiaELkZAk+H
   oFiudIsOBtCUQYntNik/HP/DJDOOCbO9oIph2Hjo3gvmyPHbmgDw1Smi2
   A==;
X-CSE-ConnectionGUID: 2aaOQjmATzKuzS5X4CNyBA==
X-CSE-MsgGUID: EfTa5MGPSkqfULUOqx5u1Q==
X-IPAS-Result: =?us-ascii?q?A0BHAgAvE49q/40QJK1aglmCV3ReQ0kDlkeLZ5I3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GjW4CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEqCwEYAS0sAwECTwsjIYMCAYI6AzcDEb9ngXkzgQGDK?=
 =?us-ascii?q?AFDQdkbDYJYAQsUAYE4hT+Cf4UjXRgBhHwnGxuBcoEVg2mCH0IBAYEnhn4Eg?=
 =?us-ascii?q?xwSgVqCao8gSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BK?=
 =?us-ascii?q?IQQIxk2fIEJXoErKWQBEheBCYIHAoJaggUCAUlDDgdHPgsYDUgRLDcUGQQ+b?=
 =?us-ascii?q?geObR+CTmEtASuCAwInk3qCaI8UoB5xCiiDdowijz6FfBozqmyZCI4KhAmRe?=
 =?us-ascii?q?k2EaYFoPIFZcBWCbgEBMglKGQ+SI8w5JzICAQgDLwEBBwIHDgMLgWiQAIEeY?=
 =?us-ascii?q?AEB?=
IronPort-Data: A9a23:xHHMPKKcf/q4iKQVFE+R3JQlxSXFcZb7ZxGr2PjKsXjdYENS1mQHx
 mIeCD3QOKqKZ2Dwftl2PoW08EIG6sPcyNJqG1Qd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uv9WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2Qqajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN00BUgRBI8d09plInxcz
 qEodBsrfzqq0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzNXwsYDUXUrsTIJ49keOhh2j2WzZZs1mS46Ew5gA/ySQhi+e1b4KJIYPiqcN9s0ikr
 z/j0FzCAQgUCfii7iOVr2/1v7qa9c/8cMdIfFGizdZjhl6O3CoPGRQZVAvmifa8g0+6HdlYL
 iQ8/TIjq6U3/kGnQtTxGhG1vnOAlhodQMZLVeoi5QeAz6DZ7wqUCi4DVDEpQN8mucpwXzUo/
 liShJXwGDVru7qQTDSW8bL8kN+pESERKWlHYWoPShEIpoG/5ooylRnICN1kFcZZk+HIJN05+
 BjSxABWulnZpZdjO3mTlbwfvw+Rmw==
IronPort-HdrOrdr: A9a23:rHzyNKs53pAo0aF/bPAiHrGB7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: 9a23:FY9aPG+Zt5+ShpiyVbCVvxQdE+cccHj08GXzPl2DVFY1Y5uEY3bFrQ==
X-Talos-MUID: 9a23:aRVT5QmCWURW5yJ6QqgBdnpPOvthvoGBMHsOiJs7n/SjLDwtJm6k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,245,1779148800"; 
   d="scan'208";a="837070437"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 16:28:01 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 9B99518000481;
	Wed, 26 Aug 2026 16:28:01 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3BC83CCA79B; Wed, 26 Aug 2026 09:28:01 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH] python3-django: upgrade 5.2.16 -> 5.2.17
Date: Wed, 26 Aug 2026 09:27:58 -0700
Message-Id: <20260826162758.3827104-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 16:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129518

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://docs.djangoproject.com/en/dev/releases/5.2.17/

CVE: CVE-2026-15307 CVE-2026-15337 CVE-2026-15830 CVE-2026-15920

Backport Changes:
- Django 5.2.17 requires setuptools >= 83, the first
  upstream release containing the fix [1]. Wrynose provides
  setuptools 82.0.1 with that fix backported, so retain the
  previous build requirement.

[1] https://github.com/pypa/setuptools/commit/dd9f436a36486b4cb8a4c70a2321548b0be09b8f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8a4bf31e7fd3be6e2ecbb0a4299de2316d4ae782)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ...project-lower-setuptools-requirement.patch | 28 +++++++++++++++++++
 .../python/python3-django_5.2.16.bb           |  5 ----
 .../python/python3-django_5.2.17.bb           |  6 ++++
 3 files changed, 34 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-pyproject-lower-setuptools-requirement.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.16.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-django_5.2.17.bb

diff --git a/meta-python/recipes-devtools/python/python3-django/0001-pyproject-lower-setuptools-requirement.patch b/meta-python/recipes-devtools/python/python3-django/0001-pyproject-lower-setuptools-requirement.patch
new file mode 100644
index 0000000000..fa4e087b6b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/0001-pyproject-lower-setuptools-requirement.patch
@@ -0,0 +1,28 @@
+From 7a05df92b0820675803a5e8e73d20b9453538d68 Mon Sep 17 00:00:00 2001
+From: Darsh Kelaiya <dkelaiya@cisco.com>
+Date: Fri, 21 Aug 2026 00:20:00 -0700
+Subject: [PATCH] pyproject.toml: lower setuptools requirement for Wrynose
+
+Django 5.2.17 requires setuptools >= 83, the first upstream release
+containing the fix for [1]. Wrynose provides setuptools 82.0.1
+with upstream commit dd9f436 backported, so retain the previous build
+requirement.
+
+[1] https://github.com/pypa/setuptools/security/advisories/GHSA-h35f-9h28-mq5c
+
+Upstream-Status: Inappropriate [Wrynose-specific toolchain compatibility]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index b2327d6..e2d8244 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,3 +1,3 @@
+ [build-system]
+-requires = ["setuptools>=83"]
++requires = ["setuptools>=77.0.3"]
+ build-backend = "setuptools.build_meta"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.16.bb b/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
deleted file mode 100644
index 2629ff3714..0000000000
--- a/meta-python/recipes-devtools/python/python3-django_5.2.16.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python3-django.inc
-inherit python_setuptools_build_meta
-
-SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch"
-SRC_URI[sha256sum] = "59ea02020c3136fce14bef0bbece21a10a4febef5eed1c51c22ae468efa22200"
diff --git a/meta-python/recipes-devtools/python/python3-django_5.2.17.bb b/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
new file mode 100644
index 0000000000..7f4ed2c92e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django_5.2.17.bb
@@ -0,0 +1,6 @@
+require python3-django.inc
+inherit python_setuptools_build_meta
+
+SRC_URI += "file://0001-fix-test_msgfmt_error_including_non_ascii-test.patch \
+            file://0001-pyproject-lower-setuptools-requirement.patch"
+SRC_URI[sha256sum] = "9d4d93be539a18ab80d058eb515900e10951e04c537c5a6b394fc49528d3251f"
-- 
2.35.6


