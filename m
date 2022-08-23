Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C69C3F6B0
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:40:10 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.29020.1661244005081653949
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:40:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZWqXJkbi;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661244003; i=@fujitsu.com;
	bh=e2Yf/V7NDqDyDO1gHBbU3gZLkEojAkbsVMNafFu8S+A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZWqXJkbiCRA/Dui9zp7BcAQTuiYzzC/ZZTlCovTWmzWRtsWKOip5/PEj7eZXAwysG
	 a4hBHl5u5WYUALqy8Oj4Wlg8Y8kqf1PpD9BzwKrdp18I0kFwMGRuyD5XVw14cV1syk
	 PLbgIHY4iqG5+CowlVpEuegUZOPRmkwlqTP0Zt5m2gXIPwqe91DYypqZZOgSvuL3BY
	 P9MoQ8WSrhQRWVAEk8MoaOQ6tFe9tf6KhDw4BK//nsYlYHlTuHYQOGqdJcG0ZvISSy
	 xYVVdK6aT4oMETuGvuKaKDVShVV/RZc14+BIJnRc+edBXpayruArqjeqEycjWNxE3D
	 qK2Je8/vuNB2w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8OxWTdpEku
  ywfW76hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bF558YC1ZwVKx+eYC1gfEsexcjF4eQwANG
  iYXz/7FBOFeYJNbOWwLl7GWU2LDkGGMXIycHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373A
  I3i4BAWcJO4O50JJMwioCqxtm0lE0iYV8BR4thsCZCwhICCxJSH78E6OQWcJL5dawezhYBK9n
  /ZwAZi8woISpyc+YQFYrqExMEXL5ghehUlZl9uZoGwKyX2zOpngrDVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0TSrKTM8oyU3MzNE1NDDQNTQ0BdLGQNpCL7FKN1EvtVQ3L7+oJEPXUC+xvFgvtbhY
  r7gyNzknRS8vtWQTIzCQU4rTy3YwXt33S+8QoyQHk5Ior0M9S7IQX1J+SmVGYnFGfFFpTmrxI
  UYZDg4lCV6PfqCcYFFqempFWmYOMKpg0hIcPEoivPoTgNK8xQWJucWZ6RCpU4yKUuK8eiAJAZ
  BERmkeXBsski8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuY9CLKdJzOvBG76K6DFTECLg3Y
  zgywuSURISTUwBe7OzbjItPHTv/q8T9zasw8sj7a7XnNZqF9t3ccHi5rjlcve3lz3Z1aJfj6P
  Ya/QO1W1/fvnxwmv1PDdsFzQ/R/rybcKH77zR1X7VCqrN15PsWObX+vw1P9WTd5et/KZk7/mT
  +vonyDwYsNG7bfzi7b4zWF4VHc5tunpl3MVC48n6/iu2zfR7WnFn42qyXIC2p3P9550+//qY+
  YjtbqV65P/nWDt/iAR8s1OkMW17+k748Mt9btz//q92uqwl1P+cedtJsWt27fcVmud/JR7W0S
  DgL4v97dfDFs4fXheFzD9b9hWbJIZfDKH59w9X8OYX3U8s/abek23lJepf8rQc/6Jh8AXUZ7u
  32W1/1h3K7EUZyQaajEXFScCAEorX7dfAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-728.messagelabs.com!1661244002!44346!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14948 invoked from network); 23 Aug 2022 08:40:02 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Aug 2022 08:40:02 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 11EEB7C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:40:02 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 05CF17B
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Aug 2022 09:40:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 23 Aug 2022 09:40:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libcurses-perl: upgrade 1.38 -> 1.41
Date: Tue, 23 Aug 2022 16:39:37 +0800
Message-ID: <1661243978-4657-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
References: <1661243978-4657-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Aug 2022 08:40:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98383

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcurses-perl_1.38.bb => libcurses-perl_1.41.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcurses/{libcurses-perl_1.38.bb => libcurses-perl_1.41.bb} (87%)

diff --git a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
similarity index 87%
rename from meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
rename to meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
index 8c56c206f7..6a6f012fd7 100644
--- a/meta-perl/recipes-perl/libcurses/libcurses-perl_1.38.bb
+++ b/meta-perl/recipes-perl/libcurses/libcurses-perl_1.41.bb
@@ -10,7 +10,7 @@ DEPENDS += "perl ncurses "
 
 SRC_URI = "http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "d521408298eb6413b209ef29d4ffcba6f5f58ee1abc60160739a17aafcb8f2f2"
+SRC_URI[sha256sum] = "fb9efea8c7b5ed5f8ea5dee49d35252accfc05ee6e75cb9a37ab7c847cd261d7"
 
 S = "${WORKDIR}/Curses-${PV}"
 
-- 
2.25.1


