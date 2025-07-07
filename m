Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B038FC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 12:48:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.59552.1751892514768980513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 05:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9283d0a30e=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675G9dL008222
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Jul 2025 05:48:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn1dqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 05:48:34 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 7 Jul 2025 05:48:41 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] poppler: upgrade 25.04.0 -> 25.06.0
Date: Mon, 7 Jul 2025 18:18:10 +0530
Message-ID: <20250707124810.1981958-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: l4TN4kEU2WYhKvSuBKm0hFAW067Z4Gc2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA3NCBTYWx0ZWRfX13gqyb115vxX rDlX1p3pmiWxL+C88ivRogapBI5gI9YnmtDAQ961q73yHZXwc5lSB/QRztd/Yc67CwvwMMmVVAm gt0qArNVFf6+y4/UhT7XNroT0iRDPlcoWXdpojXZwvUDkJz7tJwn9uRUYidqOJ6x4pBGfAn89wh
 7b54lY2xb8Lqu4VYmM+wmzxulC+x4d1WIkm1aP6rMrbCVVIvGlVSX4cSNYShUJ9j/7lK5SnhD84 CwcLC18gFtaXFmuyccp6ee40ux7MDRPQf6urTekkMBBioc7s57mAEYrrr72maIepTF6VMnRYe3m Rsvk0x9WOwS4gbTA3Zrh+gnB1RHTZayHEeQWofHOFoohxHJ9pZQbFrRm734vqFRJqSrttNLJ185
 PelZ8j/fbmQTXLhhO7d1GaVhahr6k+dRghtMnMgiVtfLarqL/OccJb3N4d2OKhD38swF00Pc
X-Proofpoint-ORIG-GUID: l4TN4kEU2WYhKvSuBKm0hFAW067Z4Gc2
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686bc222 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=AFn_XR_YslFJA8mfB4oA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_03,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxlogscore=841 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 12:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118284

From: Yogita Urade <yogita.urade@windriver.com>

Includes fix for CVE-2025-52886

poppler 25.06.0 changelog:
==========================
core:
 * Fix writing dates back to file
 * Internal code improvements
 * Fix crashes in malformed documents

glib:
 * Add the ink annotation type
 * Add missing autopointers definitions

utils:
 * pdfsig: Add assert-signer feature
 * pdfsig: Return error code on error

poppler 25.05.0 changelog:
==========================
core:
 * Fix re-fetching after xref reconstruction. Issue #1584
 * Fix compilation with ENABLE_ZLIB_UNCOMPRESS=ON
 * Various annotation improvements. Issues #642, #1558, #1055
 * CairoFontEngine: invalidate broken embedded fonts. Issue #1453
 * Splash: Performance improvements
 * Internal code improvements

glib:
 * Small signature improvements

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/{poppler_25.04.0.bb => poppler_25.06.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.04.0.bb => poppler_25.06.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.04.0.bb b/meta-oe/recipes-support/poppler/poppler_25.06.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_25.04.0.bb
rename to meta-oe/recipes-support/poppler/poppler_25.06.0.bb
index 1cd5f28cd8..9ab9b926b7 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_25.06.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "b010c596dce127fba88532fd2f1043e55ea30601767952d0f2c0a80e7dc0da3d"
+SRC_URI[sha256sum] = "8199532d38984fab46dbd0020ec9c40f20e928e33e9b4cc6043572603a821d83"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
-- 
2.40.0


