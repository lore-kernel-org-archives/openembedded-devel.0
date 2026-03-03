Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78E6EB365C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 03:14:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9595.1772505268130359045
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 18:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hRFzPgvH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cGigB4gQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6230rN0Z669655
	for <openembedded-devel@lists.openembedded.org>; Tue, 3 Mar 2026 02:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oUmQoL0nF8SRDRLQp5XG+5PiGbfAlBMxFHI
	+n3pdml4=; b=hRFzPgvHvaVukR7Woxdzp+OJz4BXwUmXXMj53NqjYjKVgGibQKR
	v4ZuobzzOGpyw5F7hoXPHFucOUgYGvdoyYkbXtvGOcXN/YFvLFMoMf3kE4eIpXmJ
	HjMhlAuD5zvD9efiEnLpybJLcZ/hEYkTR9M8phimalMKKFEbAnl0m/SEGbnOfzU9
	NzstA6lo3zliSgVSb3JoHjCs5sAzC+WJsRLZDALj7INR9YNisS+ZdeCnOtA85tf6
	cCC84BMiOOW7XfTITBkDJQjztWNNha44SatkH4gHLWZJMVCIDM5iSEuMytEqau8h
	PV9D/WtkBYpuHs289kXx+ceDuN/Z0zVemWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnngg8a8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 02:34:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae59e057f1so14081525ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 18:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772505267; x=1773110067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oUmQoL0nF8SRDRLQp5XG+5PiGbfAlBMxFHI+n3pdml4=;
        b=cGigB4gQ4jnm/WbIcY1g33j8apEUigmh7N1+5J1kHMPJKDZdbKEH+MFCJuBoX/ofLl
         KV48hmwgOXm8gB2t9VU6+x92p8OdbrAlWwxl8Bx7UfHrw7c53FwgGWKAxcq/Hq0z6ZPb
         D1ebPDTrO20W94rEcOPFgPU9l87+YYtUWS1JW8C0n7XYHzJynTIYRlsDDbb6MU5J69cy
         GlNsSxHzs/iFxDG3ViRtVdbjVBUBkWZvQ4eqHLRLovWFZRiL7Pxfg6Z8vCBJrn/4K6qG
         j6E+zuenEiX0yVl9uC9UhgOUIZnpVjmsjtKKqDpcoXeYzQ1k2vlgMeyxPIBA1g5G6qT+
         bZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772505267; x=1773110067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUmQoL0nF8SRDRLQp5XG+5PiGbfAlBMxFHI+n3pdml4=;
        b=QhBbkOM9aFsE9f9AYypAlMiqsBBtTDf2D9qzEyqRz3EV1iKXW/GbBiOHrW2nLfaEpu
         CBRjD3GaSWs2eCytILyoad5jhfM1W1gxr6wkOQRXOCMQ6h0Pngvm1x3xnKon/yUmUSnU
         GuroXXD99IeONOGrdXAfq+4RuBTnV0e1DSq9Z0K8ctSvY59OpMGB+8eTNOaxzojwEhVn
         Ij3FDXhTZL+D/tWScLwgYO1RDV/FjySo+EyXO+4LF5z8NuDlxVL5j6Eo3yOBQHLVhDik
         rzDcdWuPFbYraVfdZ5QW8PYRUHrzwo3zVHodremHkaHdUEZabLvruAAsXn6kb/nWL1ob
         P8Qg==
X-Gm-Message-State: AOJu0YzajV//ng6pcw0sY75ZZV8iCTcb+1mpTwMfShK+KgYYXc82rpak
	6rLhoKuu1Gc0xdMUHkHHL7PUML8Nk7X5n45/Ccdm5N9qD++4o1b2R3hg5onTtXw9rc2qM/ec4C4
	VQy2DKTNkdpxhr9cVQwY/2riC+HdLVpDf2c8g4BMtWYpq1eSAVyeHbWLLWvsh+mWXK1i5YkyWBx
	sI1rUT19xa0YCbiCXS0E8=
X-Gm-Gg: ATEYQzzMO0x9+WQAxoaTCcfs6bGCVPXbMlP9aXPm0Z/W2ZLno73EwUP3tKPJlkV5+PJ
	lvGbwGldVE4s1MejLplgvwfNb2PdPBD3ofbMuzC/v3+qyAk5ekiUVcCKGRb9B5wae2OFViajaoa
	tpBdhFqlgAn5i6vCgs0cqiHq7lju3GwhweyG+Aw5GpDuJss9iICAbB0CeGUgr3ltlA/7XU/ovAX
	dZZGbJ51YYD82I12dMKj5Z9quQhyWZnkydpHJhNH06RBDZ1lMO+FsvqxWJPGCM2fFRTA+bIZze3
	DyPTe5TodUk8SZvs4eb+PyRJGattw+veiGZhxrJYo2w374jdaecbQFaTjkNdYG3JVSiRE3AdFL0
	JnQH2mcjZqQKpIYAU6yk5kpKv533vnYsSOfjCevxMNfPn/0GB3MAJ7xfvS5aEogbC99dE6sOliA
	U2eZp4
X-Received: by 2002:a17:903:f8b:b0:2a9:62ce:1c15 with SMTP id d9443c01a7336-2ae2e03118amr134316585ad.0.1772505266570;
        Mon, 02 Mar 2026 18:34:26 -0800 (PST)
X-Received: by 2002:a17:903:f8b:b0:2a9:62ce:1c15 with SMTP id d9443c01a7336-2ae2e03118amr134316345ad.0.1772505266078;
        Mon, 02 Mar 2026 18:34:26 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3e4e34f3sm91619615ad.29.2026.03.02.18.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 18:34:25 -0800 (PST)
From: "Miaoqing Pan" <miaoqing.pan@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, dmitry.baryshkov@oss.qualcomm.com,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [meta-networking][PATCH] wowlan-udev: add udev rule to enable WoWLAN magic-packet
Date: Tue,  3 Mar 2026 10:34:09 +0800
Message-Id: <20260303023409.4016900-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=P7E3RyAu c=1 sm=1 tr=0 ts=69a648b3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=T8Rb3LcDPC92mQh966MA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 6EFO7S8_fzJhZ_olH-1eCBOAQaI28gem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAxMiBTYWx0ZWRfXzOCXw2MhPE6o
 h3LKYDokPL9xiNnzAwzZhjcjB0vv5eI+de0g4mbX+ZJ8SEJPLpwbcuTs6C2l//n2qX2W0tuLkmZ
 dSOpwtQIQsM834vyK7vGJt7E61dFl8Xh7l/dWM9uLpMQ3Cr6u4Wp+y/YW5ERBklMSeYwAFYF8jT
 P1QD5gBsMgz5kun4rbS++/g6rFeKZp7WYmP8JTiA7Vka+bI+bFpCfomlDgQ4WXdb7ZeQEgZ6YXj
 R1iWFMSbO49L0/wnJ2maICPs89Y9WZoZSayYLIFM4H2gWxCRHTYt7HZIn95xAF4xkSvCNPNT05B
 TDvkdyqT7ky87dAr0KTHzLgVtA9ZTIRR0k7nkARI49sFpn/Suboj6VMftDH1wlu1DcUIRhpnTgK
 wI7NOXGP5P1zH6KSFHf6CcLGaqyHwRvCLIqlwP8PYQRbKG6D8mmacqLm8CPQO6iBlyzv0V844Ty
 e4EVHxPlxbtrFq2mgfg==
X-Proofpoint-ORIG-GUID: 6EFO7S8_fzJhZ_olH-1eCBOAQaI28gem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 03:14:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124823

On some platforms (for example, QCx6490), XO (Crystal Oscillator) shutdown
is prevented by Wireless Processor Subsystem votes on interconnect
bandwidth and XO unless the WoWLAN magic-packet trigger is enabled. These
votes are released only after running:
  iw phy0 wowlan enable magic-packet

Add an udev rule to automatically enable WoWLAN magic-packet support when
a Wi-Fi PHY is registered. This rule is provided via a dedicated
wowlan-udev package and is not enabled by default.

Integrators should include this package only if their platform requires
automatic WoWLAN magic-packet enablement.

Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 .../wowlan-udev/files/99-wowlan.rules               |  4 ++++
 .../recipes-connectivity/wowlan-udev/wowlan-udev.bb | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
 create mode 100644 meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb

diff --git a/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules b/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
new file mode 100644
index 0000000000..ba41eef896
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wowlan-udev/files/99-wowlan.rules
@@ -0,0 +1,4 @@
+# Enable WoWLAN when Wi-Fi PHY is registered
+ACTION=="add", SUBSYSTEM=="ieee80211", KERNEL=="phy*", \
+  RUN+="/usr/sbin/iw %k wowlan enable magic-packet"
+
diff --git a/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
new file mode 100644
index 0000000000..06664c8e10
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Enable WoWLAN via udev on Wi-Fi PHY registration"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://99-wowlan.rules"
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/rules.d
+    install -m 0644 ${UNPACKDIR}/99-wowlan.rules \
+        ${D}${sysconfdir}/udev/rules.d/
+}
+
+RDEPENDS:${PN} = "iw udev"
-- 
2.34.1


