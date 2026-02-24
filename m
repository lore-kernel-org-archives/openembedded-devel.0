Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F48EFB808
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 06:52:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15030.1771915939718829389
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 22:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nc6RgOAN;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=iBeqpNm6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LoqV1523990
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 06:52:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ri+WGu16yJEQke61mLkHeru0o29kPpbHrkH
	osfjjVcg=; b=nc6RgOAN6IYGmxwCEr5p7OHQsxx7KOuFcYPj3jBmx80Ual9bl+l
	9kktPFl3IE5/M3JCD3xl94IXscICSmsDPu6abmeM6OayoUzIxqyxOOPEX4zAsQfc
	nS8ehXfu5bGrQFArIcyO0wDg5sNRjnOv3UngKheaw3xcKBOVW3qz7aLM2sjp6eew
	+kZ+oUYbBFXBRHPJ1B7mSFmDL21uWHJfZ3ZmNqC4+CMTyFdQYDWq34Lflle6pwsK
	/HcWSs7JSyT487rT6Uwt66Uj5/xf0agF/aGrVctwkUa8w81jun5aNybBYVpreBJE
	AfuQ1cmkzqbudeK3zItVgMU/iJQtHZ/J+cA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgtx0a2jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 06:52:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aad5fec176so11335ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 22:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771915938; x=1772520738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri+WGu16yJEQke61mLkHeru0o29kPpbHrkHosfjjVcg=;
        b=iBeqpNm6yjZBVcNbNtqx1eY/93bXC8BS8pF2yFbpMi4oUB0P2Up+ZxAR2k8jaDFjc6
         fKaLHC3z+MAcSQsE6Qz3zJlLcJuK2RnSzgti9zwNo1OqgJaO2q+t6jqCHuTDY/tds5rJ
         2MW5ows/Sa+y2TRKQu7ETcnfChECxPKrAEj7uD59hU/ldAxD7ZBBFsy5oPbNUl4VGchb
         0FghDmQeenVXW+0oVXFqBF+8xG55/3treCkh2XF8ojnaAvfDERowtTM+FeUv67iSXH+V
         Jlt1wNuNUobrVGTTZpgq18cnXHhpjh6aUYgxGKs1qIjcSfULkXU536mwKp8zeiGUhKcf
         yJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915938; x=1772520738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ri+WGu16yJEQke61mLkHeru0o29kPpbHrkHosfjjVcg=;
        b=GMJArLu+rrLXE9hOnAJBVYdi84iJ02ckKSUUgvLyV61PRi+74Kr+au0akc05mn/TVG
         83m1vti3OIj/WjzS4WPV5bfM/q1zbLhS07mddANh9A/PbbpLxLYF+hD/KebpLf9PU7Fj
         3dj2QJR5vHMgFPeUkFU9GR/4xTqxwXS+Jh33lIWAxbEwKm1afnhRVjAfi7DMzpEFvaeX
         sADwNqSUUz89TWDkwIe2GF6bvzIIv5BDo+Sm+vGbhKwTAJdS/+lGzIlRhhlM29F0nmr1
         ur1sTPj3ocDeRXTMvGHhLAKYBqSPFHlok+QyxFfoVwuV22uEyQOilNSlBK4xgzbKYeFz
         jBhw==
X-Gm-Message-State: AOJu0YzdD/FOCIzR0qlCPvFLTGBkzEPrxSY6386XRMWhWqWQO8PJ+XnY
	Xl60ROZ3GsMiQsfE2EmydrWb6SRWw9+MuMGluiV0jsobClNNdufjO6jdwz/J2+WlzSzjrrm/MOc
	vAtEeh6MlRWHcLXu/jQb6oZfChn6qnYJHBowekR7pCd9O0+/XSkID1mRiXUgBc9BxnwWCDZ7eot
	ztwNL+jGSmZs++YM6Bif8=
X-Gm-Gg: ATEYQzwFvGEC635XRroUc/tS8nx9aIUJZXzgUWXPJdrZ3gVfamgmd5a/ZHJIQd8fQBt
	21QNHk7/QJ6S/WOYbA23fg+7d0TE9mGSx2ZdkbUrkYDe32ArYyOx1JKmmisuYwRXPpulr5vP6yP
	ikoS9RhZZoarqQ6zfh5b74pQJAndLBWcIsvo7FyMLRylcgvUmfP7224Uu7kLtU7UDZpC4sxwctu
	wzJeTUq+a1hZZ1KAROsbVjSHc/4XIQi+sdNAdbyi6nS6EWHA01nnhnS9IIYTImNn6NDZXsKwdJa
	UQao81jFSdz2ukCIGHj4O6e9p0DbMfr4vOCAtaNBmqy9uAaJ1tVbHHWX/c9ydqsix/Ww/xXdu7R
	Cs81WyX7gdlu4FpaEMgQiU2kELQ5QaHze+bIn3YZBIC+czzLxnGDR
X-Received: by 2002:a17:902:fc86:b0:2aa:dd98:197e with SMTP id d9443c01a7336-2ad7456281bmr98181935ad.51.1771915938401;
        Mon, 23 Feb 2026 22:52:18 -0800 (PST)
X-Received: by 2002:a17:902:fc86:b0:2aa:dd98:197e with SMTP id d9443c01a7336-2ad7456281bmr98181775ad.51.1771915937894;
        Mon, 23 Feb 2026 22:52:17 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b72603dfsm9463326a12.28.2026.02.23.22.52.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 22:52:17 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][whinlatter][PATCH] systemd-netlogd: upgrade 1.4.4 -> 1.4.5
Date: Tue, 24 Feb 2026 12:22:10 +0530
Message-ID: <20260224065210.3388670-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TEe8xUmvBZOUIN6pvUu8jMbwaxa8UQYV
X-Authority-Analysis: v=2.4 cv=euvSD4pX c=1 sm=1 tr=0 ts=699d4aa3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=koSZFWg6H3gA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=lXbf-iYbNHxdrM0DDF0A:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: TEe8xUmvBZOUIN6pvUu8jMbwaxa8UQYV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA1NyBTYWx0ZWRfX+wzeoZFCOW10
 q6nJJ185GL7qFiExIqS74mxZtzorrGDHjK3IjiraOE5Hhd1GgKzkJ1ZtQE2SmpncihzJdIcudmG
 Sq1OsuMV6bvlSWrKRPuhdeNMCC839MHRgsztZVAG8xeNuKZpuTNGTcGu3yvE8QDoc15MwuZNFAA
 7uFIzig+IJUlKG4apx1sGgnRUr4dcmpVNTudSC+vWvp+BoUwSbgzPHay2gCOVEBvkRB4CA9TN5i
 yAWho1zir+16mQr5Mw107ebslLs5CvZHmGagdLt39k0Thk62maS9CITSDyGy1NLKMiFLJ2oUr8W
 gsWOYzK8oCM4hA42LjU3WmvyZzmeFu6wJpwdnegLyl2x8tO/Dq3U14YzEsD6wHNIUZJTxtBVuhF
 k0Y8siI3y1ER9WVOWD6NrC1l8kz1qTl/t8Cpw2ItoL+fZBrIgcSQDw+k5EyqObBHcWOZ4+ZzBjI
 zv2/gldBcdzOPptx3OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240057
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 06:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124572

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Fixes build with 32 bit machines.

- Fix build on 32-bit with 64-bit time_t by @cgzones in #136
- Misc by @cgzones in #137
- Add terminating newline also for TLS connections by @Googulator in #139
- Add RFC5425 length field by @derobert in #140
- Correct examples for ExcludeSyslogFacility and ExcludeSyslogLevel by @ngraziano in #141

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../{systemd-netlogd_1.4.4.bb => systemd-netlogd_1.4.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/systemd-netlogd/{systemd-netlogd_1.4.4.bb => systemd-netlogd_1.4.5.bb} (91%)

diff --git a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.5.bb
similarity index 91%
rename from meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
rename to meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.5.bb
index 019098fdf7..1ff65b1e21 100644
--- a/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.4.bb
+++ b/meta-oe/recipes-support/systemd-netlogd/systemd-netlogd_1.4.5.bb
@@ -3,8 +3,8 @@ SUMMARY = "Forwards messages from the journal to other hosts over the network us
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/systemd/systemd-netlogd.git;protocol=https;branch=main"
-SRCREV = "b03cc3b1a75048c7cf19467d8918a4b7320767e6"
+SRC_URI = "git://github.com/systemd/systemd-netlogd.git;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "20534091417686d1185acb3f29e93944d8663c4b"
 
 inherit meson systemd pkgconfig useradd features_check
 
-- 
2.53.0


