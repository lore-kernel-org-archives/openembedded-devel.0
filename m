Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A37E7C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:48:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.145500.1783325654907998630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=XZzRe2Jy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=N6s2GEjM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641R5r3459027
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Jul 2026 08:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Nc13JtqE6mKv3wkgeHjH133bPR2KObI3trb
	D3f94oNA=; b=XZzRe2Jy/j2c0iCSv673ENaCy36TN6zFpYxEMDncWKpAXvsRvF8
	7+swhjTN3AYEIrApz9fxxRPi/3RBtzuaKe+LZ3Ag036kc2cYQbyX4xfjtLlB9xjp
	OIdCZvOEg1KmBWaIyO6wgbspkizr2sxOKYb59C4WMjJnSIE6gaKcIcPzhgT6+tPx
	NuH6qHbh2v9QaS73VFaPpH7lBL3R2J35BNYlF9Z+JEE71sXWGWDcQtalJl+/TRxq
	IplmRRfPvyVkkthj1aNdBEqOAq6rvUV3QTxoOP1OlAsiL5Ze+jlc96ynkXUGayMD
	Sz172aVRqsUzfAEGJR+l6MpA4jsjU/+19Rw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf851gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:04:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e632390d2so523129585a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783325079; x=1783929879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nc13JtqE6mKv3wkgeHjH133bPR2KObI3trbD3f94oNA=;
        b=N6s2GEjMd6bQp96jxkCSLL6pfM974u2vBpznx3JT0eKwXq2hXWeGeIsTgmmkg8jziX
         +8Yekxe1ErmGTO9utlouzwiXJ+cns6alTJlkAUIi36aPXwh/UOhJVVQc8WCmSWJTC5HL
         9p9aIWcofFK8li1DdHmPNCotvjFLOy6AYR/GScVqnGRXMfCWis36/xYqTA79gGIIdNF5
         HWvI5227fWSToEEfpOeFrHJsL6BLhSrmRWzVPOx6AIoD9jOeby4T/+a13Nqq+jTWubEY
         5kIqD41ZETMWQldwW4qBRHXUFXq+xcLxFAx031Db2s8UJ2w3XKnnF4gxfBrx/2D5bmCm
         BrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325079; x=1783929879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nc13JtqE6mKv3wkgeHjH133bPR2KObI3trbD3f94oNA=;
        b=XzSb7CLtoeFWN2YHhKVk5rjhghF7dWwzqo85pyzr3MQP71SVIIE7tgPFuqG4b7Ng8L
         h8xsCm7XxkLUnwyXjzFMxWJj4YvqGiWG8Kriup9SspXEIj8iWqpUtcFkpcB0CnaYfIDE
         LE+ouPSurgVbf9xWuKPWSpSorI7/zCNKbKCnM/q+b3EaLHlPzMl0txtL7+RH4LsvQCy4
         I7IrurkzArXByA+KndSJqICdg5pArlYDGrRvUNPbSLSnAKrbu3uuX6La90i10rV8JIV9
         1fZiIEXY2/A42HkgJg3ph9DVbJigz4V5/4/yG95KwiTbff2ZubM5UPRLMR6ATMHuwyBm
         TyRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp88r13wzE0w6HDrCya1dRSDk+ns4TxDw4lkzhZjgvngtt9LMEkcKjxgq26L25IAlWmr6cIc20CC2pSP7fwX7v/ybg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxBCAXqYnrvBRN0+4DBB7ecoSG7oGEYPAyMFqnDo38drBED2AJZ
	VpaSM1gr0Tyk6eVrwwq4ohTHNdwP76w33WYwbTzI/SNVtwKVbAKp7+4fljzI9ODav/3/p3NlKOn
	owhct5mOI7udhhg3T6X9DHuINwmnIWOMzFo1IZHNZ5f2oZzhhsrMJIlgb5ZSMLBHSqNzsk8R1pB
	a5vREvucHg
X-Gm-Gg: AfdE7ckrX/YJ7Lkhll9xjQftVHAqPL+3mjx8VkaeHo4F5D5FzbqXmqB/ZOjiY7gPmpe
	1EUAifZPA2IiZPxLc4eBcUkLgflV3ZQTnQHoTm2UMivRKMCGj2FgoAlMmnPQkf9lv6Eb/8BX8dj
	sslszEiJ32/vWA88g9onThTZR86vUch9zxXZwvTBIJUdYkXWJfAETqXuaPphZjgRMXXs9IJmk9Z
	2849yMl54qPwITHpj22DXtkpEKKvegHsgMDnN4pjCn0duh05F6Arbs6bESVL20ASZe7niPh7SzZ
	Ft/i5s06c3Sf7PpkYyDV2HTwGxiW8Vb069wFQiNpCVGBXny3yTVVE85K6koP60N55TVEgD2Co67
	vp9VbyRibcHJRmuYVZ62yGI4KCpukBQjtm4UDY+s=
X-Received: by 2002:a05:620a:2914:b0:92e:6637:db3 with SMTP id af79cd13be357-92e9a419d0emr1249132185a.38.1783325079366;
        Mon, 06 Jul 2026 01:04:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2914:b0:92e:6637:db3 with SMTP id af79cd13be357-92e9a419d0emr1249127685a.38.1783325078438;
        Mon, 06 Jul 2026 01:04:38 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm22665533f8f.20.2026.07.06.01.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:04:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libgpiod: update to v2.3.1
Date: Mon,  6 Jul 2026 10:04:29 +0200
Message-ID: <20260706080429.6386-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: Ehfd_-3HrcjSbjM8670G8b2O_o56H7ND
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA4MCBTYWx0ZWRfXzdDA52Dgru+4
 9Y9uv+5RZQy54+CzbauH4doSPxhdzUspXL1J4eHsydm9DRq4xueZG30rwN8DvLqjiGoslgRbgss
 AksT8oH9DMbVprWpdfP6qR75M+8iGHU=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4b6198 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=wpIpc32Z_e3X2T5SHRwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ehfd_-3HrcjSbjM8670G8b2O_o56H7ND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA4MCBTYWx0ZWRfX5v8123SQR0Rs
 OSXeMRoG60bp8VCa1dKlKvW0N8IGy/IFqElNrL+aNxU4MFNZxptAuKaa8k1ZkXEB+bNt0HHhwRA
 QNFhADKDq00EqjKM0EzfQ6VYD2ltVYRFWu4Gq9uqyv65CEEuPVtUpAMn9vrCs5va4uBUZW4kCdQ
 9M/slvP3UB0u3DNh0MEGYyNzF0FwFM5ao346zajuQfDRJcMxPi/k2FrEPOXiGGr0vISqYHjRC7B
 H2w2SxNiAuMcsN0PjMovigW7+eJ9YLXcTSE03HQZFrgkI44KXuVCeU/5cokppD1WMWMDebkiUSy
 j/uv7rDzxvqzOQUUagEYv6ul0Iy2ThdBO9fG/cWrME8cQpueZ+ftyY/6BIs8UUFcAGgsn67al9H
 AERbdYBRbupRTRbTDMgiOsdGSJ7XtW0l/c6OeIdnLkMhFDwo+O8xPxdOo0EvlXUMSCE5OhWQg02
 m0sgDGfa1NqAGNM4Ezg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060080
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128029

This bugfix release addresses several build issues after the transision
to meson. These bugs didn't really affect the yocto recipe but let's
update the package for completness.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../libgpiod/{libgpiod_2.3.bb => libgpiod_2.3.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.3.bb => libgpiod_2.3.1.bb} (98%)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
similarity index 98%
rename from meta-oe/recipes-support/libgpiod/libgpiod_2.3.bb
rename to meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
index 6ff2bf29d3..3af0edea2b 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.3.1.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://gpio-manager.init \
 "
 
-SRC_URI[sha256sum] = "cb71db463aec2604ac520c95bf04eff1839d86bdc9a2dfd67ef879fbb10426ea"
+SRC_URI[sha256sum] = "e3a358a90a9204ff16f92b6f4028ed91460b1926f10589eb54b3566484650a30"
 
 # Always build tools - they don't have any additional
 # requirements over the library.
-- 
2.47.3


