Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF81D6CFB0
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 03:07:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59458.1769137621440991485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 19:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=jcuA13VM;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aqq75sDc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N1D4RW3649033
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ruu8lUBwLCtf5SL228YmvdbQbthFCpAEZ5y
	szPv9Lwc=; b=jcuA13VMq8o2aQt6d1GYVZK6Mk8JXbTrE2srK34il0vIMjm1qcM
	+wOU4FDSIsuiv+GDzh0UjUW4oTEZRYx04D6Rs2H03dyuw7WJK2Bpo1756lZuEJLf
	EtQ8biSxaZk+AW8RliYIvE33Ks/GLiJF7OnoJWfQP9+c7IGAYKtg50/oVsin167f
	xSORJqEJf2AhRmhV6DUjsrru6Jsluj++m72AC7ttyXhU8SXQKxpvy0bttAbp5BPQ
	UA24TxDsTqriLWrDDOvVRGF41xNIMZWpLi9QH2ayLUh7Wgb2QMATnMQUeGc9+/WI
	E09QKtwfGyMoEjGtn79N2OmWtn21DYE6dNQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buy4nrcpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso2624774a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 19:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769137619; x=1769742419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ruu8lUBwLCtf5SL228YmvdbQbthFCpAEZ5yszPv9Lwc=;
        b=aqq75sDcuHMDylWuszUiUbSpy5xtFNwn6NsfDr4+lf98yjcsUQI+vTtb8ME/nSBaO1
         UJT8Y15ZSiZGPeNuNxGGyx4Br2WvCzSbkLb+IOVTIqCty1mk3hpNF2q0dx+4H05OOT0N
         3KLhNXpWly71FQy43HggSPhpuz8VOoqySlGCrFqNScJS6iLVJcH3MyhaTYV4sBvBT6RK
         U+YxZ8MWS1B10di0fLNAfEHkLq07zgjl+rAtPYul5azNu3xJGHyEIYS7IL8sRJPS6LfJ
         /zY8Lp8XbSWZJnIM4WUoKOEy8ihR6m3atTVBCLBvzNutH8UCb+pSpuI/QUeLP/UpaZDR
         Fh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769137619; x=1769742419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ruu8lUBwLCtf5SL228YmvdbQbthFCpAEZ5yszPv9Lwc=;
        b=TDHyuGmWvFlZEWppfOZGpM8o+GwpakjWnjzBt4eTPq8poLt3Ea2ssTU1wMNLaUvMek
         4SUFo3GgepHO2N+DfePIpi8LGtCKcYNg3XiBRKdAV0/0RFBwL/M1MDBZOe5KfjJwMWdt
         PG5IKBsg16D/TZS200KhP++9+mHsqsaHy9mlC8DpnDPVD3Es1O5ROVXnnivVS5Gsa2cc
         V8+yQIxt9TdokR9lwHpHCp1z6QxXYa7i6Xeu0yFxvRTRJD7lF9t4v0r9sA8DAmjKCMwh
         9P/nIxuiDGc0U+9kPBNGRFFwMo4Ficzvmv8L1/hT34Y5TzR7YHAVHwpnWi0ff51JIp60
         00WA==
X-Gm-Message-State: AOJu0YwGb+UENnYxOw04MB/9Ja5bq1vCpF9FT6IpCYfFwS5iiggu39xH
	UwE501u1SxfFAINtEWFPC4IcUGJ+IbrRMFp+ay+3nO5i3R9XlF6BRHoGcocfJAigoiUL69vHDzJ
	3n7As955yY6gzGZaZeU9C9udORq/drpn1i+/43Ja2HMyzE5MHg41OziJ9UY1fiEq4f4Yhc5nMGm
	Lk8L/Mfuo+WfmrpIkmcsA=
X-Gm-Gg: AZuq6aJDzchgvyyZ/WLCYrYmENpgF2JEqaXyl/Wa1YPGL4WMJKmNAE7KC0FG2BsKDtT
	+iXghn9zcQABOR1uMQQx0C2quuJ6/DJ0C7IF6RGBOxxgyCXcX63MyEUF+dMAmdNrOgzvtbaEIOx
	1y6VkUXw5dBgvGeaB5DCaOxbAHMbcZC3ztW74BhqNN42CDoKjTHmJmnxlt6iNLlD4/mqZp1+huZ
	v757csB52BjXYsfWT5tE0ZD31mkHvTgypmqoLuYK8aVDVzSt/YabUzLkKjRlG0rmKEUBn5db7+f
	N0/hO+6N+pK2t7RtusxXnKxWpC9TR7kRcG8kZgmMFP1mIqJH5/Ruce3joDThzJfdnND9YmSnM0Y
	aQO8+q5IoAYafDEpmrDoUIn1e1pcfEhQa623Ikpme
X-Received: by 2002:a17:90b:4c4b:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-353670238c8mr1349655a91.13.1769137619135;
        Thu, 22 Jan 2026 19:06:59 -0800 (PST)
X-Received: by 2002:a17:90b:4c4b:b0:32e:a5ae:d00 with SMTP id 98e67ed59e1d1-353670238c8mr1349621a91.13.1769137618497;
        Thu, 22 Jan 2026 19:06:58 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa62fsm5664945ad.18.2026.01.22.19.06.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 19:06:58 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-oe][PATCH 1/4] recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch
Date: Fri, 23 Jan 2026 08:36:50 +0530
Message-ID: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PYK9hKldD7CnzSOi5aoHY2K0M3MPEYwH
X-Authority-Analysis: v=2.4 cv=I5lohdgg c=1 sm=1 tr=0 ts=6972e5d4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=y5Yq1ZyPAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=b0ItH73Abkw8fGW46A8A:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=PoVUXeey_BepnEeCpHdp:22
X-Proofpoint-ORIG-GUID: PYK9hKldD7CnzSOi5aoHY2K0M3MPEYwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxOSBTYWx0ZWRfX+qrY4JwwSlUY
 A7IiZwE2yiVMIKEGxAdOKVN5Es/KsCJ4qQjBwtu1nO+XAMp9AlzR0zpKyjbeAaAe7wSjrA8b1/L
 i8kic3EWQJ8qDLfeYLTwl2vW5pBKmOzucmXRMtAQ1+uwvAXuy03u/dbTVENKrjx0OWQ6xZ/5L6t
 hpcUeNT6hwfra1iav50e8u5pckikkwkuB0SFKWYj6R6yXeenBJmoXOnzDwmqL2/TPusud3GQQJ2
 IwtltCBDZi0lPfpCNyWGWUVoD68DorwI17mdpPp64XEISRD0oIlbx+ZP+e6q8LY7S6cUNFJroL/
 U0tMrfbii41lKBYuaJcxV0zTAuGBps7OHMGpLdoIQco/pb86q4N2JlpS9Y9UIWjV9xDHV741F1p
 oWjXlYVgZnZ9vVp/Jlur0RXfqZbZoEZ5xgpjKuzVdAMW/CQVHdYbTCpsuJCr8yR5A+2c8FuHaOY
 +hU7hDuhGaFOVvDWekg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123756

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

The upstream site (landley.net) serves inconsistent content when using HTTP,
causing checksum mismatches during do_fetch. Using HTTPS ensures stable
downloads and resolves checksum failures.

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 050ffcdea2b2ac3fcfb5bc5f39d64b60b2dd1dca)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-core/toybox/toybox_0.8.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
index 919743135b..6a5a155ba5 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.8.13.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78659a599b9325da368f2f1eb88f19c7"
 
 inherit cml1 update-alternatives
 
-SRC_URI = "http://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://www.landley.net/toybox/downloads/${BPN}-${PV}.tar.gz"
 SRC_URI[sha256sum] = "9d4c124d7d731a2db399f6278baa2b42c2e3511f610c6ad30cc3f1a52581334b"
 
 SECTION = "base"
-- 
2.52.0


