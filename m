Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459F0C83F1B
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 05:18:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14959.1752643081882069737
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 22:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9292c3e01e=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56G4j7dk1713972
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 22:18:01 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wdvdsg54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 22:18:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 15 Jul 2025 22:18:00 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 15 Jul 2025 22:17:59 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jinfeng.wang.cn@windriver.com>
Subject: [meta-networking][scarthgap][PATCH] postfix: fix rootfs file difference
Date: Wed, 16 Jul 2025 13:17:58 +0800
Message-ID: <20250716051758.2412737-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: EhEt8dMJ1lYzEqmF2wg2n03BXFfM7G16
X-Authority-Analysis: v=2.4 cv=JbC8rVKV c=1 sm=1 tr=0 ts=68773609 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=Wb1JkmetP80A:10 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=fWPPgeRKwIsxyyA-Ks8A:9
 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EhEt8dMJ1lYzEqmF2wg2n03BXFfM7G16
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNyBTYWx0ZWRfX411DcnFLqeZU
 BplcnJ07LJDA8c5yT5fU2Qmk5nYesasMckksmIZvDYcDCt22t+PwOklxsnWpe6kSWmSDziiEO1h
 Bx7V1p3BXOF9pQfUYIkD+w9AdKKLGBVfp5EzNmJZ9tXamqGak2TnLponD/304FZv1GX+404N1Yz
 zThfD6QZk5KoW1lDXnjlmnE8QlZf8ggzFZGMAz485XgrESJCW7r+U51Jy/bcJpiEsoYG4U3MFIJ
 RZ1zYsO/FmavjNE2lU4rsDiFD1x4FnmWoODhNFvZHbPVKrnmOjq7S8H717eUAoE/GcNk7J3+Mir
 ZvbRN32gz2su70cCu1Mu3GkZIJuTaF/xhjVcraCMubJwoKLwFphzclTL//0Ikg3rusAn8XI/qBi
 cxTUwgq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 05:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118569

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Rootfs file differs with the same project configure, add preliminary
setting to avoid this.

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...0006-postfix-add-preliminary-setting.patch | 31 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.8.6.bb  |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch b/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
new file mode 100644
index 0000000000..50d0073262
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
@@ -0,0 +1,31 @@
+From c09d377cd3b91c4c4360ebfab5be37f6296ff26a Mon Sep 17 00:00:00 2001
+From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+Date: Wed, 16 Jul 2025 02:54:28 +0000
+Subject: [PATCH] postfix: add preliminary setting
+
+post-install call postconf commands to modify main.cf. When multiple
+parameters to postconf, the order of those parameters in main.cf is random.
+Then it will reproduce random results in rootfs file(sample-main.cf). To
+fix this, add preliminary setting in main.cf.
+
+Upstream-Status: Inappropriate [this is the use of post-install,
+upstream is not affected]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ conf/main.cf | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/conf/main.cf b/conf/main.cf
+index 2ee7996..0c208e6 100644
+--- a/conf/main.cf
++++ b/conf/main.cf
+@@ -683,3 +683,5 @@ sample_directory =
+ #
+ readme_directory =
+ inet_protocols = ipv4
++shlib_directory =
++meta_directory =
+-- 
+2.31.3
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
index 3ec7f22ad3..b0ac51a9dd 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.6.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0006-postfix-add-preliminary-setting.patch \
            "
 
 SRC_URI[sha256sum] = "4b6e17c826cc438cc3016a9c0a55ea7e77c6cbafba7dd57241d81b690b0e9774"
-- 
2.34.1


