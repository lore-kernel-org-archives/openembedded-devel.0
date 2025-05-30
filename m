Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFDEC54FB3
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 02:42:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2274.1748572921727962995
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 May 2025 19:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8245d0438c=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U2BPHt022207
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:42:01 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d45yxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 May 2025 19:42:01 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 29 May 2025 19:41:41 -0700
Received: from pek-lpg-core6.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 29 May 2025 19:41:40 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-initramfs][PATCH 8/8] dracut: set DRACUT_FULL_VERSION to PV
Date: Fri, 30 May 2025 10:41:51 +0800
Message-ID: <20250530024151.4152523-8-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250530024151.4152523-1-changqing.li@windriver.com>
References: <20250530024151.4152523-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UWevOnJ25kEHOCblDNkkMjvSHf3F8OlP
X-Proofpoint-ORIG-GUID: UWevOnJ25kEHOCblDNkkMjvSHf3F8OlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDAyMiBTYWx0ZWRfX604AbepxlOng 0U/Ln+JpAcBYiijee9iNREeiwqBlrTns0E6SvLQiXwRsA1kXHBT1hDCCtjkB32FqLn4dhyuwb7M wyS4ey601+O5W3sJnppUucPAqJDnaHXU4U75GKEFlS3PW0oVcfeu3+U7kjPWFFIjaMzN4b4/r9H
 siL+q9Ur+MsHf6AdHk4OHfzoOuFOtAbUmd/T2qY5LiwSEFAg4cvMIetZN7J/jQnajLo5EYXlWo4 bSSJEaq7ig2Ej08mbjs3BY5nsz2u8Gi2NXG6qC9Gawlnq5FMfwBagHKo5zwJrtW9rSr9J4z3X9j s5eyhlIVHqQYT2yARH11SWF8JBlCfql9qHAxFENC254cXe+4KqwDe8PFTOBhYHHzDPvR/Cuu87v
 exUSa2a72SOUCZBVi9pmWes5dGl7STrkwkC3BhimZdbwwxknHyqBbP77UkKmBejirLfJcYPE
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=68391af9 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=dt9VzEwgFbYA:10 a=t7CeM3EgAAAA:8 a=tFQAytT4SFPGcj8ao_8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_01,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505300022
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 May 2025 02:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117664

From: Changqing Li <changqing.li@windriver.com>

RACUT_FULL_VERSION is conditional assigned in Makefile as below:
DRACUT_FULL_VERSION ?= $(shell env GIT_CEILING_DIRECTORIES=$(CURDIR)/.. git describe --tags --always 2>/dev/null || :)

When build from git shallow tarball, since tag info is not included,
956c087 is returned. This will make dracut version in dracut.pc
different with build from git repo.

Set DRACUT_FULL_VERSION to PV, to improve reproducibility for this
recipe, and also fix the version mismatch warning

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-initramfs/recipes-devtools/dracut/dracut_106.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
index b70ee4baeb..871119521f 100644
--- a/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
+++ b/meta-initramfs/recipes-devtools/dracut/dracut_106.bb
@@ -35,7 +35,7 @@ EXTRA_OECONF = "--prefix=${prefix} \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,,,systemd"
 
-EXTRA_OEMAKE += 'libdir=${nonarch_libdir} LDLIBS="${LDLIBS}" enable_test=no'
+EXTRA_OEMAKE += 'libdir=${nonarch_libdir} LDLIBS="${LDLIBS}" enable_test=no DRACUT_FULL_VERSION=${PV}'
 
 CFLAGS:append = " -fPIC"
 LDLIBS:append:libc-musl = " -lfts"
-- 
2.34.1


