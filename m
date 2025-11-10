Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DD0CCFA1A
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:29:44 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39143.1762744396135328707
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 19:13:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H6kT26OV;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1451; q=dns/txt;
  s=iport01; t=1762744396; x=1763953996;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I9R7qSBn9v+6GNHHhhuHOXtKbICUYqlVup0w9BFXAMQ=;
  b=H6kT26OVSV8Ibu87kB8+95WiK36XULNwPYaTZ46Fb7NLv7V6PfwxCCFm
   yQKiWev/Sb6Z384uY/bs6RsPCgBr3M3tWzl+cOfC82PMAwPxADst3ZFn3
   Q6CZgo3oo9eocJX3EW7aHQEKtCXN2fQ0HwtERoNNkeF6H+qVoMM3wog2X
   gh2+07GDmQnKqx11jG5chmGZSegGH8vcb5rANm+ubDLJuIXRUM/zx0T8U
   XTpwqRBUZcwuQ0Lcw+3qy0brVSghFahFWc82OWl0xikUbB/yPTDDkTE38
   PBgWICvGQtAwhvDURGrEJtyreDASWqnHM0pL9oC2M+quhJ+9kfeiI5Ejh
   g==;
X-CSE-ConnectionGUID: eA8gPEyBRkus6FvleaRNag==
X-CSE-MsgGUID: zAa9QFWHTQOS/Xu2BeRmtA==
X-IPAS-Result: =?us-ascii?q?A0C2BADNVhFp/4v/Ja1aglmCR3tdQ0m0ZYF/DwEBAQ89F?=
 =?us-ascii?q?AQBAYUHjFsCJjUIDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8Nhl02ARgBLTBcHQEmgwIBgnMDEa09giyBAYMoATEFCQJDT9sqgUqFO?=
 =?us-ascii?q?4gWcAGEeCcbG4FyhH2BBYFcAQGCLYV3BIIigQ6GJ4JzkC5IgR4DWSwBVRMNC?=
 =?us-ascii?q?gsHBYFjAzUMCyoVbjIdgSRBGHGEXSJoDwaBEoNRBokYD4owAwsYDUgRLDcUG?=
 =?us-ascii?q?wY+bgeUBYJ8gQ4sBByCDJMlkk+hDgoog3SMHpU5GjOqa5kGjgiWUIRpgWkBO?=
 =?us-ascii?q?oFHCwdwFYMiCUkZD444g2mBf7syJTICOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:uILHxa1IR+KqyUc4cfbD5YNwkn2cJEfYwER7XKvMYLTBsI5bp2AGm
 DcfUWzXPfnZa2GnLt4kb42/p0MH78CAxoAwGwZo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU6
 Lsen+WFYAX4gmcsYzpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGAWhmMrU168xNAnxVq
 9IGLD0EVDaKiLfjqF67YrEEasULNsLnOsYb/3pn1zycVaxgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+RC/FMEg9/5JYWleuvgHb2aTBwo1OOrq1x6G/WpOB0+OS3aouPJ43TGK25mG6Kj
 2uXxkrGIi0jE+fY+Sff2H+Wg/PmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:LwRuXK+oTX5IsPcPO2Nuk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoI0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: =?us-ascii?q?9a23=3Aj7Xru2mbrIAtrPUdLb5mNisPR47XOXD0nHjoDl6?=
 =?us-ascii?q?SM2V0U+O7V1ud8ZlCmsU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AR2Xvvgx7HaTx5L2aOIbdak7uge+aqLaHARE0v6o?=
 =?us-ascii?q?mh/CjDmtAJm23gQ6yXqZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.19,292,1754956800"; 
   d="scan'208";a="422925915"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Nov 2025 03:13:15 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 2043A18000234;
	Mon, 10 Nov 2025 03:13:15 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id B85F7CC1288; Sun,  9 Nov 2025 19:13:14 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH] nodejs 20.18.2: ignore CVE-2024-3566
Date: Sun,  9 Nov 2025 19:12:59 -0800
Message-ID: <20251110031300.3852180-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 14:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121464

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/nodejs/node.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2024-3566
Type: Security Advisory
CVE: CVE-2024-3566
Score: 9.8

Analysis:
- The vulnerability (CVE-2024-3566) affects Windows builds of Node.js where
  applications indirectly depend on the CreateProcess API.
- The issue allows command injection when specific conditions are met within
  that API call sequence.
- This flaw is specific to Windows platforms; Node.js on Linux or UNIX-based
  systems (such as Yocto builds) is not affected because CreateProcess is a
  Windows-only API.

 Reference:
 - https://nvd.nist.gov/vuln/detail/CVE-2024-3566

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
index bef62f88eb..9a2841b245 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_20.18.2.bb
@@ -40,6 +40,8 @@ SRC_URI[sha256sum] = "69bf81b70f3a95ae0763459f02860c282d7e3a47567c8afaf126cc7781
 S = "${WORKDIR}/node-v${PV}"
 
 CVE_PRODUCT += "node.js"
+CVE_STATUS[CVE-2024-3566] = "not-applicable-platform: Issue only applies on Windows"
+
 
 # v8 errors out if you have set CCACHE
 CCACHE = ""
-- 
2.44.1


