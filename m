Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22261.1795539579049891358
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 08:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ra52UnWP;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1757; q=dns/txt;
  s=iport01; t=1795539579; x=1796749179;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J6HBHuHKNmUMGzOdtny3V+a+BtLvY595b1zBC/kNy+Y=;
  b=Ra52UnWPjGAnCS+YnhP2yWgeNTdfWPy2+e5GalPmEHU7bh+DzWJiRYNh
   18qEWkCQDl7OFf1wAMVwWNVnUGQVguru+YWXdq8TosLzrMnWx4QKMvRrj
   rXP17we5cKc0+TzA4+wIC1rrvEXjBy4aOXcBgDfCZgUUabG3u5LKQce+f
   ixsK5wXPeR+UTphXonAtIY0flJ/0xrKx8vMLV/9moqel6NvMBLRrj1kWv
   Ba4n7XhbDVnYTs5mmu//SWoukDPvwEm6SNMLEveOGHJNOIrAg0vNtHavM
   fp0JPKxSVKRlzYFYnUQSAzVl1scPskeeipRh/FMczBld2yqGEVXhZoTyr
   Q==;
X-CSE-ConnectionGUID: u7zyJPAPTAOe//cnx75Nbw==
X-CSE-MsgGUID: cAg1Jdc/SCK/V9vIw5Ie0Q==
X-IPAS-Result: =?us-ascii?q?A0BCAgCbwAVr/9NK/pBaglmCV3VgQ0mTWgFPgiGeLIF+D?=
 =?us-ascii?q?wEBAQ89FAQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDZBACwEYAV1cRIMCAYJ0AxG6dYF5M4EBgykBgVTbMwELFAGBOIVCi?=
 =?us-ascii?q?CV1AYR+JxsbgXKBFYNqhAqBBoV5BIIiPD4SjmuKHUiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvB?=
 =?us-ascii?q?RomPhsKgQwnHx4bDgIfEAYWIQsgGA1IESw3FRkEPm4HlBeDGoEOLCCCDBGTa?=
 =?us-ascii?q?pF6oREKKIN5jCSVOhozqnKZCI4KllGEaoFoPIFZcBWDIglKGQ+XN8lIJjICA?=
 =?us-ascii?q?ToBAQcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:l3kJtahATFoJhpuHTh8giU4sX161NBEKZh0ujC45NGQN5FlHY01je
 htvWW6DbvmKajGhLYsnYd7n/BlXupDXndIwHFA6rHg1FC1jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjf8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUFpfRmI1lnz
 cAxDz1KKRuFl73r5rikH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGISOJ4bRGZwF9qqej
 mnv8D3bDhpdD/e8jgTU7FOz287CxRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:143TH6p1K6sahbBCa0GaQucaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:PViHMGBXVxfqcVn6EzQ45l82IukdTlT6wTCXKEmoVjtPQqLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AwRDTpg1dX/dc4GJUj2BBvqG7UjUj6I2hUWIBmtI?=
 =?us-ascii?q?9kOrDC31uGijArTnve9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,231,1787011200"; 
   d="scan'208";a="63523418"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 16:59:36 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 73A9418000B7F
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:59:36 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 25F28CC1611; Tue, 24 Nov 2026 08:59:35 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][wrynose][PATCH] wireshark: upgrade 4.6.9 -> 4.6.10
Date: Tue, 24 Nov 2026 08:59:35 -0800
Message-Id: <20261124165935.1874673-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 16:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132956
Content-Type: text/plain; charset="utf-8"

From: Khem Raj <khem.raj@oss.qualcomm.com>

Security fix release: fixes 39 vulnerabilities (wnpa-sec-2026-111 to
wnpa-sec-2026-149, CVE-2026-130434..CVE-2026-130469), mostly crashes,
infinite loops and memory leaks in many protocol dissectors (RTSE,
NBAP, Kafka, TLS, SDP, PROFINET, ...) and file parsers (ERF, Ascend,
Android Logcat, K12xx), plus iLBC/AMR codec crashes. Also fixes the
LoRaWAN decryption ZDI-CAN-32851 issue and assorted dissector bugs.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 628b7976f16720056f7ca03333ef4bebdf2f81de)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../wireshark/{wireshark_4.6.9.bb => wireshark_4.6.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.9.bb => wireshark_4.6.10.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.10.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.10.bb
index 1a10eb08e8..99ab82a7af 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.10.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "d062d416a1ab3a49975aafe3a671c882dde0562ccd71b078808ceb59d465fc0f"
+SRC_URI[sha256sum] = "268f41bdf8acee561b670217cf6ea74cf9e779477543e59f92f1cd00294a03dd"
 
 PE = "1"
 
-- 
2.35.6

