Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E50EEA870
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 09:44:22 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68364.1770975861362620548
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 01:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k3XbhcKx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dV8k7OA7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D54Fsk1827975
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IDyRzgzCkyG
	9OarOGULmD0AY+/vQGrlm7d6qii9Q0lo=; b=k3XbhcKxbrDMRMZQzClACSjdVjl
	cqpq8K5/+x4ClZw/uCc7c/sFGU8pqUX/JmYqdpbn1Bvkvekf9tRdDwv5MyQOuu4Y
	/C3dSW6sy5tp2nszIwoXMGtoxb4p5TfTxuK9NE/BX0zRm7s3OM7t6B/QLPhdzYYe
	980qF9iwoE3YLy3E7rxoBpbKrgB6/CwZaKzS9GzoYfYw6SzkkYlwpWt5KGwoYO8u
	mkVDcJPIWnyhi2Ttvh3/UxDF42yFXNshXPWpoAStTeprOepI1Hzqpm+wkm3iGYdZ
	MmpNedBfqN1OM63St4+F6oCsKNVyWbbZ2xLFj3BL/b2nfg+n3EAeJeDkMiw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9wg010eq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:44:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so358447285a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 01:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770975859; x=1771580659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDyRzgzCkyG9OarOGULmD0AY+/vQGrlm7d6qii9Q0lo=;
        b=dV8k7OA7t/mb+0a62NXhAOTnLWqlG74IBBL7oNGe4KDPHNrOOiq/Y0qxLWtiE1thb1
         NucKkp2sEcQ5oJC5+sAQ2CMgQEfID4KWypfbn0+FeiYoTBCTFEMnLWxZ2zxX/GMI6Fcj
         DBeZ+Azf+gBh4pPZriHNWICCGDdyG8pVC6q/cBLYeORLhdl7+u3ZFXsGNlFSmDI5x/wg
         CYExoRksPvsz9Y5ddb9syXr9WGiGTEUuPBDVa022xWoUqZCIi9VLxzKzLEU0c3ZsLRqo
         GDuEWD8KE65Lf8O9LPyAWtvrcftLc38BGUMUCEIUdmcO4fVfSHVJfr1VjLMJSsjIr3F7
         KDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770975859; x=1771580659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IDyRzgzCkyG9OarOGULmD0AY+/vQGrlm7d6qii9Q0lo=;
        b=oMY7b2nWtclHkpXPqu8YE+jPQqPEXhc2xONwoYVrq9R6IsSCnMos4p4TKnJzMIhcqM
         fGMGQsLgZd/dfh2IWh9PLzx267DiK3U9VLOafO7ZaM0MzUaYWj5g6/5jAkpLlyK9Tb5h
         qCGrT+ncs7415GStIEsOquNe9iQlVccjtqQ/voM2Gxhgzb6hcEQOc7g5Y6Jvp+jbhOEm
         uy4c+UHjj03ZjjII1jYTVhwZVoBmCmxidXsRjEMzW3twlqENKa+9Vcb7c2qII+vcUy4f
         TSDpUOBnp88H+3iA+2Tv+AYTBTeBraxD2+5JmS1RdUiyb4YQe0eugpF6SO3HfwS6jsZx
         R5SQ==
X-Gm-Message-State: AOJu0Yy6iW2Pm/6pMDpzjn7KY1Shluh7hObK2+eYNqjt0sEkNMuOBT3I
	ZXfaZtyDIWUmuKVn/hJxCuOOwvFFWAAONBojOAWeqL6HHWbBlTMBLiRPOiI+spQDIQY4ifQ6/fs
	o/btTSIqo/MVfgT4tUtYy+Ot18T2V8w3244QYXkiQsdLzsT3SZcNG68xPNzRz3En1PB4apOtWjQ
	bURezoytbiSTQCne7E
X-Gm-Gg: AZuq6aJeLGZ3eDOB2Bl5POt9SBiqriM5HJ/HP+S1eXGDzivADUxc2z1wPElmunKBmjD
	6xPs6qtasS4ELJN5WGTuqfc1pdF5k7xt0PoPcb4lxJzPj9wUPmSTQk2UmJNfF1CQBPWBQ2WEpFg
	OdpuhNIJCOVs6MYq/8fz2r4i4wCNdd2bqVKwVppmoNUNV/YRgCokfnpvq6mZp++dl7XHMyeJUlD
	QUC/BCa4PNeiClfThySoH9JK+3aVutBi8X0A0tfe3nYDkOAb5FBUAlxAYk5yJNyFflfQ8vHuZcF
	UeQrlAeCb6VoGYNM4XnYjk/ol7lhhSJbOlv9UwB0GiOtaaVzPSLPcne+Ti3B0ksE3XGB9g1Ayvc
	knJKWvZ2RWW0fF9Q8iVjxUYR9AkBseGf2X7sI80NscAndjIN84Qn7VNRLpuRndscmWRAbOpiq05
	5JSE0rDP2daPLElBPPKzjEqoF/slR8Bl7Hy/w=
X-Received: by 2002:a05:620a:7081:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8cb42268fb7mr130234285a.27.1770975859575;
        Fri, 13 Feb 2026 01:44:19 -0800 (PST)
X-Received: by 2002:a05:620a:7081:b0:8b2:ec00:7840 with SMTP id af79cd13be357-8cb42268fb7mr130232685a.27.1770975859104;
        Fri, 13 Feb 2026 01:44:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5acb0esm1435563e87.67.2026.02.13.01.44.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 01:44:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] vulkan-cts: upgrade 1.4.5.0 -> 1.4.5.1
Date: Fri, 13 Feb 2026 11:44:16 +0200
Message-ID: <20260213094416.88437-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260213094416.88437-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20260213094416.88437-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA3NCBTYWx0ZWRfXzaw0V2j+HT6C
 eQ8aXTFnRR4aRkzMPqVZGVxCq7o/tHB2CqDT3H+CjFqHNqIA+Tcd3euwJo/zPMxrWwLDMMCSBXS
 O71VqZ5yJbKWYljtRBTeRQS9Sp4JI1+dBv93/GhSZzVBDB0Rky31n3rDrwbv+mhsh9C4ngVKNQu
 rD4ZpjAV0mZjmNzRGOuMD99n1UFF7yVIjBZCyfn+y/k6k78pNWYEYmAexj4TUiN/cfGNUjSYmS9
 f+c1DTO1kPV0wjP0u64A4SLBpqObCT6Bkm7kbpyWbB98B4VsdLTfg7YV9fcVYfqtA2O/quaxXU8
 zF9cr9rzVwDpOiR4FYvFxSuLsfpGOME1avyQQ1e80exeE7MTLyDweAj/r81cEXoIwBFjfagOip9
 PlpEMBroSLXU5yZXubBwec9zGl77ewUXLDk1SyT+sLi4stEafGdNd5Mdf3iSdRzSOby6dikZjiX
 7a+kNFEm9IopB/QFv8g==
X-Proofpoint-ORIG-GUID: Q-m6xu8sazOBzmAQvnHkPzTNt3J7aoyD
X-Proofpoint-GUID: Q-m6xu8sazOBzmAQvnHkPzTNt3J7aoyD
X-Authority-Analysis: v=2.4 cv=bo5BxUai c=1 sm=1 tr=0 ts=698ef274 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8
 a=6r3AYOCa_0SeUzyjCW4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 09:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124380

Bump Vulkan CTS revision, picking up fixes for sevaral Vulkan tests (and
updating VVS to 0.3.9).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc     | 4 ++--
 .../{vulkan-cts_1.4.5.0.bb => vulkan-cts_1.4.5.1.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.5.0.bb => vulkan-cts_1.4.5.1.bb} (92%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index cf1d24f637a5..52116c8ed724 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.5.0":
+    if d.getVar("PV") != "1.4.5.1":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
@@ -19,6 +19,6 @@ SRC_URI += " \
     git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-validationlayers/src;rev=0a11cf1257471c22b9e7d620ab48057fb2f53cf9 \
     git://github.com/google/amber.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/amber/src;rev=9482448393f3f1f75067cc6ba8ad77fda48691c6 \
     git://github.com/open-source-parsers/jsoncpp.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/jsoncpp/src;rev=9059f5cad030ba11d37818847443a53918c327b1 \
-    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=823364b0c7abdc4f4e39418d3dd9dc11623ef146 \
+    git://github.com/KhronosGroup/Vulkan-Video-Samples.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/vulkan-video-samples/src;rev=aaf915a0e08d679d1e8b835c30e6a346ab0c7ad2 \
     git://github.com/Igalia/video_generator.git;protocol=https;nobranch=1;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/external/video_generator/src;rev=426300e12a5cc5d4676807039a1be237a2b68187 \
 "
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
index 34dc10e44dec..cd5a66fd9fc5 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "db74f486c9d0594bc997f8f79521b424708ba8da"
+SRCREV_vk-gl-cts = "7b7c6cda940bec82d1c5a8c39048728d9bd32f39"
 
 require vulkan-cts-sources.inc
 
-- 
2.47.3


