Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9F6D41C2B
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:21:32 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7312.1765452829952569613
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Dec 2025 03:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RNvv0+2u;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: vdabhi@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4360; q=dns/txt;
  s=iport01; t=1765452830; x=1766662430;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TpnK2FkkAf8o8c53O4RmJaAjKBoEh/cV/lEPzXKAEdk=;
  b=RNvv0+2uTXGDtWmTI5LzHKUMfyG+N1IO1gDYvKjg67ohIZ+OJ9gXznyS
   jUGkbUF2DmdmA0n4aesbpRcb9xc1JyTOmIH2Jg2p/7ikAoYXWtYBzTL/k
   D/wrOezRdILAELg6lMbO5W7axNiXHWg92j+qv8IyDCJMq1k25Yj+T3/IR
   IDBSFRcauc/GHqNdtWv6oiG7PYvdSfgSJa9UfBlg+QHnG7EnH+xUczjH2
   /JhiCcStVDTMb613VvxHjso2gyRsvj+zBO+M0caQqO0sU7SMX0z7p2hPD
   01dcJrtAtKwbuh9xZbJncOJtmHmatCXsU3+U912AY1vBcPTPRf1W7t5n9
   g==;
X-CSE-ConnectionGUID: k4l9TPUGQ2m1GvetaMw42Q==
X-CSE-MsgGUID: kS+KuEK2T0CAHjqkyc+qcg==
X-IPAS-Result: =?us-ascii?q?A0DRAwBJqzpp/4r/Ja1aglmCR39fQkmVXGyeHYF/DwEBA?=
 =?us-ascii?q?Q89FAQBAYUHjGkCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1AUYsAwECWiMhgwIBgnMCARGyL4IsgQGDaAJDT9ssg?=
 =?us-ascii?q?UuFO4gWWBgBhHgnGxuBcoJQgi2BBYFcAQECGIgKBIIigQ6GH3iBKwMrHhCQR?=
 =?us-ascii?q?EiBHgNZLAFVEw0KCwcFgWYDNQwLKhVuMh2BIz4Xc4RdHmgPBoERg08GgSyHY?=
 =?us-ascii?q?g+JdkMDCxgNSBEsNxQbBj5uB5QWToFlTRYnUQEqAYEbKDU0JA6Sc02SAqEOC?=
 =?us-ascii?q?iiDdIwelTkaM4QEgVeSPpJSC5h7iyWCY5U0gRwrhD2BaDyBKB8LB3AVgm4BA?=
 =?us-ascii?q?TIJSRkPji4KC4NegX+CWbtmIjUCOgIHCwEBAwmRbC2BTgEB?=
IronPort-Data: A9a23:cPPLC62FqIRQyMhxoPbD5YVwkn2cJEfYwER7XKvMYLTBsI5bpzQBn
 GMaDTyObvaNZWugKYh/Pd6xo0sO78DWz4dgTAY63Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX4
 bsen+WFYAX4gmQtajpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDx0ybLEgx8lOW2QX2
 uIVNDkocUzZvrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWguuhjHn+WzZZs1mS46Ew5gA/ySQtiue1aYSNJILiqcN9nX3bh
 X/r3D7FWjozFN6GyiuOsWunibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Kze8A6Ev8407NqkWpLqE48eALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KlbGSoAEJ30bFh4lgPW
 AKSdkbNOHN
X-Talos-CUID: 9a23:vpN5JG5tKghd0a+6Btss9xIQS/wdT1LklnKJDFG1FW9MV+HPcArF
X-Talos-MUID: 9a23:U4I2bQhLdltXmIJ3h5GiTsMpN/wrwLmDKxoxyb4vm8udNj17eC6Wg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.20,265,1758585600"; 
   d="scan'208";a="427016066"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Dec 2025 11:33:49 +0000
Received: from sjc-ads-11808.cisco.com (sjc-ads-11808.cisco.com [171.70.103.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id EB268180000B5;
	Thu, 11 Dec 2025 11:33:48 +0000 (GMT)
Received: by sjc-ads-11808.cisco.com (Postfix, from userid 1871031)
	id 92579CC1288; Thu, 11 Dec 2025 03:33:47 -0800 (PST)
From: "Vrushti Dabhi -X (vdabhi - E INFOCHIPS PRIVATE LIMITED at Cisco)" <vdabhi@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vrushti Dabhi <vdabhi@cisco.com>
Subject: [meta-openembedded] [Scarthgap] [PATCH] p7zip 16.02: Fix CVE-2022-47069
Date: Thu, 11 Dec 2025 03:33:42 -0800
Message-Id: <20251211113342.3552509-1-vdabhi@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.70.103.59, sjc-ads-11808.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 12:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122584

From: Vrushti Dabhi <vdabhi@cisco.com>

Upstream Repository: https://sourceforge.net/projects/p7zip/

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
Type: Security Fix
CVE: CVE-2022-47069
Score: 7.8

Note:
- Commit [1] updates complete p7zip archive source for v17 and includes changes
that fixes CVE-2022-47609, adapted fix related changes in current p7zip v16.02.
- Similar changes via [2] have been integrated into the upstream 7zip package,
which replaced p7zip 16.02 in OE-Core master.
For the testing:
- Verified fix using steps mentioned at [3], trace not observed.
- Validated against known malicious ZIP samples [3]

References:
[1] https://github.com/p7zip-project/p7zip/commit/d7a903ff13c2
[2] https://github.com/ip7z/7zip/commit/f19f813537c7
[3] https://sourceforge.net/p/p7zip/bugs/241/
[4] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2022-47069

Signed-off-by: Vrushti Dabhi <vdabhi@cisco.com>
---
 .../p7zip/files/CVE-2022-47069.patch          | 63 +++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
new file mode 100644
index 0000000000..586c0e82dc
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2022-47069.patch
@@ -0,0 +1,63 @@
+From 633f61e2eaf6530cf7e53c702c06de1b7a840fa7 Mon Sep 17 00:00:00 2001
+From: Vrushti Dabhi <vdabhi@cisco.com>
+Date: Thu, 27 Nov 2025 01:36:55 -0800
+Subject: [PATCH] Fix out-of-bounds read in ZIP archive processing
+ (CVE-2022-47069)
+
+Add bounds checking and replace unsafe pointer arithmetic with index-based
+access in FindCd() to prevent out-of-bounds read when processing malformed
+ZIP archives.
+
+Testing:
+- Verified fix using steps mentioned at [1], trace not observed.
+- Validated against known malicious ZIP samples [1]
+- Changes merged in upstream p7zip via [2]
+
+CVE: CVE-2022-47069
+Upstream-Status: Pending
+
+References:
+[1] https://sourceforge.net/p/p7zip/bugs/241/
+[2] https://github.com/p7zip-project/p7zip/commit/d7a903ff13c2
+[3] https://bugzilla.suse.com/show_bug.cgi?id=CVE-2022-47069
+
+Signed-off-by: Vrushti Dabhi <vdabhi@cisco.com>
+---
+ CPP/7zip/Archive/Zip/ZipIn.cpp | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/CPP/7zip/Archive/Zip/ZipIn.cpp b/CPP/7zip/Archive/Zip/ZipIn.cpp
+index c71c40f..84213b4 100644
+--- a/CPP/7zip/Archive/Zip/ZipIn.cpp
++++ b/CPP/7zip/Archive/Zip/ZipIn.cpp
+@@ -1095,11 +1095,11 @@ HRESULT CInArchive::FindCd(bool checkOffsetMode)
+     
+     if (i >= kEcd64Locator_Size)
+     {
+-      const Byte *locatorPtr = buf + i - kEcd64Locator_Size;
+-      if (Get32(locatorPtr) == NSignature::kEcd64Locator)
++      const size_t locatorIndex = i - kEcd64Locator_Size;
++      if (Get32(buf + locatorIndex) == NSignature::kEcd64Locator)
+       {
+         CLocator locator;
+-        locator.Parse(locatorPtr + 4);
++        locator.Parse(buf + locatorIndex + 4);
+         if ((cdInfo.ThisDisk == locator.NumDisks - 1 || cdInfo.ThisDisk == 0xFFFF)
+             && locator.Ecd64Disk < locator.NumDisks)
+         {
+@@ -1110,9 +1110,11 @@ HRESULT CInArchive::FindCd(bool checkOffsetMode)
+           // we try relative backward reading.
+ 
+           UInt64 absEcd64 = endPos - bufSize + i - (kEcd64Locator_Size + kEcd64_FullSize);
++
++          if (locatorIndex >= kEcd64_FullSize)
+           if (checkOffsetMode || absEcd64 == locator.Ecd64Offset)
+           {
+-            const Byte *ecd64 = locatorPtr - kEcd64_FullSize;
++            const Byte *ecd64 = buf + locatorIndex - kEcd64_FullSize;
+             if (Get32(ecd64) == NSignature::kEcd64)
+             {
+               UInt64 mainEcd64Size = Get64(ecd64 + 4);
+-- 
+2.35.6
+
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 31a12fdb04..3ac0ed03cd 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_al
            file://CVE-2018-5996.patch \
            file://CVE-2016-9296.patch \
            file://0001-Fix-two-buffer-overflow-vulnerabilities.patch \
+           file://CVE-2022-47069.patch \
            "
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
-- 
2.35.6


