Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8244C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 11:00:31 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20302.1789470022178846374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 04:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ggtsgBnA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JLdjjwcY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJkT2674967
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 11:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=VGkT8zwhmKRlhN/cxiBWBff4TpgTdpMPNfe
	qaYtsgsM=; b=ggtsgBnAFrI85p7c52scqTAqf4EcdO0cHVVUF8m5Yk9yEm/BLCs
	bwhYl2G5auNcWtV/8YPufSnTYyQpS1poawZDZ7ZmrpWj1sfW5IdVFrnERmF0pN95
	GBnOMJwYwSq8CHJjtcDArlmSRw6wDaSMa2sZEmqYZ2RFZ7ysi6q5moBZKh380GIK
	nsUY2EhfIpyQaKxou0uvyHrQwv4Iq2Ip34xjA9A+UJrUBGBsBq9nqsNI9X9CbSPB
	mKo+z0NN4oqED1mn7s8HnOVyaJfka2MS/6n7bGDzJvhbw8GFaCZLfTE6S+5VWnQu
	BtmBStd92jh6xx26EjtI+xER7OYufs/caVg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye71ewm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 11:00:20 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc489e7a701so6227187a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 04:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789470020; x=1790074820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VGkT8zwhmKRlhN/cxiBWBff4TpgTdpMPNfeqaYtsgsM=;
        b=JLdjjwcYsFksBlFfX1DsQzQReyLGRKURlgU/u3qEeRUIhdRcvY1XuhgYK/buiJsznN
         OF3ZoZpljfd2ISnWWDu4q7swuGB0llljGUti+7jDORq7WUdJOpqytifTRnXuKgh9VKWx
         5agk7Y5iNRSPZXFTpMmuY/XOuAiavBWGm9NQMJqgzX/SF7mie1Np/NZBtlUdI+FsCPKE
         RqmrCmWJsvsMrS6WaEBysrxx309mEqquhXCUakymKFiS0osFqtyFGK+CEEOoKFO9CrqI
         c9LklpOF/vILFjB8pRguKBFuZo+wK8BUcI6mAEqY0urBbwYXwNzlG6waGX4AQ6MPdd0a
         XpkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470020; x=1790074820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VGkT8zwhmKRlhN/cxiBWBff4TpgTdpMPNfeqaYtsgsM=;
        b=1JFs6dH4eKodp+CZ6IGP7833N07Ha0RY9mDOuBYZhJsq4+vve9wzVewPyo6yIBrd91
         dJ5T+WXAK8uaWUjVNwcekBBP/Yw7Pf0nDl+y+4Qsu5+KB1cL+2kEVg+SOEd1DoqHsD3Y
         8P0ZQ4e8trWGOjwn2pzGzZ4a58v+9scJc1/+bEXOHQyZ5OYHUtc33v+8lbAuGDB10Hx5
         shPDyVO360PG8xQNxA9ZQaetx7nhzNl8kn4irs4IXqwpwz0v+a6KkurdE/BzKcG8yqzz
         BcLogPXucuOGO3cGJhnrd31T67zM4hDKe63EbDrFgKi/1atkRgdK2X/wfanyyxdB/g2r
         2NJQ==
X-Gm-Message-State: AFuF++kVnRJxBqW6qQUt+5gQVrZcBzExshR3+l6Rz/CkUAEyTh7VZGTl
	tloaE6hGrdicuzxj2+IAiPPJDY2MfLH4yLluPmBv1hq7ZMxh/nkjzYxxTaxqzO5XmMxNJHbDDMN
	PhzoOYEcfeFmJVHMGyZ0A2aKr87NTYl1G6BYPoY2FKlH5BD0Ip1uia9NokZspHoWobmKLgcbGdc
	mjT2nFFAJ4VO+Zyz6w
X-Gm-Gg: AYBFou0QudMRli3vnh/74aFSPiptZ9QpWL6ziFdwXa2KareLyXnpUde9Y7TX3zSYWx0
	NVhIlpoK96+TKnNUOjQbz37ZQygyeKm/0fbKkY5xtfwTvAzIz8/j1WGdDSot5o52LtAmDLbliE7
	9BhQpjXGX8zQ3l0IMD8Q5RqKnH4qNBVhMhXGtLuVS/OJpgXTKbQ0nyfQC4U5pskk/n1sBiHpq38
	2m+cNRIRFsVowVeE7Dd4UnCGSMRawWWvVg98G64Q2r4++wBCEXfKZC/NGYwUldT0izpCrPpkUcS
	/1k112uodh6zTo6zqz3xvDwg6fNC7IIPwdOQ//Fufc6eLsbKoafxtrEWTY7B0CmVq3hhhGOmcZM
	GN0BUyIAs//teBp0YqygUjNubkbRYxbN5iyvVTYFCoFxTfFmuenbWJOS7vTxAo0KXrHY1Cpk=
X-Received: by 2002:a05:6a20:7492:b0:3d7:b90:acba with SMTP id adf61e73a8af0-3db4038edcemr14236758637.6.1789470019440;
        Tue, 15 Sep 2026 04:00:19 -0700 (PDT)
X-Received: by 2002:a05:6a20:7492:b0:3d7:b90:acba with SMTP id adf61e73a8af0-3db4038edcemr14236636637.6.1789470018764;
        Tue, 15 Sep 2026 04:00:18 -0700 (PDT)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm38384339eec.0.2026.09.15.04.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:00:18 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
        Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH] libfastjson: switch git branch from master to main
Date: Tue, 15 Sep 2026 16:30:12 +0530
Message-ID: <20260915110012.2586942-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1OSBTYWx0ZWRfX5ZhR51G/se7V
 78KB0t0w39hVbdbFysXhqCiRSl/6e7dxmYjVOGHmA+8EeuqGsmbJATHBHjL6F4Cr1k5LSuLT2Tq
 +f2w8Zvq+/lhLHsSxn3G/8xe7PdLgPQUHqCiEn6f/9+PZDDISOfWJ9AuDhImgmK0BRhlggzC+Jn
 jTKDaT7k55391nF64l3Pxv2HiM3WXSHx5fFmfxey3iyaqQ3kLexLZpJBJ1eB3CMuOeYoRiQwQPy
 1UggTIScrsLe6pTtnHCE1k6UE7m0L2F0Y9BKlhm5Oh2YkBIzmrxHIMVtcZACI8d4iPQboPVPVDH
 ojx1KYe5XqjqScvACU0kNhG2+FTYoYDERhoLIFEMB/bPaXDRCDSLx9gGWuEtpbElbE/GTZKovWE
 NstN3MPSEmTuStiW6OG4/uR4f2MZwzUwYAd/foerCX++b7nEcpdjARvyhBRamcvn4AJdqNlbPYU
 xjvDBMCJu3+ycaMBf7g==
X-Proofpoint-GUID: xUcmSQ4rr2Q78IEYOw_6g85UmU9DMTcK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1OSBTYWx0ZWRfX2EfylUMzFFuh
 ruQ1m4icn++yJHkQB5cXDmFRonASLwmbpeKKyrP80si1QM3VAORkV6i5SGjl1vSnOigPELMzESp
 UNDt0wCCL4tjBNFfyEej50WRZZIX/ZY=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa92544 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=h4_r7ypedu5HhZy-XOQA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: xUcmSQ4rr2Q78IEYOw_6g85UmU9DMTcK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150159
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 11:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130076

Update SRC_URI to use the 'main' branch instead of 'master' since
the upstream GitHub repository has renamed its default branch.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1a742957c1c16ff34480cb5a61f76c377f24b2cd)
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
 

