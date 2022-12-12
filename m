Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830F4C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:35:08 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.37696.1670830507261093203
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:35:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V4Qej8Sf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830505; i=@fujitsu.com;
	bh=5clif1LDV63TdqW5jlfzDkZC1JLvJXO2NIcrBWztywQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=V4Qej8SfUsXeJ/LNiVHXwScHf4llq65PeRdqguJuitw8zBf0Fo+aRx1JXOzCOQz79
	 VnHGWXj9+/Vi11pe4phOJZIP9L4ukJWS7Nl5mCZ1AL6FQk0ofrYjRshg348EKvzo5Q
	 4PNK6LzNM2sPiKax5+0B0kG+IWpgrkBURkfFhEFUz0gqVkvL33m6PukgoY8LCZzb3H
	 hQnvqI6ORP9SZh9FAm3xDQRv1v9+UYYf8uhZ4OJxiWuTftMs+QVDZJk38lUSX9aWTd
	 THzaHT3A3z9jc0j0JKlNjcs8+gl7FJuUl1LODttQZ6RogGouhX3ZY6b92I5e0ic2dU
	 wopXbpvPL34Fw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWXflzWn
  JBnuWC1lcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBldU0+wFBzkqpi04D17A+Mazi5GLg4hgYeM
  EvuX9zB3MXICOVeYJCbvsodI7GGUaPhzlgUkwSYgJXHj/n82EFtEQF9i6ew9YA3MAioSL373s
  IPYwgKuEieXLgKzWQRUJSZcPwdWzyvgKHGr/QhYvYSAgsSUh+/BbE4BJ4kt3SvZIRY7Sty5tp
  EFol5Q4uTMJywQ8yUkDr54AdWrKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6AkWk
  Vo1lxalFZapGuoYleUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5e
  askmRmDwphSrtO9g/LTsj94hRkkOJiVR3sor05KF+JLyUyozEosz4otKc1KLDzHKcHAoSfBuu
  AaUEyxKTU+tSMvMAUYSTFqCg0dJhNcNpJW3uCAxtzgzHSJ1ilFRSpyX/QZQQgAkkVGaB9cGi9
  5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5ba4DTeHJzCuBm/4KaDET0OKol1NBFpckIqS
  kGphYd1xY2Ly+NNLp1sW5RQWL5sbprsxbsrX+VzHrw1qG9/Od7XSzLyulcLgtTXSv/F6y5VJ4
  xAfNN07fRHOV5/5r3f9rwnKnRUX3ueyuLzawO/pjQUVIMUvI/vSuw9dcne0kzDMq4mb81rj9U
  aDxZ9TFG20H6k95vf/ksfQFl805//UT++V9/3wSVlRane5g+rxnFpe4R8z/gBsLz31bLHY9Vf
  Juzg1vswAzvTDfRW7KmQ0343p2bPmt6qm6JWCd+UOtVFFlT/HdIsk3+y0D5guzmAh4veGTlN4
  YlBPbtm/jCb/irTZBKxf2x/cLnn+jzTVD8Uu+8uGCcwurDtxZk3f5ouleGfcz0nPkbwm08imx
  FGckGmoxFxUnAgDqDUQuWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1670830505!284117!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8590 invoked from network); 12 Dec 2022 07:35:05 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:35:05 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0801F153
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id ED6A0142
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:35:03 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] dnsmasq: upgrade 2.87 -> 2.88
Date: Mon, 12 Dec 2022 15:34:28 +0800
Message-ID: <1670830471-3000-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
References: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fix bug in --dynamic-host when an interface has /16 IPv4
 address.

 Add --fast-dns-retry option.

 Add --use-stale-cache option.

 Make --hostsdir (but NOT --dhcp-hostsdir and --dhcp-optsdir)
 handle removal of whole files or entries within files.

 Add --no-round-robin option.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnsmasq/{dnsmasq_2.87.bb => dnsmasq_2.88.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/dnsmasq/{dnsmasq_2.87.bb => dnsmasq_2.88.bb} (37%)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
similarity index 37%
rename from meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
rename to meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
index 793b61d71..52ee9aa96 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.87.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.88.bb
@@ -1,6 +1,6 @@
 require dnsmasq.inc
 
-SRC_URI[dnsmasq-2.87.sha256sum] = "ae39bffde9c37e4d64849b528afeb060be6bad6d1044a3bd94a49fce41357284"
+SRC_URI[dnsmasq-2.88.sha256sum] = "da9d26aa3f3fc15f3b58b94edbb9ddf744cbce487194ea480bd8e7381b3ca028"
 SRC_URI += "\
     file://lua.patch \
 "
-- 
2.25.1


