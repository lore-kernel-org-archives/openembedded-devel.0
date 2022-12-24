Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62D5C3DA7A
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 21:34:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.106414.1671917652081934118
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Dec 2022 13:34:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qPvg5IsU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=93571bb386=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BOLUrtN006737
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=VOvgmQPVyIFb+TKkVnKDRpOtRMNpTt6oaJNT45Cm404=;
 b=qPvg5IsU5T7M0q+kEVwFOkZCzRraBFUtow4uc9nd4VejBTV81Gc1a5B2vz5cKRIQYhge
 GAJpSPis7fQYpUFW/KHzj7KkOZlRRAxRLHWXEkkz41y/GpgsMrk3AiVHj3I9+qwevw9B
 lhHgt4gwaf1aaDxCPVIKkBWEVBZSpaSKB86ed50S6ZYN7Jhlp734F46mhUKALXcobbhM
 pceq7gfXmp2LaXQFXS0ixUW25m/iKfhZ0xUyikUjqPLb4IJUXQSkzP/1fMXxaizEhmUn
 yj53bwHpAPQj6qZARL2UOnHzXS8fDGN0GPSjwWRjltT+lu/KZpQhTmsCJXOpo6qoqQ0D /w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:11 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BOLYBFj013021
	for <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 13:34:11 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnwk889rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 24 Dec 2022 13:34:11 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sat, 24 Dec 2022 13:34:11 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Sat, 24 Dec 2022 13:34:10 -0800
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 15/16] xfdesktop: 4.16.0 -> 4.18.0
Date: Sun, 25 Dec 2022 05:33:46 +0800
Message-ID: <20221224213347.39959-16-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221224213347.39959-1-kai.kang@windriver.com>
References: <20221224213347.39959-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: bstNYb_PkLLUbN_oTOYkWRILNwk-oi2w
X-Proofpoint-ORIG-GUID: avh6e13tXQO4gsU711vgWhxt5ZJjYDpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-24_10,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=922 suspectscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212240188
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Dec 2022 21:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100222

From: Kai Kang <kai.kang@windriver.com>

Update xfdesktop from 4.16.0 to 4.18.0

* update license with GPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.18.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfdesktop/{xfdesktop_4.16.0.bb => xfdesktop_4.18.0.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.0.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
rename to meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.0.bb
index 4a1ece8be..6895b7912 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.18.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "libxfce4ui libwnck thunar garcon exo"
 
@@ -8,7 +8,7 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "934ba5affecff21e62d9fac1dd50c50cd94b3a807fefa5f5bff59f3d6f155bae"
+SRC_URI[sha256sum] = "661783e7e6605459926d80bca46d25ce2197c221456457a863ea9d0252120d14"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.17.1


