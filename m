Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172FBEDEC1C
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 07:07:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12124.1772602715876556082
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 21:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PnC7ozbV;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JQF/9Wp2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: miaoqing.pan@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245TCeb946662
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Mar 2026 05:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wq4zJoxsr0lh5UGanyNIrVJif25LB7B3Sbq
	+Nvl1F48=; b=PnC7ozbVqCYtHxOmt0miA9XGBlG7YwFStrDbdfpkUIcxAen2btq
	rkCFjpS9cGzl1KPgFxQZZuE5eyg0QXL+rGNXP8fYAbcV32lqcehAfh1E5boj+AqT
	14kWNqf8IslN24CPG4lbUDoOkMUFMp+Xh1/NxvdKez5jZxXAECHuT0Is12966ts4
	mSuSVw7Hlt+7C+MRWDo60xmOxWUs5HNNzVz27If2oPItZwUms3S9JF+nqsEJa2y6
	2j+IbcniQoLcWjaDb5EDVy64VVkb3HjzXff97MTr1SP22ujcrRvHos/7W+JCJ+Uj
	1Pi3VSumFI2NoMZ/mkbpH7P3tmGrMjH0fgA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvxfbqd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 05:38:34 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82740488112so15985225b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 21:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772602713; x=1773207513; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq4zJoxsr0lh5UGanyNIrVJif25LB7B3Sbq+Nvl1F48=;
        b=JQF/9Wp2WdVcGGLaiB2wFzMm3XQtB7sQ7GN7B53cx37uTR0spXJAHNPo02CHsbE5OB
         6Qu+NZrW7hwILaUGAnCrDyXFbKccgW/EjNMbqrB3DOoNjoIvE5el7/vFwV3y8jkOwk5T
         IhmR4Yzav5RGXJ9F5rK3ONeFMtKwviThIJeCYvZT1uLvQ+SJeyL9QIrG3XX7Vh6JApxK
         c5QpVLXzKnj6WJ7/4ieyGoqhSnI7K9ZvCPlsWyCgcf/jJxhGQWYqJTMXQrFndXzgTkl4
         0vUInMgY+hhwHFczIwOdfpHCDJtVAH+sV6XiS+gsvYY8/NTJ1878xI2nZGm8SH72tALz
         0q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602713; x=1773207513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq4zJoxsr0lh5UGanyNIrVJif25LB7B3Sbq+Nvl1F48=;
        b=YYp3jg5v88OZAN1hsp9E05xaMIP+WolqCJXFphigPvKr6BCXJcozf1kGvK+/DkXhmC
         vcwEeA3FwDMrtoPr2+y6mWtqzmKVUYRh3OTQBalwj/sOf36p/ky0PhQK50Fbf9apmHgI
         t0HI4X37aaEeh+VhSRcHhRHM36S3AFDRAzev4DhzD+Y582NAaXSRtct/jmqt0B7MsA3/
         BDlclMM/oc+DJcbT9xZ8yNJF9v5Qws3AVPAUcfw0h0/yMyeWvavz8dpMciunZ+F56KW6
         BHA6iT8gYLpG5ge6F8SUCtEMdPBmu68GCmiXMjLJ9WzBn/w4NDEggL3p5bDiqN9PK1Mx
         eX6w==
X-Gm-Message-State: AOJu0Ywiyrrbq9bIVtk+/TTjPTSZiw6v6xTzl/rtqydQoa8nSqkpC0c3
	E0OBGanLG2bJvnloj3spFd4dchc0MlVLXrdN4nasvAJvImdzKOvXG4ptBIwvywIBaC66u8KFJY4
	OpW/j9XwLvWRDVAhz2XV2o5ZxfBPRcHuYAMtMEnTMN/yzv6dvJVrqlDbu0/pYf2gQrDyb8BjDNZ
	G7b2UBuj9+tBW9Ocvx7xU=
X-Gm-Gg: ATEYQzyHx+J9YkAwga6TX3dSxA63ez7NGtt76YI1Ejqa/D6H6RRxVgE6H43fjmChEj/
	Jn//i+fc/OnsLCt3hsTHPIpckWLRwSxglR+izpDw2WXwehbH4mEcraKMvs7yRxlhkBequysl8Mu
	HX0bFZX3HvEVKaxvuKCtp/lzmT1pEsa/GxckuAB5KnB7r5FeE2I3eC+Gw3Dp6Xf+DZWOthV6nqw
	FMPi9akpdZegcTCHTT/6dsT6n7wlrRQJmoAvEHwoMtMaMsrA+sxaiE9TG6+rEnPHi8GswP65Elo
	f3Pai+sj92u5NKcn8WNu3snn0VB/X3WDA86tevMIaJnLFLRTDXBYcvSuJdMiLEYjNJOkhf0I1ED
	tpPcNZCuaL/XJvVVojh+N1c3QyN7kGfSR3AipSmjLPLWtERadNZzMrIEVfOx7YBwRXWkTB+3+2j
	rE4hmv
X-Received: by 2002:a05:6a00:2d94:b0:81f:9938:b07d with SMTP id d2e1a72fcca58-829728f04ebmr829307b3a.7.1772602713464;
        Tue, 03 Mar 2026 21:38:33 -0800 (PST)
X-Received: by 2002:a05:6a00:2d94:b0:81f:9938:b07d with SMTP id d2e1a72fcca58-829728f04ebmr829297b3a.7.1772602713038;
        Tue, 03 Mar 2026 21:38:33 -0800 (PST)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829751f3867sm408801b3a.55.2026.03.03.21.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:38:32 -0800 (PST)
From: "Miaoqing Pan" <miaoqing.pan@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com, dmitry.baryshkov@oss.qualcomm.com,
        skandigraun@gmail.com, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [meta-networking][PATCH v2] wowlan-udev: add udev rule to enable WoWLAN magic-packet
Date: Wed,  4 Mar 2026 13:38:10 +0800
Message-Id: <20260304053810.1001453-1-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA0NCBTYWx0ZWRfXzvEhc3BMbWZV
 ZSe7vu6JEUdT7I9mLfAli7a4xQx8IyYHYH0r2T2sSaE/1c896w11J7w49Oz+S3KsuyuBZ3NFZ9k
 Jn6XB3QKKfPApu0wkPwp+6ZCVLDneD9YlfZdXnG3HAjyG/zocJslBKdxn1PINWkgRTrCX1B/5SZ
 5PM+WcqksiN5LxwxWKBO7l+FkuHyL8/8bjL6EXxBaCBP7/k+OwznEmjYZJ1gcWxR/zpoqFu5Y3s
 u9pd6cDTFbeBZnJ+cCHChrMYpUozGVP8sSiMMx68ev/m1guk525/wWeRpn/UXK82p0aOTXccpWS
 QhYxpnvHGf6cnOycNVpFCSB3ySIsPhIXYi9H65vHq/synFgMKjbXVWDRCJnTs+e7emRdUw7bBbG
 mVuKSAZu2xTI5yWrqM+Oqca8vujC2D41E+9JuSk1V6Qm5fYIlN1JL+bvxPkU/W8zewQGQ3L/OG6
 2n/Jn1OgxHEuNxVo4vQ==
X-Proofpoint-ORIG-GUID: 6a2YOseh9DVzRYp3eoPEHXCavg4F_gSZ
X-Authority-Analysis: v=2.4 cv=S+HUAYsP c=1 sm=1 tr=0 ts=69a7c55a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=T8Rb3LcDPC92mQh966MA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 6a2YOseh9DVzRYp3eoPEHXCavg4F_gSZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040044
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 07:07:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124839

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
v2: update LICENSE file and set INHIBIT_DEFAULT_DEPS.
---
 .../wowlan-udev/files/99-wowlan.rules              |  4 ++++
 .../wowlan-udev/wowlan-udev.bb                     | 14 ++++++++++++++
 2 files changed, 18 insertions(+)
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
index 0000000000..857bbc3f95
--- /dev/null
+++ b/meta-networking/recipes-connectivity/wowlan-udev/wowlan-udev.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Enable WoWLAN via udev on Wi-Fi PHY registration"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+SRC_URI = "file://99-wowlan.rules"
+
+do_install() {
+    install -d ${D}${sysconfdir}/udev/rules.d
+    install -m 0644 ${UNPACKDIR}/99-wowlan.rules \
+        ${D}${sysconfdir}/udev/rules.d/
+}
+
+INHIBIT_DEFAULT_DEPS = "1"
+RDEPENDS:${PN} = "iw udev"
-- 
2.34.1


