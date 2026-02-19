Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4694E9A04D
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 16:31:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18118.1771518670274467790
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 08:31:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=B1cAPha/;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aAI9xHUe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAWnSX1623623
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 16:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oBLwsEGJJBCL20Yan9XIPpBYs40c9C2YfRJ
	GkZAmOmA=; b=B1cAPha/2tIuR/G2TiZlzTWqHiG/+Vb5WyNED8xDDh9z9aQZPRi
	SViiK1meFgIwB1hmVzA/93ucpjtI0T6JF4phCKhTJlTuikDZHKmCnWkzIlyz/hwP
	jz3htooVJ+mkmq6aBeaRN6jGbcKDlcjXGdZN1ZQxla3M0uHtPZCr89kOUvxHbo7x
	Y3zAFSvYMFserBqwU0nKM2PUcyXfAhcTYlPboK5QtXYN7AVvfrWjD8u96DA2LKkC
	aEFRD51BCU0NNLqToPqx/5SI6wr0/nPz3mtYDoCU8daaUW7aeiEV8tPsdKo7bWC5
	V5LGGeoCQ7NHp4l+Eq4KT6w5LZjRU2XtHsg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdc7ucdhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 16:31:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad60525deso71060225ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 08:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518669; x=1772123469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oBLwsEGJJBCL20Yan9XIPpBYs40c9C2YfRJGkZAmOmA=;
        b=aAI9xHUecZ45s9pgXk+vCFwtd/3GGgl1Yp0tptD/9P2URP1jH+RvR+2MN2Eey4Hxxm
         Uf/mxNV4yiTZSLd3M2RHo6v++l5m/nMYQZ1g/cRKTMz6GFqhbQjjubUs6cQV+vSrcmj8
         3Nv6yWXZPi+7tlf7o/G/Cp7CPF7f9O2gDUTpqcUvh27VwJeqb95DBMV2Exbuv8gooIb2
         0LdRq9KwEWxAfSnhNhyIPFZz/AKPoYxe5gvuqD3lsFn3slS8SsyX82NBFo9yZpgAvNYd
         8oYhuD9g1N/CQkebQp24XmsNs/qhL24knr8kQFfC8j3LR9GSte6irU/WaiChaU3wtcFA
         NWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518669; x=1772123469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBLwsEGJJBCL20Yan9XIPpBYs40c9C2YfRJGkZAmOmA=;
        b=nrcIWxnVQAl3X/dtObof7V90jvEdb2ShiGNj8yLl1vpjQWFiJc1BGZogxPNZChCb1e
         uwt6je5QnOxCwa81cOAaGZxdRKsCfDQZw4bTIwDzRHqeGXHy8GEdm+WrQ0Q0zASD38zl
         jsvK3CB/fSL3fdOLu/GzKY9PzbTZYmE9QIW46C6wkw3RDlIITxxHB1oD6eQLM+XG/TUA
         pKJuWGJbbbkAlFcJut766ExFrDdpGMxxuHIt+c5CuNm6h+2cDAhEG8tuqcpuGXmunnSM
         znmvoP2KQZPfoeffP1MKJMWiAEoRtgAbWpZiVozBmqWwnr0nrsIEwwHweGgUMUwM+3c2
         XEPQ==
X-Gm-Message-State: AOJu0YxbfxRxSE/1Nuf46jBcbFoJ94k1RmzNEeydBFGGZp4rUP4Hawj8
	kxHvq4r8rqdTZ5AHv5vaEDLkubB3SbZ/Qw9EVQfh9RkkgZZnGEbEloYIFw5vtdUgUnjsNiXKJIj
	VqVTU+TtM1+7LrF4Iy853qnWMdKTLtGCuDbNcpFe+SAPzYtkmo2c/qfqbiZdMtPIvu8g5O3gVuM
	ETrr/tQa7hJdjS6BYZ
X-Gm-Gg: AZuq6aIqA87S+eTWmXdDfZ7BeheBPYBjGOcooAfXaxAAcffusUZMKQ88KfPxjGy6tQL
	3nAzzt0HKUYTYEG7MaeKHCnLDwItrkf3mlhq5BDHoCUgkGVERtuA8adAUizI0qxct9XUGYV2V4n
	zAyOlf25g31gruWqNQQ5V5nGOTQ8MmkJ8Jh6wsqzqAk+Klyr3J4ExC19r9SP5QkxaShDbW/FovV
	wz4JymFhztHNPDDkiXCNJO4SGzqowQl4+E2qsfxkORZJXev2fA2xU6CEzCnoUuu8k9eD7HgZ63W
	3bqpQUSfp3FTJyWX2lW9v6a0ZtU2J8y2JRh+Wqjqpa533tVOjctXmQSGSlK85eAmo0DJZWE9sAS
	o9lZBbJK5g170ZalZKPNpzyo5olGjDihpzM3GwraIWBr3Lz6IrMUkUNkJOVUrO1g=
X-Received: by 2002:a17:902:e945:b0:2a9:4507:3e86 with SMTP id d9443c01a7336-2ab4cf837cemr237764355ad.19.1771518668809;
        Thu, 19 Feb 2026 08:31:08 -0800 (PST)
X-Received: by 2002:a17:902:e945:b0:2a9:4507:3e86 with SMTP id d9443c01a7336-2ab4cf837cemr237764035ad.19.1771518668251;
        Thu, 19 Feb 2026 08:31:08 -0800 (PST)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a71f1efsm174660415ad.32.2026.02.19.08.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:07 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][meta][PATCH] uki.bbclass: make DTB packaging optional
Date: Thu, 19 Feb 2026 22:00:51 +0530
Message-Id: <20260219163051.3809204-1-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BWEDg2OpZj6YqDs7a7F5GM_YMkSciXnB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX8Qtj3tiJmlpx
 EybQjwv2TjNA+/BP3mUk7RPuTrmRqQnZE8iFFSuXI2ws3D5m6gjHW9G1qQY/0US9Uz4/DpmEE2m
 Omb3wpcFlX013yrTJiDFb5qiuEfgXA9X/dH13RPuY9BuzRoOKSc1J+rc14Tv39KmDg3B1tACcFO
 e1IHBu/jNnMqxsAIuz1E3fP/JvcVn1Y2jm2laAkuhVqo0BGLC4K9Fcp4HCCcPeIjcTXBW086r9Z
 +4xr02i2BmVWEQ/OwQus14FB5ncbb9yxOa3Q70T83LH59vQzuPy7bMD61+PpGac4OrfcR0q4tvA
 U6PjaXNDOd0VOelZROY4H12ybjKYoxIJUG7s3tEZf1xmQqEZcTfPVQO7QdhOK9chVCpbGa6pYAh
 b4ls7hq6zAJbasCM1UnqtXsErDKFBEizJfExz9gfL27fDclvrODMKNw8aIXE4S+9M30w9tPERnA
 1NAhOW7FB4hFr5vQxmg==
X-Proofpoint-GUID: BWEDg2OpZj6YqDs7a7F5GM_YMkSciXnB
X-Authority-Analysis: v=2.4 cv=daCNHHXe c=1 sm=1 tr=0 ts=69973acd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=nv23E9fyAAAA:8
 a=EUspDBNiAAAA:8 a=Rc8D2G7uKTYt0k-AzuQA:9 a=324X-CrmTo6CU4MGRt3R:22
 a=ehkDpipTsgk7cDPTKqUC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 16:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124510

According to the Unified Kernel Image (UKI) specification [1], including
a compiled device tree in the .dtb section of a UKI is optional. However,
the current implementation always packages device trees listed in
KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass
unsuitable for systems that rely on firmware-provided DTBs and do not
want a DTB embedded in the UKI.

Fix this by introducing a new UKI_DEVICETREE variable to control device
tree packaging. The dtb section is now populated from UKI_DEVICETREE
instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the
UKI can override UKI_DEVICETREE to an empty value from their recipes.

[1] https://uapi-group.org/specifications/specs/unified_kernel_image/

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uki.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index ea449540db..326697a066 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -80,6 +80,7 @@ UKI_CONFIG_FILE ?= "${UNPACKDIR}/uki.conf"
 UKI_FILENAME ?= "uki.efi"
 UKI_KERNEL_FILENAME ?= "${KERNEL_IMAGETYPE}"
 UKI_CMDLINE ?= "rootwait root=LABEL=root"
+UKI_DEVICETREE ?= "${KERNEL_DEVICETREE}"
 # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core)
 #UKI_SB_KEY ?= ""
 #UKI_SB_CERT ?= ""
@@ -149,8 +150,9 @@ python do_uki() {
         ukify_cmd += " --cmdline='%s'" % (cmdline)
 
     # dtb
-    if d.getVar('KERNEL_DEVICETREE'):
-        for dtb in d.getVar('KERNEL_DEVICETREE').split():
+    uki_devicetree = d.getVar('UKI_DEVICETREE')
+    if uki_devicetree:
+        for dtb in uki_devicetree.split():
             # DTBs are without sub-directories in deploy_dir
             dtb_name = os.path.basename(dtb)
             dtb_path = "%s/%s" % (deploy_dir_image, dtb_name)

