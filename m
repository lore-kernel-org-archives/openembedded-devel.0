Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BD0D31A37
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 09:31:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6616.1768383107486570226
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 01:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ntU3JYJ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=547401f5f5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E4CsLX1315818
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 01:31:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FCP9DB+lSmIJIAAPljVv
	nGWEGtXkNf+XDtYHoX3OVRU=; b=ntU3JYJ0nvQ/OrHoZE1Eusw7oDG2Scu0gd9/
	WDcXEb3gazSomXhGHyYZY4XHnAYLjAXpZeRFgsUy3crdVAkbIAsJsP2od3UO3nxb
	mBFslPa5omgD0+vsLFjJkm6+ZFL+aMFi8VbG75HItmBIWUOXZeJC8sUbXEBSQLvP
	zQCzm5PZjpZ424rjTPoLd6StcYqQ91taOlxFsoXF7PlfhW7qWDl10d0Wm1eKMmPe
	nasJvARCX8rTxJc+SCPVXhwyy2enTuxtMs7Bkwo6825CaIvyRoFneei30UEbY3eT
	3vfZDHC7ThSwCk/bcd9GFbdYUkxYjB0Uz5ruTqj3x3YmfW/71w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0v4jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 01:31:47 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 14 Jan 2026 01:31:46 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 14 Jan 2026 01:31:45 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v3] nodejs: Make prune_sources execute at do_patch phase
Date: Wed, 14 Jan 2026 17:31:45 +0800
Message-ID: <20260114093145.789773-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: HNIZPQF83UWIxZSGD-CMnqpNFdWXW_vn
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=69676283 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=3k9ziyYjAcfRlEKEkpUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3NSBTYWx0ZWRfX4r+Yz6gXpQYF
 ftx7Cp0tUR4NKmAt9F/kfLiLUf81R7ro1b+0OdM+pZzjmmbr9zWcad1hq4ZHB+rPFKIGER5UPcr
 F3bo58ytuc8wwe5cCDWAr8Z+z8PC0s+AuGhu2tI2LIkMmcQlpU5XZbfmCrUdtBqnD3jZG5pcIm6
 F4oqyF6g3NXCQbGxNmCnRXZJFUVMkSJob0P4x0PbUcNobPZXuRN7NIG7RAB6Ffiih1ix/ifqWDq
 vDDSZu+gffMJRl6oVeopLkhJ3CQCEGjpRSovLEkkNEq7D89kBbyDM7527nZ9JvzZU23XfePqE0w
 4vevUVDHirJBmKQMzhxLN1NNJgNVF404mlBDy9SysIu8dnyKR2nlxt2EmIzn8dsbjoGpfVfzjcg
 wBTQ8bBMrbWb+J8Mei9WKvoih08OEmEg1abjdy9WcdM7d1yc3yQqZesENBcXDtXCIqbhsJLp+ZC
 PPjkESSL7NpMdmaOGmg==
X-Proofpoint-ORIG-GUID: HNIZPQF83UWIxZSGD-CMnqpNFdWXW_vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140075
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 09:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123453

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: nodejs-22.21.1-r0 do_patch: Applying patch '0001-deps-disable-io_uring-support-in-libuv.patch' on target directory '/build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/sources/node-v22.21.1'
  CmdError('quilt --quiltrc /build/tmp/work/core2-32-poky-linux/nodejs/22.21.1/recipe-sysroot-native/etc/quiltrc push', 0, "stdout: Applying patch 0001-deps-disable-io_uring-support-in-libuv.patch
  can't find file to patch at input line 27

The sources which related to libuv as deps/uv/ are removed in prune_sources
when depends on libuv.

So postpone prune_sources execute at do_patch phase to fix the gap.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
index 443cdc430d..1ef01cc3b2 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.22.0.bb
@@ -96,7 +96,7 @@ python prune_sources() {
     if 'zlib' in d.getVar('PACKAGECONFIG'):
         shutil.rmtree(d.getVar('S') + '/deps/zlib')
 }
-do_unpack[postfuncs] += "prune_sources"
+do_patch[postfuncs] += "prune_sources"
 
 # V8's JIT infrastructure requires binaries such as mksnapshot and
 # mkpeephole to be run in the host during the build. However, these
-- 
2.34.1


