Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E840CCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 07:28:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2789.1760599718728873651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 00:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CaEonvtJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=238448c8df=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59G6T7Nc3127111
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:28:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=k/MTIomcD30/T2tlifug
	arKV60ifdxaRHuqE9b+3mc8=; b=CaEonvtJTOij3QbPWrHguJz6gksViKy8tIo9
	2zyiQJQDUBzdNFAuXph3BZ3E0Z5tiUerstLgGOUNPO6lTu0njJXf8lnAFx+2H/R7
	+NzWwkX2cNvmO90TChTXvRzcluUzO1S0z7K+2Wjrrz8oU+4S0k8W3OqPWHmjS8N1
	a60fyvohG/escIpfJfOUxCfeXNJVIx4CJuZ2SCqDJxUcoBAuA4TXOGC+TLojBR3/
	M6rvHBaYbTdYLMvty84xW38J6jxLQdeBlZuQcISuA3y2Tz17uGFXYc5CnZF+MMZS
	jK93voymL22bxOS0UMtZ3lDwxzpEuv488py+3fH7B7wJaOBkrw==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qprdwm11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 00:28:38 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 16 Oct 2025 00:28:37 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 16 Oct 2025 00:28:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] bpftrace: fix do_configure failure when ptest disabled
Date: Thu, 16 Oct 2025 15:28:36 +0800
Message-ID: <20251016072836.4173403-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDA1NyBTYWx0ZWRfXwrvq5d2TnoEA
 CMMeapfiPI8E0oB1U+w4YpwyggKoR9pXwE0r1FSNFFmlTF7Fb0bxkaEENon++56XiT53EEnAhZR
 DXaGI/cFJxEtmFniSrzQzygS53hUYRo1kLcgsGY1OCVbTYeKh+z/Kk/3uDXsPlrZ4j6fL0ZTcdN
 Psomh5/nePddy85gdN7E/ekkCDMxBYXA0RhSTr31pL2DT2CaKgtre6RLVTsu9yRtCddUtlyL2sS
 XEJc1uJK2GIs5psSCK82pxODwvSbqRRWarljg3PTJPuWhZJEOcMs5C8YMgjlVc8CTpUBniQgmjT
 pj3dGldtLtUDsiAv3BPBuxu9EewJ+HinJTI5boZ5HTyPs9x6t9EmCZHDE0134yin/2otyy89Lhx
 iC4xkrP6+LKF6t+x+9k307/LI3E5Gw==
X-Proofpoint-GUID: 9Vp22ncUWQ5xpp_pN9EWEDosqX9G6U6b
X-Authority-Analysis: v=2.4 cv=JaKxbEKV c=1 sm=1 tr=0 ts=68f09ea6 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=QRm9OrdMYt10qwfPQsQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9Vp22ncUWQ5xpp_pN9EWEDosqX9G6U6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510160057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 07:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120718

From: Changqing Li <changqing.li@windriver.com>

After upgrade to 0.24.0, do_configure failed with error:

| CMake Error at cmake/Embed.cmake:3 (find_program):
|   Could not find XXD using the following names: xxd
| Call Stack (most recent call first):
|   src/stdlib/CMakeLists.txt:1 (include)

[1] https://github.com/bpftrace/bpftrace/commit/df21d917d9cced77ebde1202c1b3508a169f46a0

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
index f7b2e7485a..50fada36bf 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.24.0.bb
@@ -11,6 +11,7 @@ DEPENDS += "bison-native \
             bcc \
             libcereal \
             libbpf \
+            xxd-native \
             "
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-native', '', d)}"
 
@@ -34,7 +35,7 @@ PACKAGECONFIG ?= " \
         ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \
         "
 
-PACKAGECONFIG[tests] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF,gtest xxd-native"
+PACKAGECONFIG[tests] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF,gtest"
 PACKAGECONFIG[systemd] = "-DENABLE_SYSTEMD=ON,-DENABLE_SYSTEMD=OFF,systemd"
 
 do_install_ptest() {
-- 
2.34.1


