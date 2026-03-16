Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC2ADFB5E83
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:35:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.63697.1773700529894335268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 15:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=NY0x6tel;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=go9Gk/vY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GEg9l93295286
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=22wD/IirmVL3Mh+Wrj9jfFrOoN4KGNiDM9/
	peRfkqgU=; b=NY0x6telZK499nMHyWdpDCnUY3e8sAzs/VX/aPHktxyuJ18sLTm
	6e6NOxS73eaVnesqQHh4L44LMRO106fK23aFMTzfHV4k2BKXPXIjqGJoWMOWa3BF
	M3gkw1tCohOJ2EtyO8BL8P5vpmlbA7Tz4RQgEWn1NmyCFAc9tn+MmMye9xa+L91d
	b76RftBBV2c0y+efnX/MEcecAzK0e6D9fJSqZYbhUoV84L0MR2xttt+6JE3w5O/v
	kV+pKlUrS79xEdQcTQhJKiqBNOxov4eP3PiuUACh9Sr3Aj7g1TwkZWMIptzcoUvH
	tt82ExeHekE03+yqfM0Jm5rzKElC7erYO8g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy1f0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:35:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso5633695485a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 15:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773700528; x=1774305328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=22wD/IirmVL3Mh+Wrj9jfFrOoN4KGNiDM9/peRfkqgU=;
        b=go9Gk/vYB6bf16Hxz/jgX5NarvuObDunhjzg1YcAFWJ2HxJCLtsj+Hr8IpCqBuQtxW
         PSyYmYcuK3cRXAeIfFPZXBF7J1G+Cs87HwVsgFeHf+fIeGlG/1FFpWdRH4vQU3wSSMcL
         Eo+G0TOLWeSm8Cu4GbqwXU/RW9W8uHvlD8zwJbSwCnVj1c8aHIo8Hht2lSFHvIrQxkAg
         Xs4gqy5utWtzu9E2nnACuEGWMEsIc++RagDkHtOWczgxMZXB4hp1UFBYL5xnY+/wL7dL
         mDoYG/ruOmz28x8P3g37BGAKnlDyd4izgaXfJXyMpynmdr76MHMM4gUK8hjM5j2xZwYC
         B2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700528; x=1774305328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=22wD/IirmVL3Mh+Wrj9jfFrOoN4KGNiDM9/peRfkqgU=;
        b=EjCFiqsHPEHjTeppMn/NmkGqKt2V8b/tEaMpx8qU6akQVG7fHnC9WWjPSTThjEGyn6
         ZhL4ppqgjubvZaw4OCMsVx3oCYvbVpMCI+zWzcNUMp7nv3UKU3foXGU5PP0A9wAOJK8r
         5TMzmQLy7I0OaZyORkaDehtvMao3okHqlcbaYfYUwG2YtnMGjV1vJV+ZwKZJ+9hZcMlW
         wAEHVkDoVU9Gturd3jlN5UBzKnpZb9ZjbQAQc57kqqHtusaxETqStyU5i4h9DofzCTVQ
         GuDAMtWEt0YPtCeJabay1abDQaWi2LGbPxgPUjVEBTuhLIIDmzJQz96GQHS0sKw5rX1L
         pxyA==
X-Gm-Message-State: AOJu0YwrIlY9JeU227stwrU3ff33sjFuq5BKXiuGGmXbkcfR52weCkMQ
	qRwRw/3kT1lwc/X2Nynx+DZBa0AXLa6HnwHiLp0GpMoNCSH99+4OLmGOQWbarZdO10e///SIf1l
	V3WQMXOAEo8PTM3+c2VcZ7SaYkezpBBqMGQMjAzN+huFOZfMW2rcYQUs6DxbU2kKzhF4/UqG9+r
	ZYUXR75kdZ2kTJtVCc
X-Gm-Gg: ATEYQzw4hQkZWTg9EAACdaTmPvjCTEeeZclyfL9D37NRcRVZYxWCLYjZozF5zveYPID
	c0PA1RoWtE1q8Iwri6DysrvPWfMx+I+pCWXYZCFJ3chsIFXUxF1HfFZmWYFMMsleuMpUkRLsKvB
	N6IT8NFwCG6XS8AQIbTqEbeBI1yFx/YZ9uDjAMEBLVAx2Qc5dJ3YMpJgYz27W0r7DSMOYYXGUQA
	6Pcp8lCKSKNr2RzqA4WkRfaiL8WfFdg4otzgDsS14N6S9XZfwd5LM1XDViMIRGJ+anufAW8hGFS
	TrsTLso9DdsnP11Pgsk1HYS/MhUAiM+mWCMK6GrH1DWugeX5TJcFeLSzPMxcoFrgBraj8ZOWlwZ
	MEA61iVUxohyttw+fxyLY2w9Tp5CM/p18CAInlUEPCvbUvhcFIwgSxf+RR9boik5+qMJf/pUytH
	TEqMeImbKQcTirvv8YBjpRihrmIEl9RKZH3uE=
X-Received: by 2002:a05:620a:a51:b0:8cd:b6b7:1e6c with SMTP id af79cd13be357-8cdb6b7254fmr1487367785a.35.1773700527933;
        Mon, 16 Mar 2026 15:35:27 -0700 (PDT)
X-Received: by 2002:a05:620a:a51:b0:8cd:b6b7:1e6c with SMTP id af79cd13be357-8cdb6b7254fmr1487364385a.35.1773700527265;
        Mon, 16 Mar 2026 15:35:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e692sm3707239e87.30.2026.03.16.15.35.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:35:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] spice-gtk: enable libva-x11 and drop gstreamer1.0-vaapi
Date: Tue, 17 Mar 2026 00:35:25 +0200
Message-ID: <20260316223525.1537696-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b885b0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=66mx9R2xfalqe72labsA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE4NyBTYWx0ZWRfX0SViFT37h7K4
 OGfiTFEXoOdv0LCwqGsQsR4o547RA5nvSPX+RNr0jOaV6KMLu+qvTIPRyQa2Sb275zaN7EpIl6o
 t0H8joYJF6nuONMtATIWdqesg1pSBkPEOg52Oe5Ky4xcRP1cylhWZjoBMM/sfTAJZroyi4FlI6H
 q3ciUN3KSr7HrJzsyuJGa4fJO0/ZzluNA6O0mRwgm910YgWjU7wm/ZEJNpa0QHOkafm9dHp72qE
 DLI+6eZRiOyjVKZPjpCPunMO/R5zSfXybMSTOM7ImO9Oy8MUJhfQ+bcno9GkXCA7x44KpC14/uW
 m6fufnQ96nQnWOOSZue/sdf4aSAOVuyTFHClBdxTPQykYuKMJME5LMHdn2xXlODDX/Mot4fN4Kp
 6UkBuWFTAgdqiRnuHhY4HPk4cBI6eRdAAegJ/Gd5gFYFj9KRNKuGUlDfNbHwPfPLgl9tqnL4kzR
 2GO5RGBuIYS3EgVIqHw==
X-Proofpoint-ORIG-GUID: 5qeOHQm_bmLd9p_P0m5J8vjVJWCGAozA
X-Proofpoint-GUID: 5qeOHQm_bmLd9p_P0m5J8vjVJWCGAozA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160187
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125295

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


