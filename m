Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC8BC88E50
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:21:44 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13951.1769408503015000111
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:21:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=f34VBord;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FjwWXBgP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKpm5c389525
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l/Xfk7prf7B+9VhIcHNJn0iQJ/wfPCrdFCY
	ZpJfUcgM=; b=f34VBordU1VoDi9nA8wI4zsXhxZhcYmMW5p7Mk3DtpuWno1f3v/
	8hgpeSV/3mspO8A2aUxTR2rgx0ujLrhTweHkjkAqvS8obdhubOukKVf11WV2YFOn
	Kov87xvcw+kJyVh5EzAzoo5EiJAudeiUO+ShOq5efElZlJzqf8JBkKQAA/DqBifl
	YC5KuHMKfrpL8WC+wAzFZtyszc8zEujGYw2iFhs8adhY2bQ5JJ18SpnrWTnjGL/L
	DT63IwEYr7DkpBV6lhfMI8nsWo3Fm209P4Q9dEooV+KeHb7NhbgT8Ei9MUfCk7uA
	IKZnBeh2U6hjNcMYSoPSiro7/13cd3G7sFQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uujpq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a77040ede0so39042815ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769408502; x=1770013302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/Xfk7prf7B+9VhIcHNJn0iQJ/wfPCrdFCYZpJfUcgM=;
        b=FjwWXBgPkpovvWIolgJegpcBN1xBmmg9oNy172n4869fPnYefIqLm4eis04R7R18Az
         bheUzlx4OKIEgaRYqLh9UjNWT6cKlEDKZw7fyQ27TaxuMR3gSwwjYFJq001NlWVv23mv
         datNR8cqF9NP/oyO/UW+UZCMVT7S8N0YWa11fgYPdv5Fe8PoE6Z9N82Xmc/qYqPI7BKU
         PMuGy080KxhgVekNShODGMM6TnCBkL2KyevYZC99T7K+5Rj50iKYxk89VdDMLcnJ68DA
         GLMV52wlc7gesencdbwvrcebK9jNQGG/9hZzFsTdJoeDndonviJGn4td/W2s1wcextBF
         t9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408502; x=1770013302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/Xfk7prf7B+9VhIcHNJn0iQJ/wfPCrdFCYZpJfUcgM=;
        b=Uf3muxISt2wtbwiZDYbbt2pOBq6PiVRdeQa2DW0N+p22MDPUxkJbqsvz3uEm7KyM4F
         +7VUDGqi3HGXvvjEpN0k0hOFnH5T7+l8OeoxSFQ88EurByamSKRG7TtpvrX4DTnGsnf3
         vrHrnEVrZjku+6EtrlreMxIGeqGKNIXrIKbu2FkoyWtIhSvfva8lplREhreRaETMTqXG
         iSs/niTcHMr8Q0x36ZuizSKO9IYeBWrMO59RyWW0psheuGhdm1fUbDIPq/fDuG5/kpYc
         r1sHAYD9euef1INsHaXYrcn+Ye+/R5F6PHov3KxicNel80Y/WTUWTMx6P+POsj4Z/CiK
         QVJw==
X-Gm-Message-State: AOJu0YwAZZXv8/umXPnFdbsdg8p2k576yHpdlDLhCXGlQ0lvRJaoxf4u
	4tebKFoIVOGJa1AOG3lQ2+z1zNb7Tn3+S0K6TXtPDi2aha/vaTS0KXfwV7WaqrcgAJ1fEbsAcmE
	eJGiyYu2LU6gTz+8GczUNDDPWvpj9rcJmr20iCHusHCrHGz1VMyUlsSAaJjuxmAmmBusUmTBg2S
	nmkQ5jFJhq5yfuhk2l/sA=
X-Gm-Gg: AZuq6aLdB87EDvs9jihcNZVbe5slv+qIemQejI2LbLJMletCZ8UvngT15+dMdzJiab7
	WtA3/la9Ahw1xf0sGply45bmZJDsJzsZssDqTLMW6K2uY/PqInia26w+hWYtrsL9fz46EhifTIf
	LXkLP9lgTAwX727coyVaaE/mOIkFb/i1NKXKQD4k76Fr5yGBVgnROBMbnZnxM+tU7w8xgDXoW3h
	Zmjinx3Tmsu2SsJKTCWMTw/sXK8JGS2jzlu6eyST3Ug4qdwcU6bbY1w95lqF3ODpsaoXU4xsdER
	nd8MCdWO2TqStdWOPKL3U3OvKMHIUeZkRT/o4gpVrSBMbakjfeZNjY+kWnyC8nCu6XcGdp7Fia3
	7ZcfRU/g+JE9S7w6f8/F6vTLkHhWORhAnd0R2SZHe
X-Received: by 2002:a17:903:3bc8:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a8452bc66dmr30215425ad.38.1769408501823;
        Sun, 25 Jan 2026 22:21:41 -0800 (PST)
X-Received: by 2002:a17:903:3bc8:b0:2a0:c884:7f09 with SMTP id d9443c01a7336-2a8452bc66dmr30215345ad.38.1769408501306;
        Sun, 25 Jan 2026 22:21:41 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcfaf7sm81079675ad.34.2026.01.25.22.21.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:21:41 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH 1/3] acpitool: update SRC_URI
Date: Mon, 26 Jan 2026 11:51:26 +0530
Message-ID: <20260126062128.1437811-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1MyBTYWx0ZWRfX0x9OAR5hqD18
 IQtJlIQYlsd5qcfX7YXDFIxTqaGkCqvlzazfeFa0CPeZFwCugL4z1/JMsxrqA20gMTG/QF/sw5s
 tURV0IcSTfmySDv0zt89MUXRRLlX2eyZVQmFwuQU97iIM2cvWjYBSVY5MZwi+9SPQCIq1ZhNv7E
 iibOPdEpSHCZdXsh2c6P6ChnOSfFSh+e0tcp54bhuDsXGiLG03T1/C+BbicKmI0KuW5PrVMva7q
 PW4PWpZ82QXf3zQdSHahNcZ2MduwYPjg4IIaL7XPvs/lU8jViohfR2odl4v1O+1X5TBJC2PVEy7
 PAbheAuR1uGEwiOUTdlOx0xM4qa18/g8v65NoXg5fI7Hgv3XRjWATZ+yP4Y8a7awZhJ/sbOuBxU
 q63U+fnyFFdy2n1JrGtxsxccAV8q1ZKu1iBIGIN2Hr0va/a3+W2GMj+y70IFXrAftTVg6SPiT+/
 vZzd4rEUplOB7GvL82A==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=697707f6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=kKFFB-AYAAAA:8 a=FP58Ms26AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=nYOUHvbjhWZdPxHcN5gA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=j-b7SdXk6dxKsCe-uVBN:22
X-Proofpoint-ORIG-GUID: 4JKYMTVT0kevXaBYuYVQK1D5-fECxPbN
X-Proofpoint-GUID: 4JKYMTVT0kevXaBYuYVQK1D5-fECxPbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601260053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123855

From: Gyorgy Sarvari <skandigraun@gmail.com>

The old SRC_URI stopped working (its certificate expired), and the recipe
defaulted to OE mirrors.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0b2deaab02251a61fedbb15bda3b908147c717cc)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
index b392581ecb..60620f0cea 100644
--- a/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
+++ b/meta-oe/recipes-bsp/acpitool/acpitool_0.5.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://freeunix.dyndns.org:8088/site2/acpitool.shtml"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BP}.tar.bz2 \
-    "
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}.tar.bz2"
 
 inherit autotools
 
-- 
2.52.0


