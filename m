Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12883.1795503942030029846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 23:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jdGYxbwX;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1676; q=dns/txt;
  s=iport01; t=1795503942; x=1796713542;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bDq1dGj4A6u44bM8u2JE9bYixy0/XUQQ24/5gtXF9aE=;
  b=jdGYxbwXa37qvtePG+mQHvBSlEr1BebWL1x3hK++6fU6aTuMtToBVOD3
   Yi3y7KwNJhMyZIhWJtPEXtIHpJwc6dN8JRtj0y9yacB6Eoo6YzQ32EyhD
   noBaosvzaM9sx4EcK7lvegWXOa+iIUMmOk16dCtQRpNqYKv1mMjne2ezg
   K3XEkxUM3dKVfCdptwfSTal3Oj0QLlwNxgwJWywoZmLFoKpfSBrc+2rfe
   j7DYiNLCf1mVC96pHRM7yXVXcF1w8iQyaeD5Hw/xfarIEcZHMRjsg9s3g
   +ybQAO+y8ISPmSswQlzMMYHOWJVg+webfQx/CZz/90obvBJ0jEqDCbHU8
   Q==;
X-CSE-ConnectionGUID: B51JjTC+TPO7A1/+lnn8QQ==
X-CSE-MsgGUID: fyXc1H97TMieN85nPK+gzg==
X-IPAS-Result: =?us-ascii?q?A0BDAgAxNgVr/8xK/pBRCYJZgld1YUJJlkueLIF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYISgi1GjiQCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBU2ARgBGxIwXEQJgnkBgnQCARG6MRs3giyBAYMpAT8CQ1DbM?=
 =?us-ascii?q?wELFAEFgTOFQogkdoR9JxsbgXKECXaBBYFcAQMYgRp5hXkEgiKBDIFyjHmKG?=
 =?us-ascii?q?kiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErK?=
 =?us-ascii?q?F0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZ?=
 =?us-ascii?q?wsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELGxgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5QUgxgCgQ4rAYEfTVGTYJIEgTWfXAoog3mMJJU6GjOEBKZumQiCWYZDh?=
 =?us-ascii?q?G6WBE2EaoFoPIFHCwdwFYMiCUoZD445hWqDFMlIIzUCOwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:i7/+/a71NO/QPCTom1qVIAxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jZLXWqOM6rYNGDwctF+b47kpB5QvJHTy4dmSwA9rSkwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eF9BB2ORLKiJyz
 dtHAWlKLRSFgbKP+efuIgVsrpxLwMjDNY4F/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0En1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FboCKJIDQFZQ9ckCwq
 HP29D3ZU04mEd2S72rY9EqPxeDdknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:TOiFFKArmzglfdblHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:Bkt/mW8//qhU1sm2I26Vv2RJQ+InTlae8E/3fGbhTiVtTrvFcGbFrQ==
X-Talos-MUID: 9a23:MwItqAk/oxKihcrR4JkGdnpsJfdjuoT/V3wokJgg65SCDQ8zNCWS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62764289"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 07:05:38 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id BD15118000860;
	Tue, 24 Nov 2026 07:05:37 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 4B697CC1634; Mon, 23 Nov 2026 23:05:36 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [meta-oe][wrynose][PATCH] openldap: mark CVE-2020-15719 as disputed
Date: Mon, 23 Nov 2026 23:05:32 -0800
Message-Id: <20261124070532.4047734-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 07:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132936
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

CVE-2020-15719 concerns third-party OpenLDAP packages that assert
RFC6125 support. Upstream rejected ITS9266 because stock OpenLDAP
implements the LDAP certificate identity rules from RFC4513.

The recipe carries no downstream TLS verification changes. Its two
source patches only adjust build stripping and version metadata.
Retain the documented TLS_REQSAN policy and record the upstream
dispute instead of applying the Red Hat downstream policy patch.

References:
https://bugs.openldap.org/show_bug.cgi?id=9266
https://nvd.nist.gov/vuln/detail/CVE-2020-15719

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta-oe/recipes-support/openldap/openldap_2.6.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.13.bb b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
index 59f20d0f08..63f61ead52 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
@@ -23,6 +23,10 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
 
 SRC_URI[sha256sum] = "d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656"
 
+# Upstream rejects the RFC6125 report for stock OpenLDAP, which uses RFC4513.
+# https://bugs.openldap.org/show_bug.cgi?id=9266
+CVE_STATUS[CVE-2020-15719] = "disputed: Upstream ITS9266 rejects this report for stock OpenLDAP; this recipe carries no third-party TLS changes asserting RFC6125 support."
+
 DEPENDS = "util-linux groff-native"
 
 inherit autotools-brokensep update-rc.d systemd pkgconfig
-- 
2.35.6

