Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD0CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 10:31:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5851.1760092269109437173
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 03:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OTbw2gNi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2378ccb1a6=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A9KBFo1414195
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 03:31:08 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=WzTebZPme1KAmOR6f2+8
	Cx3squTxVmBdSDaFqAdu8Qw=; b=OTbw2gNi1bv8rdi1o5Wn36laAnTGrHqkaHU4
	jhnKVPTjvScokuD6ubYjS6Hw0Hn0HeI7731Zc6F+3g3q46K0+YRA48tU25uT2Zht
	KcGf8hxUfBxg/mfvO2HAGm9oOMM0v0QRwBBJGwXgTOaBgSHQbTMyiR3zJRYDSXpH
	nvhs1ox61mivt113oiES6hEODF+pPhjprZi68DXYifPRfA9mP253TG/xyUQ45+1H
	S7Q8anVW9Q3Py7N4EeJB9m1Ixi14sV6A6uU/P748I0jUOlQ7lPMtNGLO8Vkk+TUc
	ra6Abl3xFK2QKE7BKbfXr/GK3WolHZM+4S6CQ0b9LWKVbeFzbg==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2ua0mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 03:31:08 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 03:31:07 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 03:31:07 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cdrkit: fix reproducibility issue
Date: Fri, 10 Oct 2025 18:31:06 +0800
Message-ID: <20251010103106.2808487-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA2MSBTYWx0ZWRfX3QZ2f4LgXab5
 0L9UCEqul5dDj5OBRkowcFMTG0C2EEr30TYA729wqi+7Fyl7Ev/Y81ym6d740nJHMbcNtCFrEsz
 IILyM0CYrmJfnMaBqgLkcQ6bD9O/5rdtf/qzGh3R7i0RYECZMGesj61tA3sYSsXoZuIE0RRi8YP
 FG8dxVSOMXFfd1ErD723TIPpyOjsbeCf5inxXdIYTMX4Vzs5ycXyzViRDHehau05zYsa9t3Xj0G
 kQgABVoO19ggMuAh9BNMTq1FtHvJKiIOBa1Csf85BxKHC/YX2JrgdODiCwPRiETWdied7Uxv9hr
 dLyxWyD5CNMdBmrpy3EN1tMNO0NeJ7kgKNrSq+m/ZOwtcXdq5/wq6A6IzegSo8IXGU5jzGzZ3hs
 jCpHr1P7XRMLz0dntoKT+rDmUBZjYQ==
X-Authority-Analysis: v=2.4 cv=ZMnaWH7b c=1 sm=1 tr=0 ts=68e8e06c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=GCL6OueXA7Dzrn8mMJcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fo0qvDbjrYy5-7ADh6ppyOTi7RnRfMga
X-Proofpoint-ORIG-GUID: fo0qvDbjrYy5-7ADh6ppyOTi7RnRfMga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 10:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120475

From: Changqing Li <changqing.li@windriver.com>

Normally CMake uses the build tree for the RPATH when building
executables etc on systems that use RPATH.  This will make the buildpath
included in the binaries and not reproducible, so disable RPATHs.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 16b15f745e..80b5cd527e 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -24,8 +24,10 @@ SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc7
 inherit cmake
 
 DEPENDS = "libcap file bzip2"
-RDEPENDS:dirsplit = "perl"
 
+EXTRA_OECMAKE = "-DCMAKE_SKIP_BUILD_RPATH=ON"
+
+RDEPENDS:dirsplit = "perl"
 RDEPENDS:${PN}-dev = ""
 
 PACKAGES =+ "dirsplit genisoimage icedax wodim"
-- 
2.34.1


