Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0DCC7115B
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 08:49:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3751.1750927766449218096
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jun 2025 01:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827295ca50=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q5mlpN032366
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 01:49:26 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14w81y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 01:49:25 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 26 Jun 2025 01:49:22 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 26 Jun 2025 01:49:21 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [walnascar][master][meta-networking][PATCH] netcf: remove EXTRA_AUTORECONF
Date: Thu, 26 Jun 2025 16:49:21 +0800
Message-ID: <20250626084921.1698090-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 46Vs0PSb1HutD5hW575YKtFjQXYlUdEi
X-Proofpoint-GUID: 46Vs0PSb1HutD5hW575YKtFjQXYlUdEi
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685d0995 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=EKsbETwGN8wA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=4taaBpbIvRurjojsPoIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA3MiBTYWx0ZWRfX/t6CztLu+fYx n4DqlZ8zxCS6qxbvmFoIzHrcy5/0hV0mLzan1rbp8c3KMoZkV4AFezb/psqlRw8QeQJZ+khoWaf dp5XM76+NmQNY5p/DNH0sx7OnjEGQpHFz0SvInT1gpAJJCGmmwxKLdodC42iCrfCh0N5iDWwM+j
 Vqeq7SOR6gWLujS0ygobebXM8d09aBxpaSKtHttjV/qeGrMg2W+5+Zrgvp5FdVNxv+I9tutK5vM LR8LjSW6NBFG4ABGydtrtEPzlMn+NjaZSjckgliGbUYseCEnnaNcwc67ahlal+PdhHNU31sVzkA adJa3zFjjRFAt5rHMTOov4Prcrm8VfH0iNiifK0W7Suw2iAyAvyHbTRTq1Ne2DG0FEy4JK97dbr
 2Rr/M1LQarJbdRffu2gaqkJB+IKVyfUshl5I6Co5xtjL/ggHptP6XJV2zVw7mOoXGgs8+ve9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506260072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jun 2025 08:49:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118118

From: Changqing Li <changqing.li@windriver.com>

Refer [1], Makefile.am already set ACLOCAL_AMFLAGS = -I gnulib/m4, set
EXTRA_AUTORECONF will cause do_configure failure with long build path,
just drop EXTRA_AUTORECONF.

[1] https://git.openembedded.org/openembedded-core/commit/meta/classes-recipe/autotools.bbclass?id=e718d1be2c4fb54cf363c23f929358e1be68c724

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/netcf/netcf_0.2.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
index cddb0ead2f..4170e9fab0 100644
--- a/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
+++ b/meta-networking/recipes-support/netcf/netcf_0.2.8.bb
@@ -26,8 +26,6 @@ EXTRA_OECONF:append:class-target = " --with-driver=redhat"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-sysinit=systemd,--with-sysinit=initscripts,"
 
-EXTRA_AUTORECONF += "-I ${S}/gnulib/m4"
-
 do_configure:prepend() {
     currdir=`pwd`
     cd ${S}
-- 
2.34.1


