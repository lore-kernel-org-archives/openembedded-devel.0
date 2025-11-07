Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05E7CCFA05
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 13:31:51 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8264.1762510889399865376
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Nov 2025 02:21:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=TrZBy1np;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1714; q=dns/txt;
  s=iport01; t=1762510889; x=1763720489;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PwPPU6nBwMHyTAeVDTFYZeazvbtD00GlNHd95g3SbV0=;
  b=TrZBy1npEom64bEoErtdaASyV/K3UOtRJ9OcKDEZmmBvA1SrRzT/+yH7
   QtNI3Nx/XVYV+q9UJMOqlI58JNXZuMWonFxvgxkaT3ojLx+Qwky2doCpq
   a1MXCuXIYv+eEmCndNAEEK1TsKIxhv5armB/7Q5vDT/gWi6HIR6plhh9n
   il+1Hcf4B8s7mWcBbsJ6YLHvnw+6VpaZ+/ci9qGHcO+XbLsvo0AuZpjrL
   ec7C7KXicnrnmDHX4X0SyDxSWS6yO050dOLsYO5YKwKPnpidwJA0PQm/n
   fktPi9LFqf3hwK4L3QsNmh8uiPv2H8/e3k6/3HVSppqNNZAPmmfuQh7WA
   w==;
X-CSE-ConnectionGUID: 9n4Yzz1LR/+TNXylH8EIZg==
X-CSE-MsgGUID: CtptwF2MRd+0prCu4mI/vg==
X-IPAS-Result: =?us-ascii?q?A0CmBADIxw1p/4z/Ja1aglmCR3tdQ0mWSJ4dgX8PAQEBD?=
 =?us-ascii?q?z0UBAEBhEFGjFoCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8Nhl02ARgBLTBcHQEmgwIBgnMDEbBqgiyBAYMoAT8CQ0/bKoFKh?=
 =?us-ascii?q?TuIFnABhHgnGxuBcoEVgTuCLYEFgVwBAYIthXcEgiJ6FIYngnOQM0iBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWMDNQwLKhVuMh2BJEEYcYRdImgPBoESg1EGgS6HcA+KSwMLG?=
 =?us-ascii?q?A1IESw3FBsGPm4HlA+CfIEOLAQcZX4pkyUkkiuhDgoog3SMHpU5GjOqawuYe?=
 =?us-ascii?q?44IllCEaYFoPIFHCwdwFYMiCUkZD444J4NCgX+4ZiUyAjoCBwsBAQMJk2cBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:tD7TiKjD9YYkF0x6Fg2mxWQMX161MBEKZh0ujC45NGQN5FlHY01je
 htvDGnTM/qLNDPwe491aNm+9R5VsJWAmIQ3TQtlpSA1FC5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSOULOZ82QsaD9Nsvrc8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVJ/LpGE3MX0
 cZfawwrXgGHp7Kb4YC0H7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9JoTaH58NxBfAz
 o7A10/lGg0FGoa68zbGqmq2rfKTmAK8Ro1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:UY6u5a3Eh3q26uD5nioBLQqjBLkkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZq/z/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7DHio379
 YGT0C4Y+eAaWRHsQ==
X-Talos-CUID: 9a23:drNUcmw1JXhwAPd9VZ8UBgVFHJwUYG+E6E2XYHOeOXdtaO24aG2frfY=
X-Talos-MUID: 9a23:eTe8egoH3Wmk0AQDOYYezxp+LNt3zf6LMkxOyY0ckNTYMA03JTjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.19,286,1754956800"; 
   d="scan'208";a="408220290"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 07 Nov 2025 10:21:28 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 51C00180001EC;
	Fri,  7 Nov 2025 10:21:28 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id EE63BCC1288; Fri,  7 Nov 2025 02:21:27 -0800 (PST)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH 1/2] python3-django 5.0.11: ignore CVE-2025-27556
Date: Fri,  7 Nov 2025 02:21:14 -0800
Message-ID: <20251107102116.924586-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Nov 2025 13:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121373

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://github.com/django/django.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-27556
Type: Security Advisory
CVE: CVE-2025-27556
Score: 7.5

Analysis:
- CVE-2025-27556 affects Django 5.1 before 5.1.8 and 5.0 before 5.0.14.
- The issue occurs due to slow NFKC normalization on Windows, which can cause
  a denial-of-service (DoS) when handling inputs containing a very large number
  of Unicode characters.
- Affected Django components:
	django.contrib.auth.views.LoginView
	django.contrib.auth.views.LogoutView
	django.views.i18n.set_language

- This performance degradation is specific to Windows, caused by the Windows
  Unicode normalization implementation.

 Reference:
 - https://nvd.nist.gov/vuln/detail/CVE-2025-27556
 - https://github.com/django/django/commit/2cb311f7b069

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 meta-python/recipes-devtools/python/python3-django_5.0.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb b/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
index 5060f3c9ad..43be30c7ec 100644
--- a/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
+++ b/meta-python/recipes-devtools/python/python3-django_5.0.11.bb
@@ -1,6 +1,9 @@
 require python-django.inc
 inherit setuptools3
 
+# Windows-specific DoS via NFKC normalization, not applicable to Linux
+CVE_STATUS[CVE-2025-27556] = "not-applicable-platform: Issue only applies on Windows"
+
 SRC_URI[sha256sum] = "e7d98fa05ce09cb3e8d5ad6472fb602322acd1740bfdadc29c8404182d664f65"
 
 RDEPENDS:${PN} += "\
-- 
2.44.1


