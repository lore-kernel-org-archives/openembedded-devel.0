Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9780E9A02C
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 15:30:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14241.1771428010115578726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Feb 2026 07:20:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PqiyldPj;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QVea+C/h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I5OP8Q4024823
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h1OUYDWSy0V/BjWjuMeHsp
	S2oyPLCbk5LCzY5FbWT6w=; b=PqiyldPjX4des5Bt+IvXQzTtUNxqMHr1hNk8dU
	vZZR9iqk32PAkF9x6W8e8SmMgH0NWcB6Y0xlpsJEhuJ8teUgpf2EIZWcGmVrYNko
	Jl3Q+9ELuq5d59xj9yyTQnwzXAllYWALYhVNKNUe6KpncjMYEaG9d1MZD5jjHP21
	QWj83ok0ejVnnhTYDiKmPnIg8zc5Q49f16HTpVVAeXRPaWJBE3PEEGCb7VGogwa0
	I0SD67N6UcXqU1mT9d+A3C7INJnVzAtun9woVanX9LnsdCYEnulUAABfIReFuzvz
	u4tZsnRvR2UgwMIjbdqOGhvJ266Z4W4y8aE6+Day7oPizRZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd78c1fhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:15:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4a241582so3104720385a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771427727; x=1772032527; darn=lists.openembedded.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1OUYDWSy0V/BjWjuMeHspS2oyPLCbk5LCzY5FbWT6w=;
        b=QVea+C/hgwb/pLGXKpEtX8C9U0PjItDEg0kvUCZSypMM9DG+lJHCamfMplFWuGBTHs
         VEXg6PaOM8JH3qymjtoLSirMHkpGk5XjDobo2r2qc/Rn3Cgul6BMadoQfYv88tu/0nGD
         PywLJ82O+VkGy9YU/VNOSeGx3i2xR5qH7f8V9yYq6RjCoPp6uPvWzh6oiVvY1Dle8MdA
         Z4XgB8Is0jdlREJuX/5ExgRIcDgt5V1kpHPgSkCUP+XAD9f5cNC2DMRJcMfNQgsz2mPp
         bml6+rkwHD3CD1kd7cD0IptCyFKgrQFD+JCyj3OAngUVQCNV77lQoBZtuYtjjSJL46gM
         thLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427727; x=1772032527;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1OUYDWSy0V/BjWjuMeHspS2oyPLCbk5LCzY5FbWT6w=;
        b=trwG91W4E94w4PxXHMOJn9xIbz9lRqKnb+05fQIvRAGThHxjhwckXcS+x8WhJkw8jd
         v57SXj6BomTrp/gSz0ew5kJdAdRoVnuYWfwjgVbLQ59Ot7yf15SH1Xe75W1KbYbec76E
         2BW8VucRpybRWavJgy8VDiehcFcrOFTilHsX1FEyMyr+TsA40M/xjRRAut96RzLZ01TH
         5elgYp0wKo2kPT3lK8STbYbhLPXuv16I6u6PiOIadEOWngLGW3zIu/KnmKvmKD+liALb
         VcHNJTjl/1QK6oiuISSYIA7iP7Eg+mt6zmfURflXr2hvtCV+u2byQL5iwvNgQdEqoZPL
         xHnw==
X-Gm-Message-State: AOJu0YxnjQY9hkp/M0S6MONs9JCfao3S2WusHvQBPVTggV44LDF6pMCz
	R7bgKWZ+oZ0GD+Mda7DqrCCf2Rk0ZG43RZFGaNS9opJJgb/CITNbHs3rbvtCha96msVHZy83k/Q
	/KRlT5tmux67+A1eY0a1eIIDSFhkwBTaC6M5LU0V99W6QXQIXlXRCQlW6vu9Rf46ehWyiwepksd
	L3FPZfqjT4
X-Gm-Gg: AZuq6aJAX35JE8p9diqIBsWKz/ekbJiqg5EBE1N6sjIGv5OsYG52YoTD0tUhLiEO+Dy
	PmKXY269xQx1su/i6my5QmES5bh1y1Om49VEhAnY94GxD2j3etMM9dUKjJKy5wCuPCjiNme40XA
	LBaS1wH8JK3+VxAucs85JjXEjztaaS2JDbTyRoLzc9h9llaXR09SwbyRU4Qcgd9Zr0L6v2h5duP
	KRkXMLiydAVEprsOz86kbqiXyFKepG61jfmrragaTwt1tgUe00tEIydcSvuxT6Pm1XF8oXcxiac
	XElyzN+TmpIGbHVMKJcWUAvbXSPImUVH9+J8z0HGJmqIgNxyaGXq7QP7pTdX6Pl5QlCX1mLyBIy
	KknvXJn62Gs+ovkOKfT6BjukD6JNeJluuVVIN9jNM/MXupQKuhJB7
X-Received: by 2002:a05:620a:4095:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb408d6a21mr2265134185a.43.1771427725290;
        Wed, 18 Feb 2026 07:15:25 -0800 (PST)
X-Received: by 2002:a05:620a:4095:b0:8c7:6f8:ae4c with SMTP id af79cd13be357-8cb408d6a21mr2265091685a.43.1771427722048;
        Wed, 18 Feb 2026 07:15:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:1503:4cda:107b:9e15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm912573265e9.9.2026.02.18.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:15:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH meta-filesystems/meta-python 0/2] gpiod-sysfs-proxy: update to v0.1.4
Date: Wed, 18 Feb 2026 16:15:03 +0100
Message-Id: <20260218-gpiod-sysfs-proxy-update-v1-0-55ccdc46b0e8@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHfXlWkC/x2N0QqDMAxFf0XyvDCNY8h+ZeyhW1INTFuabljEf
 7f4eC6cczcwSSoGj2aDJH81DUuF7tLAZ3LLKKhcGaile0vdgGPUwGjFvGFMYS34i+yyoHdv39+
 IeGCGqsckXtcz/YRZskOvX6liltmu5xBLnurda98P6d+iS4gAAAA=
X-Change-ID: 20260218-gpiod-sysfs-proxy-update-fabf3422d8dd
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-devel@lists.openembedded.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1210;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hH5RyWz6I5OAmwPUuWjE3mTcF02MD4BoIXc6dBTvOIY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpldeBDayxh2RhCOEIDzEvLK00M8lNVFZDUjW+e
 3T7ATm20qWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZXXgQAKCRAFnS7L/zaE
 w1tAEACHXbGgfPQNejfNa+DBsw309FDOvan/dXObZ7oJMJkM8YZ+UZ239Q8aoOQi3OYCVF24v/o
 mwJh5VPwpjIe+cCPbb40F8vAGIUm2k1ofUwMmTto4XW6DhUTgPLhunH9DqBNEFNnxI19JyFbg96
 SDgeubK9yb0tYtUxPEBDtMQ9jO/UgNbUI7qIOGiDVAmYZhb+2WaeuS+biQ+UVILp7LWDbQnBZF1
 Dxs89jMswAYRqf+9u7zH2TGPd6GDt2EQzcQIALntAHugKHO8PfJb77p457wQClV5e5Gylg21B5y
 OePmtqgj5eZlZG4BjKXr3OUltadUZtjrDsQ2b6j+jvuf0aGs3hUKVwAImBe6UQZ8USuT9e+TFsZ
 HPaigxOOoJyjmZ9pT1KB5EQOJHuQPwrlBzMhw85A4KZ6Di5T487TMsWn5xHY7VQ0OPsxs0rhrte
 3QKHGFh6WQCUvlg2DY/qqUpxHwRUQpJhQqxZ+z0GAjcLbXNEuxwf/79vNcappXH/OklaW9W7hai
 NeMV43TyOZPG5huhwLOiC/zmfOWCON/Zu23CAFcpJr3iBdfpi7nDXhlkwolzgXpfuhaj4hw3lF0
 2IjjYslCCLylvxyVzgoNt6/tJmuqO2kZeNM563K9vQT6YsRosZCl24xFfXHUv6qZlTwBINbST52
 Iw3ktR3VMpUzoUQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: pAhYRX0rIwBuT5wYjPxojIBt2tX9PvZg
X-Proofpoint-ORIG-GUID: pAhYRX0rIwBuT5wYjPxojIBt2tX9PvZg
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6995d78f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QGtQWn5i2DT6C_2dv8cA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDEyOSBTYWx0ZWRfX9wannff3cxDn
 yyemt1E0H7/1JaM3zoMIFeU79No9SMe6gxsWpKa9Q2FjiToB7Lg9hdHUjMO7a4WDxDl1NIwFRTs
 DQIf2D1UEV24LDHaTjtv+HpgSmWKkxcGIPvrWlOTMsvwXmOPTNM8cuz7vZE68p02OtlFN8+hLL5
 7W35yA8mxf9kdhb1a9gYno9LcQGXa5HML7vuOGFESqoO0G53lX0laO2ViNvDLwTqnzBgBn4bguE
 JGdDA+jB59UtZMbYGD70POnMmJYBlZiN5DmtmvTo6rAuFJPamh76f3HRv58/QnuXfv42qiMwzaz
 XC5CA+j6s5MRaeEpcRNQr6O/QNXG0uqjgkJZTbR7Kwrq9Jz8TSjNVMYeTmzxEl6ycHGHP9Nlo6j
 Q9Tdl5Zj946WtBrkcHuGIFt3589oESqeWVBu939dcvkgcgW9O7CnuxA/jXp0JpAXBsPu3DDo5us
 UWDs82szgMtAHS6B+QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180129
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Feb 2026 15:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124483

This is an update to gpiod-sysfs-proxy and its ptest script. I've
noticed that on some environments the tests fail. I tracked it to a
problem with python multiprocess marshalling of functions and fixed it
on some environments but not all. I switched to using multiprocess
instead of multiprocessing and the problems were gone so I propose to do
the same in meta-openembedded. To that end: add a recipe for
python3-multiprocess and use it in patch 2/2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      python3-multiprocess: new package
      gpiod-sysfs-proxy: update to v0.1.4

 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy.init.in                |  2 +-
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy.service.in             |  2 +-
 .../{gpiod-sysfs-proxy_0.1.2.bb => gpiod-sysfs-proxy_0.1.4.bb} |  6 +++---
 .../recipes-devtools/python/python3-multiprocess_0.70.19.bb    | 10 ++++++++++
 4 files changed, 15 insertions(+), 5 deletions(-)
---
base-commit: 4d60ca97ec2f0a7a22ac35a97f716544b54fbe39
change-id: 20260218-gpiod-sysfs-proxy-update-fabf3422d8dd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


