Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C023C5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:13:23 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1932.1786515198326476877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2026 23:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=eRDuM4zd;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1708; q=dns/txt;
  s=iport01; t=1786515198; x=1787724798;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RSWHjKzL5PR0tR5l0pK+FmhUApaUQu8UDi/4f5Y/DU4=;
  b=eRDuM4zdFGO/dKcALhcyqCfaVN/hZeCi45acSbZ1MrD2fMaBR7ly4Xgw
   mSN9NHurg0CLo65byGjDiTxlS7Wtqa7midu1e1KHlUvpD65Qaflq5xQHz
   y3AEUVIILTj8RDsxXTZVV/5Z1/SfhbJoXY+xsOeaK7cW0oeVzejJbUKhL
   IXvYsERwniIr3cfpnxiWlV27VOMm1FwspbjeNIaK6/BowZfveVaNGgc/I
   fPbraDBv+JEGJnaVHNvTroR0xNnqxGIe93OXmSLYwaJ0Nke0tum+Gom/4
   kJXR5qCJ9H55Wu/F9NYGRIWkd56a9ePxNLBzZ5FDIJ7y36pteszj8vReP
   w==;
X-CSE-ConnectionGUID: lcsEU969TA+ccyLJWYk+wQ==
X-CSE-MsgGUID: jqkXDIONQuy9gG66rU8JfA==
X-IPAS-Result: =?us-ascii?q?A0BCAgAIDnxq/5IQJK1aHgEBCxIMggULgld0XkNJk1kBj?=
 =?us-ascii?q?leSN4F+DwEBAQ83GgQBAYFxgxSNaQImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4Zchl02ARgBLTBRC0SDAgGCOgM3A8I2giyBAYMoAdoeD?=
 =?us-ascii?q?YJYAQsUAQWBM4U/gn6FI3aEfCcbG4FyhH6CH4JxhXgEgiKBDJMnSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIRoIxk2fIEJYYErKmUBE?=
 =?us-ascii?q?heBCYI0AoJ2gS1iAgEeCxgNSBEsNxQZBD5uB44wIIJGgQ6WQYJ5jxSgHnEKK?=
 =?us-ascii?q?IN2jCGPPoV8GjOqbC6YWpITkkcrhD6BaDyBWXAVgyIJShkP3lwnMgI7AgcCB?=
 =?us-ascii?q?w4DC5NmAQE?=
IronPort-Data: A9a23:7K2ME6I5IbQSQa7hFE+Rq5QlxSXFcZb7ZxGr2PjKsXjdYENS1jQGz
 mtNUTqPPPaJMGGkKt1yaozloB8Fu57Rm9drQAAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9i2ctajx8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1qB1obANxGq9peQmpF5
 Ng6FwEOLQ+60rfeLLKTEoGAh+wqKM3teYdasXZ6wHSBXLAtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzMnwsYDUXUrsTIJ4zgu6unXnnWzZZs1mS46Ew5gA/ySQhiOS9b4aEJYfiqcN9nF+bl
 k7n2ELAHwBLO/PBlyC4olCir7qa9c/8cMdIfFGizdZwiV/VxWweDTUZUFK6pb+yjUvWc8lcI
 koY+yU0pLU03EOuR9j5GRa/pRasuQYRXddVGeA25AyBj6bZ/QudLmwFVSJaLts+uck7QDYn2
 lOEk5XuHzMHjVGOYXuZ8rHRqXa5PjIYaDdTIyQFVgACpdLkpenfky7yczqqK4bt5vWdJN066
 27iQPQW71nLsfM26g==
IronPort-HdrOrdr: A9a23:9LIb36vKv8pIIqUoUe9YuXay7skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:71QQlWOC3b45u+5DXCJ82XNFRJEZWz7Wx2b0AXCJCiV2cejA
X-Talos-MUID: =?us-ascii?q?9a23=3A2Np3Ww99+RgsMX1F7dgX8YeQf8Vx4JSCKWcrqIg?=
 =?us-ascii?q?X6sara3JqBme/gh3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,218,1779148800"; 
   d="scan'208";a="804874973"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Aug 2026 06:13:17 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 376FE1800017F;
	Wed, 12 Aug 2026 06:13:17 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 5C704CC12A6; Tue, 11 Aug 2026 23:13:16 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Devansh Patel <devanshp@cisco.com>
Subject: [meta-python][scarthgap][PATCH] python3-twisted: set CVE_PRODUCT
Date: Tue, 11 Aug 2026 23:13:13 -0700
Message-Id: <20260812061313.1606606-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2026 06:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128929

From: Gyorgy Sarvari <skandigraun@gmail.com>

The related CVEs are tracked with twisted:twisted CPE, so the
default python:twisted CPE doesn't match any entries.

See CVE db query:
sqlite> select * from products where PRODUCT = 'twisted';
CVE-2014-7143|twisted|twisted|14.0.0|=||
CVE-2016-1000111|twisted|twisted|||16.3.1|<
CVE-2019-12387|twisted|twisted|||19.2.1|<
CVE-2019-12855|twisted|twisted|||19.2.1|<=
CVE-2020-10108|twisted|twisted|||19.10.0|<=
CVE-2020-10109|twisted|twisted|||19.10.0|<=
CVE-2022-21712|twisted|twisted|11.1.0|>=|22.1.0|<
CVE-2022-21716|twisted|twisted|21.7.0|>=|22.2.0|<
CVE-2022-24801|twisted|twisted|||22.4.0|<
CVE-2022-39348|twisted|twisted|0.9.4|>=|22.10.0|<
CVE-2023-46137|twisted|twisted|||22.8.0|<=
CVE-2024-41810|twisted|twisted|||24.3.0|<=

Set the CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a89ab3223003a5ebb9d41ef5ec56f7a903834255)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
index 691b80ac68..76ed4a9544 100644
--- a/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twisted_24.3.0.bb
@@ -13,6 +13,8 @@ SRC_URI += " \
 
 SRC_URI[sha256sum] = "6b38b6ece7296b5e122c9eb17da2eeab3d98a198f50ca9efd00fb03e5b4fd4ae"
 
+CVE_PRODUCT = "twisted"
+
 inherit pypi python_hatchling
 
 do_install:append() {
-- 
2.35.6

