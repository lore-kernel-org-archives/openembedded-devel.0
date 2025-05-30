Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3FDC5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:41:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2354.1748572915003094107
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 19:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TK01jq031212
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:41:54 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d45ywv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:41:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 29 May 2025 19:41:34 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 29 May 2025 19:41:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 2/8] libtimezonemap: correct package version
Date: Fri, 30 May 2025 10:41:45 +0800
Message-ID: <20250530024151.4152523-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530024151.4152523-1-changqing.li@windriver.com>
References: <20250530024151.4152523-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BnR3RtbDzSGIJwv8FDx48sqx953DBrTC
X-Proofpoint-ORIG-GUID: BnR3RtbDzSGIJwv8FDx48sqx953DBrTC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAyMiBTYWx0ZWRfX/1c27PCSaHFg XLN1J3Z2XwBycthK7VWZFR2XYm7wbvB1q4+Unt4SpeAybQ2+SItpnBiQVdlYF9skzrAxO/bcdt0 YxJMN8UGzNkJw/CBlDZzBrNVzh67uKHSkPix0spGWGNg/S+fFu8KwwP1QDCpT2cXFm1poW8/vI/
 F/vV4rHhN+910Om6a1zw3PpaL0bt8oYBl5xZNsa0UuDr7OAMoS6vJJQZRzpmdtWAKon8rqxYHj8 m9Qg+sL+9jhU1s9XEI4tnFpiATBu6CnaDfgxZ28GHgCyGndrrfHPq6qzENTMt2S1amzeCJkH9ur lluE0RbYDiZe1SDvvt53itBK0Lbir7Wp96wwAy1P4nqpmP8+A5lExjUSABJOAwnEqvAU0ucFK1Y
 AsQKtRM0EbBBcyzVbt5LalmUoxThWbH6fygn9LoyLp2yKdlBQ+/k9rJy2KL2fneZd37C/XoC
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=68391af2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=xNf9USuDAAAA:8 a=danhDmx_AAAA:8 a=t7CeM3EgAAAA:8 a=oMCc9RdpAGuaAqeP18oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117658

From: Changqing Li <changqing.li@windriver.com>

correct the package version in configure.ac

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...001-configure.ac-correct-the-version.patch | 29 +++++++++++++++++++
 .../libtimezonemap/libtimezonemap_0.4.6.bb    |  3 +-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch b/meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch
new file mode 100644
index 0000000000..0538bc3e5c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libtimezonemap/files/0001-configure.ac-correct-the-version.patch
@@ -0,0 +1,29 @@
+From 915bc44d9f243075d084238c72089a346036388c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 29 May 2025 10:08:21 +0800
+Subject: [PATCH] configure.ac: correct the version
+
+The source is here:
+https://salsa.debian.org/cinnamon-team/libtimezonemap
+
+Upstream-Status: Pending [ register account rejected ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3f74dae..24eb0e5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1,5 +1,5 @@
+ AC_INIT([libtimezonemap],
+-        [0.4.4],
++        [0.4.6],
+         [http://bugs.launchpad.net/libtimezonemap],
+         [libtimezonemap],
+         [http://launchpad.net/libtimezonemap])
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index bafe7af040..3f37890e8d 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,7 +4,8 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz \
+           file://0001-configure.ac-correct-the-version.patch"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
-- 
2.34.1


