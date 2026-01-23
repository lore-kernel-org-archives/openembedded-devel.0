Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26FFD6CFB6
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 03:07:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59951.1769137623326028824
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 19:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=MlY1J4jb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=e3OhzY6K;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7e3D3503792
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5fZe0IJmmOy
	CBmZvhWPQ0j4TV3fHDkDWErvLuNL6lkE=; b=MlY1J4jbfz4wRT4cRkv8IVOpshM
	yQeUQnIujFNxllLQxM/bODNR0E/h5LaPqWvLpGcSfVFa3CXYZ80va0A0D3/2m3HA
	Vl3E9h1YLE4f4/xMUB4E5SpBe/NyzPM4+TayQUlbr4Yj9V4+sAOzFu81jWEV0v0E
	h92iKiVk+XRLslAyhvMfMZnokVBaP6Dkxj7OsbbmhfUSW02y1j85i/E5SLQEHN4v
	ynMump0P8I9DtHBI+z2vmo1cveS1d7XbPUHjvOLAeGPcpLBJiP/oZBEC8rQe0kqE
	dwlRs9/R0mS9b0Z6a1Ma/yZVcy96V2Bo7twW3xzMRDdVD26wvTBxH5bQKVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bus981agn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a7b7f04a11so14675985ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 19:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769137622; x=1769742422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fZe0IJmmOyCBmZvhWPQ0j4TV3fHDkDWErvLuNL6lkE=;
        b=e3OhzY6KrvwdWi7FvIiEc27UQBR+lm7T4C8YdPiSySwiCfvgBNzlq8KvKIKQZEnRD9
         7lyq8TA+4yXycIXx5tSEyFD4ZfbaUtMwFwEUCivKrnY8iXonbm4UYyB0K+u43ZzyUSrk
         R1mAipJJ2u151xBT+JbwHZ0mi97P+JkFnHunq6tsGB7bRS/QdbLFbUxhSX4G96Gjj3mw
         J6sp47DZXOMoEsk+K2Jbfxp7zCAayvPgmzc4AEIM/3NhKj0k9mY14npo8hoQO/ZYDIhY
         svstATqKm3kMWxa2YzBiM035kMNOx8cM9KdQI1M3fTj6FAuU3mlLREoXN/YkHcN5VP6h
         2uDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769137622; x=1769742422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5fZe0IJmmOyCBmZvhWPQ0j4TV3fHDkDWErvLuNL6lkE=;
        b=ZC1NEqwnxA91Y8ZWklKS0lNA7idpXnDgMZsZudKA6XV9lza6mxzpBd/r/I9DNNFe54
         hcNAc/mSc7DeDkkXMVinrYoU63sFHHV9ZoyX+i6jyUFchUGpV358yaYN0XX2af1APUyG
         demCFE+E/3Bf+0nVOcpcPIiFaaJoVsochyOt7631JhHBGY1n+SUbRLfKyq7pQ1FM9C2D
         InnlhTiANXoxhlU1GxCn+BREAePuO4MnmqOPd9PUjHMkUXn0Cv4tZl9tFpERkzGiwW/+
         fEwyabr5oeoGiqDX7IY/CrpHT9uCZ7/m9Fu9kh9v1m6sFTcgrWuEgtK/gPogqas1iEv9
         0vTA==
X-Gm-Message-State: AOJu0YzZvy6g9OVo9uFPBsC0bNiorX++24J9uYxMdOeVoHMiE3LbKOIt
	nExT2BcFp+3Ot8Q2DA9Gqq2671Q91bsRaBPo71NstJ1OLqOycveFc9BjWM/BX2bEMS9pfmqvX+B
	/1QfCod0abku8ZEKKL8KWQH663JMiFMpCyWnD37aTg3hJ1EeCP2a9j/XwjGWZhl/SVSsPgB/BcC
	9nINgPxna0Lfbs8XUMHd0=
X-Gm-Gg: AZuq6aKCDxSPC4wIt09pvD0EMHryYNQmGCHRnu1jEhiDXSLMHGTi/SSDsb8VhIIKry+
	w7ZDCObRUgO5C2SxXhS9lzjTX7URgdZkHtGsBGTTrymxa6Qw55ojxshZ8Crd9ssbtP9lSPzyg8p
	kJLZ2djUTASF7Euqc2HpWwnHyoa1PoN+F2YjrONeN2qygxca3kc61MakPDAXys+M/njjx1s74KY
	gdJy2I+q0xOLx9jRzqZvATPobvERXkLOXLmnc03+bnDOmlmTSj+fH9zIIL6L7H3lqsLl7CGz/iu
	tQWs/jJ1E3In3Nl/C19h8AKgZuetE0fL2DVPkfbRSFSB+CIty9JUDnglfFl3M0ENWsL5wdkvn+C
	uD+pLgJrhhmQL0j46v+DAROXp+jAjWZL1rYZ22AWZ
X-Received: by 2002:a17:902:f54f:b0:2a7:3daa:5822 with SMTP id d9443c01a7336-2a7fe77dd97mr12026935ad.60.1769137621717;
        Thu, 22 Jan 2026 19:07:01 -0800 (PST)
X-Received: by 2002:a17:902:f54f:b0:2a7:3daa:5822 with SMTP id d9443c01a7336-2a7fe77dd97mr12026735ad.60.1769137621214;
        Thu, 22 Jan 2026 19:07:01 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa62fsm5664945ad.18.2026.01.22.19.07.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 19:07:00 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-networking][PATCH 3/4] ncp: update SRC_URI
Date: Fri, 23 Jan 2026 08:36:52 +0530
Message-ID: <20260123030653.3331549-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
References: <20260123030653.3331549-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxOSBTYWx0ZWRfX8fRx/8WILWDI
 rzv6a4nOOELeKe/z4vSnQtXQk7ezvvLjKLmw1e21ejkG8GX9kf1IQDGRTSEBgKEtSTgZdkFFmhj
 QeIlpq6t6ByX5Efay3CFiBxrdo7nlocXrL7Pyw8AWds24+G5mHi5ywZ+b9r6qNE9zhhIbbjp7bm
 9eiOvLBbcKz6olrqsuLXb1cP+aCnEDyLy/kxcFGRXj2mi1C/Cky193SABkB3f7YVLV/kpwUx8RK
 nwYjX3m/CtKAB9MUWnTgEJoJVN0FhPsu5ELLpPLNqjDF4ih4xeGGOn+Nc3yZ8RA32G4hg8TdqAs
 N2igAYTu3Y8i+AayH8uULtVKOqniJ4cyWHgm2kz6JYL0G00xyyf9nV4t5fNvAKcQmfCjL7dLbY6
 SUrG9QrnVlr47sSeZSpJL7wwo60vWnWvAoKLWISfux+35WMcHlRLIw4429lugV97FrD67zDNgno
 rE+yJR4rYS7SmZxiNQQ==
X-Authority-Analysis: v=2.4 cv=JuX8bc4C c=1 sm=1 tr=0 ts=6972e5d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Aziwk6T4AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S42EvN6mvxo28DboS0gA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=mtcElmGe8wx6H7Xd9tIj:22
X-Proofpoint-GUID: DlaDNqp80LhzQ91YHjPXTmV4kpuPuRJz
X-Proofpoint-ORIG-GUID: DlaDNqp80LhzQ91YHjPXTmV4kpuPuRJz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:07:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123758

From: Gyorgy Sarvari <skandigraun@gmail.com>

The https link does not work anymore, it just refuses the connection.
http still works though.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8da9f2fea2e4c2f525e9357814f21b70669b8d8b)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index 516beede5f..ec6d918744 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 DEPENDS = "libowfat"
 
-SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
+SRC_URI = "http://dl.fefe.de/${BP}.tar.bz2"
 SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
 SRC_URI[sha256sum] = "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
 
-- 
2.52.0


