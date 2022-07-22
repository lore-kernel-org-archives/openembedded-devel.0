Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B3BC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:09:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.3489.1658455757853100510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gD/HhRt6;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455756; i=@fujitsu.com;
	bh=hi2qHS5GSLQKsPPYCM/mrAEUU8d6OZgslX5t1Zg9ANc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gD/HhRt6aXnX83LoaIfmgQQoSbqAxyEKof9r1ywL8dCG3QbZ/I5A4GHbCEH+sXevc
	 XIFJfTYPKtsNGoXAnVos4b05MeZQZrgaKB0zCUarKgh+Nr8u/vycbj9thP8oquWtg5
	 fSo9XrhMH/qKHjk3QWBkiDUEqJT/jjLTEsjOeIGgaTA8NhduAfspkmamSPndo8y3Zb
	 +REfOI8m9Clm/ZMY/zMNa5YRW/ptTrc8e3audfQd6T0L18QGNF8CMFtU0HNNcVIER7
	 lWm6pLS61zLBZ6/P4dghnIl8D1A9ehLFyv8n288JiECExzEN97zFHmIG1FCv4ED70d
	 Z4uO1Zi5XTYBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqHua7Va
  Swa8jEhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPA0uZCu5xVLz/fY69gbGbo4uRi0NI4Amj
  xNS/v5i7GDmBnOtMEr07eSESexgl9nW/ZQJJsAmoSUy/dYMVxBYR0JdYOnsPWAOzgIrEi9897
  CC2sICPxPbr99hAbBYBVYmT12YCxTk4eAWcJA42xIOEJQQUJKY8fA/WyisgKHFy5hMWiDESEg
  dfvGCGqFGUmH25mQXCrpCYMWMbG4StJnH13CbmCYz8s5C0z0LSvoCRaRWjdVJRZnpGSW5iZo6
  uoYGBrqGhqa6xsa6huaVeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYU
  K27ewThx5U+9Q4ySHExKorz7Jt1MEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe4X5VpKQYFFqe
  mpFWmYOMEJg0hIcPEoivBZfgFp5iwsSc4sz0yFSpxgtOabO/refmWM5mJz5te0AsxBLXn5eqp
  Q4rzor0DwBkIaM0jy4cbAovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLeNBWgKT2ZeCdz
  WV0AHMQEdZG5+A+SgkkSElFQDU/X+DY+DlJ33uzzzSeZ6KNYo9clr3oK9j08Gf9JQeFQ70WwG
  p/+86H6jNLsvco+PJ9TVH1hwP5fPZ3PfWo/nBXMWFp/9tnhmp7VL2RmLTB9t695GFYMbiTbfP
  6l6br52NexIrbSmR9CKs6/4t8nOf3Pz0ZLH/teal908lmxhvWxlUEn80vaCM8/CnnHUyfrZPM
  iqzux+kOy2fKVzksXJl68yH07LCrv/ND0xY6Lhwrcaiq6u8ubaKezq6gxRJZbONWq1bcsCf95
  6dWr9DqVPdlx/bnzczdbxeq3Idjl1ljq3ly+2KiVtMJkv+6G0w0hXem/HSjdh18N3Oq2ebDfd
  nr9FW/cm767S3m7FukwPJZbijERDLeai4kQALU/k7F0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-548.messagelabs.com!1658455755!57630!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2943 invoked from network); 22 Jul 2022 02:09:15 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:09:15 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1F822100191
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 13ABE100043
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:09:13 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lru-dict: upgrade 1.1.7 -> 1.1.8
Date: Fri, 22 Jul 2022 10:08:53 +0800
Message-ID: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:09:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97936

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-lru-dict_1.1.7.bb => python3-lru-dict_1.1.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lru-dict_1.1.7.bb => python3-lru-dict_1.1.8.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb b/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb
rename to meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
index 0a0682e0c2..b870bc0889 100644
--- a/meta-python/recipes-devtools/python/python3-lru-dict_1.1.7.bb
+++ b/meta-python/recipes-devtools/python/python3-lru-dict_1.1.8.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9d10a486ee04034fdef5162fd791f153"
 
-SRC_URI[sha256sum] = "45b81f67d75341d4433abade799a47e9c42a9e22a118531dcb5e549864032d7c"
+SRC_URI[sha256sum] = "878bc8ef4073e5cfb953dfc1cf4585db41e8b814c0106abde34d00ee0d0b3115"
 
 inherit pypi setuptools3
-- 
2.25.1


