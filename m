Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2E0FB5E86
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:50:52 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63965.1773701451587348890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 15:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=T+21TZYG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bUanGiYA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GECKGU1639186
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:50:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/lFKIsmwQ3W1i8vXf0S4F2SRTOrNzD/jCKO
	yrDgD43M=; b=T+21TZYG85704XKfxQT2ggdGoerVyObceidy7JTjxgzzdrP+ZAo
	oEs7y7MD/AYy/AJO6FziLYBRiWzlb69UxQTU35YBCLL491HnDnpv8IqwNcGKVhC/
	nVCewOTEcQHsZXLk9eb8FUbrd2PNp6YC5cqFV6FOaO3Xi6ySjG7K00es6J8PYi4e
	Rpl7Jxj1pGkKG9jXd/L9ZoO4rIwcxnWzS+CTtDbQ25GK44ghZWIuldRVTp/C9/Lx
	Kv3RekbmNCPR49MvQ9FmKw2l+CSvimq1kWQ5Jov8oiYiC+DK4YQ0NaMlcdnUYlCg
	lJFa5cf9sNjD+WBW17r5BwAfVeZkj3yGvFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke09psb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:50:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8b37d4b2so361926385a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 15:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773701450; x=1774306250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/lFKIsmwQ3W1i8vXf0S4F2SRTOrNzD/jCKOyrDgD43M=;
        b=bUanGiYA5yGUO0WeaMeYCm32j/Fmqa/hT2DMcgpwmMgvKOiIfSM59WAUPrq2CCVUjH
         LmX9VVr3J6TDuFHEvguANYNKho97c7SpfIa8mAh3mRgdrPFlpcHhl1pb34z1LbAzSmhY
         SJAXE48+JDQnucTo7zXeK4YfMw0R7M+y5RZ2wjRhZHpRQpKcP4l4tAFXygD8POi5cmua
         mbKDkEm1eZmFKfwbhwF05WyOYkeiFvIEsaGJSOhU8OC9Zt1k3p4iF2ZHtdm8lSA21StC
         498TACbfns0las6Xa4Z0GH8kVkNxowaPESPvl1CBO24BFa4eCc80AX5u28mr6wMvggfg
         TqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773701450; x=1774306250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lFKIsmwQ3W1i8vXf0S4F2SRTOrNzD/jCKOyrDgD43M=;
        b=L1AZpRfi7PcWfY/ORf4aNLW8B50uMz5ioTmSLBKxShcTzJQ6faRckFJNjk7GFJskGl
         dLPdmzO389geUtNeUUtsWl/mZrv47vLcexcnK/szy6sReJKyTBC3X1aiP3fwjyU7skPH
         i1PB7QW+al1npPkyV57aH7q0Zs03K8F2zOX5rYnyjP8PxRQxodTVJOc+9IzI66F6Y1v9
         wWulmXK18vMVtGzvSPbFRqLub+Yjcw+wRmfWgcxCkUOjTWbHxKV6MeWArUxS4WSmbeQL
         Gm83Qi+fJ2K2P5GXJpbw1pYKH6ZDDBxRaQhpz3UxehTYBQ4+UTaCZRP/auqmiOuCLnie
         2ILA==
X-Gm-Message-State: AOJu0Yw0nBouy4SmDO06G1o9x5quYCicQwI91GRg4n4Qegx1R0ALmEgQ
	t8HBMrM+/9+vlTK9N+l6NMmGsCZTUipTk9l3giLiKM6iOfRMA+EjzqxmDVIaaHjiNH+NsdmpH/i
	hCtsVPDSfZHre3EqWaeanPEM6afrbxY+mvz4GV+WP0ZxpEa09boHuM7gqzESXmtf4hfudlJ9Sok
	wkFpbnuiPIcFFh3zcA
X-Gm-Gg: ATEYQzzkN6re4MrS9HKm5YKsGUTlmJ7zyg/et4D7xj86yGugXI8g+WY/dR/+6DX8Dr9
	cExlM9/OE97xKwbC3i/6yBDw5qcOMF8/p+BYrWnil+Y2TBDfU6q8kmetr1C7TsEAqRzN7WbhH1+
	+Zb/8QX0FYdfiHU7salbRIzcTfi3bc++nT1EHllMhJ32c2Xo7AxWgCGHRSHQfu2pNvdORsE08r0
	GBOxbEQfy3sKv9Kqjo7TqXI3bzsLVVI/9RfdHTzIWuvCQUUPrTA30EchCwF83L1Vwc5Oeu9kGJE
	3I88zRChrfHQHpz7/OZq0OGM1LEvdhjU2CcirYWcacU/G+CQWn3scBntkMXt+7MCoVMKQph1OzO
	+eF5puCGyr9MHgW6R436+V/f+CJm9o2yUurc2KfWvpk6lLM9qCve/NoWYi4n3sMzS9++XfbwOdm
	mofpi3NAL8+OVSsNcdisFeEg1L+qUL4iKmj54=
X-Received: by 2002:a05:620a:4627:b0:8cd:827a:2abb with SMTP id af79cd13be357-8cdb5a683e0mr1899650185a.31.1773701449734;
        Mon, 16 Mar 2026 15:50:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4627:b0:8cd:827a:2abb with SMTP id af79cd13be357-8cdb5a683e0mr1899648285a.31.1773701449239;
        Mon, 16 Mar 2026 15:50:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162dcesm3689499e87.58.2026.03.16.15.50.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:50:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] vulkan-cts: upgrade 1.4.5.1 -> 1.4.5.2
Date: Tue, 17 Mar 2026 00:50:46 +0200
Message-ID: <20260316225047.1540453-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VgDd2F38yLBbwP6XqC6dDOZQm-Eb6czB
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b8894b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=PU7NgQ_sEuaNWWYYBg4A:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE4OCBTYWx0ZWRfX2p2+nDw9ZAiY
 oUgI9vKG/F2UGu+fQasJkU5id4uZdq4R4cgG+freWGsIPMfbcelgF+6A5moSfBXYoblqbbtvQnY
 LIwQuh2YiVepFtvS57UX8xI/SbxvgenEQkPBM+9wqX2TI8XeqgDBRCw63Y5393CJ60t5ts6Rai0
 xeZ2S51/STBO7OLFzx4kqTp0rE9Mv4M7UDB37a5/UY/IVlbdTtzrNewJBZ58PDoc+ff6Ni8qufM
 5grbQzbRzVPcrjVV8G4d9QkrzcAwVMAtY4ibIFQDFQLGixmPnKyHzOK5dX0WkXWf71h4kxzRFCb
 jRQpf4MiPiUg2lvsQ6Qpp0TA6SDbMnQhDrHrjPEw4PUEwjByO33bSg0AhVwXJVa6uJ+TIvsT+3Q
 6RYn+VVa7zmADeYTyn9j2wAYw+ieEd9w0sqLvaNCFrKxetKSRS2SIw0hBojXit+gf0y2DSMt2/S
 BVvkqH6i7DlA2LL8YNQ==
X-Proofpoint-GUID: VgDd2F38yLBbwP6XqC6dDOZQm-Eb6czB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125296

Upgrade Vulkan CTS, fixing several small issues in the tests.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc       | 2 +-
 .../vk-gl-cts/{vulkan-cts_1.4.5.1.bb => vulkan-cts_1.4.5.2.bb}  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.5.1.bb => vulkan-cts_1.4.5.2.bb} (92%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
index 52116c8ed724..6ebb9c18db91 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "1.4.5.1":
+    if d.getVar("PV") != "1.4.5.2":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.2.bb
similarity index 92%
rename from meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.2.bb
index cd5a66fd9fc5..0dd78620fbf8 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.1.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/vulkan-cts_1.4.5.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Vulkan CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "7b7c6cda940bec82d1c5a8c39048728d9bd32f39"
+SRCREV_vk-gl-cts = "a02761593aedeb1d3941ddd344ca35d7a2f9de46"
 
 require vulkan-cts-sources.inc
 
-- 
2.47.3


