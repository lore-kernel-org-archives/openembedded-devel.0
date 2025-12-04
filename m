Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A96BD1CDCD
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 03:59:02 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34622.1764820739153574389
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 19:58:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LxlQMl2z;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=E6Hxvwh1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3IaWEu3329524
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 03:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6CV+pyAEJbBVw+Zd4nzp40uVO0dY54fmciE
	RajXs1s0=; b=LxlQMl2z3fxZuwLbzGI5mvsRxwqE8hJYe7KgvZDXIxbokfmE9IH
	8hpg10J/r+IonFeZ+A0iFWrRd/IkhCYTQYs2dSsJLjZvwUzQW69XBn99x7UzNJ+Y
	WsXgug3yFspJ5imjsbAwuUpEyrrhO2tqJH62cLSVJp6XZ92LbjaPmxTY505SzAcR
	0tIKHk/uM2dFtZKx9VuPdhNmI54KmOTZNQyPyR2amUyPVygBFgTx/ahvsU5/4c+C
	qNehERqs7FaeGHaNwsuBGqqF/yXh4DP3qtjEA5jaM/FZarjxqXrCoKSDyx0Rc98q
	8CXRA10IeiqUQbSHaJUKcfMg7lf0Q6RYgSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4attmh9br9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 03:58:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295fbc7d4abso6340005ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 19:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764820737; x=1765425537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6CV+pyAEJbBVw+Zd4nzp40uVO0dY54fmciERajXs1s0=;
        b=E6Hxvwh1plAZnb5vjsVejN2pA52tscX1wY0DxEc+V718nnZeGcWrd6RBsy0t2zKbkF
         4ggruBpguFHlyisUWAofVaz8c63+S5/ra+6WybRPD+6Q97Iw8l482JtMAM8IdSRTHAFt
         VVu2Ao4bMARxlDRb8EIGr6DD7Yu6VZnotWl3sgj9ZFlmoFisenCQXvVayZOTkudU48UI
         LvvtaryQpPtKgRscQ4TV2S1eNi7RsyjNo9cGw65fV72mFl0uvxs0xLGDQVEPVRKnTc2H
         7j9BCZ0dXz3TszW0hR5qA3sIC1tem5LQwaYdfvnMKpOV/WipFAk0JmxiLcsbnYyqpUCV
         x+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764820737; x=1765425537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CV+pyAEJbBVw+Zd4nzp40uVO0dY54fmciERajXs1s0=;
        b=AlQH2cwiF7Uxqb/NeStbYuaJLhy9PmzT107S9h1Hd9ckTtNf4JDZyGzTIfwX1EQARG
         rEyYuLQ/XWKRivTole8eABfOD92qNtBAVPqkuoOWSVsC7t0kful09RSjqWMLcuMLBIK8
         9won0q28fNrfd6pNigEa+ywQDNG0Mxi0pWRwlpJxj8V6Zaly18JJJWkzz3KdhEVuJr+O
         kc/9eimLYJDwbnu2+oAXfUzNQRyRBFh70ayXBPCMohxmgo3IqSLu0nQBVxFk8T0pGdFy
         VfCdodB56+Wbz6PkUImboBaitILulaBGvaeZclUBmN5kn3xayqG0HHIFjdECtXl9v6AJ
         SjNA==
X-Gm-Message-State: AOJu0YxUtgVJVa0uJrVIKNFMsvfb10tp8z3ejVWYWIuNGEN6mfcTg4+W
	IsT4gaLSHst6BAmubLbThe1/2DuxuON1kwgicC/1FOmpAm3bAo2d3b2MHsZ61KGmho8mNaYnhs1
	52/QuJvoQ+U3B2BaArg19Xv3TbdcNs5bGjEwb8qeG9p2OkJZtR3dgaWLVWY0fCmoo7RmXjFDh1R
	7X3xRlJtaTdlPJo5MY
X-Gm-Gg: ASbGncvav9AFwY1/OmDQoUarmumTE/LBiNjsTRQg4flriwAvzUsuIUQGkbf/HFR4JYd
	o9G2iwDwzjql+pjd1LWHKL9AVUN7O0yBb435qd7vGp8U97/dMTKsHimZ3XuKRXcqG4RPoSqn1Kr
	SP2N1uyURmvCmmTwQXVGOSzuIVhCUknomiRt2Y7TFue4XsKLGM0UU63SSF9TmHkVfKKJwWlxRnD
	bQl4HftdjvFwAoNlydncCss352L5gE3g10f2yYB+L74vqoVRtN5zYsqVg+IIvlepOxgQDizMdcQ
	1nuoysHNp7REb6Wc1iY1XiTlJ6moWDrr1vke4EF/F1+nn3aWQ5vYFi+GGhLAbY7QXRbpc66cvz6
	hTNEn91Oy0Jv045l2R9LhJ8RjgGUPgCtf2g4e1bZG
X-Received: by 2002:a17:902:dac4:b0:295:28a4:f0aa with SMTP id d9443c01a7336-29d683af3famr48635515ad.43.1764820737072;
        Wed, 03 Dec 2025 19:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1jWmTiCQKAd4xxxSJ4XsDLtWG3baP/6FxaKpWYnWrchmqL4tbsfWQmKPJf5GCVfnABb9HaQ==
X-Received: by 2002:a17:902:dac4:b0:295:28a4:f0aa with SMTP id d9443c01a7336-29d683af3famr48635315ad.43.1764820736572;
        Wed, 03 Dec 2025 19:58:56 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494e84f577sm473292a91.6.2025.12.03.19.58.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:58:56 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] crash: add zlib-native to depends for crash-cross
Date: Thu,  4 Dec 2025 09:28:50 +0530
Message-ID: <20251204035850.760261-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ze9pNAtqo1DyLW-thJkvqZkRTpLkquqc
X-Authority-Analysis: v=2.4 cv=NcTrFmD4 c=1 sm=1 tr=0 ts=69310702 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=t8HofilRSo8CRRffCGYA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyOSBTYWx0ZWRfX9PEFOWuBPqCT
 +7VaY4CEOQCopbWdi345IYvlfrY3IX7bvpTivLjYf9UphwX5wlqfsI7XeQmJ291ctAHW0R3aI9X
 o7zpcChFlxFDav8HsGmB13RO87HPauPxpjmFofIjCPE6QS9omWspT4wKYjHRlUfqobJOntJpKAZ
 iEouU9bTKMp9L5f1fLF+rk2O6/iI5nOK/PXZP8BR5fZf59LE2t4mYqdNGHyApdKrmPZ7k/vuWW8
 sMT+/I/NnQ89XKFfPgxwzoWuybqFuP9x1f8+YXsFaRGjYe1Ni8Cpk0FFT18C6kceKKegzk7BKQN
 619mxqoLAthJH3063af/aNxYw5Zv7fyZrVjgE8OP73WwG03d6rWpUGzXgsmZeVgJ6qTUICKYZ1h
 ksNh/YnsYh+qI1s5Ey++jNQgL2yGNg==
X-Proofpoint-ORIG-GUID: Ze9pNAtqo1DyLW-thJkvqZkRTpLkquqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 03:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122297

From: Yi Zhao <yi.zhao@windriver.com>

Fix the following error when using buildtools-extended:

va_server.c:20:10: fatal error: zlib.h: No such file or directory
   20 | #include <zlib.h>
      |          ^~~~~~~~

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bd745115de76de7242e3e7e69b29f1ae507fea13)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/crash/crash_8.0.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-kernel/crash/crash_8.0.4.bb b/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
index 1af90978e0..893d4de410 100644
--- a/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
+++ b/meta-oe/recipes-kernel/crash/crash_8.0.4.bb
@@ -12,6 +12,8 @@ EXTRA_OEMAKE:class-cross = 'RPMPKG="${PV}" \
 EXTRA_OEMAKE:append:class-native = " LDFLAGS='${BUILD_LDFLAGS}'"
 EXTRA_OEMAKE:append:class-cross = " LDFLAGS='${BUILD_LDFLAGS}'"
 
+DEPENDS:append:class-cross = " zlib-native"
+
 do_install:class-target () {
     oe_runmake DESTDIR=${D} install
 }
-- 
2.52.0


