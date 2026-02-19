Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E4BE9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 11:30:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12034.1771500596973819833
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 03:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=n9RbY8X4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=WTn+Zjim;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61INpgXu2883966
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j2NbuuBYBa0
	P7JG9fWwW6DjUJkV4ua1BbYg5RpCgcEs=; b=n9RbY8X4ZH8s4RhSPoC4Rz05ZgX
	hmWV6nGfIKHOe08jqD1vyCi9rpIQDwoCjm4yj1EjABIs5/7gdlVpk8BeCoOETTen
	MZo4mnAl9QlS0bHoXLzKCt07CJnMj9KHkf5Tp4t34TkFS2K03Ljc1OgDvgPMlAD7
	zoP3KOBiq8QTrYbR0dLXlZQGPv8tS+XwCu9W6g81hVPQjE7kGjB3uXoGuco9mQQu
	pPyK6nQP1TDkoLy+IfRNTqwVRKuL4rwFng9Jwre06RjtJ71NqJuXJ9+lyTqoLj+u
	ksT3gWA5atq/itAnopAFfPA2rMosaufbgUBhIL4LKYiX4fV4AKp1W13kaVw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg9cun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:29:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8243a06b397so477886b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 03:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771500595; x=1772105395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2NbuuBYBa0P7JG9fWwW6DjUJkV4ua1BbYg5RpCgcEs=;
        b=WTn+Zjiml6GR19QWHZIPbSONeKQhPZ4ZgBD+23te1h5Tw3icqn0BteTBs+1AXq1T3e
         e9jLkScMl89MsqvlYKnNb2SWJd3VrUjYrdQPOfGd8xyZ+jUvZpNtoZAQzTg1LSgN5iXc
         H3NSrC1jXn4JXh5BlwdXeSvvx3mFpVJSDYoro9z9QXIQZdidhLjqFJyKy3IOAL4kUzqn
         9DaVNjW/k87nzaUCIad5+petgW/5tIUCISPa0MLIApIm1m+qoL1LMcOL+AJNpatb4Ram
         lBcouRBqTe3F8577Eo53QzbUeTpCiEzZmaCIQXsNnkOQJQAlAoY/JqpakLLMzgUfsfMS
         qYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771500595; x=1772105395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2NbuuBYBa0P7JG9fWwW6DjUJkV4ua1BbYg5RpCgcEs=;
        b=X6BJgFxD1MYqGCtafuihdFcUrNQ2b6TdJrtYG2tGMgKOWB06v6I5nzXlBS8nVG9iuH
         CbKicTV1FE+zT5HJkRnkf1MhnvyG+WmKtbwjlThdLkFU1c0Uxf4i+jDpa5lplEjUVYNZ
         VOeP5Ex7ocrP6mspfbkdKZL2MRgUn6y8+6xAfrUSky/N2wcjcOHBok2yrKnq0QStRtEY
         LcPhQZ3SsNH3p0CWZq5kyg21L0vtGLlMc+dZaDK7wgqwCShMMARRD1ec95dpHmgmLjX8
         BAbO/VyeqMPbMRZoykheZvjkE+s2BsfdsGy2Tndu//twiZ2yiIxTsjmSb8JHz5mkDrfx
         fxMw==
X-Gm-Message-State: AOJu0YxM0ARhWzkp7xm8DyYpsKeLNqs5hfkYABMGBXz972mHPQRBx3Mu
	WdGFvYJE48plGBiosTwXd+IGBG945aoiY6Zj8GrdLuOCqE1+NC16/WRQeY6XY6jLin9xPIZHJdi
	gefTXW5PkSQVBspsH1IemFubY50Ct9Hse4wLSBinPuH6vubbofLE9/Is9TU+zz5PuNoS6uHVUIx
	hmOYZZ1ec+hAy7qXopwoI=
X-Gm-Gg: AZuq6aKrPz98F4jLzdo+FAW/tAUueVPO5awqtzTU6ZpjZ9AVuyZBC3/TicNC6nBVQbi
	hOkdzglt1vOYzVccgUZ3Avwf48x97bkF5BSD/x2EOfi5Z+mx8ItlV2cVqIT8WqhNsFGHeY5hxOb
	sPfvOa+iBlkUUYvdvjqzzpw/OBS+V3i1e1Hm2ZuTIGiuRrw8HUWj1f732VhSnIRYc6TxHvjwBa4
	Dp4MVjcYag2A6pSmadvQLilOBt9VT9VgczZP/WZfLeXut2ecEe8yvN+yFtuIxAwPZNxkkTH+qUP
	OE+f+xJlxErBRVuzx00a05g8ZSl//BGiude46s3G13Y8BG8nlLUU2CceYCEdDqkbFKOtj7YOlHJ
	B9wh50zdRkD4OykMuzEmR7K1SGO+KFe6HHwVOn1x4zknq6QKbebUg
X-Received: by 2002:a05:6a00:2d8f:b0:824:18cd:f2f6 with SMTP id d2e1a72fcca58-825275ee134mr5382150b3a.59.1771500594908;
        Thu, 19 Feb 2026 03:29:54 -0800 (PST)
X-Received: by 2002:a05:6a00:2d8f:b0:824:18cd:f2f6 with SMTP id d2e1a72fcca58-825275ee134mr5382135b3a.59.1771500594441;
        Thu, 19 Feb 2026 03:29:54 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a3e15bsm19697056b3a.19.2026.02.19.03.29.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 03:29:54 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/3] thermald: fix upstream check
Date: Thu, 19 Feb 2026 16:59:44 +0530
Message-ID: <20260219112944.1555772-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260219112944.1555772-1-anuj.mittal@oss.qualcomm.com>
References: <20260219112944.1555772-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d5uuMQFRDGXynKjXF2xQCNAzLP7-4XFv
X-Proofpoint-ORIG-GUID: d5uuMQFRDGXynKjXF2xQCNAzLP7-4XFv
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=6996f433 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=NEAV23lmAAAA:8
 a=ayb08WdcAAAA:20 a=vlGuhjqhAAAA:20 a=EUspDBNiAAAA:8 a=85F_JoPuDe4g6_Idc1UA:9
 a=IoOABgeZipijB_acs4fv:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEwNSBTYWx0ZWRfX2rHsAIA9iS35
 R4fwYQMBjRHLhrjmUpVRo97tqjle472MZ7dEJ2Ps2x8RyRxLv/bU017xVtUd+/Z8OCoqIG8/l5E
 Xgo8rg71A/BTmnLJ7mUJv5TuKw1a+vaCg84kVF3NGhUSNA4quCbmpSyKnYsRIBf08tmvevN0sp0
 lK8ZGc2gIWJuAzfF6m9ggFdIQFFu9u638Yfv01yVnWN2giDmYSJVeMYvvXeB8bBtjd5jLcwX4tR
 LX2agWoYKWycEFT82QOMuU0+i9icq6cIGlDQIEg6Nb96W3EzWyfNDiKj5WV6lkTpPXmwOQolzgJ
 OwB4vHD1ypDSD+0iFlL40CyhDvWnW7VLFgANjKtqUgDmU6ZPkPygUlrZgQfO2kROMEMfCYJfbvv
 vTWnSpnGkFI4YkHWTx3kzkpvBbapGSqFtGG5vTIBoJzLkAKV3nSfiQ8qqDVMiUKcpawwmAFAFRG
 iGu6boCmJ+nQ1Pf16kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190105
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 11:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124509

From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>

Look at the correct URL for new tags and exclude incorrectly tagged [1]
2.15.10 release.

[1] https://github.com/intel/thermal_daemon/issues/504

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb b/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
index 3ee31f9df7..98310b4c5c 100644
--- a/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
+++ b/meta-oe/recipes-bsp/thermald/thermald_2.5.10.bb
@@ -40,4 +40,5 @@ CONFFILES:${PN} = " \
                    ${sysconfdir}/thermald/thermal-cpu-cdev-order.xml \
                   "
 
-UPSTREAM_CHECK_URI = "https://github.com/01org/thermal_daemon/releases"
+UPSTREAM_CHECK_URI = "https://github.com/intel/thermal_daemon/releases/"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(?!2\.15\.10$)\d+(\.\d+)+)"
-- 
2.53.0


