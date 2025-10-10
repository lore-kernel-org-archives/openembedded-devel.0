Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6A48CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 10:31:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6151.1760092277491972493
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 03:31:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LIIFstDL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2378ccb1a6=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A926kQ2342773
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 03:31:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bnMLW9HZBXWUhJ+3pviv
	sNwWjCW4ovSlxzX3CdwR4a8=; b=LIIFstDLNLqRFojEaX/mpT+FoCOrIdvo7Sxq
	+RNV0z5+41hqJCEzJG8Q9iWyZdT4Tai47NIDoWCaYnsHu7Vst+WcQRoW6o4nnn4G
	afLhaDmYcL6TgsaiRDrvSpq7LVcz2vcTsXQ0KgnaScj6LiDt5fg8GozOTMsqbK6s
	47Z8Mp89UAWQgJaZOipJRrMkxklHBSxJ++bvvJZdbynj5mfKEYYpuGz4vikqE8mZ
	eoSCwORAofOl7R/WZaI/LbqLCp/yb/l3sLRCg2RA9l5hRxfm3fCiCgZc38v5JNcr
	wpIYgoDws41/Vc2qjS8do384O/lfRyznSJKTvw9an7xMOb6+sw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2x20wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 03:31:17 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 03:31:16 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 03:31:15 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] doxygen: fix reproducibility issue of doxygen-src
Date: Fri, 10 Oct 2025 18:31:15 +0800
Message-ID: <20251010103115.2808500-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pnrCrM70V0lOqouSgJqT3yxYtykH3sUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA2MSBTYWx0ZWRfX/rzsAvcvSdeZ
 6wuK6kd3jC9gjdH2tQJoYDxT0DDNHF0eK4yb0NxSY4z+Ypyd9QS813d6nO+XYnAsroadwwitZ4F
 0H6iVxdp8DajYgNkR/aJ6Iv++MDmimiMTiQWsw7UdKV/IajJGsSaqwMRP+mPkuzIqgugoJoW6OK
 H761sxuwUL3j+UDKL4M/4PHpGcNFLiPEMEzt7B5sznh7VjE2PrfvqFlR5YoB6ise+UTyBL1W4un
 nHiKBoPp4QDa6cv0SZId4p88SUQb01spUOxZ21GWDD8i+vA64YIztuaFeOW4ykpd1cH3bHIT1g6
 XMVfTTfDlT7L8d+Uqxx5tOMjf5/zkM/Bg6smsV/pUoQBPS3BdjopvvSRIZeaXHGuG06xhh7wkdA
 A0H19H7OhR6WGdNFEzPapg/7BrDaCQ==
X-Proofpoint-ORIG-GUID: pnrCrM70V0lOqouSgJqT3yxYtykH3sUD
X-Authority-Analysis: v=2.4 cv=N78k1m9B c=1 sm=1 tr=0 ts=68e8e075 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=FIvvN1yPdonHhAqECwEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100061
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Oct 2025 10:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120476

From: Changqing Li <changqing.li@windriver.com>

[ snip of CMakeLists.txt ]
BISON_TARGET(constexp
             ${CMAKE_CURRENT_LIST_DIR}/constexp.y
             ${GENERATED_SRC}/ce_parse.cpp
             COMPILE_FLAGS "${YACC_FLAGS}")
[ end of snip ]

bison embeds full paths in its generated headers, eg:
bison -o /full/build/path/generated/example.cpp ...
The header will include:

This make doxygen-src not reproducible, fix by replacing full build path

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
index 512a63549e..73594fc09f 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
@@ -22,4 +22,14 @@ EXTRA_OECMAKE += "\
     -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
 "
 
+do_install:append() {
+    sed -i -e 's;^#ifndef.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;#ifndef GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
+    sed -i -e 's;^# define.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED$;# define GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED;g' ${B}/generated_src/mscgen_language.hpp
+    sed -i -e 's;^#endif.*GENERATED_SRC_MSCGEN_LANGUAGE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/mscgen_language.hpp
+
+    sed -i -e 's;^#ifndef.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;#ifndef GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
+    sed -i -e 's;^# define.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED$;# define GENERATED_SRC_CE_PARSE_HPP_INCLUDED;g' ${B}/generated_src/ce_parse.hpp
+    sed -i -e 's;^#endif.*GENERATED_SRC_CE_PARSE_HPP_INCLUDED.*$;#endif;g' ${B}/generated_src/ce_parse.hpp
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


