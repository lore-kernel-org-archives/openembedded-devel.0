Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83A2C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 11:02:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20325.1789470113107372598
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 04:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iVdwRQrL;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cXn2R5xY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvgY2584537
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 11:01:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CFUxK7+daSuD49E9wt0Ybo7Sd34DD6fHO5Q
	fs86dENU=; b=iVdwRQrLmjtjv80/mumxCv0uSgCzO1pax9oSf4dXRG1xVNYNeJn
	UQieqGogNYNanZIkYDfYYmsXiuKDg2cAjSsFAk2dfKupToXQiftCJCk4Ag6MjbDz
	bxkB5V1hpOikFrVoybmv7jgJOMGaZco/Z7QLLxvpaFwrVrxd71blAe8qUINzfoL0
	8cYWLjqvW1PN4lMRUn0HI7bkAxLbwiWEGsJKyr8b9dbaT3S18yyB25I6p/sHPNAm
	DQXnwSvfYwglMesEVWVt8t7FS9inc24GvE9tCrW4YgLLyS/o+oUKW8bikW1+anv+
	UNYLFunTfd22A50X33IbjD7WJErVaoo9q0g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9nga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 11:01:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so6136201a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 04:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789470112; x=1790074912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CFUxK7+daSuD49E9wt0Ybo7Sd34DD6fHO5Qfs86dENU=;
        b=cXn2R5xYBLJa2/F2nerU0brGrUDtO3saFscJOoeWg50yCP0qk5dZjioBkukmzqAxG3
         7MFI6W6sOVpmUrkfMwhOwBMNMY9mwJb16tDiPIQMfMVCfJMnofTkXVEGOIjyQBVYIAC4
         IPyGNcXiSNTWfaijK8iEjZgZjlRIMAnUs99awUDZvRAn2UpF9y2sUom+j+Crvmk22eX+
         csDGHLkPfbeRBBgNAOKUZm6ucIcgt7+cmEiQ7MbS9WIPty4CQgrwjVgAEmJYm03Cmh2Y
         okjUePdzY3Gi67cAQ3eIvvakkc5ks2yfSVgbDD+KUCsVlmcVKQlnBuuXLj32IWn9UV4x
         gVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789470112; x=1790074912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CFUxK7+daSuD49E9wt0Ybo7Sd34DD6fHO5Qfs86dENU=;
        b=Ev64eUEzfdoLnOTMzDU0QzSd6q+OGMWNaJ4TSU+T3HAYX7TdRdzeoXPPEePOzJF0QK
         t28YBb4CuetsFZAgZ4jUbYiRsUcV5/C/MqeuSJPfBmaEgAecfGhv27FkxaRDUsqiXhHX
         ZXesILri2p0h5Ab1rqI1EXTpZyx5M9k864FYiT7dQNCGK5Mhil72+KIxdMIo3UHnAAJL
         puR6pi2SRDZgISLEvdIuy0HkFJubo2yoAKCMJC5c7YGfYQi7K/Jsbpg5g1zf34v0Hvm5
         KPFojuzJn/csQTW4fvJlieL5a2ZbIC45QZcOFPet52fp2mkRerPKY/OfnjPoCj6Wg1o3
         fAxQ==
X-Gm-Message-State: AFuF++moHQ6qbDFRFJL3Wj/PPCuU3etKc4fiTWxmtKhm5wx1VTrnb/Gx
	wGbZShXSFSDNwRIAW6+Fzonw7/yewBmgxWRs7qCOmA6bl3XDTJceali4e14IejUn3ZcTbxTWqhh
	Qy4da//phdRiRI0YDbnd2MAmrTAHg5y5vtsF4xs/qUrxl8s3ioU/Sz/1tTpDsUi2s2mDhOJ72ca
	etw2n0CEn0nVPE7ETX
X-Gm-Gg: AYBFou1x3GH4J0wIA5/FzbaQW2tgyHrAM5MjqoD6DjMhVXRNyQSmtcVQpDefpkXELr3
	o+vFYbj3AvxKxEQH33NiXwcTIHHKRiOBkMKuIKDyPSszJNg/yU7b6+a05oJOPLGm/ao4CM/S+15
	rZC482QJvkchs5CHubR0sNKM1YagBNl6ozvTbSFPK3DEW2AygqNnM9NWwXeofYmEMafT6BhNygU
	aTa3aNLLkahI+/0izTAhp7oQzemNak9UWFubbVaxal2HwyqzRlkA9XPUhujT2nUWOF4kmtSOGuU
	PHw3z/VMKDqA6yk9yFns2dEpCcMiQzGi+xdTB9cBOl5vBloMUQTccL/AsyDf6WJ1qymXPMRzfEg
	Vyb7aApK1J9D77IIEyNbClCLiDKjXSwzncWfs084riDIz5+8b08WEo3+hDwjnENt+pzrEk4M=
X-Received: by 2002:a17:90b:5865:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e04332517mr4360862a91.5.1789470111519;
        Tue, 15 Sep 2026 04:01:51 -0700 (PDT)
X-Received: by 2002:a17:90b:5865:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e04332517mr4360806a91.5.1789470110942;
        Tue, 15 Sep 2026 04:01:50 -0700 (PDT)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfba23bbfsm1695505a91.2.2026.09.15.04.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:01:50 -0700 (PDT)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
        Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][scarthgap][PATCH] libfastjson: switch git branch from master to main
Date: Tue, 15 Sep 2026 16:31:45 +0530
Message-ID: <20260915110145.2591791-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE1OSBTYWx0ZWRfXyPjkJy+6JxUC
 9mcheIcBYVq+Wziyhjt+OlX0IXYbwsKucWnijoyf6Wh9/5A3hY9p3IRVGDjvkmbX3AOTmSbmBXC
 0dg3XWrPF4npmVU10zjZBC2QJh4gy9g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE1OSBTYWx0ZWRfXxfgS1/x4OjQo
 K/X0vAmhVMgpvGbm/Q34P3dZ6BSZ8Sxumx+6ko6c8pqMDrtXTEIHlXNIAe+yhyf0r2l6DbYwUtq
 zIAx5PjF9QYnzhOnRCOkfuMbLXjLmzhNvzzoJvGnluXf++9Yy3CTuifTlim39CDSr9AkF4gtfKx
 i1krtP9N5OWFjdTFypJCM2jv19agBVXKCHVISMfQGTNSPrNmcLxJulDbePFaNFdAL3+YKL6+G7t
 mJ3y1aVbhLzIHBZ/PogpylSo2QYQ7hfALXE6n7wkTKz/a6TJw1fZ8XlJ73WrMiQy1zW8bR4U2up
 eQShmDz4YsQeAfhf3vVIw7ZaxKCSYu4CSt7wp/SNphmkFqQGvU0S2PDzy2SXU24aw9m0OgcbS4b
 W7zvTfjEdo8za5AJQ27FUDqvwUQ9j4MqebaGc09P85cscYIcgQr7LbsW+LTYBVgP3dS/FJ7nh73
 r31cKW1U7qcEjJ9MwuA==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa925a0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=NEAV23lmAAAA:8 a=h4_r7ypedu5HhZy-XOQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: FWBMgvE8MSYQEAWA5_n6mkzKgpyYmQPr
X-Proofpoint-ORIG-GUID: FWBMgvE8MSYQEAWA5_n6mkzKgpyYmQPr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150159
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 11:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130077

Update SRC_URI to use the 'main' branch instead of 'master' since
the upstream GitHub repository has renamed its default branch.

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1a742957c1c16ff34480cb5a61f76c377f24b2cd)
---
 meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
index f16126d936..2a8b52d720 100644
--- a/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_1.2304.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
 
 DEPENDS = ""
 
-SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https;branch=main"
 
 SRCREV = "3a8402c1de7c7747c95229db26d8d32fb85a7a52"
 

