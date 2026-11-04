Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5594.1793785813401731987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2026 01:50:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gdbl0cfp;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=YCPzNbq8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KaEe2232021
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Nov 2026 09:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kppSjTGl24Gx3Gy7+kuc4PDDM9/4TpBVsH3
	CsrMwlGY=; b=gdbl0cfpUQWWgptjqPUBubFHbahNVJG8yQ6eXlfx2IE2V33rSg1
	blq4BkC8wwCLifWLTNk9a/XTyCm1t7j1BFLsSk+OfsIBv5nGm1e8Cz2HrvDLR6G9
	wM4curMMKdXlaLKfNnRwXncUMu+wSINL4zwS47Q6sc4H+xL8Ilty5YehpdvMms1K
	4/c+O3fafkSJ+U8xKFNHFS7b7+qTy59IB1Nm6qqqECvJLsJI6rU5Ss6tRmx98cNe
	dPNvpgy+xSQTDNp16UD06yPPjVbM7bF/Vpi/X07qq06MMqkHHB4FHmdMcH4YEm87
	HSwVK+7P4RZsj9NSn10vQLq1secP6xBamIw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pkgf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 09:50:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so112203885a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 01:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793785811; x=1794390611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kppSjTGl24Gx3Gy7+kuc4PDDM9/4TpBVsH3CsrMwlGY=;
        b=YCPzNbq8hbdQNuws7rPAk9ReqvSsh8DmPVzEEjVYUu/W/5UVI/xNT6hLt3PG9DExoq
         oKq5O9QLDzfqSn0K8tfv+imQtGgMN9BMrVnf7cDeZlHO76PlCT98c9sLQPB79ZiVowG5
         mMQCpG5SxQQBoxubur5WkUhBoSVBAXshUqhHtiVtyub848lSL/Ks1EXNh5sIdkPJQCQu
         1zXSaZzaqwYMKo3CAH0XEdQI6AudoJyFO6WUIpoWd6QZbjH3nry5+t+WZhSJGqjre0hh
         afzDedI2j/OXYjT1TrJLr10wE3O4TsiFOfrxfULqvopmgDZhBmMSl987BNcHBmFMilpF
         bBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785811; x=1794390611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kppSjTGl24Gx3Gy7+kuc4PDDM9/4TpBVsH3CsrMwlGY=;
        b=yxHRDjaziYEVqxr9h9+2l+ktCvAmlhC/TxIODzAn/xbYfK7CKZsY6wAHNtuNIuh+3n
         tCalZBRCBruzQuTZqlvDqiSaLTYeYbH/83NHtjJhnvBDRcj5Xw2lSdURWSIGwi3K05t6
         1Aq2pYw1nON4WWHIAPxn4FHXIlpS4T0rrRKuDA5FUEBUhS0YaTV5ks34bzCvCauu3N5l
         hApMN8uZu6hmuYUlSSWbJ7cNZ4PaMWYH08sOu604F8//awyUuc2bqTiFaQxXirhF8E63
         M/0gDUFx07s6PqpnnvoDC1GIRIiWGRtN0V30gy7XgZv58vBATi5lyx/f2uDuu4r68fhE
         idMw==
X-Forwarded-Encrypted: i=1; AKwUvBxPgFWppu0YUeMPxUBI7soXcCzvXKkO5Ss2Nc6TNQ2rQuz/qy2s2b/rZ4zLYxMUYN0BF67/G5l8PAiZmiBJp+zP518=@lists.openembedded.org
X-Gm-Message-State: APuU4Z8x2W12CY96EZh5o9GPML300t5DPB0Iou0VJI0USXcEQzFWRyIw
	t8EBjB7D4OyjbhLgRImUpSqUE0NE4ScWJLboBpmi3mVIY7PiDPM6qNktqCImgjOK7+45Pgba1PZ
	oZggX3g8VUWa4eC3NV87sPONrXerN6PMEsIC8y9WgZzeSXEKjGCOj0qTF+ALJ+/DyxIyr/Fq95k
	5aaOpTB2Tw
X-Gm-Gg: AYBFou0UwwdK1y9A4vQVeUqeqKYShi4myejAaZcFSBWME5ipIjNWQZfAzW6Nm3bfsTU
	wN+RGEcaVfbRdYsAk13pZKEH2m/xXEWFVVxGNcpdE+TwNH9kt8pl/M5Bni8q9frrqQu62+VyhlH
	NVSIAvNijV6VNoVb3xnVKtqclgORkBouz+/ZxE3HG7OeikRLEx+PL9WkrtmviTboE0Wh+M9cTca
	N7P9980pj5D/jYBXks4FGxix/v3mDzdBnhyAOODxhRhvBVfDMzix6FTAxrNRw7Wtq3NVQ0HrHiJ
	/6RMHHDV/pXt0iBd3XY6ApVtu3zEUBVOfQdFiaCdzf0Rxf/+YsN1LTXMQijzQrFBtA4GjyI7qwD
	mBCpWaj6dObqqbynE0Oj0rLAy3WNg3RO/+LJwp0mYcZv/u7ziLznPD0fwc/bbEv4zS4lVN6mr9x
	i4
X-Received: by 2002:a05:620a:3703:b0:93c:8e3f:3036 with SMTP id af79cd13be357-9442158807emr2505391785a.4.1793785811463;
        Wed, 04 Nov 2026 01:50:11 -0800 (PST)
X-Received: by 2002:a05:620a:3703:b0:93c:8e3f:3036 with SMTP id af79cd13be357-9442158807emr2505389585a.4.1793785811031;
        Wed, 04 Nov 2026 01:50:11 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm141504875e9.1.2026.11.04.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:50:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.6.0
Date: Wed,  4 Nov 2026 10:50:06 +0100
Message-ID: <20261104095006.34150-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfX48PoACpZ+skE
 O9bpA9mMdo4K2iSs7rIeTXHOhw4Gi3e0GEUPROW8SAVTmx0vCnVkWTXSTFAwWLLoZXGYyeU7D93
 dkIzmLCC96Y/QI7T1FmHQUsjtiIqaV1heolaLxGHpr4CT9Bl+G4jsHmixHWLjpTpcJtZP9tfSTb
 RWMZnAMUqBUyO2aR7GZVJy9+f0uiJrLHhVI+DTCTOu+v6YIZscwWl6DKKEA2bSvemu5giLY0ULP
 EH0SE6736VCrrPon18Q0wWprleNktx6ZPHZiPEY0HM5IiHV3ii2mCOr2W2waZUN+9wT5BgjwfQN
 tF/lozNcWrY2FghbNT0q3as3WzKSIj6xpY5kDWJV0g+qhuxBRT79W3eHFHN7pKWiIg8KtegJPo1
 v23m1Nymbh3zr3n/bapo78CYJXvMfBB9QsWtmAgFny/WmpgiIkh8weFp3XNFZvJbgc1Gqe+j4v1
 a/80AzYCponJzGRKdOw==
X-Proofpoint-GUID: SA9pWVPCpRNrEUf9IQgkd7HyIVfo3JH6
X-Proofpoint-ORIG-GUID: SA9pWVPCpRNrEUf9IQgkd7HyIVfo3JH6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzOSBTYWx0ZWRfX8Gx6VSbLM9oh
 KjUEhFPhscy9MJXGxXNUJqB+lGJNKeVPeSIxipnZO3Exk4yJTUCFPxT4SGc7l/Ak0cqyvT1WGXK
 GvMH/0ZTknqqS8cVtiQFDGQk2KZ22hA=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aeaffd4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=kJEEPpjrxqurOdzKljAA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040039
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 04 Nov 2026 10:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131840
Content-Type: text/plain; charset="utf-8"

This is a minor release adding support for Python 3.15 + some other
minor tweaks and fixes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../python/{python3-gpiod_2.5.0.bb => python3-gpiod_2.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.5.0.bb => python3-gpiod_2.6.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.5.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.6.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.6.0.bb
index 3cbeeb772d..352fc77314 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "53ae5a1f14d6388c155b591ca0fc0cfa73b44d4f6d8d117e8a9e68f5902d187a"
+SRC_URI[sha256sum] = "1076f0384c63fdb9e4438508c511378c57b4236c6b43b65ad609d0dafdfcfd7d"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.47.3

