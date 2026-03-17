Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E64CFB5EAE
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 04:10:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68834.1773720620642237057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 21:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Oge01SZd;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bHMruMVh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GMBKQP041517
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 04:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=22wD/IirmVL3Mh+Wrj9jfFrOoN4KGNiDM9/
	peRfkqgU=; b=Oge01SZdNCamDfQ/UT0ZGraebm82dtsShGfoZp/DZgUCJripsg4
	8FTlH+BOlLCmo8oAykVQJA25OiXzckPa9pthjLMnWn0CEalwAaogoX76YcmbRwMx
	WvZGupgvLpxVSRm9wwDND0AzjixRxTU5WX/bb43chFEMPmcBSY98GTUiU6YX1Cu8
	nUEnpwIi66j2ey0Bw76wTGVy4Mf5ecG2krs+TJCwh52N2iIIBqxczxd4fkAIPrZ/
	wmgzYrdCeTnbv1gWiZmQXdqP3F0vYbFT0R2WtsZ1T8+2qfzkhMtoO6las7B/k385
	NwptAWC9MCVtAwqt8nUQuimdekV5oHQHtiw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt83wu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 04:10:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091327215dso779696091cf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 21:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773720618; x=1774325418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=22wD/IirmVL3Mh+Wrj9jfFrOoN4KGNiDM9/peRfkqgU=;
        b=bHMruMVhUbhaij0oV2VSyyoHxgUzwRBItyWNyi6ArXqHjCEg5b3ReE4Ud9OPEysVDf
         fuJbrUg7Tjc4L4pSzRDWYrO47gCnxTZix9BJCsrCSvcm6pcFCHDz33dKRsbEKAtMhav/
         PdaUX/xjTuu4MPndPX6e2LDd/hXpjxGZ/Gbxqg2AiAAqj1+Joiy7HISKiupOSw8xOeVg
         R1BnFiuxbhHccgWgGwhROCPOHq3LqdjL/TKZUZ0Z683QguwzE9wyH+QXcTlrmqE7dVrI
         FIdqV5KGLtw5QxHcr2Ov/bEAys5aahqWx2c53VpHnN2t9lLkyyVjW1xEppdTWL+LrwSp
         zqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773720618; x=1774325418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22wD/IirmVL3Mh+Wrj9jfFrOoN4KGNiDM9/peRfkqgU=;
        b=ELoxfYyts4cSWiZYOTO/ZQvNTBaxFdF+tkbxNrZ22wikN7H9U1rpfPX4daDYDE59Og
         IO1bGwEth/eaI1kv73RBUqitmCisMjuD/h85LkuF8E/3Tb29rQ1OP0wk3TpNIYgOi6nj
         DIB1blrb805rE0x+k2bUU/EX3yNsw6dP3MSdMy2sd0lsa73nFCAO1VuqRicgVGxyDaai
         FqQPg2HR7AEIUGBWGQpTpaqN9wdKbeJGiFvuB1M/9z3d9lm58u2BsKiPHBNgsJ7X/yZd
         4Kd86sGSly33LI6hVoyUeqFGh5aPRa1Gx/3uBJxH+MC/LlRjFpjK13g0T+M97abHJdsE
         Jq6A==
X-Gm-Message-State: AOJu0YxXy08Uyu1r+/Iqk92AzdehNc3j14k3WU4TrxnIYQrKcUAcGVVp
	suK/cJgMHBDP36+ZnnLdqShtEb1KfPmU+Tjp/DdFhfGyI9ZAYr8NHsTymEIBtvcz8g2bNKLczkm
	YAI2LR+aN2dDNl+4HwHJAruBOar2tw4G4V4zhW1i47B0oNZX7iVj5EZB59cxzWx79P650paL1QZ
	V1JVb9TEh/asgGB24y
X-Gm-Gg: ATEYQzyj6uvUVlbazgdXKAm4LYkaDSBhXAvXlfhsinT5V0e95WzQW/Pfezyp3lPs5p8
	WsJ3c+DP6RfmYf+9TIGEOmCURcwbwJm4hTrYoY+S18CEXkTwilK0GhzXdwqRAtSWS5oOlNBr8XI
	tTiHJYPNa3HsRc1teCMqGZDorj94wA4c4yfTxsjYjgXZWD0hAQJu01ZJ+0RCngQkSFwEe4Tfupe
	I5RPNw9FXLL4/tv82X5roRla7TjsKnuxJW/SCcuOLYm+udYPUzbxb5M4fsVZuWin+2p6JCj/hoQ
	+GfmNk7Qi6pJTHKnoEHrfIUww9FcU3/+cG1u1r+PVlNU3Hd0Pe8tNlaZST39n8rKmou2X6K6n+u
	BNoLdS23701+lmnRJdwfS2NAnHarJY42dovBMhU4DOvtOfaXm+2VPYOFeomzvLUbiSuGeVd12GT
	4An7ePrenyaTmmhQ2OTFPY+DDjuyQ9PGms
X-Received: by 2002:a05:622a:1991:b0:509:379b:d46 with SMTP id d75a77b69052e-50957d53c58mr224548731cf.11.1773720618592;
        Mon, 16 Mar 2026 21:10:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1991:b0:509:379b:d46 with SMTP id d75a77b69052e-50957d53c58mr224548481cf.11.1773720617933;
        Mon, 16 Mar 2026 21:10:17 -0700 (PDT)
Received: from umbar.. (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33b95sm3875139e87.15.2026.03.16.21.10.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 21:10:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] spice-gtk: enable libva-x11 and drop gstreamer1.0-vaapi
Date: Tue, 17 Mar 2026 06:10:12 +0200
Message-ID: <20260317041012.3111029-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: giT7YubedaGFWma8mq-L5eqVrnyyvsZJ
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b8d42b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=66mx9R2xfalqe72labsA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: giT7YubedaGFWma8mq-L5eqVrnyyvsZJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDAzMiBTYWx0ZWRfX7t1xqv/Y0T+W
 hgBRk96dNibtyfjxakq0SIDXFNo4LhlYxksbzF40XTOQVde6IKLvHEQfUmvNPreGtB+rUxIQ66F
 lNNK3Mze1cryi6Qxacs9VoVBoLzOQIjjKJcLjmISnkAtfkNxR2yTYooLbVZBcUQw9+THHk9EdqO
 ynyWHZFGJmI5c7ldsJyGHiq4JmG3Z54aXRmZCJvJPOya/jWJfwSVehgwebxpyruIjjukv2Gb0mB
 XoclHtwj+yqzLzj3IyrCR/E+5DwiCJdsK2Y7fRsYyaeT16dk3hlqgwDMOy/oMKNDDaSZ+4W3J6+
 Q21MjJTV1G766EUa9uZqgwjrTsT47vWF7DnRIloVbCYtm0ytD2w35LgpA6PEjy1/L1Q31R3ANTx
 j4dEa8PQJqwwSgk5AKB62pSGUu/iHOcDT94T1T/7vuqZsoNPmn06xbXCuwDnOTwAbw/Kz8eqdcn
 U8pWzrwFIL1C3WiQgSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 04:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125302

OE-Core has dropped gstreamer1.0-vaaapi, breaking spice-gtk. Drop the
dependency and, while we are at it, enable libva as a dependency, making
sure VA-API is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-networking/recipes-support/spice/spice-gtk_0.42.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
index 3588d674f7b2..127738a429ae 100644
--- a/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
+++ b/meta-networking/recipes-support/spice/spice-gtk_0.42.bb
@@ -22,7 +22,6 @@ DEPENDS = " \
 	cyrus-sasl \
 	gstreamer1.0 \
 	gstreamer1.0-plugins-base \
-	gstreamer1.0-vaapi \
 	gtk+3 \
 	jpeg \
 	json-glib \
@@ -30,6 +29,7 @@ DEPENDS = " \
 	libepoxy \
 	libopus \
 	libusb1 \
+	libva \
 	lz4 \
 	pixman \
 	python3-pyparsing-native \
-- 
2.47.3


