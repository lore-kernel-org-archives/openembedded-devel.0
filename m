Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CB15C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:31:53 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.89962.1679617906108324485
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N+nKuLBj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617904; i=@fujitsu.com;
	bh=6C2ijhK711GYPZMRuHzKhqQhi//qP5WbXlWiVYqdg9Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=N+nKuLBj6yR0ge7+Tah637xudy0X0qOauAXtC7WFAzaSj1axhvRgCP1WKXcu4n6OU
	 ZMKsSbmL4KgOEG+4+pcPlwrDedFggJdhn8UO/oeIrQ7+8qd+PMkmEJGJYYzEoxxjdn
	 tZrNEGmtSbwqA7ZtIEpbh1aSz2tb+JzyKAX6bxyv6E+Yy55cMB0WatUZG2e2pC9ee+
	 jdMqewqGhlCpS4sj+hlSpMyHt3qEu+7o52LDjnbjNNh6cYSDW/TmKeZBb1eGPOTCUM
	 fjwrBHbJCBQEDAp2kXjvphI9dRhmkIY/+zHOpam1B6AxzyOOLZmFvFmn4yMsR6fvFJ
	 SqR8yXsgQkBXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8OxWTf/vUy
  KwdeV5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b1F6sZCy5zVjw58ZG1gfEVRxcjF4eQwANG
  idOd95i7GDmBnMtMEm/aAiHsPYwStxo9QWw2ASmJG/f/s4HYIgL6Ektn7wGrZxZQkXjxu4e9i
  5GDQ1jAQ+JtZwiIySKgKnFjah1IBa+Ak8SRw0vBOiUEFCSmPHzPDBEXlDg58wkLxBQJiYMvXj
  BD1ChKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoWpxaVJZapGuql1SUmZ5
  RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KXl1qyiREYhCnFLGY7GNv7/uod
  YpTkYFIS5ZUIlU4R4kvKT6nMSCzOiC8qzUktPsQow8GhJMH7+Y1MipBgUWp6akVaZg4wImDSE
  hw8SiK8h84CpXmLCxJzizPTIVKnGBWlxHn93gElBEASGaV5cG2wKLzEKCslzMvIwMAgxFOQWp
  SbWYIq/4pRnINRSRhiCk9mXgnc9FdAi5mAFjvXgC0uSURISTUwCf+Xb9vyaJXAzvarjEv08vy
  ulcZN4bLmlBFl836XcS6+iXX75z3fZgjcmWdVd2jNaymROWtE2ZjvHlb37nHewMrU9T9v2bPe
  qL5JEdsNqy5vXLeorfrCieRqpR9rHoYWLEpsjH7GkGP5JkNQRs5JWtvu45qvhy1tGLnyp/A4q
  7+Jdrq/8cy2aPH9s/+e+u3y/fKBzUVfYnnYJNcfYI2Out7HEtDWyqNqKyHAeig99mWWU/6je2
  UZl6T+JG0y7Oc85HdyachFceH3cx9sqBY5vt7Wuuf6Nx6Gsr3emjG5v4tT1H9vjMloefPGXy1
  fRFqYfVb/KterW9fV2peySF3hebneKvVO/sdNW53/TOFVYinOSDTUYi4qTgQAS+ymID0DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1679617903!255241!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14978 invoked from network); 24 Mar 2023 00:31:43 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:31:43 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 802C97C
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:43 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 7356873
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:31:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gnome-backgrounds: upgrade 43 -> 44.0
Date: Fri, 24 Mar 2023 08:31:21 +0800
Message-ID: <1679617885-27327-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101688

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- new supplemental and default wallpapers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{gnome-backgrounds_43.bb => gnome-backgrounds_44.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-backgrounds/{gnome-backgrounds_43.bb => gnome-backgrounds_44.0.bb} (76%)

diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_43.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_44.0.bb
similarity index 76%
rename from meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_43.bb
rename to meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_44.0.bb
index 9f94378d8c..2934b7398b 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_43.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_44.0.bb
@@ -8,7 +8,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext allarch
 
-SRC_URI[archive.sha256sum] = "19f749d8c37f872f155bb69a2bbe7aca381175e6929f1998047d775cbc637244"
+SRC_URI[archive.sha256sum] = "4a8393b387135f2a6a424a1a0c3ac94e0742b62b8235a0923c929f51e04be04e"
 
 FILES:${PN} += " \
     ${datadir}/backgrounds \
-- 
2.34.1


