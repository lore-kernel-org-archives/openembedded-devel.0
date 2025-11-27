Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABE4D116EA
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 02:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10058.1764211330204791084
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Nov 2025 18:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O4e4qP7l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3426dc4577=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR1kZsK4102368
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 18:42:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=P+A6+1LNJMTBSbEx3fMG
	q5n99k3NUkFX0L6Do61I1Yk=; b=O4e4qP7l/IpVSCXU41BSh+5JhLBEq3HyF05H
	43/lbmCQxGXWi8n0xaeVRDh+i/4YDRCxPEY/baflGz/Zybn5aHfvtbSxXgcR/FHL
	E63bN9oIUAxEIg1Vnv6LckPNx9DlMRQwKu9l3b6E8y+jHNN5vxXbFBkNrRZonh1n
	KcjzbvBjF7b4QwBQpdP3qybXabUGJnXEMx2JSpARCRY0Z518owEFMRgiGNDGDX3t
	eq2iRfD8rEe9UF4str5pGL2xFOMDxodFB6FSqq60stvLPEBYruTi8pBALbme2Wg7
	SS4h7JBs/5i7jhaV/vuQccxLVSUuUGwGFrx21lTyzcur2XndEg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak9b5d681-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Nov 2025 18:42:09 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 26 Nov 2025 18:42:09 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 26 Nov 2025 18:42:08 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] hdf5: fix do_package failure when multilib enabled
Date: Thu, 27 Nov 2025 10:42:07 +0800
Message-ID: <20251127024207.1486736-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=fozRpV4f c=1 sm=1 tr=0 ts=6927ba81 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=qWz0Vc7-ULiSU3OosZEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDAyMCBTYWx0ZWRfX4pQZB6Bs7aDV
 VrF2UHK7+ebXgPh2gw9OPGlhYuj82t5DVx5dGB6gmIJypAAa2ACRF/1oHYZgWhtO287S+zvfDVX
 UDwgKiLsP2jRBRe0sJRkTaRxvjNcp+i2M/CDwAyAp0ySmx7nWG7DIVfLvr39ZADj/Q/WBDfr29V
 U1qF3O3pLUKMgK0kgs9ZiBy90NTd1EknKpz6hFrybRaD4CMrr5mf1jaKj92yCMBxorUBi+G0n4z
 7MK/q+x19AjCjAGLm5VKG/wgXHYEd3euwo2tNWF4QdTNYiBGmao/bxse43jg09+Bu2NwCndRKIU
 dZu0kAYRbTXJu1iydv2dIxCQ0IRlGgkCuQqJMyZ70tO9hj611UoAGQerKNe7iw7l+sUCdIRxwVB
 Uw95F1g1IY/w6uSAhX2BREHfZt/izQ==
X-Proofpoint-GUID: QEtfljnZMnq_SMFY2O3uab9_HtUzqNdD
X-Proofpoint-ORIG-GUID: QEtfljnZMnq_SMFY2O3uab9_HtUzqNdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 02:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122102

From: Changqing Li <changqing.li@windriver.com>

After upgrading hdf5 to 2.0.0, h5cc and h5hlcc will only be generated
when pkg-config is found. With current default config, it will not be
generated, remove related configs to fix do_package failure

| DEBUG: Executing shell function multilibscript_rename
| mv: cannot stat '/tmp/work/cortexa72-wrs-linux/hdf5/2.0.0/package/usr/bin/h5cc': No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
index 79ce8a018d..798ca1b83f 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71a191398102f76050a4e56e78cb4891"
 
-inherit cmake siteinfo qemu multilib_header multilib_script
+inherit cmake siteinfo qemu multilib_header
 
 DEPENDS += "qemu-native zlib"
 
@@ -40,10 +40,6 @@ gen_emu:class-native = ""
 
 do_unpack[postfuncs] += "gen_emu"
 
-MULTILIB_SCRIPTS += "${PN}:${bindir}/h5cc \
-                     ${PN}:${bindir}/h5hlcc \
-"
-
 do_configure:append() {
     sed -i -e 's|${WORKDIR}||g' ${B}/src/libhdf5.settings
     sed -i -e 's|${WORKDIR}||g' ${B}/src/H5build_settings.c
-- 
2.34.1


