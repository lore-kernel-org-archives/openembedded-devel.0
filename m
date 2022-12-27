Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F69C10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:47:15 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.152453.1672123630040980023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:47:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F13NHygD;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123628; i=@fujitsu.com;
	bh=58B7gz5MvxVSooLnPDJYEF67UIiAAb3MeUP0AE8W1Sw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F13NHygDW5L8zh5KYdItP4x8FpizZReGec0ODHi3hxtWsg2eWwhCHaHMXHTdebTQH
	 hUDElJEa9w62mq+ivOaTlQDd6qmi20CazRHIAtr6+orNartPWlDv55pKyoyTCW8D6P
	 N5s4/8Q94S6/Lh9q93xC6bgRt5Tx9HlPz+ByE4s5mSD9EtjvK4oZZoMn0XtsoyInsq
	 FS9oTYfgLyCcs/h8xCLBHAkjCcuQdT2QCxHSR/vPo7MR1nbJmlYVRR0l433KMg/TCD
	 mdWMFyjvoylcc2AgqAJJX0AT9yc9K8/K6MElZaox0hy06DpAcng1qsPPuBV1HKLlkB
	 Dpr2VarBAjYeg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORpPt6yqp
  kg7kvZCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxTPZvZCxYKVkz4+YyxgXE1fxcjF4eQwENG
  iYUnu9ggnMtMEt82N0E5exgl1uz8xt7FyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Y
  DXCAn4SD79eZuxi5OBgEVCVWL/RECTMK+AksenzDbByCQEFiSkP34PZnALOElf2dzOC2EJANX
  tXnWCFqBeUODnzCQvEeAmJgy9eQPUqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrqpdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLopxYxlOxi7l/3RO8QoycGkJMor1b0qWYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb
  +kkoJxgUWp6akVaZg4wjmDSEhw8SiIQrbzFBYm5xZnpEKlTjIpS4rxfQfoEQBIZpXlwbbDYvc
  QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmFcdZDxPZl4J3PRXQIuZgBZ/OLQSZHFJIkJKqoG
  pxkRi3SQz/vB1BeGH/rb9DtIMfvPliRWD0o6w3Uaeqfyp8wx8dBmqpvy2W/D1/5R5GrsOL4pK
  li4O/aLW8cemInnPuoArE549KDA3sxW9LFfe/uTBwgN8uxw2+n0tEth5ynh9vVmKpkGlrmbQd
  717DEV3S22km6M7nSU6jTVzn5czbfhXdp5h3YQPxxiOsPmx+p7n6Ge6LZbI1GLp47mhT2heuZ
  foFeewTU4ljtrXHdxitmaX/2PkfdM2Ofe3hafqEd+Ggkn5+SU1Qjf/OqU+X1f8P7fitYV2t84
  Fw4r9//eu0y++bFr5kpm5Ikx+1lXLaasnlaa6PT704KbcBfWoT0w2Lf2NV2KEXtfHKLEUZyQa
  ajEXFScCADjZVshYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-587.messagelabs.com!1672123627!180775!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16932 invoked from network); 27 Dec 2022 06:47:07 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-14.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:47:07 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 16E121B1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0BD6C7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:07 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:47:05 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-supervisor: upgrade 4.2.4 -> 4.2.5
Date: Tue, 27 Dec 2022 14:46:25 +0800
Message-ID: <1672123586-32004-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
References: <1672123586-32004-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100273

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fixed a bug where the XML-RPC method supervisor.startProcess() would return 500
 Internal Server Error instead of an XML-RPC fault response if the command could
 not be parsed.
-Fixed a bug on Python 2.7 where a UnicodeDecodeError may have occurred when
 using the web interface.
-Removed use of urllib.parse functions splithost, splitport, and splittype
 deprecated in Python 3.8.
-Removed use of asynchat and asyncore deprecated in Python 3.10.
-The return value of the XML-RPC method supervisor.getAllConfigInfo() now
 includes the directory, uid, and serverurl of the program.
-If a subprocess exits with a unexpected exit code (one not listed in
 exitcodes= in a [program:x] section) then the exit will now be logged at
 the WARN level instead of INFO.
-supervisorctl shutdown now shows an error message if an argument is given.
-File descriptors are now closed using the faster os.closerange() instead of
 calling os.close() in a loop.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-supervisor_4.2.4.bb => python3-supervisor_4.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-supervisor_4.2.4.bb => python3-supervisor_4.2.5.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
rename to meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
index d67707557..53f8011b0 100644
--- a/meta-python/recipes-devtools/python/python3-supervisor_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-supervisor_4.2.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/Supervisor/supervisor"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=5b4e3a2172bba4c47cded5885e7e507e"
 
-SRC_URI[sha256sum] = "40dc582ce1eec631c3df79420b187a6da276bbd68a4ec0a8f1f123ea616b97a2"
+SRC_URI[sha256sum] = "34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12"
 
 PYPI_PACKAGE = "supervisor"
 inherit pypi systemd setuptools3
-- 
2.25.1


