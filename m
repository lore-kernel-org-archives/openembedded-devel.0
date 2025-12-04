Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0BCD1CDCB
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 03:57:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34600.1764820621609222250
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 19:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CTIdfLgv;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dRi88Oot;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3J7rq93123563
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 03:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F92Mtkn5LC3GuQT90cEKZnTGvqFu/sbBvFK
	YK/9/77s=; b=CTIdfLgvfP0+zDIhNqpZIVlDQcnna/tdrm9lqkbxdbvn0liSZEp
	hDJtt0POUaLj/iZnog0hIq0U76DAT4PwgJAnrfR05hc/OZ0RuvHJxnYzpe3MuATn
	+XJi3FOGL8/CUV9kCaaX+Q8PwGht5HxqnLYnA8D8xwW1fcTSlzYT4qUur+A5ass2
	jwdNZYTlkFqTGrL3ani32mDsP4zyJ38FCuP/jJ/j71ZhFZZKHjynOUrJ1aI4V1fd
	uFoVlJvtBivM3MEbxmi2FX8CwAvzkxrenblE61qy5lOtQOQnUt2BUtqITpLq+Cv4
	i2Ib0A1z6M4sk8RQj6+CBDrjRKUslfE7d4A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atu3h1a65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 03:57:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7c7957d978aso485074b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 19:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764820620; x=1765425420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F92Mtkn5LC3GuQT90cEKZnTGvqFu/sbBvFKYK/9/77s=;
        b=dRi88Oot1/mLKwhCFj4RP25QyAdrpt5Sp5K81iJQ+YTrkzmcKTHTeeopb9omLyrHuU
         77T/IVBX/98doht+t8XGGfaF2JZoJyBGa/3vPOlCCX9gyT6OvbDgVZ+CxmfoLTqtLEpf
         Q/7o3qliuaCDPGN8CZxh0EOsj70sQ7ya3YZ1JdVQ+Xz2Eii+IYXPBwlDYRWA0O+V3rdG
         eEU1E5DFSPWwZFqfF9LxEe2Lizxi4Yeln5kuFoUWG4CSmEOMdrlDphoqMF3g/A6oSZm3
         uycKjaTOg0vYUrOB6qv7Sth58szLgODY05f4iaZvK7SNl5R0EgEOXKG1RBfsQua/CiMR
         L7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764820620; x=1765425420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F92Mtkn5LC3GuQT90cEKZnTGvqFu/sbBvFKYK/9/77s=;
        b=JQuhld8H4YIC149TabI15J3QUT7Jej0LuQGrUS1wqflCpyeiFjjWNytkJFFNORMHZS
         picf+fv1viHf3fyDzUhxWImdmg42dNRZBcE5j85aCRyfOMBW1YmgqLK59+rMGZSUkiA1
         NBREWs5GW3F5hNViUTWP9R2ZqQzjfNMPoQdQ+84rIqg536dDqSUUEg8Qb3cyoBYlNVBg
         0BGLQSTuUOrKu/+y/5X/t1NBb1cCFPDZrA5MivyV0eeFri6KJiPXGH5BBy0tQRBRnaVI
         1Adcu4aaS6o1NrxDedEZ4NUOpyjScR3zP21qwPYKjEKE40hThRov4dEQorx3p+uE0t86
         huHA==
X-Gm-Message-State: AOJu0Ywelj13YzQNXtGhql3jcCWXVrBDVdvXLhQV3IkwCSSy4asLIuLn
	DV+6TUUU1hNgA6FcqsoJmj9jspCxgzC4CZrjUngsmiAgPHup3wXVoS3+5txO1i6LXvjvaucaURj
	D+eilK/6WlJUXNe0GddnlaIQcQ15EXv7ODsiegiCOhiSiGnaSAVTbPauAkg9RAyZ/2BopAf34co
	ez8vIFqKqf39OJrlEa
X-Gm-Gg: ASbGnctRUCWTn5Vh6hR5SBEA+nWlSkpcJCWKuBCiGN1qUz1kV0RMZmZOvjyiW5hyLu2
	dzE9+8H20m1dCOMXE5z9HntHEKIQ8iGH8tLBXOXpBtdVvKgPOnuGT2HBM+f+i/+hBki7XeM64RQ
	ktt49DoMe56jJlnBJDM2lovrYviOz3DSzeFLbhRTlweTTHX9Xs6bPeuQOEB4YlTTYEvJJcQWE2z
	KSHD4Vys1ger3Cd6XxkSTVDbAJmbb5miN3cUzaH8Pr8cfm6TAeKymy4pR6R0Ne2V766HP0NJXJu
	g3c8z0yfyJ3izRVx6jue6Cjqe/+qAAWnEPInC8R0fwFJPJm1BGT4cceKKwDegzzFioslN0ZpLG7
	P989UzLGXTwXJL+RUqHLI3aUyDUoa/7XP6i0bbYWw
X-Received: by 2002:a05:6a00:814:b0:7b2:1fb0:6da0 with SMTP id d2e1a72fcca58-7e00ef4ae5cmr5580031b3a.28.1764820620354;
        Wed, 03 Dec 2025 19:57:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELtWUlpZl7Pwt9C1U9CTtylIFGAaIg0txZqfAxcvNoxp8zjnpvHxmH8ItqkTpS6YeMjMAQug==
X-Received: by 2002:a05:6a00:814:b0:7b2:1fb0:6da0 with SMTP id d2e1a72fcca58-7e00ef4ae5cmr5580004b3a.28.1764820619856;
        Wed, 03 Dec 2025 19:56:59 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2afa31d4esm459949b3a.62.2025.12.03.19.56.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:56:59 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] trace-cmd: Update SRC_URI to use HTTPS protocol
Date: Thu,  4 Dec 2025 09:26:55 +0530
Message-ID: <20251204035655.759785-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyOSBTYWx0ZWRfX7H+Et20Yw1Q+
 JZM7mDpPDdBSh3awg1cyyR4PS31LEAKXry2ulP8WYVH13ybttCgxan/bJzwCvpw7E+SLkQ2ORXW
 7bjb+GTRRfk2DBfXFd5udF7YGwwhRdE/gxMqJiTaegdNAzt2GttyRmSBQBZ5lDQoWWXUcTtUaM3
 eJdcJ7Zk8Bg09OXLVUObar3rBP3cU0Wlza11hORZBJDD9F7z/w+JfuaUGqgVRS9BQNkk/+19JGQ
 iAbW63AvjVHo6SHdNQfxejh/MYnykRo+IQ+y2IXlHgToIEqWNe+NxHsp2Sb0VeA2OwQIr4WWBtt
 pkJlVcrUch6iqncsZLfyel8cxU28zq1CHAo6bfzuQdfqd0nYA9/0G+vir2RO/8KIYT1jjcG0fFs
 JhCkHgmn2Ehp9rK8633cr26oMYdeWQ==
X-Proofpoint-GUID: do_uA0LE3dRQoowFtGAjnVJYS2tMwSXW
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=6931068d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=HcOEcyuGgr86ODkqKy4A:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: do_uA0LE3dRQoowFtGAjnVJYS2tMwSXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 03:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122296

From: yuyu <yaozhenxiu@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f00b6ad12f2fead06487711c48544b3dd62bb987)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 11c4037b23..2699b3d8b2 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
     "
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master;protocol=https \
            file://0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch \
            file://0002-Drop-using-_LARGEFILE64_SOURCE.patch \
            file://0001-Do-not-emit-useless-rpath.patch"
-- 
2.52.0


