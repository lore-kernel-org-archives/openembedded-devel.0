Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07477CCD187
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 01:58:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3484.1760147885403450758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Oct 2025 18:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DW8BLJ13;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2379325bac=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59B1Qco6483543;
	Sat, 11 Oct 2025 01:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Mv+25/1kd07ad8BfBWxbIDLFd5nDXBIqWMmC2MFg96E=; b=DW8BLJ13BQZS
	y2X0uQANaTFe3e31zgX8+/cjhP1SGMicBmpkdD1PeJn38PJQtPcgUaCAu7aBc4j2
	AGgiZXItCElT3FcNtAtXUfTQD4QPIsLrOaLtOVUUN18A3+MTL6h2smA1y+lVTCe3
	XOl0D4g46CpD+9Q6A6jRutkLm4CMP+qkAMdFYUNnXhoacaxR/jvOkV/64X4ZbhPz
	HpjPzw6sEqbbZwqLgcUlR+Jx79BCIm2hkdWfE794dd29u8hEsjXDls9Gf+ILW/rv
	YrseTuHfoiK07k/P+yCzU9EDHcV5D5NOXkzI4quMx7ybL5mryMmHpu5bD2oEOo/a
	5J1cqd8aZg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewg1tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 11 Oct 2025 01:58:02 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 10 Oct 2025 18:58:01 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 10 Oct 2025 18:58:00 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Subject: [meta-oe][PATCH V2] doxygen: fix reproducibility issue of doxygen-src
Date: Sat, 11 Oct 2025 09:58:00 +0800
Message-ID: <20251011015800.1049257-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <186D1A99E7CAB2E7.15959@lists.openembedded.org>
References: <186D1A99E7CAB2E7.15959@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9QFRJA3o6MKat31eqJL_wFvbZG0GuBa0
X-Proofpoint-ORIG-GUID: 9QFRJA3o6MKat31eqJL_wFvbZG0GuBa0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAwOSBTYWx0ZWRfXyBvb56kQENdk
 99T+VuKywygCLdUNFpoGi5QhJQBKmpKdqPbqbPvIfTRGpl7yYtiCJCbS7h8jLXi/BMMW3FpiLBS
 aj6/UNenJ7Xxi14y/sbGyJBx5JofeM5OTvuQoQx50spGD57vCy0zMx+jlqP1tvIF8q8L5owIh1B
 zfVcucMFDbjrkeyhfwRowLQrjvzTiCjSA34TZdvHwP10tfQYpl1QD9rloDo0uDDgariX9E+Rxti
 IR4QNZFOxt680Oi5XQkY/ARXRwNJU6wzzfG0z7IN1vZ1moso3QaztiVTAYJ9XQKaimE6OSsA8a/
 olx/WI4gArs7HMUXArXMj7SEKHBHXVG7+JH8xyo2ooWrR05OBoaYOBYge2n4O7T2creHRh/Eydh
 wUxTTZfCd5h8ygk4ZpiA+ln4/ZAhlA==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68e9b9ab cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=t7CeM3EgAAAA:8 a=5qK7ct6GHDW5muGWh8kA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510110009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 01:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120487

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
 #ifndef YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED
 #define YY_FULL_BUILD_PATH_GENERATED_MSCGEN_LANGUAGE_HPP_INCLUDED

This make doxygen-src not reproducible, fix by replacing full build path

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/conf/layer.conf                            |  1 -
 meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5b9ceb424e..56aea73b15 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -138,7 +138,6 @@ OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES += " \
     dhrystone-src \
     directfb \
     directfb-dbg \
-    doxygen-src \
     edid-decode \
     edid-decode-dbg \
     editorconfig-core-c-dev \
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


