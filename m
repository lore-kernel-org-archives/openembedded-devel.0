Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDF2C3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 16:04:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.24920.1747757062981041900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 09:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=P01uRJg2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7ZReB012177
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vidnC422h1n4I3LOrykFJqR4iZjnck5euzo
	QiK7qjlI=; b=P01uRJg2NoC+H5nf9gkyla2Ukw9Gt6XTd5JI0rKt6E5oVuA5FQ/
	ldT0QtvbCu7cWb4n3KxajaFPeCESOaE1EFaKWBx2a90goedI2xG1tr/BNEFCPDT7
	Y7wGDQ0OLT2a9LIBQKsaRpaeg3d488At4E9V8GOybKHQhL4ZXWKS/xy52FCgVNC1
	GTfKUMMatub3oauuu43Tiw5ii6ZIDb+Xwxpp5IBESN7Pdx1zW2QX5yrp20/QmhQv
	YFGKM2NcY7LWv4s6hKMIHAraGkZoYqQLH0pni9/VatK3cQ1VBa3lW3lUxVOXzUcO
	ZAqJ9ccUqxAapgwrWCR+MgU5L6dixg1QRpA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22ra0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:04:22 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30e810d6901so3575167a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757061; x=1748361861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vidnC422h1n4I3LOrykFJqR4iZjnck5euzoQiK7qjlI=;
        b=ZpPOqjU38fXazhxTgf7AGAdgeqnZ5QIeydq+ARlAssqgi2WiEikWT2CJpj3fXQmL9i
         1ZAFdYUB9MSbVdZTo1rrRZae2Rfvi2C4cOebrkqasAJavTx4dz3oYfhaLXJU+i9yuwye
         G/S5e9RMRMq7HE2nHm4HSrziwINMEa5SmOo8N1VqAmx/fYPdTc3FryMVfshXCJfzU9zo
         P4sL75ITh/FIUslpRUdyqZm3tCrQ2L/05S6dTWzPxkjbU0b4HhitE9WT/vS8udaYTLKT
         zBj4Iv7CfvvnpieHOsdkx0n6rNYwIxzd/yoQYY9b8XGuq8LJ/CgUpiGNg2g3OE7C7xVa
         +LiQ==
X-Gm-Message-State: AOJu0YwJvW49V2T9VY5tRLflc/W/xncHsXTMFUcdv/KjXRmAzBgzKQ/H
	F+5nU7LNL2aahnTCWgeDS8yyGsAOCkTvO2Xz0Qnry+seyBIKOkmG5yBblIcdaXZuAasBPXJ77zp
	r5gw6XIBLyXht0j4eAD/qZUSEgGB+gtgUhRRYbbuqIo2Jm3NXg4VnqgqqSHAY0Nq3mgJCxpLOV+
	OEE7/GZj2tn/3iU42nEXU=
X-Gm-Gg: ASbGncvLg5dpvbXs/hgl6X+ANvkscs0um0/srNBmPPci/bWP4rz+ROgy1obCXnq7ZyE
	zsFunNgmYDkuypkPjzG+SuN731d4g2Ymyj58FpbJsDpjkAHpz0KPnV8TcSP4Td040WEmQdUPeVX
	hExQj89US+qlAhZ422P0mQvezEdLJiBm4XBjCrSPPLpdHNBoyJAl8YNj/f2UQWiqmtDD3tWG7eW
	bg7P3HBjNcct+mF/AhhgWO4R4iMul81cw3ZlhJ2rpyfgAsHD6VKn/hjUNUP7oXzL3Y5P9ozXUkT
	f/R+ei1JKnUHCeYQJYb7oKeIPyvPeafReCiqbe5s3ujDb4CEq5R5g4MOhCVEABZpFrmPADtg3sc
	Fyrv22y82GskS6hSWQr/GDWjW
X-Received: by 2002:a17:90b:1f8c:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-30e7d5b70b3mr26750903a91.25.1747757061413;
        Tue, 20 May 2025 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuEZpRXA5Ia2rQU6wt1JmtN6err9Ax+DShlSr8UOsJUt7n0aNdT2KWTsM0v7LNu3/WtSM/Bw==
X-Received: by 2002:a17:90b:1f8c:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-30e7d5b70b3mr26750788a91.25.1747757060688;
        Tue, 20 May 2025 09:04:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084dbc20sm24096441fa.48.2025.05.20.09.04.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:04:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libglvnd: provide virtual packages
Date: Tue, 20 May 2025 19:04:18 +0300
Message-Id: <20250520160418.814173-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzMiBTYWx0ZWRfXyLAeOdyp2Yw4
 Ol5cbWkuexIIYPjOm/NqUknrHGYS+N96QkycbY5HvWDRGfaamhSXUx/vBw5IFPbrjcRXfywVwpl
 ciAFavapW2lS6FeIxWJg1288ifMG/dgaj1G8N8xQzY27u1JoFNA1cuM11CLBW8rmQBiHUZdoutc
 lWL5hSUeW+B5bkasijHs1SOmcP9ctzjQPee9f1v1z9b1IqeG581/6k68LCc0t3Q0Eog1INGzMnL
 9hqGQfmQ7cvYiXIGzH/FdH7WDcosBgQZtK+Wn7U2oEUml3nVHon4eJ72X5dPa//mgvJQz6M495d
 zYm+lpbpAwbi6NwUiU2aWPzCvr5snLRFOvC/RzjTjtIfLn6x3/lbMwbRLRNjdYgodJ1FHn3hLvd
 TiqOtIqX6rxsjz6WFa8mq5fAZyllJBW4NydwZQVHHKaOjcxYrs4QOgA/hGvL+XnrUpJwAZvZ
X-Proofpoint-GUID: 6SoBpmtjlLjH8mdHzH86wHF1fKONwlqa
X-Proofpoint-ORIG-GUID: 6SoBpmtjlLjH8mdHzH86wHF1fKONwlqa
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682ca806 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=WTgTeb579mi9al7FRlIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=873
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 16:04:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117515

Add corresponding PROVIDES in order to let libglvnd declare that it
provides corresponding libraries.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index 4094aa4fc613..53f422aff1d2 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -28,3 +28,10 @@ PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
 PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl virtual/glx', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
-- 
2.39.5


