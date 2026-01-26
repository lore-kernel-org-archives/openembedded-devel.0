Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEE0C88E58
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:21:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13952.1769408504421265316
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ELVcE2i9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=AgqSCYDT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNGbfk674191
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CmBQh67z7Aa
	RFdR4shYNl2Jj2XoHiJcjguAVjwERA9w=; b=ELVcE2i9GfCMtH3vRNwGAA56ufp
	6Qf8G51PxOpqjd4c+6r9HZiUYvXvkoBWlBEaCiXs0erF/jONoooz67Sf+p06znuj
	1D/VxYxmvXVROdO4nq9b5TYXmILFG6tf9oWWME2KkROpXan0XCF7eoOwhi8DQ51Q
	CNHGTj8azFDsoOrEEJ+Lv85vONF7Jb5Yq13vfKKRc0wupUvb8s9yR1IogQHElxan
	Xff8omYcUJj241izXD3Zyh/6CbJnI9DYkXO6JGEXK/JG2v60sRGb6MovC1VR2u+L
	kYUSF08uEfQ9WnD//xs6eyuovAZQgJSy4t5gxDvnUJmdm9aStDMTyBKSPSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq6uujpr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a76f2d7744so37878675ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769408503; x=1770013303; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmBQh67z7AaRFdR4shYNl2Jj2XoHiJcjguAVjwERA9w=;
        b=AgqSCYDTyoutzK9Ie7IC/f1yRKs+WAYbCsCxtxUJnmZv5o7l3JIuTfg/5bkiScShNG
         Z1ANeEVxJMZmNIN1FgVx4okVOGQXLLX9OQaDgrnjkvWMVKKtZlhpZQ59QyFrBzyX5VlN
         qNFgyydFgdbCiaGMKyHQy/ic2Pj3n3qi/x+OAeM13JdFuOBWxMF9XUy0MC3JRZ/S1m+1
         7zisjOdkoG5nNWlwvt6EkcbIXOG0VBAmudPaoHO8TXl7j4cTWEoDhMgBi1kM6QbBKuFx
         RSdX28FlVX5r6thJ9l8KjVd+fPc4z5QqbPoyX5+um4vvesnkwhES8qbjn7A6Hwx+GQfc
         7eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408503; x=1770013303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CmBQh67z7AaRFdR4shYNl2Jj2XoHiJcjguAVjwERA9w=;
        b=p9KeZ8PcszbdMZTRPrthfM6X4118IwQNKqVgGzwuGOdcH0hWIdmnSr/rHGwaMrBsBm
         CQSGzINfQGjXLnwvpv3x6PGvOmXLtFodU7ANVkROE4UtI/7gTQiNUVAyPAoqq0oy/030
         q62wyDVK6898QlAUDs8iV/esBEi3qhb/W88Qd07zWm3tUBE1TCXvLwgyi+woLCEmmDSu
         TyH1bVjBkVX7lm5dAxjs9MMLKV7psTL3uVbFO6fwMc/A6YD8uQREYMZuLZ+aM0gWgCR8
         M8kuFnQ4PbQSuSkBNU1++cBLuxAF52QVZutWqzCG/GmkizHQ6AmRd2FAMmr+HiVBLIYf
         fnjw==
X-Gm-Message-State: AOJu0Ywgzf4/9lelSDDNcbsp6xtyBtJN6Iu8Kc8i9nKwe8226AsftLri
	dP8ZiL5DzFIAqPakEoK8XMGe7MrX7XJwVBvOVyJBHO2g15aT08jlr357xO+vYYQEtqmHEu/xZU3
	6Q3SyoXhiwoAyReNBgoPN8AkB2Df11M4cW6c8tt71iUvk2TS/TVaBAIsmAxbWHtsx84pydFveEz
	s5zuovrJys6PTqCE85CcQ=
X-Gm-Gg: AZuq6aLttaEnT24hvk+U3KTm5X78YFuWf5qpQuehOWsqHKUGf4Eq7++fleBUwYrrH+e
	C7OS7sIFUN/qTIoBVtrvlH9F85QfX83XqyRv9Ntn+WJvvXEfZHSZO0bw4/sCLK0WTebpPhzxEEI
	QTA/+U5MHIHxSdErzOnsBuByGHBdjRnWr8MmNSjm5NENP86aRzMEW3YHaXayvgvMOxXAK2lxTiR
	J3g2GJ1T/eo2ai3INsHhYtOfusHikU8t2WCZ+WdLK+MzhpfzSqzX13xwdxkU3wGrWl2oEtIY+Gh
	Bz4tKPrTfhWUOozxf2KWnrvBkWRhCBhMRSdf/TGwYRv2mNg4WAQWYXhvCYnnN0Aqk4Dljp9VLjP
	VFR3pNGR1pAsdUgoImhEYCtasXatCPxRHbfGfSN7O
X-Received: by 2002:a17:902:e852:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a8452220e7mr32704755ad.18.1769408503273;
        Sun, 25 Jan 2026 22:21:43 -0800 (PST)
X-Received: by 2002:a17:902:e852:b0:29f:1bf:6424 with SMTP id d9443c01a7336-2a8452220e7mr32704475ad.18.1769408502707;
        Sun, 25 Jan 2026 22:21:42 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcfaf7sm81079675ad.34.2026.01.25.22.21.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:21:42 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-oe][PATCH 2/3] xerces-c: set CVE_PRODUCT
Date: Mon, 26 Jan 2026 11:51:27 +0530
Message-ID: <20260126062128.1437811-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126062128.1437811-1-anuj.mittal@oss.qualcomm.com>
References: <20260126062128.1437811-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1MyBTYWx0ZWRfX0xy8kXu1e9uO
 Lu924u5dVa+7uQH8VqNRE0jH6A60hcAGGML85MYXuxJ25LbWP3gcpsTNuycd5eoizQBUMgIXtjj
 1AHeqZmzArgDQZ7u8pctO0tEbnm4wE6Gf2vm/s/F9clnFJoH63fCYhe+8Xzo7KgHkfbOJBTnC19
 TCbTfmmFCMI4gi2yixjvwXHqhUGYliLS6yIy3/wfVqi+4plyjTh1hIO/XhTGFdozO6dGEtLVonH
 FmK4tQaliuo782J2o/AAZpfdgtrK1/Ivlb2VM9+p4uqOWv3PZ9IMMILiO9NnsMjt/oqr5qqLG7D
 GVPRc8TH2yVhx0w5pnzCz/RXSzR7kMbz8y4GZ3F9p2NX7S3TyPc7g8wwBCuxKO1bHMdX0vCmBsU
 AJkmnnYRIbGrAkTQI2JnblJxvvGvqSsUT9pSpfuALHz9UiXO/m1nhRLoMetfub1VQNflLTRBhgB
 sq8gCkaukURjtyqLUVw==
X-Authority-Analysis: v=2.4 cv=UqRu9uwB c=1 sm=1 tr=0 ts=697707f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mV9VRH-2AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=-JFkXgELngGTTkriKoIA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YZtjFjNRehQFCBqolfFU2BJVVBcbOI01
X-Proofpoint-GUID: YZtjFjNRehQFCBqolfFU2BJVVBcbOI01
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
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123856

From: Gyorgy Sarvari <skandigraun@gmail.com>

The related CVEs are tracked with "xerces-c\+\+" (sic).

See CVE db query:
sqlite> select vendor, product, count(*) from PRODUCTs where product like '%xerces%' group by 1, 2;
apache|xerces-c\+\+|29
apache|xerces-j|2
apache|xerces2_java|3
redhat|xerces|3

Set CVE_PRODUCT accordingly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 29a272744a314564035ec4a337704eb6d31e879e)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
index 9fd7e8fbab..e6c08f488f 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.2.5.bb
@@ -9,6 +9,8 @@ SECTION =  "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+CVE_PRODUCT = "xerces-c\+\+"
+
 SRC_URI = "http://archive.apache.org/dist/xerces/c/3/sources/${BP}.tar.bz2 \
     file://0001-aclocal.m4-don-t-use-full-path-of-with_curl-in-xerce.patch \
 "
-- 
2.52.0


