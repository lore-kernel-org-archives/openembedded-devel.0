Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970BAE98FD2
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 16:20:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.132167.1775741346499421241
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 06:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ipeBxnsD;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RDG0JOGj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CGnEZ3712984
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 12:33:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gp1H11EEaqb
	HwkrgHVIi/MHprSa6WitY1Fbh7D/FZSY=; b=ipeBxnsDOh8gr50BIbMdjEFZyew
	cfrCoW9Jo8aQiChTL2BuG+Ud2nQP48f6IjvqiIGH4lhAIjkmwuAwRL5uRM+WnAfi
	djQm8C5EUuECSVNEje8NPLDB+HQ8mlleIG5TpSd1vJcBVsLxsecXzrEVI8Lgj1tr
	CIzdlW0s+3NmqHpwpVgDyl9PotvcmTbM66tyRfeSjeFzDNioNRO1ngLH5hG3X0V7
	ZUjS/Ymwu4vCkcnSsRv+K8ZnxlFQ3NfII9AFEj0A5A17WHiJK1shY4u3QpeJuo+m
	xgHOtGFmsV540ifOxMBpsUChsjcdqkg/fu5T27bQNXsgSIIv6xLrT33MJwg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddt74bykj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 12:33:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so24271521cf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775737981; x=1776342781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gp1H11EEaqbHwkrgHVIi/MHprSa6WitY1Fbh7D/FZSY=;
        b=RDG0JOGjPelC1VS8qcszlb4ZRRT2xY9vcpejoTlxlybh80qcr2g66LqmlYXjae9DRZ
         dG09binDj/mr3kqCoPMc3ONLH/G8xxJuP9RRx9zFeB8ZpSfh2w/yR49UbXfjB7xuzNSf
         oSbV08Db4pQoHo5Za1HrotoCmnuevJGLCKVA2ZvDcv+a/aquuIYJt4kyRwa2IArovsPO
         9VGohSRQHKZI5HkMAXy75swdkviTA/KSdsamt1nQ/CjLKOwnADlY0Xbu8ZAsXDP1kHrL
         gmd+QmurL8uIOUxsNPO8U3d/dgNBeHksvL35uGHgSrYYNfdEpRhxyg0zgf0F8hdDGIQi
         6gTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775737981; x=1776342781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gp1H11EEaqbHwkrgHVIi/MHprSa6WitY1Fbh7D/FZSY=;
        b=VG81Olp562CP4/ezgr6I7F/S+ihWbXN30Apqr11eLKgTtJJ30h+1OUcp2T0MiWJdfP
         FkO/uGqeCV5TtgRorbNP+SHLLLxiGxwUEDjjKNFjwlZrFeGBtjmNBAunHz7d+GoMJxri
         kQnPAz0QXKU9Whke7rkSegkM09+iBdj7WgnLnk8tu1+oULmQZYSEDDkGvv0f5uhzS+s0
         VfRTuZ3kSOSSfdfnbIWMaJQpOWWjV9Oo2KT7LZC4/kumpdtk2A/4ASThlFWuzWeOyrJ8
         9F9iflEsD9ClPzChw/RV5BPPESwg9fgZCOISqY+qXj2rUhWFs/np9PgUPOl3B4jSiCVu
         ndew==
X-Forwarded-Encrypted: i=1; AJvYcCWj4e9OA8rjjRCxGiiGiJXUHQJ4ZnsnTttUhR/YuZGVedVnMzrbIt7c7erdSU5ME+ift+7it0/wsfq0MwiPPkEH1yw=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxr8Xe+MuPhn8xHOjJ+IUGFXMkwxqcpH7x3ElPeC8JsJapU+N6H
	Hlbet69WMrns0jSC8JKD7LuswIjeXsQVgSDu4tFoXuc0A+PM7/oV4PdBN05Nav8wyag6l6+1Hea
	174DIIaRnP2/LGOD5orogKNeNMYcHo1Zc8WrFEcyQCd7kNhhPYtjDt87q/4pE9wHrdK4n+r1tXP
	XLILMolK3/
X-Gm-Gg: AeBDietWF8F4XgXyVlATvQeb+MEItIK3TzzOqMxKhX280o+aXWdEKGItHO4t//lvemR
	0L27POnafk+eAPDDZrMYyXJdQ1i/JVS/VJDEhlKp0jGvg8lMBYMsYiOCBz2/WIlNiK1aVe1A59g
	50vYMSYynpLj1SKKONdx1XycSLQ5nSS4iZR3VamgcJmWtK0ev8+/vldWbmwATzQyXihmswfek9Q
	RuS5di/zQzSyn8YrtQyIEi3tnWUKnJd52nZ7e7H8LNuefCholS0vTpL4vU5Nj+nuozUFosBA9Mq
	OUoYxv+2V2KZpMV4SqI6ZNlyC77yj1TPdBy9koBs/DzKxf1WN34Chp7zK9clAOHfyuLldJ0sw6h
	eFmxjsJIIBtBvVUXkwtUVJ5tfTZxMsV1XOW//phU9BoSTf12eeQ==
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr280979741cf.25.1775737980971;
        Thu, 09 Apr 2026 05:33:00 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8c:b0:50d:82bc:d2b4 with SMTP id d75a77b69052e-50d82bcd411mr280979271cf.25.1775737980530;
        Thu, 09 Apr 2026 05:33:00 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2346:762:14f4:8b01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd17bdefsm22347825e9.23.2026.04.09.05.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 05:32:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/2] python3-gpiod: update to v2.4.2
Date: Thu,  9 Apr 2026 14:32:52 +0200
Message-ID: <20260409123253.106920-2-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409123253.106920-1-bartosz.golaszewski@oss.qualcomm.com>
References: <20260409123253.106920-1-bartosz.golaszewski@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=TL51jVla c=1 sm=1 tr=0 ts=69d79c7e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=2kuNKHlEyhQFlJa_gtUA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: dpAMVhI59Zs3QE8CNkq6uyd0f4bxbW9C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExMyBTYWx0ZWRfXxkELwoqCvqes
 iU+1g1//0z1TwFVHeDfI/zVTkwsr6ZtsDCLX/3pgseaHtK8yE4aQahYiTa7vW7LpbAz2Dl9CwzS
 2z3htt56TsVSLbciJ9FLtUgckhn+jP/2WxACVpS9qy5XEKMsrlChU8GGs5HKmiKBlPrOgLABh9L
 1rJAuIx3r9pyX2yBe+d2Jq5tNxDOOV3+yNyTO5xrZY+BjFYPd10G4xPPg2UhTMhwCTZa25AjWHL
 k4YTu/9tyUuBUrAHrOMDQ29smDyQ94DGK8t4RwbxLzJ65U2KaFwPW94W3GGio8oP8gMljLjBt4j
 AL8PWpyU/b5liYqB+dApPA2HqiX50xf+NyV9AVo+O6ZKR3d/Y/qgWTxiMu+kUhtHPtzxlvW5TJp
 6iLYaXsImXZPgx0RDjNgBCtRibAX9IMIEyPy8eYoAdOhUh31RTkzYQkksLT0qMb/GpILXiMeq70
 W7ugi93K+CyHUKJcnMQ==
X-Proofpoint-GUID: dpAMVhI59Zs3QE8CNkq6uyd0f4bxbW9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090113
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 16:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126200

Bug-fix release addressing a buffer overflow bug discovered during an
AI-augmented security audit as well as another minor issue with
unnecessarily duplicated code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../python/{python3-gpiod_2.4.1.bb => python3-gpiod_2.4.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.1.bb => python3-gpiod_2.4.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
index 61a3fb929e..87765c2482 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
+SRC_URI[sha256sum] = "602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.47.3


