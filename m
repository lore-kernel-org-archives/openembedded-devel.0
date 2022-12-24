Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BF2C4332F
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.106128.1671917650095192560
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZRewwhtR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLUKT2006112;
	Sat, 24 Dec 2022 13:34:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=ztlMMs1uJkNa15gF1QtgHt5Csc+YyxUmeoLDMXh5PPk=;
 b=ZRewwhtR0VkzwxAkNawM0+niWvULmhSr7kfUGjLaW78uqeZpzGdtSOVYvmc/gJ3QTo0l
 oztBRFTEL7TWHtGRf0ciMFPM5aVzXfIBG6RMQ7DCPcGIWpZIR10U9ljmGV+dMXMgpJrh
 TpyggslTN7EKRh5EsfzKYk6R9umoUvF6xtDHKyW9HmbIan24NURXeOoQqPXKiXyxdcUj
 cq0y8mtNZZOh0+zzymGE8Wa5D6rALZtpHnolx1eHbeZXCSmQJq0hvzAkRuht828OiMdp
 Zbq5PbDNW3t5LRrCvR9rPg0qv23Z9AcAM88d+/xVYfm9tJs/wNv9Vkj+p6Lq7zoyGv2/ GQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:09 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:09 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:08 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 13/16] xfce4-session: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:44 +0800
Message-ID: <20221224213347.39959-14-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: AHO5diZq8EI64gsG1-xlTzGbXh3w2hbE
X-Proofpoint-ORIG-GUID: AHO5diZq8EI64gsG1-xlTzGbXh3w2hbE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=900 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=1 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100221

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-session from 4.16.0 to 4.18.0

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...xfce4-session_4.16.0.bb => xfce4-session_4.18.0.bb} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.16.0.bb => xfce4-session_4.18.0.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.0.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.0.bb
index e6613b8ee..25d30cebe 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.0.bb
@@ -1,20 +1,20 @@
 SUMMARY = "xfce4-session is a session manager for Xfce 4 Desktop Environment"
 SECTION = "x11"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
 
 inherit xfce update-alternatives features_check
 
+SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
+SRC_URI[sha256sum] = "38badb500b272012f494543a60a9c0563c381647cc95bed73b68aec0b0b89a7f"
+
 REQUIRED_DISTRO_FEATURES = "x11"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}"
 PACKAGECONFIG[polkit] = "--enable-polkit, --disable-polkit, polkit"
 
-SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] = "22f273f212481d71e0b5618c62710cd85f69aea74f5ea5c0093f7918b07d17b7"
-
 ALTERNATIVE:${PN} = "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] = "${bindir}/xfce4-session"
 ALTERNATIVE_PRIORITY_${PN} = "150"
-- 
2.17.1


