Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D746C77B70
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:48:31 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.49150.1681717709671811370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MPnaoobA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717707; i=@fujitsu.com;
	bh=Y5LUYsMRaJrvgtLEwLfW/N7iylEAmbFjNBrJv4ukulQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MPnaoobAgKjMxjaAMF2QY1DimlzKQ4RAzkSUHsBtfMrcosZrEYlH0hMt9Sj1kwCxe
	 +TXFC6NNVqaHDuzL4HJIWWF42YG1ikdscrEOmbl75YWmtdKXYaWc7bMqnRRFafwOyh
	 4VAmeN771aASg1gBiqtVO0Ck1CZlvIFn2PyJvxN3PBVowlWRDTthrQE9j53OAkdGJc
	 2vGbG9qLk4MS8/vquQbkGWJa/JpQi5ik03veoUxzPBK+6SinGfkTMr2SbnFovgp20m
	 GP+K+MLuYw9TRIaHmEQ02xcS4EYnFDQ5bmJpdlt+LXKd5XvIXbSJby0Q+TZiAANgm0
	 hfkgwCr4eqidQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWff0T5s
  UgxO7JC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozJXcvYCs7zVzR+n87YwDibt4uRk0NI4CGj
  xJTTJl2MXED2VSaJqUd/M0E4exklXh5cwwpSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  exdjBwcwgKOEtM/BYGEWQRUJZZf7GEEsXkFnCTWfrwMNkZCQEFiysP3YK2cAs4Si199Z4Q4wk
  niw/SN7BD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjNilOLylKLdA3N9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzelWPnIDsYdfX/1DjFKcjApifK+SLVOEeJLyk+pzEgszogvKs1JLT7EKMPBo
  STBe/6bTYqQYFFqempFWmYOMI5g0hIcPEoivMbPgNK8xQWJucWZ6RCpU4yKUuK8/t+BEgIgiY
  zSPLg2WOxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMO+kH0BSezLwSuOmvgBYzAS2WUwJ
  bXJKIkJJqYKpl/6i01Nzoje1EY/6bukc1drjEi9sW3ee+JDsj3NZoQlTUhG49ztKFn49v2LFt
  W8LJxoMFlZ4ZbCx+j8ue6onoBxzPCzRyWNysYiA2MWH6iqhXh362Sgnu+axx1q/yXP/H+t8LF
  V7wc2v1r4qRjD3eY/EwJ/jN/NTPgmqB+/N3rJIuWD9BfvUNuwZ+vYlTW+wWWrhbltqbbgtSCn
  xh/ECJfdqTqP+yc/3Pyl9PP97wdCPHMqfKBYt5lihy3p5yNHfamUVPrLbf8Dfzr/xxv9fkyJZ
  3M6O2vv46RUVN3rf5bVHoTtc6qVz39Bdixqc8Sq8y7109idHivNcVnYPbOkvjpM/m8sw1lvZz
  i6h5p8RSnJFoqMVcVJwIAAD4IeZYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1681717707!406206!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25492 invoked from network); 17 Apr 2023 07:48:27 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:48:27 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 247E6153
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:27 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 186AC142
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:48:25 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] remmina: upgrade 1.4.29 -> 1.4.30
Date: Mon, 17 Apr 2023 15:47:43 +0800
Message-ID: <1681717665-19231-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
References: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102119

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Update snap build to use freerdp 2.9.0
    Add text mime type formats to RDP clibpoard
    Ensure timer is null after destruction
    Ability to view passwords in the clear using a toggle in the password field
    Made icons viewable in lower resulution.
    Improve mime file
    [REM-2809] Appearance preferences now refresh in the main window when the user...
    This should be a message instead of a info print. So that the user can see it by default.
    remmina_rdp_monitor_get(): fix maxw, maxh and monitorids calculation
    Fix undefined symbol error when importing gi in a python extension
    make it build on macOS
    Fix autostart file flatpak exec command
    [REM-1987] allow for dynamic resolution updates for vnc connections
    Fix overlapping text in preferences menu, terminal tab
    Allow could not authenticate banner to go away after successful reauthentication
    Add environments for easy manual testing

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../remmina/{remmina_1.4.29.bb => remmina_1.4.30.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/remmina/{remmina_1.4.29.bb => remmina_1.4.30.bb} (96%)

diff --git a/meta-oe/recipes-support/remmina/remmina_1.4.29.bb b/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
similarity index 96%
rename from meta-oe/recipes-support/remmina/remmina_1.4.29.bb
rename to meta-oe/recipes-support/remmina/remmina_1.4.30.bb
index a92a3b278..c22eaf1d3 100644
--- a/meta-oe/recipes-support/remmina/remmina_1.4.29.bb
+++ b/meta-oe/recipes-support/remmina/remmina_1.4.30.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 DEPENDS:append:libc-musl = " libexecinfo"
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
-SRCREV = "fb19eb5f11f206ffb442a9e0c519cb0f2cb3fd8b"
+SRCREV = "61ea9b6681104cadf0a3f8c25bd3e5685ee6691a"
 SRC_URI = "git://gitlab.com/Remmina/Remmina;protocol=https;branch=master"
 S = "${WORKDIR}/git"
 
-- 
2.34.1


