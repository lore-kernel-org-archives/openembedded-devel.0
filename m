Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF1BE77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 10:36:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53417.1734345385468533595
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 02:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2080fd93a2=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG9IiU7012899
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:25 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43h6681jxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 02:36:25 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Dec 2024 02:36:24 -0800
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 16 Dec 2024 02:36:23 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/5] libxfce4util: 4.19.3 -> 4.20.0
Date: Mon, 16 Dec 2024 18:36:15 +0800
Message-ID: <20241216103618.4078816-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216103618.4078816-1-kai.kang@windriver.com>
References: <20241216103618.4078816-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9D7dzBsp3TZjtq9R08hBLVqpgk2G9Dia
X-Authority-Analysis: v=2.4 cv=K5XYHzWI c=1 sm=1 tr=0 ts=676002a9 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=lWhOIMQbgaqtsgal_LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9D7dzBsp3TZjtq9R08hBLVqpgk2G9Dia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_04,2024-12-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=898 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412160089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114327

From: Kai Kang <kai.kang@windriver.com>

Change log:

4.20.0 (2024-12-15)
======
- Translation Updates:
  Polish
4.19.5 (2024-12-01)
======
- Bump Xfce overall version to 4.20pre2
- I18n: Update po/LINGUAS list
- Call xfce_kiosk's parent finalizer to prevent leaks
- Translation Updates:
  Amharic, Telugu
4.19.4 (2024-11-01)
======
- bump Xfce overall version to 4.20pre1
- Remove local ABI check
- Add meson build
- Migrate to xdt-gen-visibility and xdt-check-abi
- I18n: Update po/LINGUAS list
- build: Bump requirements for Xfce 4.20
- Apply .clang-format file
- Add missing includes of libxfce4util-alias.h
- clang-format: Add file
- xfce-rc: Fix support for the LANGUAGE environment variable
- scan-build: Add false positive file
- build: Use AM_DISTCHECK_CONFIGURE_FLAGS
- session-management: Try to create D-BUS proxy synchronously
- session-management: Always set an error when returning FALSE
- fileutils: Fix MD5 hash in xfce_create_shared_thumbnail_path()
- Translation Updates:
  Asturian, Greek, Hungarian, Lithuanian, Persian (Iran)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4util_4.19.3.bb => libxfce4util_4.20.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.19.3.bb => libxfce4util_4.20.0.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.3.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.0.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.3.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.0.bb
index 364384d9f..0b8356e0a 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.19.3.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.20.0.bb
@@ -6,4 +6,4 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection vala
 
-SRC_URI[sha256sum] = "f047937f753466b7ff74ad3809c817b11db44498dd90497de7e1584ee48502c6"
+SRC_URI[sha256sum] = "21493f9c9995a282823db93839f6b9f06ae31edb094191ba9acf04d932a2b592"
-- 
2.34.1


