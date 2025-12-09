Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0BED3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 05:00:19 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17.1765256414535553262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 21:00:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HpYFE/D0;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3326; q=dns/txt;
  s=iport01; t=1765256414; x=1766466014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hVxLgCY3xrSkDPC5GacPXStKUcbZ8/B3vLEjB9DpwiM=;
  b=HpYFE/D04i3S7hX2mfy5PKaUHsKXA/ME9BVh5lR0mEdJn282/7yIMVTh
   iAhxCNs2EhXPCdzvD3hhO9ZFJ7ddaog1yGEb44P0sDIOjeIwXBrvR9rgA
   ImgZwrVS/0rbCm9FZvcCmuZTVpm8GOFTn8LoApfWKB1Z9yyZxVTUQkAjg
   y57QU36ZWtq1SXWVO2sXz9QAnNCwm6l1uHbnjevPdOKJwPJoDdXClRf1C
   8geUK+sPpKw42bwvaQKWjD36OC3dcdDSLxStc1A7KPX7BjuWYfjvzdbU8
   IzSYmnZGP5IB9cBdCU0xcgeKJ+gTP+O8i7I6/ajb01scPc291CctoI5H+
   w==;
X-CSE-ConnectionGUID: MswEd5ehQ7OGYYUc92l5cg==
X-CSE-MsgGUID: WmKDoywBQM2zzKOH85k5wA==
X-IPAS-Result: =?us-ascii?q?A0AaEAD9qzdp/5P/Ja1aHQEBPAEFBQECAQkBgWUCgkV/X?=
 =?us-ascii?q?0JJh1+OaYtnkjaBfw8BAQEPFAI0BwQBAYUHjGkCJjQJDgECBAEBAQEDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8Nhl02ARgBLTBRC0SDAgGCOgM2A?=
 =?us-ascii?q?gERryuCLIEBgwkfATEFCQJDT9hEDYJbgUsBhTqCeYUdcAGEeCcbG4FyglCCL?=
 =?us-ascii?q?YEFgRpCAQECGIgKBIINFYEOgXWEKoJSHhCGeQaJLEiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WMDNQwLKhVuMh2BIz4Xc4RdHmgPBoERg08GiRQPiXsyAwsYDUgRLDcUGwY+b?=
 =?us-ascii?q?geUDE6CMnIJEwETGCACgVsLJA8CIZJzCZAlgiGBNZ5ocQoog3SMHo89hXwaM?=
 =?us-ascii?q?6prmQaOCIQJkkeEaIFoPIFHCwdwFYMiCQo/GQ+OOINpgX+DFLxiIjUCAQEHM?=
 =?us-ascii?q?QIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:Gj7y+aL4Ucozw17sFE+RgZQlxSXFcZb7ZxGr2PjKsXjdYENShWBUn
 TMbUGHUa6zYN2H2e91/a9iz/BkCvZ+BxtViTAsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnV0
 T/Oi5eHYgL8gWYkajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1LF14bMdAV+t8oJk5/x
 METeWoJMxuM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLolgeu1g3P/ehVTqUmeouw85G27IAlZjOKzboqOIILXLSlTtnmdh
 U7B7nvTOzRAJs687hrVr3HxmcaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:e/FY1K9SnrfD7q7ko4Vuk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3ANr5mxmjKktwS9I/Ts+0eV8pcajJuV2bC4XuNLk+?=
 =?us-ascii?q?BVkFGeYyoQg7K/P5vnJ87?=
X-Talos-MUID: 9a23:H9C9lwpBtUjArc8hRq0ezw5nF+tv8ruEMWVXg4clnOnUaC8tJB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,260,1758585600"; 
   d="scan'208";a="426683265"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 09 Dec 2025 05:00:11 +0000
Received: from sjc-ads-3824.cisco.com (sjc-ads-3824.cisco.com [171.68.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id C607418000880;
	Tue,  9 Dec 2025 05:00:11 +0000 (GMT)
Received: by sjc-ads-3824.cisco.com (Postfix, from userid 1840713)
	id 6B2F9CCF82B; Mon,  8 Dec 2025 21:00:09 -0800 (PST)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com
Subject: [meta-oe][Scarthgap][PATCH] hdf5 1.14.4-3: fix CVE-2025-2912
Date: Mon,  8 Dec 2025 20:59:14 -0800
Message-ID: <20251209050003.192253-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.251.21, sjc-ads-3824.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 05:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122393

From: Sudhir Dumbhare <sudumbha@cisco.com>

Upstream Repository: https://github.com/HDFGroup/hdf5.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
Type: Security Fix
CVE: CVE-2025-2912
Score: 4.8
Patch: https://github.com/HDFGroup/hdf5/commit/7cc8b5e1010a

Analysis:
- CVE-2025-2913 was previously fixed by [1], which is also addresses CVE-2025-2912
  as noted in [4].
- NVD [2] references the GitHub discussion [3] for CVE-2025-2912, and we successfully
  reproduced the issue following the steps outlined there.
- Applied the fix from [4] and verified resolution using the reproduction steps.
- The same patch [4] is already included in OE-scarthgap [5] for CVE-2025-2913.
- Therefore, reused the patch from [5] to resolve CVE-2025-2912.

References:
[1] https://github.com/HDFGroup/hdf5/commit/7cc8b5e1010a
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-2912
[3] https://github.com/HDFGroup/hdf5/issues/5370#issue-2917388806
[4] https://github.com/HDFGroup/hdf5/issues/5370#issuecomment-3542881855
[5] https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-support/hdf5?h=scarthgap&id=b42e6eb3e51a

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 .../{CVE-2025-2913.patch => CVE-2025-2913-CVE-2025-2912.patch} | 3 ++-
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb                  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/hdf5/files/{CVE-2025-2913.patch => CVE-2025-2913-CVE-2025-2912.patch} (94%)

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2913-CVE-2025-2912.patch
similarity index 94%
rename from meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch
rename to meta-oe/recipes-support/hdf5/files/CVE-2025-2913-CVE-2025-2912.patch
index e1614bee9b..47c887597a 100644
--- a/meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2913-CVE-2025-2912.patch
@@ -9,10 +9,11 @@ one of the free lists.  It appeared that the library came to this vulnerability
 after it encountered an undetected reading of a bad value.  The fuzzer now failed
 with an appropriate error message.
 
-CVE: CVE-2025-2913
+CVE: CVE-2025-2913 CVE-2025-2912
 Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/7cc8b5e1010a09c892bc97ac32d9515c3777ce07]
 (cherry picked from commit 7cc8b5e1010a09c892bc97ac32d9515c3777ce07)
 Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
 ---
  src/H5Ocont.c | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 8a37323536..e8432f0d6b 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
     https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-1.14.4/src/${BPN}-${PV}.tar.gz \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
-    file://CVE-2025-2913.patch \
+    file://CVE-2025-2913-CVE-2025-2912.patch \
     file://CVE-2025-2914.patch \
     file://CVE-2025-2915.patch \
     file://CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch \
-- 
2.44.4


