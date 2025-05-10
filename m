Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E72EC3ABBC
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 01:21:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.1827.1746840101952253418
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 May 2025 18:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EMDab/CT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549C8kE2014286
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 01:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SEPoYzTL9puWi8gujTTbNDqnSAb0ayPy0y4
	RH3jiWCA=; b=EMDab/CT9WQrkGYEu/NTtR45hkPOqXkOS3hMe61+bnLfUJXL1hY
	szgNV9aUFoJloj9x9Js8Su80jETbCs1EGugpTRMKKI2jWt06MrDZfpxdwU8dqTl4
	a9CA1i4+iclRbT6fgV7Anyq3cZrkTtFwa8TAyzEYhZuE6pNSX0nkOVfqD8deZW5z
	6jRnaDAQfqVCADXaco/cBuA5oq+q61kOQDczWWgUU8mn7IC234L0jOXlrD4xv9v5
	y0UQt8udVh1AV0JSMsShqrGdirdsYvNgYBQNtzjrYb+O8oIC9iZGZHvsUK9K/qED
	HnInctYODRJ6uFEXEOQ3ujOrqYCTfMmEbxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp4p6v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 01:21:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-478f78ff9beso71220051cf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 18:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746840086; x=1747444886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SEPoYzTL9puWi8gujTTbNDqnSAb0ayPy0y4RH3jiWCA=;
        b=vxr9EAjfs7q2iGPNpkqwwANb16WFJJl03PFRGaqgE+TZJAYvb1RKRjerX2FsmmOvcb
         lNQeOlz1phYHsKpfH5bxgD5t6eiFbMcDEH17EeSN8/nWoLtz2jjnk9RF3XRUieEQwxlL
         pijBGZT9NDPOXYUq97e8c+Rb9BL0RfU80F7LxXTivUQmRbzSm2dZOt4+OpQDFVyjC98F
         Bmh0535ID8GhEtT7rynvdhTVBlnrakeaY7IBWvN2KxZ0aL4xK2KPKGiIdTIxhMBxkQ4h
         bl/PCPKe/7O94EMLvFKi4Gs0NW3mCydYk5fF1x/xdtx+fK0DNFpM4n1R5w/Hj3jljcGG
         6i1g==
X-Gm-Message-State: AOJu0YymOmCa6EvZtz/NbDZTqnvXHLgC+Mb6tkG76sxzn3b0J0Om8kiR
	XRQ3n1dJ0q1AM6q63A7lic2cA+EYCqttJyHLW+FW7VBGCq28DuSq6PD3Q2pamvAodSy5zFz/VKU
	o0KQ7bmwOZ0K8ONiqM5bY0MqHqg0jCm+S363Gb3+vhSdPiYUH9aze6Tmfmt+pcyc4jOcLoNxTyK
	wBdCvA5K6hWUI5
X-Gm-Gg: ASbGncs8U4JbjtfiQCjpgaEJtZydB45bOgUI+N3rQT3XafeBGzVg2wJbZ3rhfNkXZY2
	hcROhuLp6hShwLQ55aTRfNna3Hb9BMnN2gRUrv03JdhcX3agfV0eXV6Eho58JqsvCXwrERLvQ2X
	kPnBLvQ6rcNM4KOWyO56f+537WnhgORrHe18zSqDjueDTze7B2TdsHpaf/7hN7fhcGTLPnnvueC
	SR3wuxfIMyzRUZ29X7TGicvYZYx2YNIruQ0HtOkQrAhnAq+Jqi6XST+0WGpRSi/f698mUhmfTC7
	F5S1Wky9WKiFZR1dK7Ou95k9yqQ0Vq+oVMjI01trbwnG5JphpSqy6Jgva067jM40aN9KBQKVFja
	u6j2TkmwEVtgexicCgo7o0E0B
X-Received: by 2002:a05:622a:11cf:b0:48b:42ca:13d6 with SMTP id d75a77b69052e-4945271079emr69194901cf.7.1746840086078;
        Fri, 09 May 2025 18:21:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjSKqGwNvo3bPVqA9qIYO/IvIgZAoI5c9+wkjRmC4tjdHx6R0L9zglUFXT1FqRw8VXL45jIg==
X-Received: by 2002:a05:622a:11cf:b0:48b:42ca:13d6 with SMTP id d75a77b69052e-4945271079emr69194501cf.7.1746840085616;
        Fri, 09 May 2025 18:21:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64b6f13sm447270e87.135.2025.05.09.18.21.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:21:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opengl-es-cts: install mustpass lists
Date: Sat, 10 May 2025 04:21:22 +0300
Message-Id: <20250510012122.3013899-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rMZXizSTrekmQc7lFrXAQ2QhzY44V6CP
X-Authority-Analysis: v=2.4 cv=E5XNpbdl c=1 sm=1 tr=0 ts=681eaa24 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=QEd8dXg5ROkAOysMinMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEwMDAxMiBTYWx0ZWRfX0s3np/kkEvJi
 23cbUdrtiihp1glO53ZXg3+/MT1oEZDg0elzZYTiKLN1mY6IoFiAh7tits9MbiruC0y83+CPUn0
 BcE1Q/JkyOi/FMm7g1y3aF6+Y8IrgxOJv88+3urk6h7F0i9Wo5pWQn6+hYNUdgx0c8dE1oYPRyz
 SnlAjJ0ETT2YYHOtFvR9sru8C5oLF3mVMp6GxBskOuqKqvhXCHg+0tLrHsIh74Chwoqx3IO3hsg
 iV49i2sC4kJcIyyqWZzcoBqeHU6HnHpXVauxZ2RoCBTYeMdh8wBEudiR7KiWTucB6jEdpjoMAN1
 Mx2ByyDxkztyTwyHieaUaPE5YzHW4W+eqzp6a5an0jZIU3wXS/cIUkvD71HmX6DOdvidFLUktNZ
 DC1C/Js4ovA6BzsjPyLXj8RF1ICFfChSPs/SFW6ZZZXD1f/aNH0C7YYw2G6kKnMmL9VOWBb6
X-Proofpoint-ORIG-GUID: rMZXizSTrekmQc7lFrXAQ2QhzY44V6CP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-10_01,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 mlxlogscore=992
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505100012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 May 2025 01:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117378

Follow the Vulkan CTS example and install mustpass lists together with
the testsuite.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
index 96a4ca7d497d..40aa31982e1f 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.12.0.bb
@@ -11,6 +11,7 @@ EXTRA_OECMAKE += "-DSELECTED_BUILD_TARGETS="cts-runner deqp-egl deqp-gles2 deqp-
 do_install() {
 	install -d ${D}/${CTSDIR}
 	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
+	cp -r ${S}/external/openglcts/data/gl_cts/data/mustpass/ ${D}/${CTSDIR}/mustpass/
 
 	install -m 0755 ${B}/modules/egl/deqp-egl ${D}/${CTSDIR}
 	install -m 0755 ${B}/modules/gles2/deqp-gles2 ${D}/${CTSDIR}
-- 
2.39.5


