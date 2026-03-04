Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A2EEB7ED8
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 11:51:35 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16399.1772625086868390584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 03:51:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EZhC0i5E;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JjwpqDSb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246D65t1203222
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Mar 2026 11:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Gj0Dq82AckRSEJwkDQlQXxSnWz/aPE+kFUT
	Uog5Fupg=; b=EZhC0i5EOUEBiWlMzwzDYacF8GNjqof1kqZB2xMK0ZMXonnP0qn
	+mKVLG7LUBq3a++SwsajlSnimjPPa4GCcIulQsmSC378AWXDRrENKqTlPU7GSKtR
	ywajnzFN+iMUNMWgnl4VJ9+xWtM5dQIItb+vah0/KmkwUd6WHBnT1lP8WLv2YkHI
	elOq5KOjUsLjOqck0beO62rSI6S0BUIE5QG8ddeYokRBp2qi5GEcDToDvnuwBSQD
	xSDUyM74QQjxfWDOI9QeW0VZHYTwWriWnqnfvbvKCtWYeb1MnL7nk1RaD43vbXPJ
	7xn7QCPm98RAHmwjXuJMifb2qkWjEkyVwqA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c13d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 11:51:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso4367456a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 03:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772625086; x=1773229886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj0Dq82AckRSEJwkDQlQXxSnWz/aPE+kFUTUog5Fupg=;
        b=JjwpqDSbpPrLi6iZJNRtCuQd9UMmhtkXBuRyt+kuqB33/bJVprHwEC1PDuzX0k73Ch
         BRur7+69SF+fLSU4ymwjlH/Ypheb8kX4au91eYbrwB3ZF7h9eqDhSgRB3UE74FZ6M4p9
         BCbcbLXpirXzvJfWsxaHRvWkW0CxUR21y97fLz2Q6HKVD1hRr00uUUHWwvUaFnXnYBjS
         qoOBJOHyPN0gIDYXY+i917SwhMkknjmOugmr0Nqz0nCnYJOWj+CpaNo+s0UnOJVVlTxB
         nNuAsYJjXohwbUuakTNRhIOLoHZhWTkm1gV89A6fVS4ovPcesAf2g2LPD3BFNcOJd5WC
         wUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772625086; x=1773229886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gj0Dq82AckRSEJwkDQlQXxSnWz/aPE+kFUTUog5Fupg=;
        b=Shkl1QzIIn5Wc7tAy2tlAgN6Jst3DjrluzZHQR9Vsust26WZgHT77OsZAUlKPqqU28
         XHE8O6tHXHRGXxEJoH2UJmxADT9/zKcDEZz5/SgtgJSjR15wxezME0OAFLz5ZOGDRCxR
         oFMFy3pnrQyp0+MOD39g9xn0ucUxbd/+mRpTldM2NkhTxPd6x3uRBG138RBxY82ECM8j
         1yuoUnzLZscNt0pXhP9ezA3jabckh2dtmIw3pdN9JqUmOjPWYZ2jzMM1s0+LWtXajFS3
         2O5BoJvTp6PLBwed7/X+wVdw7z9MlAn/4zHxmZfc+Pa+tlMTeEAHWUomVamyXvxajQvs
         3s4w==
X-Gm-Message-State: AOJu0YztCU8HMfU7Z2DruWxYCXtATsXzTJBaLJWyGUSPiY1zQXqxBtd3
	32QC9aPM/WppduSLrnKFjIxdWtF4//pGyvNKsbbTSd4e8w+92sW4G0QXLF5umxwve+6Ce5MqAgh
	CgGApCMREVB1O60jbFQOMYoWxqr5dvJky8Gt5pocKputJLfxY8Yqi74qhnd7dOqci+C0gEd4+2N
	ElUpjMIErBHfJ9z0c+L+E=
X-Gm-Gg: ATEYQzxTROGU3/CrjiDIWLQ3wwDVaS6NVmTbuaORZutmZbilrhIPL2WHTyQd14NETtU
	+qBTAGPS9AZdwXdjzkkaNLi7D76r5KCdsfZ+a95V9CxM1/b8IbZAmoFefAhoc/+pr8VfI49jkLt
	kbB0SX7bWjSwmu7R3k2tBjyr7eKIV+ciFJjarLj43f8TSKqh5Pl6ZE20m22KPYAjg1E1aLA9ejd
	6tfJbcB7UnSqpZv4CojBx0gVK5BbhY+fjDQzJq0+JEDF13sm93cKCHNXZz7T/xItfUFkalBBhWk
	3/oCjoPdvc30Xk1iSNfuxUd8f1PWsCdSmZ7X/sEBEcf7MQnDMsd7KUNG5e+b9U0MVuvoJWd9ph1
	5dPGpW3i42wbZxXziM9DTI/h9W04oBqiPoNkTVe2eGa8isN2SPt3L
X-Received: by 2002:a17:90b:1e01:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-359a6a4c9ffmr1578165a91.29.1772625085659;
        Wed, 04 Mar 2026 03:51:25 -0800 (PST)
X-Received: by 2002:a17:90b:1e01:b0:341:88d5:a74e with SMTP id 98e67ed59e1d1-359a6a4c9ffmr1578153a91.29.1772625085134;
        Wed, 04 Mar 2026 03:51:25 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3c5a61sm5978784a91.17.2026.03.04.03.51.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 03:51:24 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap] source-han-sans-*-fonts: rename downloaded files in SRC_URI
Date: Wed,  4 Mar 2026 17:21:18 +0530
Message-ID: <20260304115118.268290-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5MyBTYWx0ZWRfX7NaIKTp2obBS
 oxH2sSU66UZShxkALIjmI58tqqlVUKfsmQI8uZM05cZEKfiLWrr6/Epl8IV3zSpdMYTkq0dwLnq
 pSp578lrrmibjRfbaps0Yho7XMwLy/FydWFlFlea8YC9rw/J9NQuyv+lSGmAZvv9wVV8RE5qh+v
 Hd5u/AJVkKPfUtekuwO6qsvFSlUxrb47nSfnDv8O7n8Agt7Yiex3pGdrD4YEDREIFKwClhOrort
 XE4VzbA2a7ShuNZbu5bTh+7kJ1FwaUUSu+t6hMYD4QxIc6AVmmF9HY1pZ0NMtL94VSOVIdLnP3y
 LwioBiUkxYpWohK0UZm6kvmWw8Ba2X9BlmpjH22KTEill0gx6HvNIpGFSJ9iR9wK7Nm+JN/Rjzi
 vVQR0O5HdtWTn1NucN3yTtM5DKWc5nBEuS10pk6cxfDgOmNLroGtvh+CVU4lLt3Ro7iJ2Y5y+GP
 Sk08EwxThf78qhvjNzw==
X-Proofpoint-GUID: UAwqRS-n2mF9g-s-kYye1DgNM5XYwwLk
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a81cbe cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=plMWTl-mAAAA:20 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=L-XXB2h_G8GYiLdhf_0A:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: UAwqRS-n2mF9g-s-kYye1DgNM5XYwwLk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 11:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124848

From: Alexandre Truong <alexandre.truong@smile.fr>

In commit [0], we've switched away from SVN fetcher in SRC_URI.
The archives downloaded are named SourceHanSans*.zip
They are named this way regardless of the version 1.004 or 2.004.
So when the new archives checksums are tested, the fetcher will
look for the old archives with the same name in the DL_DIR.
>From [1], there are checksum failures due to given checksums not
matching the ones in DL_DIR. Thus, downloaded archives are renamed
following their package name and version.

[0]: https://git.openembedded.org/meta-openembedded/commit/?id=36a1e36e1272ca50e5dba0c4cf25ee3ff8b8f1c9
[1]: https://autobuilder.yoctoproject.org/typhoon/#/builders/156/builds/367/steps/16/logs/errors

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Alexandre Truong <alexandre.truong@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 08e414d496206d0959c2663fad7214596fad3cef)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../ttf-fonts/source-han-sans-cn-fonts_2.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-jp-fonts_2.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-kr-fonts_2.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-tw-fonts_2.004.bb                 | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
index 391d465571..db4ff4269a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansCN.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-cn.conf \
 "
 SRC_URI[sha256sum] = "6841fc13f1c0d255cfeb33d2a2c68d24bbebd94ae2c070347a2b2b200a1db4d6"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
index f940478a80..7ece511281 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansJP.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-jp.conf \
 "
 SRC_URI[sha256sum] = "1ae9f62ad620d686c4a049ce25cf54e3afd8fefc954a678c644cf9802750c17e"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
index f536d1b61e..0cbe438efc 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansKR.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-kr.conf \
 "
 SRC_URI[sha256sum] = "02fe28a48c6381c49d61c27a1b173c77f0e6f2b9f2b68e79f076f10a6a8f4bfe"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
index 0a4aff5e31..3b4eeb2719 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_2.004.bb
@@ -11,7 +11,7 @@ inherit allarch fontcache
 #EXCLUDE_FROM_WORLD = "1"
 
 SRC_URI = " \
-    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP} \
+    https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansTW.zip;subdir=${BP};downloadfilename=${BP}.zip \
     file://44-source-han-sans-tw.conf \
 "
 SRC_URI[sha256sum] = "11d78c8fbc1a4bb04a453cdd65c99db8d41ec5cd6ba6d68c8638e6ba170de806"
-- 
2.53.0


