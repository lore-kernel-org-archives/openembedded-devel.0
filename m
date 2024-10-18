Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A6B2D3C55A
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 07:27:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16884.1729236461649651103
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 00:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=002138ef9d=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I5i51b032052
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 07:27:41 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42a3dday5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 07:27:40 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:27:39 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.43) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 00:27:38 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Changqing.Li@windriver.com>
Subject: [PATCH][meta-oe][scarthgap][master] vlock: fix do_fetch error
Date: Fri, 18 Oct 2024 15:27:37 +0800
Message-ID: <20241018072737.2658207-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bHI-3SltvF_int0zi9FlwDIF1aZIsrKT
X-Authority-Analysis: v=2.4 cv=EqyArjcA c=1 sm=1 tr=0 ts=67120dec cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=DAUX931o1VcA:10 a=t7CeM3EgAAAA:8 a=7mOBRU54AAAA:8 a=G-axfLThCGkl4GXj2LMA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=wa9RWnbW_A1YIeRBVszw:22
X-Proofpoint-ORIG-GUID: bHI-3SltvF_int0zi9FlwDIF1aZIsrKT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-18_03,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410180046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 07:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112975

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:

WARNING: vlock-2.2.3-r0.vr2401 do_fetch: Failed to fetch URL http://distfiles.gentoo.org/distfiles/vlock-2.2.3.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta-oe/recipes-extended/vlock/vlock_2.2.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
index 455bda1d76..84289515ef 100644
--- a/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
+++ b/meta-oe/recipes-extended/vlock/vlock_2.2.3.bb
@@ -9,7 +9,7 @@ SECTION = "utils"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
-SRC_URI = "${GENTOO_MIRROR}/${BP}.tar.gz \
+SRC_URI = "${GENTOO_MIRROR}/37/${BP}.tar.gz \
        file://disable_vlockrc.patch \
        file://vlock_pam_tally2_reset.patch \
        file://vlock-no_tally.patch \
-- 
2.25.1


