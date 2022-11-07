Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C612C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:32:00 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web09.1236.1667809915437078980
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:31:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=DONDg1mK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667809918; i=@fujitsu.com;
	bh=EvXEEXkrdSJNyRTasYrGeuNGiFTpCvU8GoHcdYhi+Oo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=DONDg1mKO9IClt0qJckWII5eQEf4Pgdw3TtpJp2Ms6PO02vQQBQYOwhPRll3tlVv3
	 1M7Z2Z7xk3jtUIyvh3hqnHaW9NzVxGdM7Il73hzsujrMa4xEHm71HUlMF5L47UyY/E
	 Wt8G+LAsNciq65DqUOlJXM5T0MFbv6Q25s9JIXgCIOmI0c+/xTE+gJEufQAwRHBS36
	 8iKasbNLIKMHCuupHVt9Wx9xp61JRGAKqHot9Al/L6FJWHVOXSh8kJWk30kDPpVA/4
	 wzu41uOUauG1GRhrnYvZv3MGnO4W6IJdw+YEl5iKKHLtg1QMHvpth+1zor98hz/Gd4
	 z35W1GjrHGpPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSbfuUEa
  ywafNIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8birdOZCy5wV1w+Ope9gXE5VxcjF4eQwBNG
  ic5DnUwQznUmiW0TOhkhnN2MElv/LmXvYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  rAaYQFXiXv/3rB0MXJwsADFn8ytBwnzCjhJbJ9+lRHElhBQkJjy8D1YK6eAs8TCRbvA4kJANS
  83v2ODqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka6yXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYvCnF6et3ML5b+kfvEKMkB5OSKO/v5RnJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR4b2wEygkWpaanVqRl5gAjCSYtwcGjJMIbtg8ozVtckJhbnJkOkTrFaMkxdfa//cwcy8HkzK
  9tB5iFWPLy81KlxHmv7QZqEABpyCjNgxsHi/ZLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR
  5mfcATeHJzCuB2/oK6CAmoIOqC9JADipJREhJNTAdbXuVOG0TB5/nHiX+hNuvliy3X3Pzm3Hg
  ZeGym5/lHHt6K8yDOvn7SzsY933p/By6xM9xw6GJJ5c4HZjrVx/Xec/mTmurwINvnmfN5EuWW
  hlE3P650ujli/uKSur7jTiNz7CX3RQ/ER3o4sUw5/yL3CXu39dl6802LXuxMOsFU8S1TYxCG3
  bJS4SIlDaeDVMRn+rMUP/O4UFHsvLpD+ybXtkdX1ak75i655F4Uqyuy8o8Hrn09Wnz3n6aEmp
  U8fPuhH37N2ZZ/nqS6SJl+OO0+b6wT8v4Pd0+PO153XB059UP8euXfOQ5+5d5bfVDvnmGJT/T
  TN/tFw4J8mhceqlK8smujKOl0mccLAoX7ilVYinOSDTUYi4qTgQAAWh/vXEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1667809918!245371!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31992 invoked from network); 7 Nov 2022 08:31:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:31:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CBDD01000D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BFB161000D2
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:31:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:31:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] stunnel: upgrade 5.66 -> 5.67
Date: Mon, 7 Nov 2022 16:31:31 +0800
Message-ID: <1667809891-30889-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
References: <1667809891-30889-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99456

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Security bugfixes
-----------------
OpenSSL DLLs updated to version 3.0.7.

New features
------------
Provided a logging callback to custom engines.

Bugfixes
---------
OpenSSL DLLs updated to version 3.0.6.
Fixed "make cert" with OpenSSL older than 3.0.
Fixed the code and the documentation to use concious language for SNI servers (thx to Clemens Lang).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../stunnel/{stunnel_5.66.bb => stunnel_5.67.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/stunnel/{stunnel_5.66.bb => stunnel_5.67.bb} (93%)

diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.66.bb b/meta-networking/recipes-support/stunnel/stunnel_5.67.bb
similarity index 93%
rename from meta-networking/recipes-support/stunnel/stunnel_5.66.bb
rename to meta-networking/recipes-support/stunnel/stunnel_5.67.bb
index 17c8c5360..db535e735 100644
--- a/meta-networking/recipes-support/stunnel/stunnel_5.66.bb
+++ b/meta-networking/recipes-support/stunnel/stunnel_5.67.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://stunnel.org/archive/5.x/${BP}.tar.gz \
            file://fix-openssl-no-des.patch \
 "
 
-SRC_URI[sha256sum] = "558178704d1aa5f6883aac6cc5d6bbf2a5714c8a0d2e91da0392468cee9f579c"
+SRC_URI[sha256sum] = "3086939ee6407516c59b0ba3fbf555338f9d52f459bcab6337c0f00e91ea8456"
 
 inherit autotools bash-completion pkgconfig
 
-- 
2.25.1


