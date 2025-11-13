Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C960CD5BCB
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 11:21:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21610.1763032888578634990
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 03:21:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VYvDp3X1;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EZNBRazV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD90GNO3113207
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AYgyNG8qwxeIXGN4nHqPEvL42sO3OgqEHZv
	QFWsuFL8=; b=VYvDp3X1LoxI3Qa/7VYG22t56dAo7nUsBlBe1H2BU4dLmM0QZnw
	9485qy/12hTqb4CKfF9PdyfYtTBU2eaZhSM2YI8OhW9TVSz9msmCcMwc7bjWzbx6
	7nMtdYjW0rXcU2ck6Zn4jIWsptEZN2CS5DaYf/7QTyXX+30sIWHwy4JV4cgdof/T
	J33zJouNZbIAMG3V1iRHiWhGBkKtNMq+IsU3SeXnC8wXcRaIjXvl91ANh0Y3AyyN
	ZY5YzPZNN5A0XQvztO/8Sizef/ximKD1Dm7dtpPYSfCUCnBa4aQuBYJj8dIzzY7U
	d8CspLT38KBFhDHRxYeF5vMhJOQUBcUHIIg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4bktw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:21:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438b1220bcso889305a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 03:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763032887; x=1763637687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AYgyNG8qwxeIXGN4nHqPEvL42sO3OgqEHZvQFWsuFL8=;
        b=EZNBRazV6eWQrskK4+Al63wkmhsyzAZ3DbkKQa6zCLygUqhHkjCWKBEDfxFCBX31QC
         VxCoJsx2TaExX4NgA7L1kugbhiz1akVq/KenQfGMP1mV91+E/WRZZPju0gtAMBnP1LHe
         Ha+AZ66lZvDQAaJZkqyyPmw/yEhwLXwx3FmDjs2+BCbVwJTY7NI/qm+HsdkT3vtPvjqZ
         F9YELAPAHpLQ+NPuW3N/NxgeiPT+rQnYq55B5eI36Qzp+/mDu9KYmJRnW/xhm6D/3pL1
         5T9+7d180HYWx5VYnItkMZVEeLt2T5xQboLodwgzjhOmToM1mz8r0R/eBaf0TM+q9y0T
         LMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032887; x=1763637687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYgyNG8qwxeIXGN4nHqPEvL42sO3OgqEHZvQFWsuFL8=;
        b=w7KuT9PSetLZw5HSUfcYp4zxjneOtTv8Kkt38B5eXaC8T97x8pDnKDiv2qAjdIiNgT
         J94wKVINnz+CmpFL0NXNtoQErVsDMFBZLxt7IZ1m9QKCLDxhOhQ8axJyYrVWkBJXPnlY
         +WsFUbuwrnHaE71CiqKrXe4F4QasJorzMKMTZ30BP8nNHNFguHHAIBtmMNCLFWX+tLDm
         3jigpFh291lnoz8VA5ILwv9q9hQL7IRg9hzrN2UV5DYAzDqOXM1jHy92kvzLdDN6E5K7
         6CvJukkuVAH+VFMtcmb3ZvBrmkuXHGQVcCZhvh+R6rKvJsnZSh2yoyvQOUpzcFwtKuDP
         BTmw==
X-Gm-Message-State: AOJu0YyRRxdtyMLsErCh2bLokXjY2ORyRcd6zcXH58ebc/GuSkoxZwlS
	VHE8DSdVs1ZDPz7LkLoCbKD4bWiSEhj+Nj/znHr11CwZrZi25hHB5rJNoQNGU+cP6LLjztes0iy
	XzzED8ZyEfiPctBcq5Wt3MTnCtG/frbP0dTBdanhNf/1pEKStxztlx/hjK5oMYxuMwVo9j7Pa2K
	sWlM+sstrYoST2EUzkLSw=
X-Gm-Gg: ASbGncuxAM+fMlr+a258xI3d1ex0lB34IGtzYUqndpCOiUR+ABLfYGY5HAaIb4LaDd0
	v7mr9ymb2SX1b+g9wpwVgDLDTlPi/xYP3QcnHc3jLLpj4n9HJkqbTGQQVejsIuYcwqoPuaBOq2i
	IxWAATI7BrVDJAm5felt3sKwLkbHGfizOfRPpO8RTWNMjyl7aWzdyoWdj4jci2C+3GRazXZs/5G
	Ty/I06vWRffrbbEDyWIXC32MWRF59jWYTcfkJnXDNTfFjwZYDlaRTzdLS97yCUDoZg+HiKmhtah
	KI14AFH0hvjJbgSFW8QPSIIDrFlXuvsFBpI8AQP3eldKWkzIAxaU0GcsVTOCRR/RhASORUauzkU
	NpGLpT/YPf//lv4NFMdynbwd+/b8Gog==
X-Received: by 2002:a17:90b:4c43:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-343dde8c6b2mr6662856a91.21.1763032887145;
        Thu, 13 Nov 2025 03:21:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdsL7lW1LbJa0rfjLfK/4q0AP0e+lR4SI0HjCgQo7bHSOBT3PQlSewGyArB/hKzTd7D2MRiQ==
X-Received: by 2002:a17:90b:4c43:b0:343:d70e:bef0 with SMTP id 98e67ed59e1d1-343dde8c6b2mr6662828a91.21.1763032886519;
        Thu, 13 Nov 2025 03:21:26 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343eac93449sm1264997a91.3.2025.11.13.03.21.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 03:21:26 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][master][scarthgap][PATCH] remmina: add DEPENDS on curl
Date: Thu, 13 Nov 2025 16:51:22 +0530
Message-ID: <20251113112122.1553793-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KIqcBGKwVFyhiA9MpJ3a8t2XyQxQ8T5o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA4NCBTYWx0ZWRfXw+j+t9VINpME
 7hw6q9ZTX4qe2oqWaP74/fHKI5TrM71aBg9lB6dUR5ZYuBt6Pl03FofdoZXXTu7kKMz+ZG/CEo/
 CpcUbjwhNS/Syxd+NHukTKCDn8p3Cx+DvcXoAcxz24zZfgV//FWq7Eo2la5kT0SvZGP94Alq2eT
 /HoTjXg/3iLxD1RR3EKoexlwnKp+3X+OSWHlqZv7iDUGUr3O50hDcAzoXPTPqow1SNn2xI79mfQ
 JoufvrmrDMFfOCDgQNaXhNrKe1VTlhm4fOjgfr0B5LSX7FvJLvZW9uZWno5yozOnlWM20qKfLbH
 bJ4skfwNUCmIwaN11WfjOhU2xj+Eqw/THO3tH8Zu0ZXpbPfQym/KztvJUOi+kXAv1PKdWyG6TtI
 QYCJvngajX4VMObuWdxDUoATcqxKyQ==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6915bf38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=-artcdj0ciAA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fou6dX1CAAAA:20 a=EUspDBNiAAAA:8
 a=2TNrCjRSqPdrytZh3IMA:9 a=iS9zxrgQBfv6-_F4QbHw:22 a=bA3UWDv6hWIuX7UZL3qL:22
 a=yULaImgL6KKpOYXvFmjq:22 a=6_D5ljFcL1GZDUJyZucp:22
X-Proofpoint-GUID: KIqcBGKwVFyhiA9MpJ3a8t2XyQxQ8T5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 11:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121643

remmina has a hard dependency on curl [1]. This doesn't result in an
error on branches with gtk4 because curl gets pulled in via vte ->
gtk4 -> gstreamer-plugins-bad -> curl.

Add an explicit DEPENDS on curl to reflect the dependency.

[1] https://github.com/FreeRDP/Remmina/blob/a8afdd728d215791e3ce2ebc0411569529cd0296/src/CMakeLists.txt#L259

Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/remmina/remmina_1.4.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
index 921d34d9fd..d101908b94 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.34.bb
@@ -20,6 +20,7 @@ DEPENDS = " \
     libvncserver \
     libsecret \
     libxkbfile \
+    curl \
 "
 
 DEPENDS:append:libc-musl = " libexecinfo"
-- 
2.51.2


