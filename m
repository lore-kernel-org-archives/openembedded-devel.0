Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29075.1793863784104754022
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 23:29:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=C1/9grB7;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6341; q=dns/txt;
  s=iport01; t=1793863784; x=1795073384;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oAGyO/l9bdH7jMLKIDAScJbMYuaiTCxiQw+v7bpMCCI=;
  b=C1/9grB73VdJK2kUEewFF5nGwT3SnTBI0hGj7bY0bn1yrPMfPTB8FpvA
   hkimbD+Yxdej3dUdiPs3g0giwgub5/Otd/zFdfsK0cUvxVPqRU35LzZOC
   wL79ErkaGlYn+lrcRER0dDGmix2nr0RGIV6JwHqdIv4CssSlKCItyiHj0
   e8gxMw6wNl1gh1TySuHY45s0Z1R9xqInJcN080uJFxLPUEcBx58k2TrQl
   mN39cGnPFSHmmTVFlVPVG9s5KZ1yQt83ajNti5CRdZa6G+fBlEu9+Y4KY
   1dDqGuIDf1cvLVCpgvgFVOvZT8IQVKRuKFZrzEFSmbvRgVnOJlAqCK4LT
   w==;
X-CSE-ConnectionGUID: R8GUNsc9SxKwGSwAIY7nuw==
X-CSE-MsgGUID: KOnyvrz+TPiK/GGPX4+7Lw==
X-IPAS-Result: =?us-ascii?q?A0BFAgDiL+xq/4z/Ja1aglmCV3VgQ0kDlVxsA54hgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjh0CJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBMCAQMyAUYQIDErKxmDAgGCdAMRvFmCLIEBhH7bMwELFAGBO?=
 =?us-ascii?q?IVAiCN2hH0nGxuBcoEVg2mBBYFcAogEIgSCIoEMgXiMeohFSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESgQddgSsoXQEhgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyO?=
 =?us-ascii?q?RAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5IvgxEBFXgBExgggTpSky6SSIE1n?=
 =?us-ascii?q?1wKKIN4jCSVOhozhVulFpkIizeCU5V0XYRpgWg8gVlwFYMiCUoZD44vCgscg?=
 =?us-ascii?q?0TOVSYyAgkDLwEBBwIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:6GYFA6maKtNvviy1FsAgArvo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNWjiFO6zfZzCmL94nPd638kMO65PRy4RjTAJrqykyFltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbdI1dtRGmofz
 uw7Nx82cTmitr2w3a3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJoDaH5sIzhvwS
 mTu3EP/Ew8AJp+j8TumtV2Dvt+T3nzfR9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:UOm8jqB6nZUYievlHemO55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AZtfEsWttnl89lbREODBSHoNz6IsfIlLg6mzbcnS?=
 =?us-ascii?q?oKnlGc6K8aG7P/r57xp8=3D?=
X-Talos-MUID: 9a23:c1vlUwSxzUkKLlB/RXTPozdzKt16oJiWCWNKvro+i5XHaghvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544826585"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 07:29:43 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 3080B18000637;
	Thu,  5 Nov 2026 07:29:43 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id CFCC3CBF201; Wed,  4 Nov 2026 23:29:42 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-filesystems][wrynose][PATCH 2/2] ntfs-3g-ntfsprogs: mark CVE-2026-56136 as fixed
Date: Wed,  4 Nov 2026 23:29:40 -0800
Message-Id: <20261105072940.882696-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105072940.882696-1-dkelaiya@cisco.com>
References: <20261105072940.882696-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 07:29:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131879
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

The three index validation patches already included for CVE-2026-46572
and CVE-2026-42617 also provide the complete CVE-2026-56136 fix [1-3].
Their combined source changes match Tuxera's 2022.10.3 backport linked
from the advisory [4]. Add the missing CVE tag to each patch so
cve-check recognises the existing fix.

[1] https://github.com/tuxera/ntfs-3g/commit/2ead8a3ccf940c0219ffba587fab54e21462b3a5
[2] https://github.com/tuxera/ntfs-3g/commit/dfd1a7c6eb23a22238ec193451fa59c989b4381f
[3] https://github.com/tuxera/ntfs-3g/commit/edf2b892356684ca8f2fc5898943c7a9b90ffb80
[4] https://github.com/tuxera/ntfs-3g/security/advisories/GHSA-r66g-c39x-cw95

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 ....patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch} | 2 +-
 ....patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch} | 2 +-
 ....patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch} | 2 +-
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb                | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p1.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch} (97%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p2.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch} (98%)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/{CVE-2026-46572_CVE-2026-42617_p3.patch => CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch} (96%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch
similarity index 97%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch
index 47121ea9a5..27fc063df2 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch
@@ -13,7 +13,7 @@ inconsistency.
 Thanks to Alexandro Calo' from Nozomi Networks Labs for reporting this
 issue.
 
-CVE: CVE-2026-46572 CVE-2026-42617
+CVE: CVE-2026-46572 CVE-2026-42617 CVE-2026-56136
 Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/2ead8a3ccf940c0219ffba587fab54e21462b3a5]
 
 (cherry picked from commit 2ead8a3ccf940c0219ffba587fab54e21462b3a5)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch
similarity index 98%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch
index d2d40124fe..ae78336386 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch
@@ -10,7 +10,7 @@ ntfs_attr_inconsistent() for INDEX_ROOT and from
 ntfs_index_block_inconsistent() for INDX blocks so callers can rely on
 the IE stream being well-formed.
 
-CVE: CVE-2026-46572 CVE-2026-42617
+CVE: CVE-2026-46572 CVE-2026-42617 CVE-2026-56136
 Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/dfd1a7c6eb23a22238ec193451fa59c989b4381f]
 
 (cherry picked from commit dfd1a7c6eb23a22238ec193451fa59c989b4381f)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch
similarity index 96%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch
index 54bce4f95e..3ff1a46ce8 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch
@@ -9,7 +9,7 @@ applies at libntfs-3g/dir.c.
 
 Thanks to Alexandro Calo' from Nozomi Networks Labs for the report.
 
-CVE: CVE-2026-46572 CVE-2026-42617
+CVE: CVE-2026-46572 CVE-2026-42617 CVE-2026-56136
 Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/edf2b892356684ca8f2fc5898943c7a9b90ffb80]
 
 (cherry picked from commit edf2b892356684ca8f2fc5898943c7a9b90ffb80)
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 5d6af2aaf6..e4fe1798dc 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -9,9 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV} \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
            file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
-           file://CVE-2026-46572_CVE-2026-42617_p1.patch \
-           file://CVE-2026-46572_CVE-2026-42617_p2.patch \
-           file://CVE-2026-46572_CVE-2026-42617_p3.patch \
+           file://CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p1.patch \
+           file://CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p2.patch \
+           file://CVE-2026-46572_CVE-2026-42617_CVE-2026-56136_p3.patch \
            file://CVE-2026-46571.patch \
            file://CVE-2026-46570.patch \
            file://CVE-2026-46569.patch \
-- 
2.35.6
