Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2F5C4167B
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:47:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5079.1668070026826628966
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kKZHfTkI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA8ISvR024773
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=AAZTo2m82iJHJgh3lbSJsQrkArtbZnpnJL+1Ne2yhlE=;
 b=kKZHfTkImMNBFOcq+JgFeYVujZJI/UhyNjViYA3jqSZvUpKCze4EAMMAnfLqXkitfcfk
 WZsy3FxEckpf4eldVsJQHUmD7o4dS1Bag27pzNn8RGk5qim+oRtXg3R/P0M7Fgq5N7t8
 ZZqxKUSu2uJDyJ12pEqeAREGnUoFuG0IYm5ZUDlRZ6kdCvdYV9Tp98m7aN9l7Q7R9b7I
 vF0z18h756AR9zpGbXQ9t/cgFPOxBoY3osmVxd9RmtvL1wvDkM0Ykt0Ni9Zp7wzSL6Sl
 jvPbJ6aXIdPsnMkj7Z/Rs4pllyQYFN15LKclNrU9sDuOK93Uh2DK0YeFfm7AwtEtoQyg Uw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfvs-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:06 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 10 Nov 2022 00:47:05 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:47:04 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 08/14] libxfce4ui: check opengl DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:46:49 +0800
Message-ID: <20221110084655.1714051-8-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110084655.1714051-1-mingli.yu@windriver.com>
References: <20221110084655.1714051-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OkuDUAsxhB6LxZJ-OAuH2TFjcuDK5Wd0
X-Proofpoint-ORIG-GUID: OkuDUAsxhB6LxZJ-OAuH2TFjcuDK5Wd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=889 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99539

From: Mingli Yu <mingli.yu@windriver.com>

Check opengl DISTRO_FEATURES to determine enable x11 in PACKAGECONFIG
or not as it make libxfce4ui depend on libepoxy when x11 enabled in
PACKAGECONFIG part.

Fixes:
  ERROR: Nothing PROVIDES 'libepoxy' (but /build/layers/meta-openembedded/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb DEPENDS on or otherwise requires it)
  libepoxy was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'xfce4-calculator-plugin', 'libxfce4ui', 'libepoxy']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
index bb45ee6f4..692c79f3c 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 EXTRA_OECONF += "--disable-vala"
 
 PACKAGECONFIG ??= " \
-       ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+       ${@bb.utils.contains('DISTRO_FEATURES', 'opengl','x11', "", d)} \
 "
 PACKAGECONFIG[gladeui2] = "--enable-gladeui2,--disable-gladeui2,glade"
 PACKAGECONFIG[x11] = "--enable-startup-notification,--disable-startup-notification,libepoxy libice libsm startup-notification"
-- 
2.25.1


