Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D3CC61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:26:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17956.1749047172176756746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jun 2025 07:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=825020491d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55427b17023528
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Jun 2025 07:26:11 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtmy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 07:26:11 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 07:26:09 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][walnascar][PATCH 2/2] c-ares: update 1.34.4 -> 1.34.5
Date: Wed, 4 Jun 2025 19:55:41 +0530
Message-ID: <20250604142541.1251029-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250604142541.1251029-1-yogita.urade@windriver.com>
References: <20250604142541.1251029-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: T79_4rVaagClds-68G-I6w8zJo8LRv-u
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68405783 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=p_pR1EfkuHc1GyC3nJ4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMCBTYWx0ZWRfX81/2cxwuhxH4 S52m6O5db2Z7b9APytreZbvaWYZOZJ+ybHl0tg2Cg2pS9DAbO1ruNkCb48PmUbuKMpYc0g4++te WssSEpZ/7uOMATVdFHx+VGYh3FbnrMhJB/xtWA+iUHE3BozNHtU+Q3VDQT0sxSmoVx0i3q1XwRP
 t4bZk/UhXo1Gt6nJcYgfzyqEyzevLzcTQNcTeoMNDUv4WHXj/ejrx8JxR/KMySffeX+Q74bzK0V AFpTw9iZGbTCXrLXSDexOXwdex7mjKcAQTHazYAyTuqvC1vq13ugV+VOEB/8OyC8oOne6+k2y2h 8owuUVIt6bBLhNiGdX5xaNU5FUpmsDrHg2QBZ+1L0wG9mDkJC63m9tJF8JJ+AbKFOm/HZOMPpzx
 hAfolg3anp1xVZEjQqnH5SGHuz6ipiDe4dFlybWwlV44xgNrjybvimkhiPWoul3OSD7R1FX6
X-Proofpoint-ORIG-GUID: T79_4rVaagClds-68G-I6w8zJo8LRv-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 14:26:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117741

From: Jason Schonberg <schonm@gmail.com>

Changelog: https://github.com/c-ares/c-ares/releases/tag/v1.34.5

Security:

    CVE-2025-31498. A use-after-free bug has been uncovered in read_answers() that was introduced in v1.32.3. Please see GHSA-6hxc-62jh-p29v

Changes:

    Restore Windows XP support. PR #958

Bugfixes:

    A missing mutex initialization would make busy polling for configuration changes (platforms other than Windows, Linux, MacOS) eat too much CPU PR #974
    Pkgconfig may be generated wrong for static builds in relation to -pthread PR #965
    Localhost resolution can fail if only one address family is in /etc/hosts PR #947

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../c-ares/{c-ares_1.34.4.bb => c-ares_1.34.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.4.bb => c-ares_1.34.5.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
index 1fee769f25..b6945f221d 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.4.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=d3e72a10e08191f2ca1be3f3228d78f3"
 
 SRC_URI = "https://github.com/c-ares/c-ares/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "fa38dbed659ee4cc5a32df5e27deda575fa6852c79a72ba1af85de35a6ae222f"
+SRC_URI[sha256sum] = "7d935790e9af081c25c495fd13c2cfcda4792983418e96358ef6e7320ee06346"
 
 PACKAGECONFIG ?= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[manpages] = ""
-- 
2.40.0


