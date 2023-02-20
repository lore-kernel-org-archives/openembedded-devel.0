Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6BAC05027
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 07:40:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.8086.1676878842980096598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Feb 2023 23:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GT6USIz/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676878845; i=@fujitsu.com;
	bh=6eaORY1UY3M0uz8ZJltjkrn7pOyBUeduvvtau9zPanQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GT6USIz/u1pVDDd7owuHvbLQmqEsG/1OgQEpgKvRRov2y7gHtLI0h3bhHsPWjlHeJ
	 1QinL3MfTZwXcJgru4x9FQU/UxzMxoV+OOiIHHuYIDzkXuitLszoHjNcPeBY9souop
	 8XiAT3Ylw5cIn5aDBBpQnMP7sp0Gsk8OzbCnv2b7rAXDBImmadEF2iPf2mv4eUKIsa
	 50gAJaKeLkCYL/PbGso9G4pr2rbvoDofnejvpSeQSGGwH35M2Hc85f7tIj4elLU3u3
	 EjSsJPjsHBO5RhYpOQ3qbmlNOcMItRLVQP4oIzcy5h5Er+znYRsmSg4EsQK+BPBFe/
	 Wkc42oMJ2jjAw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfeP8ud
  kg54eTYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWCtWCLVwVs94sY2xgPMLZxcjJISTwgFHi
  2S+dLkYuIPsqk8ThB/9ZIZy9jBKHPzeyg1SxCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPW
  I2wgJvE7DU3WUBsFgFViYcdT1lBbF4BJ4l1m+aA2RICChJTHr4H6+UUcJY4PGkpO8QVThIt7+
  6yQdQLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3SNdRLKspMzyjJTczM0Uus0k3USy3VzcsvKskASiWWF+ulFhfrFVfmJuek6OWl
  lmxiBIZuSnHi7R2My3v/6h1ilORgUhLl3ST8OVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBG+VI
  lBOsCg1PbUiLTMHGEcwaQkOHiURXmlpoDRvcUFibnFmOkTqFKOilDivAjD6hARAEhmleXBtsN
  i9xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9zjIdp7MvBK46a+AFjMBLXb/8QFkcUkiQkq
  qgWnSIhvWHyKsKXNWfEv99X6qfW0KX23iv/dewqoTF5xh+7JcvnxLq9OBtIVV8dviL8a8/TmJ
  9ynHh23pwjrLNyfKH+L7vS/U3MD+6yf15yw67zcqce4WC2sz2X5J6dJFjam7uRx2NfDufpe37
  OqVReLXJzI8X+V0Wa1xUv7EkxttXJp0Jn+eZPLg2aw4v33mWx5UOiY/Ub9SJyuvxfezocqrT4
  i3wmDtw2PzhK5KNstIlxyfabH4tkMsA9+hzxv6H568q6L1eDb7uqlHZTvz+n+fUH0Ys4S1q9S
  1iC9wa4lx99eI49ce7l8XezDvuMjbh/Xr5NXPMLMobebKP/ZkYs2y7XtCmd8u+L/7I8vM1q+6
  SizFGYmGWsxFxYkAYREBGVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1676878844!162375!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4939 invoked from network); 20 Feb 2023 07:40:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Feb 2023 07:40:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1FC697B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:44 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 14067154
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 20 Feb 2023 07:40:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] poppler-data: upgrade 0.4.11 -> 0.4.12
Date: Mon, 20 Feb 2023 15:40:21 +0800
Message-ID: <1676878821-15492-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
References: <1676878821-15492-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 07:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101159

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler-data_0.4.11.bb => poppler-data_0.4.12.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.11.bb => poppler-data_0.4.12.bb} (94%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
similarity index 94%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
index b0c0869a0..eed21ad54 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.11.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.12.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
            ${CMAP_RESOURCES_BASE}/Identity-H;name=idh \
            ${CMAP_RESOURCES_BASE}/Identity-V;name=idv"
 
-SRC_URI[sha256sum] = "2cec05cd1bb03af98a8b06a1e22f6e6e1a65b1e2f3816cb3069bb0874825f08c"
+SRC_URI[sha256sum] = "c835b640a40ce357e1b83666aabd95edffa24ddddd49b8daff63adb851cdab74"
 SRC_URI[idh.md5sum] = "009c93cf0141ab7bd6acb7eea14306cc"
 SRC_URI[idh.sha256sum] = "ae702c203a82ea124e9b96590f821db6fbf8754e2c4547a9dba0e82f94739e95"
 SRC_URI[idv.md5sum] = "2f32a45d43d001c26eeac6b878855fbf"
-- 
2.34.1


