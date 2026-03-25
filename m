Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBB8103A99A
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 02:20:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13745.1774405241105666360
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 19:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CcVDADtZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7544ec598e=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P1j2Wq3413127;
	Wed, 25 Mar 2026 02:20:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wkK6f/BJajWA63gOdfQw3oBzjn8sJqsEpwfUONX+wrU=; b=
	CcVDADtZtrmIzfJrbAzDvoND4JdeWhhhe/aBeDyyl8rWIyO+zJGnHuV6QeFfUJIv
	u46C+EiWkSRChTFzjZxHgI2EVY6J4x/D4xE4PgR4VpuFf98fbruBmGxF/pzDChSn
	MlXNfzZoPQMxrTsOcQ8PGhfChj1k1UDKfDwR9uKrglXp20Kl+KkjrEbYofO1rbtc
	3XgMcXSLh8KaOe0b4h78gqT4sKPYX6uWdGRQ7edYPa5r/UPETw+m49PGmTQtuLbf
	6K+cGzyAqTFzTW/biY3AGwwCK+rDh8Jqu3Ajt2r5h96EQ8psaxgpd1bh+z/SIRNk
	ZSb3YQWGyhS8qFnjDcerIA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj84e42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Mar 2026 02:20:38 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 24 Mar 2026 19:20:37 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 24 Mar 2026 19:20:36 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <jinoabraham26@gmail.com>
Subject: [meta-oe][RFC PATCH 2/2] libspdm & spdm-emu: update arch map
Date: Wed, 25 Mar 2026 10:20:31 +0800
Message-ID: <20260325022031.2902555-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325022031.2902555-1-kai.kang@windriver.com>
References: <20260325022031.2902555-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZzyuG1W8_1jChaThfwOYhIp5dCo4AS3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAxNSBTYWx0ZWRfXxWQbFaKLmIJh
 85RfC+r9Brwz6p1ZxtxNV/ahWguejhYbsOz5FEt3LQS6Mn7ggCTk7qZMiAIMPv9UrZEY5tJhkIN
 CK+MZXuDEjgvTIA4hRpfABQ+uop/k4WC/0W3DHvxWzGhXvbsbnJEtBIwVoGwdvYXyGe6mpv6Oop
 F1jQTUP9UfX6Dnu4acaFCBTXprbPnZ9pTnZ4ae6lHIEAM5gPIXyQ0R1RZvlZeLb25qpjUdw3jKB
 oMj66lftkHDyTCEpLrC7OQtK1zfO5M8OK9FGFCSKZuX7IeKOOkYrzjpieykDLYpgpC92cdDO+n2
 Wbh15Zu7NHke+9DmZRTzWAQDVqm5jFvOe9CEqAukSYI74xgItDP8wsNM8gGHf0jd2QR7Ef/e98E
 zV5RdcLYgGnea757mTXH6bilkgYR4Or38f4yFWs+FLPX8xNyU/d+NU1yinM//FzS3ZM81BZSgqV
 J/VsEf7BhKvPQ8pU2iQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c34676 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=Y_TjiYi3DC5Lt6NyRi4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZzyuG1W8_1jChaThfwOYhIp5dCo4AS3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 02:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125597

From: Kai Kang <kai.kang@windriver.com>

It fails to run `bitbake -p` for qemuppc64 with errors:

  ERROR: /path_to/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb:
         unsupported architecture 'powerpc64le'
  ERROR: /path_to/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb:
         unsupported architecture 'powerpc64le'

Add qemuppc64 default TARGET_ARCH to the arch map.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb | 1 +
 meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
index bc241b5594..ae196946d9 100644
--- a/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
+++ b/meta-oe/recipes-security/spdm-emu/spdm-emu_git.bb
@@ -28,6 +28,7 @@ def get_spdm_multiarch(d):
         "riscv32": "riscv32",
         "riscv64": "riscv64",
         "ppc64le": "ppc64le",
+        "powerpc64le": "ppc64le",
     }
 
     if target_arch in multiarch_options:
diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
index 75c51b92d9..04f1ffc1fc 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
@@ -37,6 +37,7 @@ def get_spdm_multiarch(bb, d):
         "riscv32": "riscv32",
         "riscv64": "riscv64",
         "ppc64le": "ppc64le",
+        "powerpc64le": "ppc64le",
     }
 
     if target_arch in multiarch_options :
-- 
2.34.1


