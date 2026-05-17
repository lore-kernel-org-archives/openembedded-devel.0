Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5D6CD37AC
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:50 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20221.1779006284582807264
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eYonr5lG;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=WC8LAikd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2jaSS2343774
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rJVGtvmTzVm
	bHqDQwfBzdIf59Lh8leVR7OyFBqKffFs=; b=eYonr5lGiM9LtQ+OuGBEywDLwDj
	QZBKajOgzYE9HyCiO4be6kCKgCQDONkem0VSkdjWJ3u6MnoCb9L3jDd+8W1GALfo
	V+ALluA1UWjSKn+bo0Uk8xHGdjydSSd/dsZ0rhffV6ri8pNfnqPhNqvQt+W/2GJe
	b9LwX9lvDmdECX+NEx6JRZg6eotkvLUikRhCDR/YQ/GlIMnKT2GRaYaDDa1yosQ/
	45xr54/rprFx1s1govFKDV2QqARcdY6HtZ0RpxHgCLclZZxl40ZvOmiqPncRhCU4
	k86FvGt9x/FFKeWX3tO4asfbmr1k+s1hVdsUcoPHRomQhAL7u8MTgTwTRdQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6tf1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-368edd5fec4so1297876a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006284; x=1779611084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJVGtvmTzVmbHqDQwfBzdIf59Lh8leVR7OyFBqKffFs=;
        b=WC8LAikdodKcfFRPMnday5Rldcpb7hS1byirjPPKRl7ofo+/ueJCF6cj7Ht6pTJ8i6
         qDznBEO6MhMa3nvFyYFewDpqfjaJKW/n0yaVLWD5TSn8dTuGbSFigGjnBA0EkeCywjfc
         k0hX/FKL8yICbi3vgbGFPm1lTSGfQnUOFkDFAuds4qNuzTOeb+QVlKwhVDHg0nYS2BKW
         7w6rPlrQaQQJ/qEAJeeJWwNzp0Ji8E3t3hPlp5mlzK7SlivGX3WL5RWqn60ci4qjXnqd
         cTVrKtD0ksdd1CnFSVkdoZnjy4E0nEVF2Mzhx5ePBd83zwJoeXLycncitDprARcogZyp
         qaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006284; x=1779611084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rJVGtvmTzVmbHqDQwfBzdIf59Lh8leVR7OyFBqKffFs=;
        b=RUv8tdr7arLMPxw11xIBO0Oglkz2ij1pg38xNOmFx7POtlLAZsfzpNGiROE3HQLr4F
         9YN7LAcxtiokHZxC1sOWRS+TFqd0HvgTVTdLOaA5tS9mU1L3TlqLtnj3e68+aNh8nUTo
         Ofa4vmOjKMNRM3PxcWdvza6FWQHvyHjKInbkpekhvj59L1vVi7Ft5F/n9ZN9Pf+0lX8G
         jVt1ezi2ry+v/LM1ja8tlbFxlD8ZUc64ku0nuhykdtHrrdibpePNAa+v8TTXYEBEosTF
         YOWypn8PHidw42OxYk49l3RD/77V/vTJZHe65g8vlMbMFOpUZFPArnEUB7uAxjqjSskS
         +p6Q==
X-Gm-Message-State: AOJu0Yw6nAnFb99bVhIs1gjr1gOhGpLylSB4DLe2PlH3g7nHvns65RX0
	Q5nAZaTVbbsni8uiILSedrItQSvfaQnrFBrUKRbdOWWN7VKv2p/z9w+VsJ3Tyq4FCNgmc6n48SO
	gj++k9/yTs/qgj0hoQNAyaOo1ktd1c/T5xFSI6CM6TUFL/ymoonoXOdntm8GMRNUoeEoh37t5Lh
	evNGp2kzkk9Nbc2xRsJTk7Kg==
X-Gm-Gg: Acq92OEvgXecw23bNWRd+ibxm7ZWKU1JX9i6ppZJZcw2EzS/qRy6fKQ69HKoPHsrXCM
	8+saKf+EhNL3WsmDYJ33PJeXQgMbJVniqApgjg7T6jZgsr8jBUSMn4jzUlha+eB3a/n8HdgC6eK
	7TKcUlOpZezCBx/WpwdhMziQ+RpXwZjrFA8eJZDR3VEZD0stH720S+E6CEEJ1aFuYuaUoqvq9yU
	Lz6p/tP3qpvXGJfP2CBJaoxOI7s3yZdCjD4baR6+IRTg3klD/PWykUGlWRSSvSKlp08C8BG/jLH
	wTv5CciAJkuelsdrcZ1uXKokuqCCGyWPddCgCszuoy7R3qb+7YLslc2iiCAZRV9jK/+xfgmXDtv
	siW63Lm5pNK+LxuOIJHLQ+GODqXeai2Vh1flXIVD0KBNt/P/S6UkB
X-Received: by 2002:a17:90b:1fce:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-369519cb5d1mr10686617a91.9.1779006283586;
        Sun, 17 May 2026 01:24:43 -0700 (PDT)
X-Received: by 2002:a17:90b:1fce:b0:368:5367:d679 with SMTP id 98e67ed59e1d1-369519cb5d1mr10686611a91.9.1779006283113;
        Sun, 17 May 2026 01:24:43 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:42 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 29/29] libtsm: upgrade 4.4.3 -> 4.5.0
Date: Sun, 17 May 2026 13:49:57 +0530
Message-ID: <9af4488d46cb4fd4c0d2d64820c86225ebd6ac71.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FrhZ8fkswZapXT_DPtlQVtU729bCsAML
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a097b4c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=LfIDWbE5vD04FTvgl0kA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: FrhZ8fkswZapXT_DPtlQVtU729bCsAML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfXwYMzKor97zoC
 NGVwteW8QEqdoWQAO6fRjLr+TVioYBkdRimiXc9NheOuziX+kgNlP6cZi3t78EPA5dZyQbaCnRy
 G2fbtiUasZdxq+gY8ev7S1X0YkcsRJXlfEaF14Bw7aZtpWsoFRujRSdKqacg2r5tWU8hjXJmlWJ
 aDwkWDcy8leyeuCDE3dX+R1ysDzf4jacOnJdAdvlqr+zlpc93Txe42b5q2uSzG5i6miW1yVVo1B
 qcnHXH5xnZV8/f5aPZtkz/HNd275pyD+NUN1jXFtWEAWNOxraeTI/+GAorWKj6nDnsCX+RR8Nrm
 RbXI0EuHO0SW3nK+uL+VykH3iLxBL9Q97Le/Iti5yaqCHUuOdZtapZH9uRj8Fih0Vb3MScnkl/X
 V1igKNhNwrDrveH8Ux8U1r5ZqAzlubt3aGwGIQCOkVq8vmXHuiWifq7c0QOCDqdQCSk73NB8A9Q
 u55S9d0paY6GfFDO/bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127042

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Support for terminal bell and keyboard LEDs
- Fix build musl
- test/vte: fix memory leak in vte tests
- Refactor scrollback and selection
- screen: Fix wrong attribute for new cells when resizing
- Fix remove from sb
- Fix get next line
- Fix scrollback position
- test: robustness, make the test faster.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6d7794e799c5c7a9c5ee4ef578706b1228ef20a6)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.3.bb => libtsm_4.5.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
index 8168360dec..9e999fe970 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "6cdacfc452bf29d98e297fe3a96e55e94a88ce3e"
+SRCREV = "556373437d1c5f57f4dfc7c6cc1330e5088a4174"
 
 inherit meson pkgconfig
 
-- 
2.53.0


