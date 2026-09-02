Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9A0C61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 01:26:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2767.1788312380154378972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2026 18:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=X+3HpNn4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=HIdKdfK9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTHl5147741
	for <openembedded-devel@lists.openembedded.org>; Wed, 2 Sep 2026 01:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dwzUR8MEV6myS1KR7IZzPK4yrCZhtwfebSj
	cNRV5M/o=; b=X+3HpNn4fsTKHodnOXNoh3y4cAhdKUVH9kARTEZpcQ4uQM9B1Zx
	+pMQPFQcAfUtdGPI1f+KqA+Lm5BvUboopdKZDXupFTTHLSjgnZeaSraQ4w48eYwV
	Pxxq0wwwDXegNKJoUIL0a4OTFJienAwuqgYJhcpuhL0fvsBHpCErEEVQ7QrNniIQ
	/H3n/BnEYLI30UQjas3ljKlX15e+hvxToz1G6hf2JhqNDPALfcpi1MPvlZd8Zmng
	+tqaufAeOVbP5pbVeokXqFKSG4NlCJA/7patwknpXS6aSVBS1jtQsQHtLVMm5H6b
	o5r04N9wvxJNacgCcpE3aWQbIABYxy55QtQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9nk2ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 01:26:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-756261d422dso423803137.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2026 18:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788312377; x=1788917177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dwzUR8MEV6myS1KR7IZzPK4yrCZhtwfebSjcNRV5M/o=;
        b=HIdKdfK9+dWqViPOeJFXlrZoubjdQFv+kBJKKtbenx+sYgvlntiO1AgPiWuuolhDYH
         19UssM0BMN2JZtwW7JiOtDgGnzKNzqjLhglZBRVikHVDOgopvfby1UP/dpdptUjnNYLg
         917iB+c3iFLOkUTjR2v0li24ZHbB8FhoTw8KW/uAGrrO5rsIVRk70C9wJ3AjLI2bYVee
         ra/MPqQKavxk9QkIry44AZltrN7y++nQR2v6u49rZ/GGKiuc/2nRppKX1cPNWhxL2T1p
         IEKHifbNTJ6ZDj+uxlza8tOScA/U9vagEL49cyvKGs2z9ZNcet1IOPxypUEZY8Mv8w6C
         sUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788312377; x=1788917177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dwzUR8MEV6myS1KR7IZzPK4yrCZhtwfebSjcNRV5M/o=;
        b=gIyhGQzkIqqBuBKk8ke8hbokO5T/R5y0aOzvrAqoiejEmPpFyWwcVFpHLb7irMMBgL
         iP4jHTrFUzXpdlblUr6xSEbWv4sQ0uBFY1joBoJSc1eQg0o1I7ckdBCofgiTS9qF9C8Q
         9LJRQX3pGVUiyV00eFEVkuGRsWnHJpIP7vgfcE0c5ij7AnoLLiOynjoF3xKLrAnfiMai
         016DCfQ4EZeu6vbBRomxRfKDBYdUxnQlDEFgPq2JaSyqgPzxDqHPixEAIygGASs/bqlB
         72hDbSYPt1bRM/vcC3ggDwCbKomR9XA49tg5Uw6THKQMHDZNQI3dUQucZHcYV9IiBN6H
         xKTw==
X-Gm-Message-State: AFuF++mh94K2AFi9hSQUIjCSe1/anoqAVNYMIWIz+Bg/0mZPR7+01mYV
	jcX45hayBuyK0Ute5TiO5bPZK+pGPVKIfNf9GqGoELXp90UC55PPx/pt1hEzmun2m2ovSteS+Uh
	nbZdEvhQVuStmRuWWkH0BzhdFp0TignAL1Y2CwaVipErSRvEFNRfpNOeu+E5I9BImqcBzQPRqGp
	kupKnDTIFqZtEppQr3
X-Gm-Gg: AYBFou3XUXLdvuXGwdxt6Ugm4cHVJk4UJXKHSfwOsKkKWUwiQPoIoYZ8HdYbweZBiC0
	WfEN1VvpQ1io058BpaOgdQz5FKhuCQ5FuC9Cm9UiMxuqA8jT4YeQZYtdwv2hAH84o1WvZAP/+tM
	19M590mfJKGqNRl0KVG5FoJDu2eMGWEXO1qss0lQGtSUH3ei1/dChG89KPy/eLIU9kpEnJX8uFX
	Q9kbRX2ee529oznxLcVSrD9bfYutAy0OtACp3iM1c1YZE3wB8z7lVfuUxi/FLuhcNd4kNGx3StN
	nbjihYCGRgSnx9vBNkyVJukbvjNBdKLiASz4whP6u2m8a1Db2q/AOlt4S4XYz/QaZLg+Qt5Enl2
	CP8dnEanwKu/KYPR1SH18lZvp7P8valRoNT43Fom8CePCCNRTvuOHr0teqyVW1hADycu1xXjCWM
	cyCpplW7sv0S4r
X-Received: by 2002:a05:6102:2c03:b0:785:8f76:654d with SMTP id ada2fe7eead31-78a1f4c036amr437278137.13.1788312377170;
        Tue, 01 Sep 2026 18:26:17 -0700 (PDT)
X-Received: by 2002:a05:6102:2c03:b0:785:8f76:654d with SMTP id ada2fe7eead31-78a1f4c036amr437266137.13.1788312376587;
        Tue, 01 Sep 2026 18:26:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606ba5cd4sm213269e87.64.2026.09.01.18.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:26:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] Revert "cyclictest: add real-time latency measurement recipe"
Date: Wed,  2 Sep 2026 04:26:10 +0300
Message-ID: <20260902012611.448874-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxMCBTYWx0ZWRfX4mIOMjbv0mmS
 F4+81fv30EiE6uWRHQJQlSIQ37b3zEl7MaG6GLIdoDplJEvyrdb2Ikp6YnCCMCT1GceRzDkzrkC
 DK1wXWWjEcyWyewAfjCgO0iISDLBEoc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxMCBTYWx0ZWRfX1HPV15WUDFz5
 DiK5/ebOcQTT7BsLxVtTZeW5L1moXBkHKBpXP4Of7fRaHDWZpntKQi+G86FlZnoVXBycSSC0yOP
 C4wQSzNI2is3ewnB6a8kyLNR4U3MR3MBV4if+vwwvyty3j1Idbb0EpqPOlffjdc45h+7mfNs1Sk
 /rASEQ2iN4kG4UKlsqjZ65ULObIFEhbEBkNgW9WPhDP+RhXfav+WUchFxMJ8vjMexhYjk7YXrUp
 yTOuYyGgaXDV5nikVlaW136koFqBJzahaQrta9KysO8oNrUleU/To+naQaBHF+3QIetXvysngL+
 WgPoRKOx2iNl6qIMOK/+4IwD+b2B17EBplW957osfAD/Nz7KeDcUadZaoe/oSdD4OvsIORWf7DM
 4iwgVN9CH9Qd242CEeYnGaQFdijo3z+4IDdQwac+4M3/zw/B11el6oFKyqT0AThsiPI9tYdv7K8
 yTpI3UtrarBf88AhGXQ==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a977b3a cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Hyp2LvsmweIz2Mws-E4A:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: gHRW4SHn3yCqQNnVtaZTl_KcGjdcRBCB
X-Proofpoint-GUID: gHRW4SHn3yCqQNnVtaZTl_KcGjdcRBCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 01:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129628

cyclictest is a part of the rt-tests suite which has the recipe in
OE-Core since prehistoric times. Revert the commit 1253fb84313b
("cyclictest: add real-time latency measurement recipe") which
duplicated a part of OE-Core recipe.

Cc: Vaibhav Jindal <vaibjind@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../cyclictest/cyclictest_git.bb              | 26 -------------------
 .../packagegroups/packagegroup-meta-oe.bb     |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb

diff --git a/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb b/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
deleted file mode 100644
index d3fbcf6394e7..000000000000
--- a/meta-oe/recipes-benchmark/cyclictest/cyclictest_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Real-time latency measurement tool"
-DESCRIPTION = "Cyclictest is a tool for measuring real-time latency and jitter on Linux systems. It measures the latency of the kernel scheduler."
-HOMEPAGE = "https://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;protocol=https;branch=main"
-SRCREV = "7aca81171ea05a03d0e8698af4ae53c5177f5f83"
-
-UPSTREAM_CHECK_COMMITS = "1"
-
-DEPENDS = "numactl"
-
-# Filter out unsupported compiler flags
-CFLAGS:remove = "-fcanon-prefix-map"
-
-do_configure[noexec] = "1"
-
-do_compile() {
-    oe_runmake NUMA=1 CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" cyclictest
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${B}/cyclictest ${D}${bindir}/cyclictest
-}
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8f32706ef9ab..0320021d6550 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -54,7 +54,6 @@ RDEPENDS:packagegroup-meta-oe-benchmarks = "\
     bonnie++ \
     coremark-pro \
     cpupower \
-    cyclictest \
     dbench \
     dhrystone \
     fio \
-- 
2.47.3


