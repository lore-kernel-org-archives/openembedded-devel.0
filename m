Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42BCCC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 09:17:17 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35233.1789118229205056178
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 02:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hJMRhcUy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FoB2wGCj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7klO34046186
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 09:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tqOQWVDlq12FLu+ISAmYWf2zjdXFArUfOYB
	YQU1ylyc=; b=hJMRhcUyM3brXP80fXb13om81w7CmDPya6tVVEXBABv+UdN2mQv
	CIIoFV2ZI1W82QpmrcROVb+ajZTH8FoAg5ME1VuwyHt1MgvZJTExudV2oPfqjHhL
	2UlgiWDzXpLT6bmSrNJCb326oSa0cJT3/egq21lm7x0Fr4HS6GjpF9lQQA/S2kI+
	dMCNRiuhQsxx3MCmzDr3odOFHfQ7Yy3tG5Yo4S3nRBVSkvgWEMDva7gY8qPFPSgg
	uDkGGiiEsE6jS+CC+H7LndubVqh7FS6tB6Q5tr7zxFAqPhLE/mBSZ00dZVllKes6
	GQsPH04k943bj8+yXQFCLzdPGrOL+valZOQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm2q12r1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 09:17:07 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc2229450b4so678345a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 02:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789118227; x=1789723027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tqOQWVDlq12FLu+ISAmYWf2zjdXFArUfOYBYQU1ylyc=;
        b=FoB2wGCjhSuoBIr32Nl/MhGqBlp/NtqpMicLgAa4UIxlffJDyHFKQRWIoiovLw8XsV
         YQT5icP7ewVuY0jfA0chUoeDN4vBn0sjVbdDmEVcjNedWawTE3yL+HRikCTMAFM+dEzZ
         Fmw/4UqLtLU3B3WCCaNSNLsLk5loi2BMUTDAmOoOxKf6l296gUn0dLZT9fOOPan9zA2y
         OfrMxrFREvvrc/gGYcDt0Ew6mtNY0+7RsHpO1huYP0f5RBR8hTQHZUQ3fcELLQNkNakN
         Erww66RJ1zzIZKRKlU8xdBxZDJ8QP/oQNAjB2qwGmVz2rUrEKSpAZzal3LyX7zy1GPvQ
         Sptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118227; x=1789723027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tqOQWVDlq12FLu+ISAmYWf2zjdXFArUfOYBYQU1ylyc=;
        b=k2ZVzGwc+vb4xg66vTQbAqNhOzk/l9JtTRpCPA5vPu2kgg6shABLkP9eU/Sw6+zEIV
         61sqmzAT2fv/YF2eY1DL3zFchKADTUe0G0yTo7uxyHpMJ1FT43NRn4jPJToALMmToZwF
         +5vSlmyEthT19BX/en1SL1gOlwz52WkSjmSE00vJmY6zsKUry7uTJQt2LhiuZjzr3Xl0
         g9E6laSqR+IrXHq1rNwbZiBxxoltoakfSzqBF4O54tMgO/bFrNCoQe4RsWTAU4pRxJIL
         +VHZLawW+6uKHcORyfePt12gsKw23QNJWLOLazXAZ7iG6yEMojY68QgAz75hB9+PGoA8
         ldNg==
X-Gm-Message-State: AFuF++l15MrsPE89KuLw/ka4r5zcsALBaJKJKDhrf5bDfSCsDwjJL/L3
	PyTOAVTCTdEtpVmd3kXdKaygU+rRpHUIMG3ps2s4y0VpItgr8IvsDT6tDsbr4X0KeJB447yFJjL
	Y0lnctKjigcqg+iw/SetsRNSs/LeSgyGiuRrwEM7AYkqnXUCYI0KYnP5BV8LMZmyiI6eBs7KhCD
	jv3eQEE6x/GV4D2S6V
X-Gm-Gg: AYBFou2fbJRCo07aG2BJ8lcfj/N+HfYhb7EqksTxqa1hWDqvUsAQyFeRpGtw3YbviR/
	Rz3UtxpaAeTdPu4vfsx2/0ShDTz3dNCMI6aCsPWWv+clhT/z9E5JLX7WiTdrwb4zi+08q9uMYjS
	adFBoQM/bmn8Ipm/h2CXIpqV1mBrMMjwx3y8sMyPsUkz9El3Olb3fgT0lEc+1Xh9yG3ix0ik0sR
	150fMg4PWiVt5PUprPgpgce10KwY2O1LboqPJcP5Mzu4ebNRRqGiiKHmOUkyW3UVIK79aaNAApg
	BfiRHBHRddJIeg5kNmeNo2qRDUomXpmflqDEUS6Ol2TyIhk0yAahwan5MdJOeBgXYd9lVHlWq0u
	9bufYkos0VK4pUnf9h0PFuKa93tPq1PgTa/lxDzk1gsSv1blVyhs3TeiEMDtdEMdXYdmo60Q=
X-Received: by 2002:a17:90b:35d2:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39d9bc0dca0mr5667207a91.3.1789118227013;
        Fri, 11 Sep 2026 02:17:07 -0700 (PDT)
X-Received: by 2002:a17:90b:35d2:b0:396:41d1:cbc7 with SMTP id 98e67ed59e1d1-39d9bc0dca0mr5667139a91.3.1789118226493;
        Fri, 11 Sep 2026 02:17:06 -0700 (PDT)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a598aasm4948236c88.1.2026.09.11.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:17:05 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH] libfastjson: switch git branch from master to main
Date: Fri, 11 Sep 2026 14:46:48 +0530
Message-ID: <20260911091648.3184712-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d6lgWhjE c=1 sm=1 tr=0 ts=6aa3c713 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=sZ_Kt6tmpOMTrNQfupwA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX+78BH11onpAf
 VgpCeKXukQ2gpUaqrlWi+k+Cxj8QaBiFAuPNIhV6jN6CRxPKTq94e/POkagg/KbsIIEN5Sb8g0q
 QZj7NsldkkuLU85Zdx9v2aqmKDCBeCLB9/MtPlgoseXVXq7y5SEPFxhLDGw2tMdZSNkTaUwrWrN
 qmPzmLx8uNqcXw0fKHBOqiZQ55y6PE/t5hgQMTqvIM15B/nTxR/T+6lhdfHTgEj1u4o8FIuMOmu
 ZRhxWWlg6wBzSlUv3vCOTpTFUvHKry+y8xW6id7TlyAz5nkrDz8IDlIdP7gJVVIxsk3CTuIyEmS
 zYyQGeTRbEhBxXTbbIqweTLp4FCwAbZR8W5dRMXjuaqSNh3VSYI2G985m8gLP/U/T22U1XlNh3e
 IZapuaz3Qw7SW13/BvTfAl/PJ34vLS5Iqb4oP/v4m955cRPLErbPntWJGhcWiEg3J3DxnHr1EJe
 KvkgFN3pm5RGsoUJasA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX/Ybc/pcHoaNA
 O58e9cYdjLg315/S7FXZ5ZKay2A+R1897fz/7cH5zivQYKPZ/xOAe0OvFWVj4tC13k4u6omARx6
 9Ek/H5W0Joi008MGtKdxLuQJx5NU/to=
X-Proofpoint-GUID: CIf4X7NqeDJEEGc2QNaMJDDOIcI2I3ai
X-Proofpoint-ORIG-GUID: CIf4X7NqeDJEEGc2QNaMJDDOIcI2I3ai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 09:17:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129956

Update SRC_URI to use the 'main' branch instead of 'master' since
the upstream GitHub repository has renamed its default branch.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index 324c0cfbe8..8ffa433c3e 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
 
 DEPENDS = ""
 
-SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=main"
 
 SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
 

