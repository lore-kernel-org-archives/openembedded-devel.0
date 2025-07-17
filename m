Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60504C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 11:05:14 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.45242.1752747218375331067
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Jul 2025 03:13:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=JxXgzGR9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56H4IA6D015626
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 09:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hxNJSUNFNtqutDXrn+EgoyB8VqT6w9gdRKn
	VtrpYWyU=; b=JxXgzGR9coKMUcYhT0FV2zYyQPqzSvDZUxCarY1benJiYJZnil8
	L54h+vAbEkNNE4XsPMPY5QBv2FyZQoNR/AvpA8opi0lb13ade05mJV3cd8k0R34i
	37CEyVFJyRilp5r/fkOa4xuPcapNVzUUlFx5EKKEbRgmdrLTfGVB+zBn4OIHEdor
	uEPpK75LFsglEroPh2qP+RBAYF1d71ZFHjlTaWgTB1mxpWTiMZU9KJI3wtm8SOWl
	RBFzUh4/cDPpyxymew6s+sYYG09iUGh6cV5+8hY5LStx2OHuOwk7v3T/KeOgRh/I
	8U6IQFD/63VX/JaXTbml0Ie1vxWNc5zvXxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dyt401-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 09:51:03 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2382607509fso5594775ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752745862; x=1753350662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxNJSUNFNtqutDXrn+EgoyB8VqT6w9gdRKnVtrpYWyU=;
        b=QAkmhe+8tXhUCZxBMlRhgg784dBIn7RE6sUWBVnPY5Inlo/5HMLXdNz3RTUSUQ5prh
         4Zqa7IVmGAoBlVEOHGwkVcXY8dU4jLp8xgP+z8AUSU4KIX24ihAX7ZyygTmCcoSttFdH
         3dBMEvz/weaQ30eo8LSFlcPiY/D5KOEZZTaHX9ojSuBppL9xXHsBIhRagqPDZx9O5VHJ
         RABVRTTtINMx+GwmuIthFRWjhWdDDlVewTwGx5oZhJF8PIQVLv2+9muT5eJD7SmEdj+E
         zaJF0zWR9xWbCz4mXO1bG0thqqsjou49awrIbPGYCXNgxYLFIn2IqNT3ZPruivjkJWkP
         Wbow==
X-Gm-Message-State: AOJu0YzYd2DEwIv53MoZc7dRSQG5wOpCcZq7ueJXWYHJ00sVHfPND1q6
	Am40WzPTQ5oATTp3gFDhJZPpGr/9lg5POgo+ezU4zSUvazZpUUM1GxhIUV6pAlW7lo+zss3d+9j
	Z5GWJ7l9F9BNynXWIBH2AiKB1W/FMjGXgeyZpWeSjdC2ecr4uwk9eCsngqyTLsUzNr+L2y9CljF
	XYtUwaDn4c/zRIulVoOmo=
X-Gm-Gg: ASbGncsbft0sIOcNHYd8f8JJ7eq0kUACvEncz2Uf7H9mxKjZeMJXXfK6O0R65hor657
	nwPFivinTWZ8/8E5h/S2KxiubiGhe/bV9ZYfARvgnyOcnf/mv2OW/T8oE1AFoK+jr/+R4ClKThJ
	ve0iJpN9QxPoSYF1OgRGBFl7qvi0lHYMLmseYhqcCjvpBvmTlFe4aJjWmvzv+Z715+yuF68cpgu
	gelRINwBDfMb1g2h58Imk/l297aqQ3eSthFNJPqTYzeUStM46UGje6pY/Y3nVptUwB5o07TyL2Q
	R5VLCuIJsTQbD4h6JlrWlmvnw+NhCKcMr1wFrzB/UYpR+7cc4Uq7LOjYg89DUOxhwxeWZJcw9jn
	KqnjTqSTw915XK0aBzkZ4JJ0=
X-Received: by 2002:a17:902:c943:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23e24f4a7c9mr81012595ad.25.1752745862248;
        Thu, 17 Jul 2025 02:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSC0GRRe2WFV8U7jxEmKn/Pqe78pvaCci2TlEzY7tyBxAcpLk0bK/6MWlq2zgCh18SF9CnhQ==
X-Received: by 2002:a17:902:c943:b0:234:ba37:87a5 with SMTP id d9443c01a7336-23e24f4a7c9mr81012285ad.25.1752745861725;
        Thu, 17 Jul 2025 02:51:01 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435b76dsm138168595ad.221.2025.07.17.02.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 02:51:00 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [meta-oe][PATCH] hostapd: enable 802.11be, SAE-PK, OWE, SuiteB, ACS, and MBO support
Date: Thu, 17 Jul 2025 17:50:50 +0800
Message-Id: <20250717095050.3449080-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 4R_pivCCZVbxoooZxsMP1iCWNe4MYVnH
X-Authority-Analysis: v=2.4 cv=RtXFLDmK c=1 sm=1 tr=0 ts=6878c787 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Sfc4Q_cGnCSsVl2a0BEA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDA4NiBTYWx0ZWRfX3+PfHXcpak1O
 b+pkABIQPhFTC9XYFB4and05FUdLEXQSePsPDCot0BEckZ50B4aOo8YMwVVxsi8PC+LdO5QiQeQ
 eR4momQOqZ2mWEDhabRx9l+nqMLbiuQ8ms4jUzPs5uSw0Cj4JGbYakwcsynb+zM3Ey5N/4cyIe/
 1ytM2lnBpzKaHQ12KIyDMrzcNOctYMazIHkzP1vQophnMC9N6Ed+28gRrc1onQ58/YiaFNU7D8P
 8AzkmTtCgdPpTdM3LE1GaZe7rnop9hsjCpKwb+PCyUw8CoXgb+qysK0YQJ+e14gh/mVpWLFnrzF
 O7m3CkGaJTSR6/d+Rxlr04JvNg3CDSKwxZMjO/n/9q4ctzUxtPLMr5whQ1O+CCpkfDHnbF9NTbF
 jk/WmJcWvoPdRvBIG24KCIUzzy9o9Gt3tpTtrbXCD6USo9k1CErWXmtyZsPOmwiHvHKQYqU+
X-Proofpoint-GUID: 4R_pivCCZVbxoooZxsMP1iCWNe4MYVnH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 priorityscore=1501 phishscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170086
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 11:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118607

hostapd has supported IEEE 802.11be (Wi-Fi 7) for over three years. Given
the growing market demand for Wi-Fi 7, it is now an appropriate time to
enable support for IEEE 802.11be Extremely High Throughput (EHT). Note
that CONFIG_IEEE80211AX is a mandatory prerequisite for setting
CONFIG_IEEE80211BE.

This patch also enables the following build-time options in defconfig,
all of which have no runtime impact:
SAE Public Key (SAE_PK)
Opportunistic Wireless Encryption (OWE)
Suite B and Suite B 192
Automatic Channel Selection (ACS)
Multiband Operation (MBO)

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../hostapd/hostapd/defconfig                 | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
index 7f8e0b9ea..b8745024d 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/defconfig
@@ -142,10 +142,35 @@ CONFIG_IEEE80211N=y
 # IEEE 802.11ac (Very High Throughput) support
 CONFIG_IEEE80211AC=y
 
+# IEEE 802.11be EHT support
+# CONFIG_IEEE80211AX is mandatory for setting CONFIG_IEEE80211BE.
+CONFIG_IEEE80211BE=y
+
 # Simultaneous Authentication of Equals (SAE), WPA3-Personal
 CONFIG_SAE=y
 
+# SAE Public Key, WPA3-Personal
+CONFIG_SAE_PK=y
+
 # Remove debugging code that is printing out debug messages to stdout.
 # This can be used to reduce the size of the hostapd considerably if debugging
 # code is not needed.
 #CONFIG_NO_STDOUT_DEBUG=y
+
+# Automatic Channel Selection
+# This will allow hostapd to pick the channel automatically when channel is set
+# to "acs_survey" or "0". Eventually, other ACS algorithms can be added in
+# similar way.
+CONFIG_ACS=y
+
+# Multiband Operation support
+# These extensions facilitate efficient use of multiple frequency bands
+# available to the AP and the devices that may associate with it.
+CONFIG_MBO=y
+
+# Opportunistic Wireless Encryption (OWE)
+CONFIG_OWE=y
+
+# Enable support for SuiteB
+CONFIG_SUITEB=y
+CONFIG_SUITEB192=y
-- 
2.34.1


