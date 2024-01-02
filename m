Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8383AC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 08:50:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.25261.1704185444343243357
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 00:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jDOK/apc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1731cd692e=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4026xhib014016
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Jan 2024 00:50:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=kZFaj
	U8yuB9iELxwjOW2Ziboldo5DoRa2nYH81NaHc0=; b=jDOK/apcuzRqI1jRd7ZFq
	zJfD/bfIePK4/YYVhTH541RizlM6j9cz1ATqXWV5QmwMmDJBtaeOJZnvIuwvRXNJ
	xv/fSdBWYimH3O0efIV0H0PXIQ8FPIYx5gteH4xa9GPljDtQ+M1Vt8MZvThKbK/I
	YCZCKUnLQU7P+Pk82p+ZbIAYcqqeZMuDBhIBH61EhUX9yn9gbimaEPOl6Kbi1vbr
	doaBPbQ58HL7zI6Z1rBkxe9dXlRCIobkxuEVBebi58lgczc1MYBCG4bS0dqG7X8r
	COuIHANtcv5WZOr6gWwi6eZXt4hkzN1tg7YflIdVDS3kEF8mP/fauaND0zPLvwAb
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vafc4ae5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 00:50:43 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Jan 2024 00:50:47 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 2 Jan 2024 00:50:47 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] v4l-utils: Add PACKAGECONFIG for v4l2-tracer to fix determinstic build
Date: Tue, 2 Jan 2024 00:50:42 -0800
Message-ID: <20240102085042.3151355-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: x_Vjb4EP-LOhf8936QveaFUeUQ9QdX1f
X-Proofpoint-ORIG-GUID: x_Vjb4EP-LOhf8936QveaFUeUQ9QdX1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=673
 mlxscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401020067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 08:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108006

From: Robert Yang <liezhi.yang@windriver.com>

Fixed do_package error when json-c is in the build dependencies chain:
ERROR: QA Issue: -dev package libv4l-dev contains non-symlink .so '/usr/lib/libv4l2tracer.so' [dev-elf]

This recipe builds out files such as av4l1compat.so v4l2convert.so and
libv4l2tracer.so which are not symlinks.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
index c02645a6b8..f314d9b6ae 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.24.1.bb
@@ -24,6 +24,7 @@ PACKAGECONFIG ??= "media-ctl"
 PACKAGECONFIG[media-ctl] = "--enable-v4l-utils,--disable-v4l-utils,,"
 PACKAGECONFIG[qv4l2] = ",--disable-qv4l2"
 PACKAGECONFIG[qvidcap] = ",--disable-qvidcap"
+PACKAGECONFIG[v4l2-tracer] = ",--disable-v4l2-tracer,json-c"
 
 SRC_URI = "\
     git://git.linuxtv.org/v4l-utils.git;protocol=https;branch=stable-1.24 \
@@ -77,7 +78,9 @@ FILES:${PN} = "${bindir} ${sbindir}"
 
 FILES:libv4l += "${libdir}/libv4l*${SOLIBS} ${libdir}/libv4l/*.so ${libdir}/libv4l/plugins/*.so \
                  ${libdir}/libdvbv5*${SOLIBS} \
-                 ${libdir}/libv4l/*-decomp"
+                 ${libdir}/libv4l/*-decomp \
+                 ${libdir}/libv4l2tracer.so \
+"
 
 FILES:libv4l-dev += "${includedir} ${libdir}/pkgconfig \
                      ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
-- 
2.42.0


