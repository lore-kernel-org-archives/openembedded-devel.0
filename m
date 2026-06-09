Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08363CD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 06:57:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73624.1780988237673783391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 23:57:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HTjTE8aZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=062099a0b7=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6595744U1636737
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 06:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=vrNGa0ypNu8A8QP9iNE6Ag6/v6NBMI5BBum0RrJzyBg=; b=HTjTE8aZ/qJ2
	tK51auINfRP4ox7cdvk2v0Xmld4mkDUD1qJLUQ0y203mBvKYZfgMG6vPhlmPxeyh
	Axrj69Mkd5A40dAVO5gPiapxyhbWKos8eip4YkkRe0djchU1l0Ag43p8Y1GDmna3
	Tq356wSmH+6KPUC2/85w/ttRqOsixACCu6kSp7dDEUBOgtrHIsdGpR3xNoGb3COW
	OZ9zHmcQCGBkctnzIdytZIXvmrwftmu0oqQnPqcjLZuN3G2d2VJFc2qXq9rU5ibw
	WUy17Vq/hBNKoG4ETe3fdxE0Nk/j6oPfQRN+6lLlJIAAlYTrdwaMAJRFwDqnt+wF
	wpQ4QLKt9Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7c244-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:57:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Jun 2026 23:57:14 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Jun 2026 23:57:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 4/4] freeradius: Fix do_patch fuzz QA Issue
Date: Mon, 8 Jun 2026 23:57:12 -0700
Message-ID: <20260609065712.2888126-4-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260609065712.2888126-1-mingli.yu@windriver.com>
References: <20260609065712.2888126-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2MyBTYWx0ZWRfXxc4xmtpg0Egk
 1CaRv37dnNC8YRzeosjoRg3y7W6Q6ayMhTfh7XJGZZhj+kvKzQkw3l/ivAtVhTzbDPLVhOCsfWO
 Ztyb1o/+FIIubsZDtJAq+mCJdaw5BcqFA2g8Vo12v8ccgzXNdeOxEkJvb6OvafzvxKEcaV1gIja
 1d9kgRYX/nGd7ipTFxvsmOI5ia/zYzo76YAW0SSCE/idWSXc3ZNvjlR8kxFmc53UCkTbI5DndVV
 P48lUDCa+WNaHzyTifEjKNvXyzTjZdHRr2mg/muaF5b58W4f2LTVI6uIzpxCrgGTB1DoqWIl9Ra
 g3n9xc8KyUy9nBJZB79lfntr+GkWGXtS4kMBmcwreDMSFWZlYWe+WbheAQmM8pIkwKUVnOqDFXW
 lCxYK97w/oRCkr1kFkXJMIkBYEYepWKlydVYhsrsoRkoMZHOPF0FAJHfl2Fv3lSTlTFYCJc0l0I
 sNQo8X3f7qxUaAwNP8g==
X-Proofpoint-GUID: FhQH8GZbQenRrMaqD9_PxaZxljljwBQN
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a27b94c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=9zdnK8HaVgD9PswVXLsA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: FhQH8GZbQenRrMaqD9_PxaZxljljwBQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 06:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127435

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: freeradius-3.2.9-r0.wr2600 do_patch: QA Issue: Fuzz detected:

  checking file src/main/version.c
  Hunk #1 succeeded at 622 with fuzz 1 (offset 8 lines).

  patching file src/main/version.c
  Hunk #1 succeeded at 622 with fuzz 1 (offset 8 lines).

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0016-version.c-don-t-print-build-flags.patch      | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
index 8917457ec2..6fb9d9fa3b 100644
--- a/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
+++ b/meta-networking/recipes-connectivity/freeradius/files/0016-version.c-don-t-print-build-flags.patch
@@ -1,4 +1,4 @@
-From 99ea83d998d3b8957830afa15cec42ba265b67ca Mon Sep 17 00:00:00 2001
+From ac503b5395d566c677013c051165290ab024cdef Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Wed, 3 Aug 2022 16:44:29 +0800
 Subject: [PATCH] version.c: don't print build flags
@@ -13,10 +13,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  1 file changed, 13 deletions(-)
 
 diff --git a/src/main/version.c b/src/main/version.c
-index 44a6edc699..a0e6f26911 100644
+index 1bdb562..0368fba 100644
 --- a/src/main/version.c
 +++ b/src/main/version.c
-@@ -614,19 +614,6 @@ void version_print(void)
+@@ -622,19 +622,6 @@ void version_print(void)
  		DEBUG2("  unknown");
  #endif
  
@@ -35,7 +35,4 @@ index 44a6edc699..a0e6f26911 100644
 -#endif
  		DEBUG2("  ");
  	}
- 	INFO("FreeRADIUS Version " RADIUSD_VERSION_STRING);
--- 
-2.25.1
-
+ 
-- 
2.49.0


