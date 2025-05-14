Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AD7C3ABD9
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 08:33:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.96948.1747211607253220058
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 May 2025 01:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7229a91613=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E603jk028592
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 08:33:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46mbcjrs4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 08:33:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 14 May 2025 01:33:22 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 14 May 2025 01:33:22 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] polkit: fix do_install failure for sysvinit & libdir = "/usr/lib64"
Date: Wed, 14 May 2025 16:33:22 +0800
Message-ID: <20250514083322.2703865-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mCUlv0Dk79R-gHqLLrzsN0IDusfozvdz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA3MCBTYWx0ZWRfX8gK3gHKMsdXA 98kVX7Pb/bQ4GdhyEyZ+uP/Vbd/UDKhxXaN+5SXoWh92InJjpSSx8SzrsZvFgSuvQuwKydqB9zX FF75rcEAEK9wU06su2kTuHPOhCg7MRN/18A0+AP8jEnCsrJdPz5R/LlZI0QPUpc39N/kxgbAa1Q
 qmr4XThKK+SH6sX2CLsD0MdEE/tOBKMKxGx5UJ/rYf6WmQPQhDrDrHcgMQ5frCouDhjYIgEku8D 0SPlAP8Wr79DHS61DE+SmGlWJKwWvMoRY5r9jLEpwmSGFPsRvwYmAhfr1FmxH8vnpTte1VtloA2 oPyUN6hbMt6YmtW0MrfuOUCbxjZL2sjjsjXHUmWtxlDA5h/DJn0bDvVljiOe8yOMT96cXEt5E9e
 Ui2fbssmyyUzYnhvB3Dj03Ev6RnAE5xCXXSu29cAcLL0CaYOwkzUTpkvPGa4QP0Js5JNV1Ke
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=68245556 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=-sR3NgW99QDOhVrlF5IA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: mCUlv0Dk79R-gHqLLrzsN0IDusfozvdz
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=488 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 spamscore=0 phishscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505070000
 definitions=main-2505140070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 May 2025 08:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117414

While using sysvinit as INIT_MANAGER and libdir = "/usr/lib64" ,
polkit do_install failed at remove systemd directory

...
rm: cannot remove 'tmp/work/corei7-64-wrs-linux/polkit/126/image/usr/lib64/systemd': No such file or directory
...

Force remove ${nonarch_libdir}/systemd and ${libdir}/systemd to assure
all systemd directories clean up

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/polkit/polkit_126.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_126.bb b/meta-oe/recipes-extended/polkit/polkit_126.bb
index 64aba7b2dd..c503ca9dc4 100644
--- a/meta-oe/recipes-extended/polkit/polkit_126.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_126.bb
@@ -49,7 +49,7 @@ do_install:append() {
 	# Polkit unconditionally installs a systemd service, remove it on SysVinit
 	# systems to avoid "installed but not packaged file" error.
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
-		rm -r ${D}${libdir}/systemd
+		rm -rf ${D}${nonarch_libdir}/systemd ${D}${libdir}/systemd
 	fi
 }
 
-- 
2.34.1


