Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CC14C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:38 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.12852.1716860968821000879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QpLRuf09;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860968; x=1748396968;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BBffySjlONusmtA/s0kVBpj1XoMcW6gm815KC5+Kzk8=;
  b=QpLRuf09uNLFy4DgVMnX7LjM+0qxQrqmqoRpX8fCwYfZ0jRu4bfq1+11
   qXC2wgFCdSZmls8O72rKSGoq8FFSUWmpXF55uvD8hBUR9m4o7BZulO3Vy
   MPEWPiG3yp+NQsXO5SJHN3xUbhnRhmVNMUyNXRJvk4D5i19q3UZdv3BEn
   whLLKeUcW8gcS926Lnz1w/Ux+OvBu7Gend3qLSYQZ9vle2xj2+/8LlWT6
   9/JcYUJJ1jK9weMK9FNc2iZrzLpaiGCXubKr+t9YBIdbOTvYdgs/+Ck8z
   fnLswOaiY2Uqv7215740aYiH23bXqTyv5qwmk3DDWJ4pVoVC9t7Ms3PBw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="148492624"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="148492624"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:26 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CD3AD424D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77BEBD6308
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 026EB2007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:23 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0F8A1A000A;
	Tue, 28 May 2024 09:49:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/40] python3-annotated-types: upgrade 0.6.0 -> 0.7.0
Date: Tue, 28 May 2024 09:47:53 +0800
Message-Id: <1716860901-863-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10--0.617900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrXs5nqGvDCfPozDhGeQC9EpZh
	jmb07zEXn/EJVrBwPHwjunjFlOjV5/Bas+2FzMVN/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNY68bpVbgWY5kN37rIZn+GWRby4x9UowTa/bLyPH2RFM6rUaBPfrDGhSY6SE5EtfkY0el
	XlmxitvVcQSZGybnktRGX4zj9hXTZltc/b1pfHmU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110547

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Allow tzinfo objects for Timezone
- add URLs to pyproject.toml
- suggested fix on typo
- Correct misstatement in README
- Fix IsDigit -> IsDigits
- Add Unit type
- Improve handling of GroupedMetadata (First try)
- Prepare for 0.7.0 release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nnotated-types_0.6.0.bb => python3-annotated-types_0.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-annotated-types_0.6.0.bb => python3-annotated-types_0.7.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
index 79cbb66bc..53552d0b7 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = ""
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6afb13fdc220497ee5cded1e717ed67"
 
-SRC_URI[sha256sum] = "563339e807e53ffd9c267e99fc6d9ea23eb8443c08f112651963e24e22f84a5d"
+SRC_URI[sha256sum] = "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
 
 S = "${WORKDIR}/annotated_types-${PV}"
 PYPI_PACKAGE = "annotated_types"
-- 
2.34.1


