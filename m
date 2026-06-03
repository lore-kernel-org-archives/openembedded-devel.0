Return-Path: <bin.cao.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99A9CD6E4A
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 02:04:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11297.1780452272214489417
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 19:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bkKfE26l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061491f574=bin.cao.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6530o38m3012795
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Jun 2026 19:04:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=aSIpUzCaWfZ8Ori6wZ43
	gWRY+9fRpee0OhIbWmlZ7ug=; b=bkKfE26lxbHwpj3Y3IdOhPcAUlnsS9hXxsoE
	lAGy3N0xp1nXJn/Mulk5V7R5eqZHKlyi37TRJuvqbaH+BHsR5HXymkk6FR3nQa/k
	8OC8YU91qx7d8foE7XpuyGjeJQ+QXm8YLObxKBMkKmnPgBOW6gu+YbByyhZEPDP2
	U7S4/9ii3uS6HEcJJn+dRU/1J1ehfYW9NEgAZYJku1Yix68P0C3nmUGQRcjoPk18
	U5zCM/VLT+9hch++gJgl1xRiQ8rDG0ORf9DBrPqhNtCgVBVosZtrg/5rkSQRU+uF
	Rqa1CtKRy4hH8t+Av5aG+qlYq3RVmuKQZNnW46HpZwmF+NPeaw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydedj5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 19:04:31 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Jun 2026 19:04:31 -0700
Received: from pek-lpggp2.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Jun 2026 19:04:30 -0700
From: Bin Cao <bin.cao.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] nodejs: fix v8 -Wtemplate-body build error with GCC 15 on ia32
Date: Wed, 3 Jun 2026 10:04:29 +0800
Message-ID: <20260603020429.1147449-1-bin.cao.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDAxNiBTYWx0ZWRfX4fcFsSNhU7Ug
 OjNQGYatfPDLAXkVfaEJf5JmE5gn6J5PuHclpAqRqqCBPcZNdjrYpgOmY9qWxn4TjTtvA0LRdPw
 t1fCwdavCJzM/3BQ4hGQObI3NzQgWhuOMEEZ/AuMe38GMAAzqZV3CgnwLH1yCrM7jqhsb+FUCaP
 K2rTiW6Bbnsk2I91nN8GZZqood1z88otSqwxbBd/f1olGn4I3Mjd7j2g0TInrFDfTgBS/fuiUGJ
 cc+P/Q+XbN8ojJ005Sv4zIRywiEQ2b5K6bhvbQUgvxyHgqTMh9dNdJJ8c1YRtIRNLIAToBe1q6t
 K+LIi6NktC48Gi/F4B5fmMqzV27ziOBy3ZI1i6L71YJy/3I3m2KyFY2FOmmAKiC3hz3iSNxbGYr
 V9TdY+i+nQSqDXSnEsC4xquxmtomXU8fooGzE2NdN1mlgJ3bmA0C/5CbvzUr8TPXPXPx/Gj/P4r
 Gd/dTktGUr+uckxpU3g==
X-Proofpoint-GUID: AujuOXXeSfjcgjcnSmO4x4WWC6vNnnl8
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1f8baf cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8 a=-LCu6K_DAAAA:8 a=t7CeM3EgAAAA:8
 a=B5ba0yYInubKTwpbWBMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: AujuOXXeSfjcgjcnSmO4x4WWC6vNnnl8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030016
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jun 2026 02:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127373

GCC 15 introduced -Wtemplate-body (enabled by default as an error) which
performs stricter name lookup checking inside template bodies. In the
Int64LoweringReducer template class (only compiled for 32-bit targets),
the expression `__ Tuple<Word32, Word32>(...)` is ambiguous in a
dependent context because GCC cannot determine whether `Tuple` after
the `__` macro expansion (`Asm().`) refers to a template member function
or the struct type `Tuple`.

Add the C++ `template` disambiguator keyword to tell the compiler that
`Tuple` is a dependent template name. This is a minimal backport of commit
7772a2df9d0b4db9947dbb902b4aec33c35401c0.

Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
---
 ...plate-body-error-with-GCC-15-on-ia32.patch | 52 +++++++++++++++++++
 .../recipes-devtools/nodejs/nodejs_24.16.0.bb |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch
new file mode 100644
index 0000000000..4053f97053
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-24/0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch
@@ -0,0 +1,52 @@
+From 9f1a2b3c4d5e6f7a8b9c0d1e2f3a4b5c6d7e8f9a Mon Sep 17 00:00:00 2001
+From: Bin Cao <bin.cao.cn@windriver.com>
+Date: Thu, 29 May 2026 12:00:00 +0800
+Subject: [PATCH] v8: fix -Wtemplate-body error with GCC 15 on ia32
+
+GCC 15 introduced -Wtemplate-body (enabled by default as an error) which
+performs stricter name lookup checking inside template bodies. In the
+Int64LoweringReducer template class (only compiled for 32-bit targets),
+the expression `__ Tuple<Word32, Word32>(...)` is ambiguous in a
+dependent context because GCC cannot determine whether `Tuple` after
+the `__` macro expansion (`Asm().`) refers to a template member function
+or the struct type `Tuple`.
+
+Add the C++ `template` disambiguator keyword to tell the compiler that
+`Tuple` is a dependent template name. This is the standards-correct fix
+and is backward-compatible with older GCC versions.
+
+This is a minimal backport of the fix already present in upstream V8
+(main branch), where the method was additionally renamed from `Tuple` to
+`MakeTuple`.
+
+Upstream-Status: Backport [https://github.com/nodejs/node/commit/7772a2df9d0b4db9947dbb902b4aec33c35401c0]
+Signed-off-by: Bin Cao <bin.cao.cn@windriver.com>
+---
+ .../turboshaft/int64-lowering-reducer.h       | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h b/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h
+index abcdef1..1234567 100644
+--- a/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h
++++ b/deps/v8/src/compiler/turboshaft/int64-lowering-reducer.h
+@@ -637,7 +637,7 @@ class Int64LoweringReducer : public Next {
+       result = __ Word32CountLeadingZeros(high);
+     }
+ 
+-    return __ Tuple<Word32, Word32>(result, __ Word32Constant(0));
++    return __ template Tuple<Word32, Word32>(result, __ Word32Constant(0));
+   }
+ 
+   V<Word32Pair> LowerCtz(V<Word32Pair> input) {
+@@ -650,7 +650,7 @@ class Int64LoweringReducer : public Next {
+       result = __ Word32CountTrailingZeros(low);
+     }
+ 
+-    return __ Tuple<Word32, Word32>(result, __ Word32Constant(0));
++    return __ template Tuple<Word32, Word32>(result, __ Word32Constant(0));
+   }
+ 
+   V<Word32Pair> LowerPopCount(V<Word32Pair> input) {
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
index 4b9d9c7e19..c9050aedfb 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0006-deps-disable-io_uring-support-in-libuv.patch \
            file://0007-positional-args.patch \
            file://0008-custom-env.patch \
+           file://0010-v8-fix-Wtemplate-body-error-with-GCC-15-on-ia32.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
-- 
2.43.0


