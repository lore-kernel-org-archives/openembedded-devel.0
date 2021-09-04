Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web08.17372.1630894344369405078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Sep 2021 19:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qx4qrBKV;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630894336; i=@fujitsu.com;
	bh=dEgxRLlaY75MU4QhLDBmlBq/eBT10YSoIKSr56ztQeY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qx4qrBKVO39BO4hOn5Y91Ah45jaVuKHQIrhxXENENmW2bQmpHIMucL3zmxU/4jy/E
	 T7CVq4nUz1CDTrUanid0cJ8PmlSmUoDXWw+fE1icI+7NX5Vq29tf8vEMjSgq3570oZ
	 HoajvtnrWccOP7Xf+xaXMrArqu1fbpKqd21aZssjy/CLW1smLbJLWy8xqE7sgAqlnX
	 /34rtJzS/vVPQRaonoKLlX9AjKE5yJluNxoK1KG8YQCVea6G3WiEZe+RkrpW0KOpiA
	 bIW7sF2xiYsLoS8hHr3db3KbefNuVWw1XpBIuUbUxNJ1592xvECnMbvIjP8+B26zQA
	 /t3Oj3FoX3fLg==
Received: from [100.112.194.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 9C/22-02979-FF875316; Mon, 06 Sep 2021 02:12:15 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYovu/wjT
  RYPYrVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNo+wq2gpkcFW9bbjA2MB5k72Lk4hASmMUk
  0X55OyuEs5tR4unjW0AZTg42AV2Jc4/XgtkiAvoSS2fvYQaxhQU8JVobvgE1cHCwCKhIPGmrA
  gnzCnhI3DvwnQnElhBQkJjy8D0zRFxQ4uTMJywgNrOAhMTBFy+YQVolBBQlZk+XhyivkHh9+B
  LzBEaeWUg6ZiHpWMDItIrRIqkoMz2jJDcxM0fX0MBA19DQSNfQ0kjXyMBEL7FKN1EvtVS3PLW
  4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwiFIKDpzZwXjq9Qe9Q4ySHExKorwadqaJQnxJ+SmVGYnF
  GfFFpTmpxYcYZTg4lCR4txUD5QSLUtNTK9Iyc4ABDZOW4OBREuG9UgaU5i0uSMwtzkyHSJ1iV
  JQS53UtB0oIgCQySvPg2mBRdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG8YyBSezLwSuO
  mvgBYzAS1ue2gCsrgkESEl1cC09trzqfnsU+MqrvB/v1Zx5rDwv18qm86InKpXvB+3ZHHc5rw
  9ehpNQqH5c4sv9Kx13TZhxvlHbpJCW3wCwndxlPUn5B6I+D0l6cq5HbUea7ZM8n/ONqfyXaK2
  lXOvxjp7H4PJp6Z/eP/H6FbJOrk9V0vnuf6SNjy/89Ybdbb76/RkpmVFq6W8/dO0RC3KS31ZU
  Y0Ro5eHpebNp6o3Wy4Jvvq3J2vjNuNy1t6g7xw/X2cub+/4e9jr79/Gra3fOpnS3kSv4Nny1K
  qf2y7sUukKbXHPF5rX/E7UMBS/3clvEnHL+NP0g1+meQksuc/3LiBPqNrGf+uWX92JlkGXmbi
  3rpivlWHc8jvsZvRCwXsvlFiKMxINtZiLihMBDJonFh0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-271.messagelabs.com!1630894335!227255!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16236 invoked from network); 6 Sep 2021 02:12:15 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-10.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 02:12:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1862CAY0012895
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 03:12:15 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 03:12:08 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] wireshark: upgrade 3.4.7 -> 3.4.8
Date: Sun, 5 Sep 2021 07:22:32 +0800
Message-ID: <1630797752-44177-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_3.4.7.bb => wireshark_3.4.8.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb b/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
index fc360f6691..faf2a3ad1f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.4.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.4.8.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "6c4cee51ef997cb9d9aaee84113525a5629157d3c743d7c4e320000de804a09d"
+SRC_URI[sha256sum] = "58a7fa8dfe2010a8c8b7dcf66438c653e6493d47eb936ba48ef49d4aa4dbd725"
 
 PE = "1"
 
-- 
2.25.1

