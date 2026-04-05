Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796C8F3D5E2
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 13:27:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35113.1775395634060080341
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 06:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=luvX1izu;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=VDzGRxLm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634HJ66a3361680
	for <openembedded-devel@lists.openembedded.org>; Sun, 5 Apr 2026 13:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F3faUXnBd5twvg9CzQgBc6HquBMmWZ/52pX
	EvuNZvQ4=; b=luvX1izuRyldHhpFzwaUQh+dlgEwUIQfGeVOuv8esFqS+ffUNa7
	fIrei0ypkJOeeMfkhnLRhq3RXG/L8TAiOozs7TslflopuQ+WrQ0+kkJqaPLSliAk
	koDXxSh4y7QlrYirXVHZlmJRQbnnixrbRTOL6GOT1MfrLBLWqYJfepKwkxJz1dj7
	+X84VTJgOMHLHDaM4/lKUn80mVOw8B7K0E+BKVt7l6ZuU5mtrbOgaieZlev1owaU
	Wkshwjt0PuTcTf+LYf2flPGrSTO8Q+l2fPN2Qo3qRBuF6INCJFsaoLkrN/FbTjr3
	3MFnM7RzmmEr/Lf4o9aKKq1/PY6ikD6yKBg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mjrnm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 13:27:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so2983320a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775395632; x=1776000432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=F3faUXnBd5twvg9CzQgBc6HquBMmWZ/52pXEvuNZvQ4=;
        b=VDzGRxLmQ9dk0QZL1IMvowTpzAFLc4akOGmXdvgEZWfgj2hWxdE/8Ys4wuWjD6ckzQ
         JHB9N4YlhwpmxVY+0dPrw5OMt624O8LGuOf1yay6ZzcKB1KKQQ3xQhqfGdiElXeCljkQ
         N9OfaB41ORtpqxttOmdOcHxvk1umCanZsQP7Biqzuo1sOyBFHXE05hV50jbrpkedf1mB
         BsG00d+QLT2OuDrJeWSUmE98gROIxvI/ygZHTthYtucMKvf2kObaKkC4lYX4mS1LHj7D
         jCoEkQSN161QPARZshZDMf5T9k2Uv0M9P24jONlBrEl1x8TjrSm2WWFZrgzKTDQPSjbi
         f1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775395632; x=1776000432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3faUXnBd5twvg9CzQgBc6HquBMmWZ/52pXEvuNZvQ4=;
        b=S984hG0/DmHQYhu2Nqt7chegOXWz+W5VA73yerhccrr4JiLH/bCbvlftUyELXxAgjg
         GGw6hDD2IX4OX8V0bVAsJW/43yuLyEOK6T2nfYIO/L3biQmHduS3Vsk19eT7VXGPFFxx
         VMR7terS1pOvZ6wEvfi1/wkiz5zJP049LZMDLI45vpsXOzoO+vk3RnxNWWNAmpUZPwyE
         ApbgsRTIvsAIvnJmGnX6JxWlcu1dPH/dYQKxP9OovoXRMDS3eERPrxWd8cH9Yf4t6ggH
         ESrFi4F17w/R+8+V5Hw4pwxqX8SSxXNpylbLp5slJasG1fCBelpYFcObcA5kV2XFdzNu
         T94g==
X-Gm-Message-State: AOJu0YyuvxYfmv1amPcGlyC31au8cp5GzIzNEtV54Y/J9eGEcE3gO4nB
	BY5s9zO7qeqiLWv/YjP8x8SAyv3IwOpgxIZnd8PoANUaDW3Wg9bckxePGzdEZ4OHo5byEC3iUUk
	nKe9XDI2cq5t3uCg2eUgyyapfGGcKLB4jCHo43AAIWy5UquujwL03WZnb4qnThSLUB1m24SLOXg
	kM69zQvLrXQZyeuDkqU04=
X-Gm-Gg: AeBDievoTv+aDWcThUr35sYWo9KoaQuVbJROXVpT4k1sAYtcCoK0q8LxxJAUKHNGKrx
	gXq2/cPJUo89YuGG7yd6np1RL4BeqULdNj2rK9EmbsCyk3THgIjCYxmc0pxXBT3ac1S7vMyRUkS
	oGg1PQ1sChPEY08WdaC8s/8Kj9mtzLykX4b6xwTz5JIXD1R4oQzRFxC3Z6ZBMMidYfJt3Fite/w
	s47aYc4Evao9eY68I8GZ0SG/OViJ+2ITDAt6uY2O+VFYVHzMBfQoIIO8Q93JJMNpDke/7Tu53xr
	sKqkn5UAutHFJz7933F+roj+dPxBYPZw1bJmfBz3qUQINGZSGb4AgAheQCCVlfmg0JxpZUreSXJ
	6nG6s5rjENHMy0OQ5d4eTr9Ry6G2BAYH6woErUmutRNwsj9lGJ6ni
X-Received: by 2002:a17:90b:224e:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35de68cfba8mr8320035a91.17.1775395631882;
        Sun, 05 Apr 2026 06:27:11 -0700 (PDT)
X-Received: by 2002:a17:90b:224e:b0:35b:e51b:1935 with SMTP id 98e67ed59e1d1-35de68cfba8mr8320009a91.17.1775395631224;
        Sun, 05 Apr 2026 06:27:11 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd368f538sm16040610a91.14.2026.04.05.06.27.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 06:27:10 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/7] Scarthgap pull request
Date: Sun,  5 Apr 2026 18:57:06 +0530
Message-ID: <cover.1775370794.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6QP3DAeNsD5EZw964o5CeSQOdEM-tgB3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDEzOSBTYWx0ZWRfXzpsjS0NSj2vO
 N5QGwdWKWYym0RkKcwQaEduxUxjKxCfdSmtNNVUuyGTOPsnWcQhGp9LsYme99pqoh214RIJ6oUi
 enMjFGjeUPATiV+INR+N8VxW6cCzL4tqBKRHl1/95zuWN9Qa4UnfPDO1nKGJ0kEp7un7DaRvl7l
 UnolbNoHbRH9htQQppi2lYr8b7qx5IqxHzjvuzc1PAhFoI2EtQxvHIVfN0xFfWCwU58MtnsFntm
 KoXaTk8dmj1ZX/vYIb47RkwSPrpYNgLk2n4/RliQVKtPenP7acETn8KU7qAXkoWT2amKFyrkj0f
 xqdZ6jSRvBVDdbUGpnTeqFBYWxZQZjND77sgeU6u6opKTEr1ArhR7raPHhSrLRJ/ZoJPtxpsWRw
 vTi9+Zm8NfD00gimsPVx2QLr4U6ns5zN3tmff66MGBc/gNdcI1eT/7hhx9RoiuDn+WMZSJ4ubqw
 Aqf0RMEQSWN4l8VOkAw==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d26330 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=wRgUJ06ctwt1G1zqN04A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 6QP3DAeNsD5EZw964o5CeSQOdEM-tgB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 13:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126014

Please merge these changes in scarthgap. Tested locally and on
autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1435

The following changes since commit 06f846a325fde423bb0a6d49d771d8c1e144d7eb:

  bluealsa: fix QA issue staticdev (2026-03-24 15:53:24 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to 1ad0d777d1de1769e5995eb806f7ae5c15d0be54:

  strongswan: Fix CVE-2026-25075 (2026-04-03 15:00:48 +0530)

----------------------------------------------------------------

Hitendra Prajapati (1):
  python3-cbor2: patch CVE-2026-26209

Markus Volk (1):
  flatpak: add PACKAGECONFIG for dconf

Martin Jansa (1):
  freerdp: remove 0001-Fix-const-qualifier-error.patch

Vijay Anusuri (4):
  libssh: Fix CVE-2026-0964
  libssh: Fix CVE-2026-0966
  giflib: Fix CVE-2026-23868
  strongswan: Fix CVE-2026-25075

 .../strongswan/CVE-2026-25075.patch           |  50 ++
 .../strongswan/strongswan_5.9.14.bb           |   1 +
 .../giflib/giflib/CVE-2026-23868.patch        |  34 ++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |   1 +
 .../flatpak/flatpak_1.15.8.bb                 |   3 +-
 .../0001-Fix-const-qualifier-error.patch      |  57 ---
 .../recipes-support/freerdp/freerdp_2.11.8.bb |   1 -
 .../libssh/libssh/CVE-2026-0964.patch         |  46 ++
 .../libssh/libssh/CVE-2026-0966-1.patch       |  35 ++
 .../libssh/libssh/CVE-2026-0966-2.patch       |  71 +++
 .../libssh/libssh/CVE-2026-0966-3.patch       |  65 +++
 .../recipes-support/libssh/libssh_0.10.6.bb   |   4 +
 .../python3-cbor2/CVE-2026-26209-pre1.patch   | 469 ++++++++++++++++++
 .../python/python3-cbor2/CVE-2026-26209.patch | 415 ++++++++++++++++
 .../python/python3-cbor2_5.6.4.bb             |   2 +
 15 files changed, 1194 insertions(+), 60 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-25075.patch
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fix-const-qualifier-error.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0964.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-2.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-0966-3.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209-pre1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2026-26209.patch

-- 
2.53.0


