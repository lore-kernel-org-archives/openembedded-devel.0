Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E4D103E19D
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 05:58:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4857.1773899911851843762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 22:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UyuRthop;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=g5+8tSUb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XtP51802729
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jwMGqhlI9Vh33+/HRz/cz36Zo5cs52NX+m+
	zXbLWLjE=; b=UyuRthopTFJlSYffqqjAgvmVXroZa/wHyIIxzkNy5wpJOLdeTpI
	6LT9MBeVc/lC0eendTOcbTT7X14jTES6NeTQG4XItYEwQ4+DI+8qLGgB8Quz05Tt
	R/m6ZN0Nxyp0l9PZh7+jnhttw6HN4YSevyxhn5H+5QZ3VsShTS7/mLjpo9a7xqrs
	TdvS3934OStznba/yLMHFryMpAJWiSAfWWGQ/0lDts+A6zkzJZdF9Ndl5tR5KyoY
	FI+Gw4pKs5cD7EwP5AqjuupOJAQb1Y959DXXqYbSkWeEK4ausZsASo+2KxgEcqQ/
	qRUODQN3dLjkR8jUo4ZHhPYHr7sLGB2fJHg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyscb3t47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:58:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2adef9d486bso9952645ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773899910; x=1774504710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jwMGqhlI9Vh33+/HRz/cz36Zo5cs52NX+m+zXbLWLjE=;
        b=g5+8tSUbLTycdYi7y8JvGWtlNTzUsrsETMuConl9mVs+P7NjiIo8rwLr9EV99141EZ
         F2D2wHXFU8TN2tWiBEHuZ22yEmihWl2FsHa+B5iceplY8tHjMOz3NBqB7CKfTgABdtqi
         wnzffvCKtWWUME0BViGhMrdYf6Dz3LtsWXL54Sjpu5EDv4ZLurQILMi4HOnynpNXhmv8
         WAgvNTySXcZUQGOCpsun2Rmh8v/O0YrSscVticuDJ+rN/WrgCRRm1Jia7BFD1bgofMVb
         vzGtP+7kpRlOyVoKuHTshq1UptTd0Kw7ZdudlY0OV9FLoS7Zn43L3GnjwfNk1xNRYfiX
         PkHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773899910; x=1774504710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwMGqhlI9Vh33+/HRz/cz36Zo5cs52NX+m+zXbLWLjE=;
        b=OmyBiRHmg3Wb/RpJEJZ1QfBFREZ+gMSYpkvZlJcoRTXSy8w2fgmDOXipnN9cowKHJt
         I/2aCr77Vt78degewSOeiGVjtiwWQkGgqe/Xl/d0UvdVVqOYEHCuh3QnQmTo1MRRN49Z
         KXSoj02jqvBQX/YMhwukX/364FBmr8g7csQjZtvjeVJCUl9Vy1LDxAtbtM9qQHrujFH4
         XSXPvXHGhRavaTI545G9EBtiLbq9J1xsg619FNl4NsnafA9vMRmoZnkgUzVyqlUJww/M
         us+XqNzE73U+FZhj0DRLuD35+vUB4vz5QMVhzQdaturXplTNn1X/TXD1Ip31Or+r7rKt
         E7LQ==
X-Gm-Message-State: AOJu0YwIV/d+4GeN01AclYtBPB6KzHyvxWmu4eAHT45fS+HgKHYLU59M
	fqPUxHtsZbVNKfdLNymU0bm3RLImw8LaZUcULaaUbucbgYre14mOmF+MGxoG70iQt09DH4hFuQm
	T15dzZOiYzIWv12avkpGUBSFTQFfSBba1KrYbsCQLk02K8X9a3ThJnueuhJima1yTV4e1OWeJUe
	/O9lOstYUuIlBul/WwqfE=
X-Gm-Gg: ATEYQzzSOWt4fWT9l3V7+K6bPtXCfwd9DevJUIxgVCdCFKqS1WD1ZH1W4d1HGMhh9nw
	E6ZhlGtZlAB6Ok+Cix5dxlwOoR7UrgDQjU+D7N/+XnBvVd2c41RSdfx+UL3vSgv6gfZgpqhuDTx
	jyTHf7nC9ZmT3B2W8fxj1c2WDnSGMP+Z68ptPFHPufHMlJQQPQxmGJWli4kuSl3qDdOWExzPvp1
	/MgZ1NqRjqCFI5n+BigiC/lypqybvpfNUjcUmmMqjj3Xij0yPJEOeWieGPcbrL0geNW7utsIR4u
	GMQVAbcC9eLUfCDBIqQGo8XyF2GftqM5h4YOQ2t2MX8xbzS8XP5wEAEGoOQ7I2dzZCrT3zb2BEc
	6FWU4R+kD4WAfkAdFSiZIw796ra3CS4RqM9hNQP/O5sZoCSnXFgf4
X-Received: by 2002:a17:903:3d0b:b0:2b0:775f:febf with SMTP id d9443c01a7336-2b0776006b5mr18561705ad.40.1773899909616;
        Wed, 18 Mar 2026 22:58:29 -0700 (PDT)
X-Received: by 2002:a17:903:3d0b:b0:2b0:775f:febf with SMTP id d9443c01a7336-2b0776006b5mr18561485ad.40.1773899908949;
        Wed, 18 Mar 2026 22:58:28 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef354sm47947005ad.48.2026.03.18.22.58.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:58:28 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wowlan-udev: set S to UNPACKDIR
Date: Thu, 19 Mar 2026 11:28:24 +0530
Message-ID: <20260319055824.3184933-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ObLV95zpWm6aQ74p4A-ZMVZLszO350Li
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0NCBTYWx0ZWRfX77IJlOHAQ3rB
 au5k13wSUdeC5rHD1TJLYzWrmE7x87xsA0cxjW1yV13RSZPkUCO614WMdeRrhcE4bbD+mbSrxV/
 20oR72M5GoRaBtohiEpT/1b0OXlxSX1igGSGeZYq+aoiomIcaplWgr+z4s/J/P5K8oN3/d8laPU
 GbdA6G71KgXdUFR+K5W8WHnmYtCR3zBNjOLuE2p3cwOjK0AW3vDKsda+PLRg/yt/HjqaYVk8yZq
 Oe7YNOiQPhip6Zz53eGuNmKYzk1BUhsFJ/Jdvd99LKo6U1TkZjgkBm4g9uoRNr15Y4LT+wfM4DJ
 7IKMcyhY0gx1k6fnr28bAh5STY3Oe+K5cXFXzsHmOpoZfu/StFV2i1HHw0PuhMCsTKEFxdVkAmW
 2Ev7tkSRK1zPxfOMqja4eH6kDBL3eH//OpImL/zbdBNAfWcLDV9GIeocEGx02myb2wiznnPDvlZ
 MuIWnFtcfV+m7UCuJqg==
X-Proofpoint-GUID: ObLV95zpWm6aQ74p4A-ZMVZLszO350Li
X-Authority-Analysis: v=2.4 cv=PtCergM3 c=1 sm=1 tr=0 ts=69bb9086 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jzdtulh2wZf2DqzS7lwA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 05:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125378

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Since there are no sources being fetched, set S to UNPACKDIR to fix:

| WARNING: wowlan-udev-1.0-r0 do_unpack: wowlan-udev: the directory
| ${UNPACKDIR}/${BP} ... pointed to by the S variable doesn't exist
| - please set S within the recipe to point to where the source has
| been unpacked to.

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
index 857bbc3f95..61cba47e33 100644
--- a/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
+++ b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 SRC_URI = "file://99-wowlan.rules"
 
+S = "${UNPACKDIR}"
+
 do_install() {
     install -d ${D}${sysconfdir}/udev/rules.d
     install -m 0644 ${UNPACKDIR}/99-wowlan.rules \
-- 
2.53.0


