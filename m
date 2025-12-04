Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA719D2444B
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 17:22:57 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49535.1764868971061864046
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 09:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NmtA5urT;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3867; q=dns/txt;
  s=iport01; t=1764868971; x=1766078571;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yCI75gtT5KvWSngemXSS34fW8tRpZaN5seuUIH6gzf4=;
  b=NmtA5urTTyUxDz7sUXxnBbfRPndlfDf4cc/kr1Tw+BH8VVl7mVAIvJNd
   8y+9mJZtRim+Ogz47FUZLLJwKttcDgUC0kZjdxZFSXO705tjLJTWYSNpz
   MFVaLqrTMX0JqVnSjocy+x/ttHtNFK2q5lbGyKqedrTNwBRRrk4mMbIwP
   uRL186+MCwhnGNBDnARIHJaJbeMkO4AsVi9E+RrxDxwBfV3roKWTv9tzn
   uzOFe8goPOxKlGHN9oQBuOEac2PlQUPBA0+ZHCtD9ZmtniHQtzCwfeGUw
   ODzEP5C5SzWm0oOMpHUtZFTMZY39zqbnU7LyKzU5Sk7UPPEOMpL5koFsh
   A==;
X-CSE-ConnectionGUID: tNy1qf1UTKiRhj3cKhaAsw==
X-CSE-MsgGUID: pnk/8D3QQlqzEMQhrJLhgA==
X-IPAS-Result: =?us-ascii?q?A0DbBQDEwTFp/5D/Ja1aglmCR39fQkmUJ4Ihi2eSNoF/D?=
 =?us-ascii?q?wEBAQ9EDQQBAZFvAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaATgBcgMBAk8LIyGDAgGCOgM2AgERBrJJgiyBAYNsQU/YR?=
 =?us-ascii?q?A2CVQaBS4U7gnmFHVgZhHgnGxuBcoJQgTcHb4IfQgICiCIEgiKBDoF1hCp4i?=
 =?us-ascii?q?QAGiT1IgR4DWSwBVRMNCgsHBYFjAzUMCyoVbjIdgSM+F3OEXR5nDwaBEYNPi?=
 =?us-ascii?q?RYPijgpAwsYDUgRLDcUGwY+bgeUHk+CMmEtASkCGGNScJMukjWgHXEKKIN0j?=
 =?us-ascii?q?B6PPYV8GjOqa5kGjgiECZJHhGiBaDyBWXAVgyJSGQ+OX4NChRO4EyI1AgkxA?=
 =?us-ascii?q?gcLAQEDCZNnAQE?=
IronPort-Data: A9a23:GgJrGKJIraxZaoLHFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENS1D1Sy
 2EbWz/SPa7bMGbxKtp0Otiw9R5TucLVm4JhTAUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnV0
 T/Oi5eHYgL8gWYoajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yKlBvJINBx9pUAFtO9
 6cTCzAERwuc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUrAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEiojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjOGyaYaOJIzXLSlTtl6ep
 SWW0z/AOxUDJvG68Dqf0FasicaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:MataDKmqJgVgLgDreqmbFah6O3jpDfI53DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qBHnlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJ8U7ndQtsZ
 uJtMNFebjNMWQ=
X-Talos-CUID: 9a23:3p+hcWwjgkd2MdFtS5DrBgUIPNF8a3OE8UvzInW4Cz1ia72cYESPrfY=
X-Talos-MUID: 9a23:mJsQswW2Xk8nI9Lq/Cfqh3YyGJxR2qC3Gm0oqJUcme2EOgUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,249,1758585600"; 
   d="scan'208";a="417143685"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Dec 2025 17:22:50 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id EE6CF18000200
	for <openembedded-devel@lists.openembedded.org>; Thu,  4 Dec 2025 17:22:49 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 94511CC12B5; Thu,  4 Dec 2025 09:22:49 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded] [scarthgap] [PATCH] hdf5 1.14.4-3: Fix CVE tag format in patches
Date: Thu,  4 Dec 2025 09:22:18 -0800
Message-ID: <20251204172240.3268565-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 17:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122326

From: Deepak Rathore <deeratho@cisco.com>

- The CVE tags in multiple hdf5 patches were using comma-separated
format which caused false positives in CVE reports.
- Multiple CVEs should be separated by space in CVE-ID.patch file as
per recipe style guide in Yocto documentation so CVE report tool can
scan those CVEs and mark it as patched.

Fixed the following patches:
- CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
- CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
- CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch

Reference:
- https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#cve-patches

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
index 47dc6b1ac7..6f1359744c 100644
--- a/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
@@ -13,11 +13,12 @@ against the actual value as chunks are being deserialized.
 
 Fixes CVE-2025-6816, CVE-2025-6856, CVE-2025-2923
 
-CVE: CVE-2025-2923, CVE-2025-6816, CVE-2025-6856
+CVE: CVE-2025-2923 CVE-2025-6816 CVE-2025-6856
 Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/29c847a43db0cdc85b01cafa5a7613ea73932675]
 
 (cherry picked from commit 29c847a43db0cdc85b01cafa5a7613ea73932675)
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
 ---
  src/H5Oint.c | 17 +++++++++++------
  1 file changed, 11 insertions(+), 6 deletions(-)
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
index c09ade1c4c..9d8da0a1f9 100644
--- a/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
@@ -3,10 +3,11 @@ From: aled-ua <bugbuster.cc@gmail.com>
 Date: Wed, 15 Jan 2025 15:02:25 -0600
 Subject: [PATCH] Fix vuln OSV-2023-77 (#5210)
 
-CVE: CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
+CVE: CVE-2025-6269 CVE-2025-6270 CVE-2025-6516
 Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d]
 (cherry picked from commit 7f27ba8c3a8483c3d7e5e2cb21fefb2c7563422d)
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
 ---
  src/H5Cimage.c | 13 +++++++++----
  1 file changed, 9 insertions(+), 4 deletions(-)
diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
index f7324f58c1..744032c18a 100644
--- a/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch
@@ -15,10 +15,11 @@ This PR addressed them by:
 These changes addressed the crashes reported.  However, there is a skiplist
 crash during the unwinding process that has to be investigated.
 
-CVE: CVE-2025-6269, CVE-2025-6270, CVE-2025-6516
+CVE: CVE-2025-6269 CVE-2025-6270 CVE-2025-6516
 Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70]
 (cherry picked from commit 3914bb7f7ec7105d8bfbeb3aebd92e867cff5b70)
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
 ---
  src/H5Cimage.c | 84 ++++++++++++++++++++++++++++++++++++++------------
  src/H5Ocont.c  |  5 +--
-- 
2.35.6


