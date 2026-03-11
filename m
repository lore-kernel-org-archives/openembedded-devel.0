Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB19FD88E3
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:07:24 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12667.1773198435269806567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 20:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=g4ZkRrTD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=gUmNtmbm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AIvRSC3417129
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=A8C4ekbdD2RFImd+Xyh/W0ZMWNKR1eKUFRc
	eoQf4bd4=; b=g4ZkRrTDxnMLySLkX14C2/RWempm6VlRL66+8xMsh4wGQB0AuOy
	O1HUupiIxiz78H1T6m+tyET7Iv6T1OWuOwnNKpdyEjxRwboC3uPgc9WgpPWLGJwO
	TCIbOLibKzW1W/7UcVnNfY1Dvv3Ms3mzD8cYNstmwFfqnOEZPKQWZx9SdNKIbcXK
	LzfT5dUnxyKIlbm33Cgxf5gBxYmvc0vP2erJqLDWP/zryiwru7S/CvBHyKOoCA9t
	Irj+ygRKvjJVGTi4x1zW1J39/fLRuMDdb1RHN1vVkMDs3Hxbh0kbq/SRlfBSYzbM
	TzVfoU8tYeSxLBM72/N0jxgaI/5OXHmJoUA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja2b4gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:07:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso13466737a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 20:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773198433; x=1773803233; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8C4ekbdD2RFImd+Xyh/W0ZMWNKR1eKUFRceoQf4bd4=;
        b=gUmNtmbm2kr7KbKjF6ksHBmPG4O00Fy02B/IQJ3JGM/I8TcLG5krSZelNodLuAT2jT
         mHQXgqIZkHJbQZ9una3lNWjbhKHMwFGTsMuaXIZoQ0NEJgBiY4fivmACpX+qhEK3EBf2
         tD9eyeyPIX8KQL8/xAJOXVZTmxnDbNjiQgkaXjwvQe4zsQCUk+FcIqIslza1Ct2aRc+y
         Avo2lsxIPUxXqcNa5A7qj0EvcwoU/uQRng+mZWYHep3qRyAHyhXyLKOy383m+uRV6hMf
         OS3mdDEm14Woiyb1Asm4y6vnPiYJzrFkezu3anBmVHXUjpy5F7sFk57MVYbN2FrjdRDJ
         j30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773198433; x=1773803233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8C4ekbdD2RFImd+Xyh/W0ZMWNKR1eKUFRceoQf4bd4=;
        b=H4N/m6xqodQvc1QBm7z28ayvXqtb4a9sVW/NZ91J0lQ5woWTKszjnAGoj/ek7MZwiE
         lDPoLSdcv4LPvQzrEL8k92TQYrhtKaTkGG4InRcol4U59hBMPdKxKuaMatpC/Aazkjwh
         DLkSGuKPxJpHgRitrTWnnO4icAQ05nzAdkgtwJF/nYs8oRXwG5+yVLPSmCjqDI73wSlZ
         h5LmqQIYUGyfs9xClAZ6XBdBg9F8sWlKwFePzVpMjFQDNKF+NGCGEHm4LcXYM0UMkV/Q
         uhc2dwYJiXRDzt0bPGVSVByF+wpNt1P50lxkKDkCmB3GpEF6HK5iBFN6YP7jCdRBSbDO
         Z7mw==
X-Gm-Message-State: AOJu0YzpT0DvDevE/oUERIgryuNCeWfvYfg0hQaET4FBENnl2HUAh1q/
	oBWou2iyNltRVB3i/GixRmEp/nyqz5ncytKuetXu3t2Z/qlGkPfkEbF9YAhgTk0CCc8gkLPXOzB
	2lbAIt0oIjESGcML2BwwgoRMqDE66WGgCe8F1OaM63+XbCsTn2MFAMWMTc4psXaKL9fxPQC3SST
	PIqPvjIuntpgw9wyscxzg=
X-Gm-Gg: ATEYQzy+UxbUcjVSwjv+XdMix/ilbSgjQwUONpAsVguODEXfdyMt876BGjGCsf/w+Zw
	iSPYfLiWh0aa+Zxn6fB+MmsRcn4oRs7R/J4peV/PspD2I1MSqmJs1QWSqKjz0cN0vR/D01vvfM4
	L3fLg2Ez+0RGWPOyEVugXUaT+4PnbXHl6LjC5GWy/uMJC1gCwE7JrGj9wdZAniVBXr4K6w+7HAw
	/2Y2DTz77EOBe4KocPl5DVvu6Q1FutS/e3iwywTvnNeDTdpsZHMCoh7VerJPr8PkZsnEEG9Yeaw
	6CD7c+7q9bVOnbrH3g74uSe1NG3f+FrOHDoK1TrC6XjwgTTaqq+K6pfqRgaP+IfvGsQCEtsoorR
	gaN0tFlueHFAfgciTqUeSlDi5Z3/1f5Mg4OwuW5Ku0hkwyH6l/rhN
X-Received: by 2002:a17:90b:5445:b0:359:7a1f:1b83 with SMTP id 98e67ed59e1d1-35a01323909mr1070000a91.26.1773198433269;
        Tue, 10 Mar 2026 20:07:13 -0700 (PDT)
X-Received: by 2002:a17:90b:5445:b0:359:7a1f:1b83 with SMTP id 98e67ed59e1d1-35a01323909mr1069951a91.26.1773198432628;
        Tue, 10 Mar 2026 20:07:12 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f05ee478sm4426376a91.2.2026.03.10.20.07.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:07:12 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] modemmanager: fix EXTRA_OEMESON
Date: Wed, 11 Mar 2026 08:37:04 +0530
Message-ID: <20260311030705.3624481-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b0dc62 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=PP7KPglhtxuO77LGvOkA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LUT5Aw-7_JcZ8WkSt5P12_3g--C1E9QN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMyBTYWx0ZWRfX+ju3q1mvUUfb
 UaIn+yJJdTdgAKx1Jku2ZwfCt58i6z3ty/9tkCZZWqtdRgSVBFWKmKxKwyKgp+vJgiUyeQef3mU
 xNoZwy7v8TFkY/xAti29TeLhndQwc6nM3+u10kvLHbdTemTg9HgTEXYkQlv9oDuLshswJsmcqHp
 yK2F2drAHQSMuAjRwTfTUWlwioFxMOzDZaRZcrEYpSAiijoZ5xuPQgVJr+gcb4/knim+ReKx5UR
 sSELk9jFNjpSVegsUkcOGLE/FLf+JbcTWeRQqhigqTjPWTrQJn/J8E0FhysEW+8VbXBe23oSq8s
 Maj7RUw5EiijgqnyO1JMJ2KFPQ3GjwdBeiWmQjNdAo0CQIOWddUVxkGv5AtudldPiHH3UeBKl2I
 dEw3h1uspXPOEuhMrpYHArt9ZxVNv4kCW1W16XnT5CRwHLlHYWHTQcpPOtKO4ttfIjwA5Lqzdok
 8Ga9iz+kz8j/HUNNgEA==
X-Proofpoint-GUID: LUT5Aw-7_JcZ8WkSt5P12_3g--C1E9QN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110023
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:07:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125046

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Do not pass qrtr=false explicitly since recipe enables or disables it
based on the PACKAGECONFIG value. Also, use += with EXTRA_OEMESON.

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../recipes-connectivity/modemmanager/modemmanager_1.24.2.bb   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
index db42c00a92..4e16436c98 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
@@ -37,9 +37,8 @@ PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
 
 inherit upstream-version-is-even ${@bb.utils.contains('PACKAGECONFIG', 'vala', 'vala', '', d)}
 
-EXTRA_OEMESON = " \
+EXTRA_OEMESON += " \
     -Dudevdir=${nonarch_base_libdir}/udev \
-    -Dqrtr=false \
 "
 
 FILES:${PN} += " \
-- 
2.53.0


