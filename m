Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C920C71143
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 08:41:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7992.1749717664181856061
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Jun 2025 01:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=825815661b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C6KxWE014717
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 08:41:03 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd959rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 08:41:03 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 12 Jun 2025 01:41:01 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 12 Jun 2025 01:41:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] dialog: fix /usr/bin/dialog not found for multilib
Date: Thu, 12 Jun 2025 16:41:00 +0800
Message-ID: <20250612084100.173256-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684a929f cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=nJAM55PacRje2yzGocsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2NiBTYWx0ZWRfXyuKxUnr5dvta uARrucPHSTU8w+ciKS2Gb2Dyxnp4Ll6DBL94Cg/zWfKtp3E8zVtEeTk0dQ38IcGAvPDHVIEmGK0 pEPQEz9hHEKGKUT+pvk8sxb22mOjJCHCWsadYLWd/AwG2G5xvZyXnNN5usumWP7BvGr/Gh44CMa
 XXR8sXl9SkVcOojz8BiEi4bBC5r/oYUJE5hESTq030WyXXAuKmZOHq61WLcBpuqRQElQMUp7NvS SGWhmeNq12cONidXrjHS/IEYtwAVMZ8CPTBzJK+BnTNTQ93HMJomEZw843HFsc5zQ6HFZiM0gyh lr3DTgc9vUfTZ2Wja9mgGMUMWBWGHyp3Gdenvq8wJNHf9dtSiZirvkXwI2zCB64rWOH0U0GD3vC
 rbu1mnXBzrhcPqJcFhAw+Sd5ZR9KkeJxPJbuxeJ/J60i2BSZMX2ENKSvfRubfwqdpSZLmMFx
X-Proofpoint-ORIG-GUID: BTa80UcxYbzNJy1UOZFcjdHxu3mrjv5T
X-Proofpoint-GUID: BTa80UcxYbzNJy1UOZFcjdHxu3mrjv5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_06,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=980
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Jun 2025 08:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117884

While multilib was enabled, /usr/bin/dialog was not found,
but /usr/bin/lib32-dialog existed

root@intel-x86-64:~# which dialog
which: no dialog in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)

root@intel-x86-64:~# which lib32-dialog
/usr/bin/lib32-dialog

Due to commit [2f7b184cda dialogp: By default, dialog_1.3-20250116
renames /usr/bin/dialog to /usr/bin/${HOST_SYS}-dialog.] applied,
it created a symlink for dialog, use BPN to instead of PN to fix
the issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
index 65ccaeb254..f2dbe4029b 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20250116.bb
@@ -30,5 +30,5 @@ do_configure() {
     oe_runconf
 }
 do_install:append () {
-        ln -sf ${bindir}/${HOST_SYS}-dialog ${D}${bindir}/${PN}
+        ln -sf ${bindir}/${HOST_SYS}-dialog ${D}${bindir}/${BPN}
 }
-- 
2.34.1


