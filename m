Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C32C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:25:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.111593.1669616755190666056
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sUgROqO9;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616753; i=@fujitsu.com;
	bh=3mxxChJCLsR2Qk0Pv3HtCt2fgUtGmct4O+YrUnEoryk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sUgROqO9VN2pQcwps+wZVbn+bHeJpon4R+g+ppqxkeM+LXJj88QNVJQs6SEkUdBC5
	 VM7BrmWYbMGHJ9J/Kud7hHuu0SH1gu5lvplvtRYMALwKPTQYTAJi/t73iOxLwib0Hn
	 fZt/zZaKue05zVHayKSGQGLxavxu7S9laxaHrcvFgfSxbN6KuYejbOma/tkz6a8ldS
	 otumAr77b3GzHKTaB5URnRdCjMO6CHm9slDYclGTJonNXv/g4eCe5xoEPjznUn8aFr
	 7oPBIhaK37duxQTqqCTadtrX/58sH6d3QOPz9hRCZ9D+6TkF4E2xDqvkX1IqooyTvw
	 4mY4d7z3Pnkig==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8MxSbcwpCX
  ZYBOPxcXDS5kdGD3ObVzBGMAYxZqZl5RfkcCa0doZVXCNr+Lmo8nsDYy7eboYuTiEBJ4wSrw6
  eZwZwrnOJPFzxnw2CGcPo8TH92/Zuxg5OdgEpCRu3P/PBmKLCOhLLJ29hxnEZhZQkXjxuwesR
  ljATqJl/Uswm0VAVWJO3wIwm1fASaLj3UsWEFtCQEFiysP3YL2cAs4SM07dZQWxhYBqtq1qYY
  WoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3Aw1p0Ji1qw2JghbTeLquU3MExgFZyFpn4WkfQEj0yp
  G0+LUorLUIl1DvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSS
  TYzAwE0pVj20g/HVkj96hxglOZiURHk/BrYkC/El5adUZiQWZ8QXleakFh9ilOHgUJLgnQuSE
  yxKTU+tSMvMAUYRTFqCg0dJhHexPVCat7ggMbc4Mx0idYrRkmPL/JN7mTmuXrkCJGd+bTvALM
  SSl5+XKiXOyxEM1CAA0pBRmgc3DhbplxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ8/IFAU3
  hycwrgdv6CuggJqCDNik2gRxUkoiQkmpgql6xUbrv/vLuuzW7ZIrs5jrb7tQJunh7WSqD+DJT
  x5tSC384HakJskiy4oz9wHSJY/uH8KvdNt6nj66u2zS3Jf2M785kvxjWaFbnZMaNIbfXX5LdM
  zv/DMfWN0YpHz5VeUbIaSW73VxffXiX5s1i8dhcy1Sp5r3h7faMpxifvdF8uSjyl16N2PEJX9
  rSN8vEK+eIbLXvrVzJ8tqAyWS9JEs4o+eXrD3qD0+cFzxjPDfMQsFww/K20tzodbsjWp/2cji
  2pzBJpD3t4otwCKo6tkZdiqOZJbptasbqqSc/zXTrdTu6zXhaV/asNWmXVNkn5FmLvJz7scJV
  1vHkh5C5bGHmr9LnK045Ebkt8qsSS3FGoqEWc1FxIgBGIKGlbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-548.messagelabs.com!1669616752!136904!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18953 invoked from network); 28 Nov 2022 06:25:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:25:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B33171000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A6A901000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:25:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] smarty: upgrade 4.2.1 -> 4.3.0
Date: Mon, 28 Nov 2022 14:25:20 +0800
Message-ID: <1669616722-13377-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
References: <1669616722-13377-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99818

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    clean output buffer for Throwable instead of just Exception 
    Fix wrong indentation in libs/plugins/modifier.capitalize.php 
    fix compilation for caching templates 
    Fix Variable Expression 
    Silence deprecation errors for strtime in PHP8.1 or higher 
    Fixed PHP8.1 deprecation errors passing null to parameter in trim 
    Re-organize all testrunners to use the same script(s). 
    Fixed PHP8.1 deprecation errors in strip_tags 
    #155 Adapt Smarty upper/lower functions to be codesafe (e.g. for Turkish locale) 
    Bug fix for underscore in template name 
    Using PHP functions as modifiers now triggers a deprecation notice. 
    Use 'DIR' instead of 'dirname(FILE)' 
    Fixed several typos and grammar errors 
    PHP8.2 compatibility 
    Make SmartyCompilerException play nicer with error handler libraries 
    Change file permissions for directories and respect umask for files 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/smarty/{smarty_4.2.1.bb => smarty_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/smarty/{smarty_4.2.1.bb => smarty_4.3.0.bb} (94%)

diff --git a/meta-oe/recipes-support/smarty/smarty_4.2.1.bb b/meta-oe/recipes-support/smarty/smarty_4.3.0.bb
similarity index 94%
rename from meta-oe/recipes-support/smarty/smarty_4.2.1.bb
rename to meta-oe/recipes-support/smarty/smarty_4.3.0.bb
index 71040d016..bc6fc0d8c 100644
--- a/meta-oe/recipes-support/smarty/smarty_4.2.1.bb
+++ b/meta-oe/recipes-support/smarty/smarty_4.3.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "php"
 
 SRC_URI = "git://github.com/smarty-php/smarty.git;protocol=https;branch=master"
 
-SRCREV = "ffa2b81a8e354a49fd8a2f24742dc9dc399e8007"
+SRCREV = "c02e9e135ea719b91f457a0072748ded0e852e7d"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


