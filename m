Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ECCC88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:23:37 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35568.1789118611124744124
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 02:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dY9LwPZS;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1508; q=dns/txt;
  s=iport01; t=1789118611; x=1790328211;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2BvRUTvIh1M9hSFmibO2ZZetiXbAKqUzjg0KKAbbfyA=;
  b=dY9LwPZStwQJYEMU8FIb4367Zx6QsV8LatiAXdxmtCYGTlQLMvoCBQGF
   tTEPaeRrTBq1j7bcIkg2+UCbGw5Y7p8br20u15eKNZym0DouaODw0fOcy
   1dCd8kW2uda1MnP4ZHJQte7ObQ0XwfrjKx7MG9JWhK12QJOgM4/fzj5sh
   5tMayadsrNk0omJBiudJ95epZgw05XZrHrrENyWPigskNlYnLcJeDC1DH
   480HG6QiXY2mLwx9+PYyJ3EgMGCBknrV5+tD8KXRBYZWPzry4RIgoWiZ2
   BDcRGmGvgGEtofwAi3AK14igDBQVAbdjIlPuAq4iNdbl/mTzd461aLrXM
   Q==;
X-CSE-ConnectionGUID: r212IRE8TymPm6yY8dm25Q==
X-CSE-MsgGUID: STTbstKZTVqR2WWi+dE+zw==
X-IPAS-Result: =?us-ascii?q?A0DEAgDGx6Nq/48QJK1RCYJZgld0YENJk1kBggRsnh6Bf?=
 =?us-ascii?q?g8BAQEPNxoEAQGFBY4HAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZckBU2ARgBLTBcRIMCAYJ0A8MFgiyBAYMpAd0FAQsUAYE4hT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6ECg15hXgEgiKBDJQISIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BJ4JiIxk2eoEJXoErKWABEheBCYIIAoJUggECAUlDD?=
 =?us-ascii?q?gdFUwknQQoSTCkiCAULGA1IESw3FRkEPm4HjwMfgl0BPFGWVJF6oQ8KKIN2j?=
 =?us-ascii?q?CKVOhozqm0umFqkWoRpgWoBOUaBE3AVgyIJShkPji8V0BknMgI7AgcCBw4DC?=
 =?us-ascii?q?5FoKnRgAQE?=
IronPort-Data: A9a23:/3wxM6+3QMvQirCv3h5eDrUD6n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2sXDDjUOfiJNmPxeNBxYYi39hgCv5PSyoRmS1ZoqX9EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAsYztNs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2ksZ9RC29xaUV1f8
 MQddiE8PhyG3b+PlefTpulE3qzPLeHiOIcZ/3UlxjbDALN+H9bIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOHWjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZC9bIKMJIXaHpk9ckCwn
 V769X/lISMmCsWlkwW68zGgq6zdgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXY0WNpdFqsg4QOlzbHPpR+ED2wPSTtELtchsacLqScC3
 1uNmZbtQDdoqrDQESzb/baPpjT0Mi8QRYMfWRI5ocI+y4GLiOkOYtjnFL6PzIbdYgXJJAzN
IronPort-HdrOrdr: A9a23:Sr1DVa3KZOGOZdbaIqsg4gqjBIQkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AVrlivGj/whoCTJ6O+1kEK41ixDJuaCeEllbqDh+?=
 =?us-ascii?q?EGGNRTeOEeA+c/fk5qp87?=
X-Talos-MUID: 9a23:a2NRnAhJx3FZGedZCWtGv8MpD/tU6b+yK3Ixr4w84fa7NG98FnSPk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="840161834"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Sep 2026 09:23:30 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id 2DD3218000121;
	Fri, 11 Sep 2026 09:23:30 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id C43F0CC1611; Fri, 11 Sep 2026 02:23:29 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [oe][meta-python][wrynose][PATCH] python3-py: correct CVE_PRODUCT mapping
Date: Fri, 11 Sep 2026 02:22:56 -0700
Message-Id: <20260911092256.1015805-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 09:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129959

From: Devansh Patel <devanshp@cisco.com>

The product-only "py" mapping generates a wildcard-vendor identity
instead of the exact NVD identity for the packaged pytest-dev py
source. Use "pytest:py" for its NVD dictionary CPE and configuration
matches.

This changes the generated product identity. With sbom-cve-check 1.3.3,
the current CVE report is unchanged using the pinned database snapshots;
both mappings report CVE-2020-29651 and CVE-2022-42969.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 26fa8b053b71d1f3f8da359abaef578c671c692f)
Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 meta-python/recipes-devtools/python/python3-py_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
index 61f3873b4c..76cb4ce745 100644
--- a/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py_1.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 
 SRC_URI[sha256sum] = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719"
 
-CVE_PRODUCT = "py"
+CVE_PRODUCT = "pytest:py"
 CVE_STATUS[CVE-2022-42969] = "disputed: upstream could not reproduce it, github also revoked the advisory"
 
 DEPENDS += "python3-setuptools-scm-native"
-- 
2.35.6


