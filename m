Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B40D0E6DB
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 12:53:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16319.1764075199158699664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 04:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=StOIqAV5;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Xp753nfm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP8DlXb2726797
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5zv4T8mMCYE
	D5i/+SVefmOcEIRXZTuV1AhAXjO4vuW8=; b=StOIqAV5m1iEgs825pHjU3o3SpT
	Idex1/dZhOhhvoPNMaxfYOpbQPgM8rJ52YJ3CBtjwcMC+mqKnZ1L8AZQjKVur42d
	tMVD4TdtiZw+U/CdSYr1TpTndTvYgDGeYnVHZUiCHPauJbKo0P6Q9cqqVUn2Hvu0
	i9BnctKuTSjGXjtsXvXkve/fp2YE4L4b3sjekCG5ThyUsjOGRfjq56hDgA1kcOAo
	RtaAy7p9CE/HbFYG++7dwPHs3ism/amE58rlBIeppOehvCvSyI0SzMOcXenTP8a5
	G0DrDebZslYuhs4f6mmmVlQkCuHKrv3ISnQrOaf8hBIAxB9wdNKwP/fvSuA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an8rvrv5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:53:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-345b4f2a8e8so10189780a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 04:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764075197; x=1764679997; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zv4T8mMCYED5i/+SVefmOcEIRXZTuV1AhAXjO4vuW8=;
        b=Xp753nfm9+aKA2b7O4lIs0G5D7GnCeN+Jf7N2Cl8HjgV9xULDDIAU8vQQE3Vqoa3F1
         ekwnt09mqFZVKMJK8hE3tim0yTl3Xu2CpOvbT4A/ncDtNpwwRMBBQjmNAMgBIITYeXb5
         slByDfh5x6OSRMluKWk3ucfYo/sBx2sxxG1K2v8BZuQR2hbwgGDAEalWO4mgaxoh4otz
         k8YaR9psZQ16SERfcltRv6aRn/q5AeE8CvQvIBgq5wvz/OvXI2SpXlccJkAnETqjxMC/
         ac7w3gxFvgKMvWxWMdwUGCga09G1e+WomhNepcAijE/H/B4ogZeE1BRHhF9VswBVWXB5
         sXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075197; x=1764679997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5zv4T8mMCYED5i/+SVefmOcEIRXZTuV1AhAXjO4vuW8=;
        b=rBarPUqUZ1/YN8z14CmVXkTOeQHoLaTiH/AjXnsG9E1jPQ65MD0Fe6iRUbfgBNgkF5
         5vxbinUGkNn0GZzh9fhY3i+PeHFHeIp3Tyctbf5KHpqj/iQa3cekFuGMi2cZyvfP/I+T
         tJbzyEqyL4JLy8Iz9Ehove9ybCNwxTintT4V8NFgiXmo1OnsAaft03SW5f9lbckD1GGy
         w/0E9UaW9g4MTUUhrYjRw+ejX/r/459pSxghb2MkaZ0WUPwt1ss5HjeoZgVNSNxBceqs
         NdqU99RD9gMRA6rhPWQzE2EaSWLvFu+icVmdl01oXgW1Ht57l/FznGikXICB3XjNdh8V
         vWJw==
X-Gm-Message-State: AOJu0YxXClIQqgdfFyp0hL/rrkpeCwhkilz5WW63UjtH7LtYMUwMvWHe
	uIyE3tMTvLPExHWGO4gXfxzJPDPF8PvGezL+eZEPcGxlXQNWIs+QNLv8Qz+WcpaRWGxBRwDxWrm
	j2o91URVYXvMxYuIAh7DRXR1oBvsitpdxm4GDTVpt3g06eFpmpEvv6LlahizRbdnpvv6+CSw2gq
	Ca5g6AYbV3rf7m+W2w3Vc=
X-Gm-Gg: ASbGncv4VNTZ9GWahdTYZ6kIu3yMVtcMwpEwISOKWzdSH/bMIWaeUChK5DnCM2O6fsu
	zwDuEx6DLi6xNFWeGIuhqPW7ZYUuxr/wBWj7qp2RQeeT33+w8xEYDLtXEBMZRBGhlF+CKgA6bw0
	/h0iPgm1z+Qkdm3rQw9xJOUd11ogA2eiRL7nfRd4YjJfyB5h0b9GN1K0J8Si/QhNKV1oVSuEJLD
	ArUbkAbIKTZ7P5MdYLi70MFIez4ZIhP99zuTvB8uQpipI1jr1YcGHiIBPbuAI8ZiKTy/s/rEZdR
	14Oyvj04EtzTQkVCSavnyXGohE0U/i+IrN7kAu+6WcHI344Bk3Id3Iypt8WIbWSLsw8+b+PwFMj
	x671XOWEpW9MSfvvM3GmCPB8alqNVYYCSPZ2se6KI
X-Received: by 2002:a17:90b:50ce:b0:340:f7c4:7c78 with SMTP id 98e67ed59e1d1-34733e6b390mr13232598a91.3.1764075196806;
        Tue, 25 Nov 2025 04:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzKLH5zM6o9zun8SFzIGdJy3BsbEYB7X1LygHkI1rR+Ldgm52GEJwMGbWPS0Yl9ZhyLgIv3g==
X-Received: by 2002:a17:90b:50ce:b0:340:f7c4:7c78 with SMTP id 98e67ed59e1d1-34733e6b390mr13232578a91.3.1764075196374;
        Tue, 25 Nov 2025 04:53:16 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174d2c0sm17999975b3a.66.2025.11.25.04.53.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:53:16 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-filesystems][PATCH] zfs: fix host-related reproducibility
Date: Tue, 25 Nov 2025 18:23:08 +0530
Message-ID: <20251125125308.1540591-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251125125308.1540591-1-anuj.mittal@oss.qualcomm.com>
References: <20251125125308.1540591-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xITrGjMf0OUkvdEMEO5lnRYyYaYMKJRj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwNiBTYWx0ZWRfX51dHb1ZNyqXi
 l9ZFNtVq3G90HLBBN4eCurBTV/7WBo7zIgA2UXgT5StHNXuIB0pdU1a1/5XFvQtRwHs5O3Gxwpx
 fHY1xd1jEeFLx57St/cVc/JlLvok9ctx1vjr8xJfos86czvC2PUP6kqy+FKBcT0fVohP5kwLUgy
 dHCsRvbOXFPCI5P5pBqTtlZzllGnJ31qTE5BCuHhMWpl+hDhQNr3QaNiFNT5dA53NaSLz0yMuRT
 GPOAGVNjcU9gyM5BBb4xyKh3uM/RmbDdOlYDiPahWqznD4eoQToZc8lG7fvCqDWQnA8D4y9K5T6
 fs3VbvDOqsaXlsQ5HqpuZ/dr+Lqbxpn5nazMTcePCa2daVOTx946lUgXJW0WdSQIdWE/MnXBD3k
 8ls/wMDrKBSlB08ya/VEgNQG7W389Q==
X-Proofpoint-GUID: xITrGjMf0OUkvdEMEO5lnRYyYaYMKJRj
X-Authority-Analysis: v=2.4 cv=Ushu9uwB c=1 sm=1 tr=0 ts=6925a6bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VxYvlW6r868V9rJpx8cA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122054

From: Yoann Congal <yoann.congal@smile.fr>

The zfs package content varies depending the host distro.
To fix this, force target distribution ("vendor") to Debian to match
default values for things like: NFS server service name, bash completion
path, configuration files, ...
The Debian values do match the OpenEmbedded ones.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4990a36eb404d5ae603acd6f777c38d62b7973a3)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
index d3ea6797e7..b1e2f2e0bc 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
@@ -38,6 +38,12 @@ EXTRA_OECONF:append = " \
     --without-dracutdir \
 "
 
+# Reproducibility: Force target distribution ("vendor") to Debian to match
+# default values for things like: NFS server service name, bash completion
+# path, configuration files, ...
+# The Debian values do match the OpenEmbedded ones.
+EXTRA_OECONF:append = " --with-vendor=debian"
+
 EXTRA_OEMAKE:append = " \
     INSTALL_MOD_PATH=${D}${root_prefix} \
 "
-- 
2.52.0


