Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CD3D1CDC9
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 03:54:32 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34721.1764820463796910686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 19:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gXnikrdA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=GBxjJvSP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3GO5FD2658586
	for <openembedded-devel@lists.openembedded.org>; Thu, 4 Dec 2025 03:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5O7AW8/c1CnHuXYesvGQH+/aefKNV/VDW1k
	abXjQVl4=; b=gXnikrdAj8ENVJUN0Bv/hx6rlMl6cHTg//OhL1wxvMttjb6MvEI
	G+KHboUDOp9GaBnZSTNJWiSJ3tcxZjhawibSn/qvTOVuhC9PecyEnl4BxgZ9B8GI
	YML1a8CI1dqPOxWDHzRH6S562BUSnFlXkBxTD1u9GqH99juzhRfIIorzWM7f1jrz
	KSvc9iZj+1pbEutrB9hzSRMrNe/RZQoj8VPLLh2ykoYBahKgc5mvE4dvFoEkM7Kt
	uj3DD7SXMy2m1o/I/LLErNr08h4eYdLzrEk6BN9j4KOlUIF6QWj3DtrwLy+8paCa
	UwzPrq+Rs9IL5hQYQSeJkM5HRW9fQGGeSBA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrpphuem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 03:54:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297f587dc2eso10903465ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 19:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764820462; x=1765425262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5O7AW8/c1CnHuXYesvGQH+/aefKNV/VDW1kabXjQVl4=;
        b=GBxjJvSPCQC0dgkRvuUKxiuMs864oZqo46hG2SQDWClTM4UxFG65XkcuPNxMTzHti/
         M9uKQzTEozQIurqP4YIZ6Sa9kCDe7QMKzgNRuqOP4dU5c6JJbI7/U/B1c4cpW2WtkouJ
         +Y32bg8XBP0/FXBho4KRZft0lZcUX/v+w+LsNEzjFSW7AkfcXHxfuPqBcBF3PUuVide9
         nVVknFTY6aM73EtU3ZMHaTUzOFSh1uPBuRd4F2e9JKtMzcllX5jNa/kRamQhODFEA0gK
         7l8H5lao6xCX7HGl0XMc1j504o9+ppWU1C6yAPhyZMg+r7tBPJd5HBlzJ4qYfUEMo6o/
         DFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764820462; x=1765425262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5O7AW8/c1CnHuXYesvGQH+/aefKNV/VDW1kabXjQVl4=;
        b=eiCuMh0cI103IswpGOAK0Vm4/kSsSIIoig4/aRgC6HjmOfO+Qh78gKpSMtv5nKGEJ6
         vYVHjLq/6UljzETodlSkSGKWzsPTIyccT0CVBXmzdlIyqH4lLLRmGh/gfPOIWoLEzPRW
         zrUnszuvTrnWViGBqhBaHSYRlTghNVQEvhrS+lwGE/tIEinugFcibTDOTFTAIehQmiIc
         ziffYvrmJq+F5EzTzajux7dY7LyTcB3NJP08h52km/cFKIVh3/1BjJj3yPV8UejatJDn
         BZFDmKF4GmKT6CMOIPOhV9JHIrS4oQr6vRaBRAUEywV0xFZuH8gNv+ujq7DDOGb2BkDB
         8QKg==
X-Gm-Message-State: AOJu0YyiEwWTMsXGTOMYPDBE4GrE3SEY3c0gMDASBl7k8cuX6B73Gnba
	kaRvSlxZd3QtOvfcHtQGaTCHxpZvRtm9MR/rukep2Qa2pwYx5lgk4zeKlyEKQmJBMrtBQtUX0xf
	fjCYneaKiFUT1+3a4TD35TtWvtjamrKp0Zxh40qWtEafhMCPsk74NnCnvW3mel+JUWRP8uKN6VU
	HYiswK7M6mD7HsYveN
X-Gm-Gg: ASbGncvX8NWP4egfyJmNMVhG5GCXh9wAhqUS7n07HWJ6IjrGPilH//TVrPxbwh8hOA+
	udaMwLhlq0uprCCOUrMtjLM9H6CaZjLA/8/J7Pve8QqDIGTN+UmkfqQit9YUloQm8xhU/t4YHEA
	KySWilMhLWuU8KRldLSqCUA9GxhbwL8Dz4/OY1I8JScjksuKIq968h2x+4wsY7fWOchxbYgAQiN
	r2FAWzJru5YxunvoyWHOYKuYSu3lSIXNGHzrzsdAHPDIySzIE/aBPy+77BXPo045XTrxH+Upz8H
	PY5Yp28OtTpH73B/Y/T7saTii5IwKKscJON4rkbMVMitRhIwO8cpHEW7tK+yKClu0dJ713GXPGS
	jXUhOPOsIPNjVhiEeFdS+ys93ZeVU8Rc9FWJ8tW+V
X-Received: by 2002:a17:902:d588:b0:295:557e:7476 with SMTP id d9443c01a7336-29d682c0898mr55506785ad.7.1764820462567;
        Wed, 03 Dec 2025 19:54:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyHZZHSjWD175/GuWpC5ORgenKzH+MQzkfyO9anKII/W92GcoBmVtCxbFKSYVBTWrl4hC+GQ==
X-Received: by 2002:a17:902:d588:b0:295:557e:7476 with SMTP id d9443c01a7336-29d682c0898mr55506565ad.7.1764820461860;
        Wed, 03 Dec 2025 19:54:21 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeae6ea0sm3647355ad.99.2025.12.03.19.54.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:54:21 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] pidgin: fix reproducibility issues
Date: Thu,  4 Dec 2025 09:24:17 +0530
Message-ID: <20251204035417.758604-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oMY0i__qM8eEcSa3iSIK7e0R0OKwi3jG
X-Proofpoint-GUID: oMY0i__qM8eEcSa3iSIK7e0R0OKwi3jG
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=693105ef cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fdm4j4KZP5SkvWvAcFAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDAyOSBTYWx0ZWRfX0U0R42UvfJg5
 inFBVzoTYdUPjtLaQSSw6Z99Zk7d7tzMHFog7PMuOaLNouCzBh8C8ub//Ola5h2eZZBmZ13kQSn
 8LbbswL/gr2hc/4fjei2wiGlSlgRwmXPNPmLe+CY6HrEoOB7/eEW+8C51RePvd/5DzFZR/Mnynp
 GQ3ZKNUe8s3slAazflIMWEcRUGL0f94hYkh2NU0zXOnJrJ9Eyp2K+9vK3p6SAW6iueM+kH5SMQ5
 It5RF2wosWWM+PqrOZsd56cUiJKjhu2RgmG6kdQPGDsAcq8sLKH13h6q91NzheCdJL8Q2l/EN6q
 oT/a99QumiibF0+0otZgqRfLyoi9yfd6aveQmS3jUzWgQU3lBCy9F8UsrypKPNFrbzFlVk79L/a
 +p9yadkuj7rKKzD9l3npt1AvggS2yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_01,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040029
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 03:54:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122295

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Backport changes fixing reproducibility issues from master:

    9697fd958e      Yoann Congal    pidgin: Upgrade to 2.14.13

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
index ae251b5a08..7fb62658b5 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.14.2.bb
@@ -60,6 +60,13 @@ PACKAGES =+ "libpurple-dev libpurple finch finch-dev ${PN}-data"
 
 RPROVIDES:${PN}-dbg += "libpurple-dbg finch-dbg"
 
+# CONFIG_ARGS is used to display build info. Replace full paths by reproducible
+# variables ($S, $WORKDIR)
+do_configure:append() {
+    sed -i -e "/CONFIG_ARGS/s|${S}|\$S|g" ${B}/config.h
+    sed -i -e "/CONFIG_ARGS/s|${WORKDIR}|\$WORKDIR|g" ${B}/config.h
+}
+
 LEAD_SONAME = "libpurple.so.0"
 FILES:libpurple     = "${libdir}/libpurple*.so.* ${libdir}/purple-2 ${bindir}/purple-* ${sysconfdir}/gconf/schemas/purple* ${datadir}/purple/ca-certs"
 FILES:libpurple-dev = "${libdir}/libpurple*.la \
-- 
2.52.0


