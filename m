Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74749C8303C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 00:10:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11079.1751501431626699622
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 17:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927982dcb7=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562Nq67J012521
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Jul 2025 17:10:31 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4cvv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 17:10:31 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 2 Jul 2025 17:10:17 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 2 Jul 2025 17:10:16 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jinfeng.wang.cn@windriver.com>
Subject: [walnascar][master][PATCH] postfix: fix rootfs file difference
Date: Thu, 3 Jul 2025 08:10:15 +0800
Message-ID: <20250703001015.2081443-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rN98FWsjEHLhVJUte3pYBpcbsog0Vl2K
X-Proofpoint-ORIG-GUID: rN98FWsjEHLhVJUte3pYBpcbsog0Vl2K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDAwMCBTYWx0ZWRfXwIDMFRggxQQj 9aPR4rURMY60dtD644nSAySuLNvVvoNTTdvbbazn0gbaXINPaVWA2Evj3XYMQ54FtThjrzJcyTT dqGoLY9iMznKtBf5PdEKKHB+VVM8YJ6Imznvgq1ApsyPBiLdHKIWP2yU2piHRp4r5pMX7kENBYH
 Lwq8j1X1KpqO7LPgst90Dr9ubNG1iagJPAga9HTSQOljvbkTMR1+rxP2dbstsWCpm4d3IpoFhtM Sa4PevsM8DgMBefqjnFM5kwy14zcBHiMvcx9Aml8ekiFqZopqfjGASZ9ViE/P2dgMZqNx58uxZH wZv89an8xoWGeXNFVnMrrberFTpbgHkISjHMC/ywL/rUcK08UoLtCURe96IMHvL3XE9kSOaJrsI
 XgDuoQcHJu5YJpEigM2pQtZJ9k0UolAaqEBRudLAT8IhroIbfPCygIlHmOdR5s2AGrR7yhm/
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=6865ca77 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8 a=ei_PhQR-cJsUnzt3-wUA:9 a=6ft9yNkZjdd813gQxDxM:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_05,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030000
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 00:10:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118203

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Rootfs file differs with the same project configure, add preliminary
setting to avoid this.

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 ...0006-postfix-add-preliminary-setting.patch | 31 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.10.1.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch b/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
new file mode 100644
index 0000000000..62b3cf0c05
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0006-postfix-add-preliminary-setting.patch
@@ -0,0 +1,31 @@
+From a5863e19d298789328e11057c469636aa8775847 Mon Sep 17 00:00:00 2001
+From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+Date: Wed, 2 Jul 2025 10:55:53 +0800
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
+index 1d2c8c2..50398ba 100644
+--- a/conf/main.cf
++++ b/conf/main.cf
+@@ -683,3 +683,5 @@ sample_directory =
+ #
+ readme_directory =
+ inet_protocols = ipv4
++shlib_directory =
++meta_directory =
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
index a85176d871..444bee0668 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.10.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0006-postfix-add-preliminary-setting.patch \
            "
 
 SRC_URI[sha256sum] = "75868db7a8ed252cd3a14c13a3ce383ddd42563160c02027d061202ee36799bf"
-- 
2.34.1


