Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F965C7EE2C
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:25:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.103913.1683541533569013352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:25:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yjXQrCmA;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541534; i=@fujitsu.com;
	bh=BuLBazEGHr7USai0LHem1ReIH0YsWoc4o0FR/WCdKSI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=yjXQrCmATUaA9FKRcswBcBmyFvraphAX8ytThf9hQ001B4IJfQ+aZ2vYCIgh3USTV
	 7+g5ecXIQhgxsuSJt7WaMPOz57ppPjBtK47KUD234D1u2OzW/L4u8ZiiEtWPhlCeyt
	 oJMCV45Ke5y4qZQ5iAH9NFY4WEpIedzy6+EQ6r9gxDsqfHycWwPDVA3fRgp/TXk8aG
	 WvVlgkvfJHYK7di5mmyWfxGl6UKptr/q4+dCDgtescQvminaacWnuHzvAbkK4KjUFs
	 wiZvK4Hh9+aAs7yC5rj0nwCQTHsCscq/exUgm88SY3QQv75+BnYG0QEaW2DUF0Oqah
	 AQCT5SpR3/dSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpCt7LiL
  FYNlBXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPVq3OsBVt4KzZe3cXawDiZp4uRi0NIYCOj
  xI8ps9m6GDmBnGlMEr8Wi4DYbAISEtP3nmQHsUUEdCU+fpjLCGIzC6hIzJh8hAnEFhbwk9j4Z
  x4LiM0ioCqxe8Z2ZhCbV8BJ4vSV/WC2hICCxJSH78FsTgFniUlH1wPVcwDtcpLYeD4aokRN4u
  q5TcwTGHkWMDKsYjQvTi0qSy3SNTLQSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1ks
  tLtYrrsxNzknRy0st2cQIDImU4qQ9Oxhf7vyrd4hRkoNJSZTX9GBYihBfUn5KZUZicUZ8UWlO
  avEhRhkODiUJXpfTESlCgkWp6akVaZk5wPCESUtw8CiJ8MoeAUrzFhck5hZnpkOkTjEqSonzb
  j0DlBAASWSU5sG1wWLiEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3rSzQFN4MvNK4Ka/Al
  rMBLTY/3I4yOKSRISUVAOTS77xxYB3+9UTOt4XajDZZ7LdL3uiKeV4J0tFJe/Siq2MvY93ztR
  5kvPMZe3xPx4rNh4zLZqwvNezp0tF9MyVsheFViyTo9a2a6YU9Ky+KL78oDmXdMz2qpWb4lVv
  3I7w/dzS4Jo0S8RGebbMiuX/18+2Pi32gn93jzNH2bsvu1csSMm0EilYxjxZPEOK1dPvk85jh
  sOCx3i+vWRyuRhfv+ly7KbzmzK/h1qFuqtpfrn+QO6kVIbP0yPBGyTfnl9t4fLFrHXxff7Oq9
  PKyw6nzWD1OcV84fW1aYWfvjq8+ZqwpseR63KTZPuaDVNF/dhLn/Nxm7bp3/il7WdxO9zLr8a
  qwr1n/aPQ+mU+Gz4psRRnJBpqMRcVJwIA6k/EFgQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1683541533!419638!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25430 invoked from network); 8 May 2023 10:25:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:25:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2E7401D4;
	Mon,  8 May 2023 11:25:33 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 55F9D1C2;
	Mon,  8 May 2023 11:25:32 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.56.0 -> 0.62.0
Date: Mon,  8 May 2023 18:25:20 +0800
Message-Id: <1683541521-25835-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
References: <1683541521-25835-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102434

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Improve performance of ServiceBrowser outgoing query scheduler (#1170) (963d022)
 Speed up parsing NSEC records (#1169) (06fa94d)
 Speed up processing incoming data (#1167) (fbaaf7b)
 Speed up decoding dns questions when processing incoming data (#1168) (f927190)
 Re-release to rebuild failed wheels (#1165) (4986271)
 Reduce cast calls in service browser (#1164) (c0d65ae)
 Speed up incoming parser (#1163) (4626399)
 Speed up incoming data parser (#1161) (cb4c3b2)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.56.0.bb => python3-zeroconf_0.62.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.56.0.bb => python3-zeroconf_0.62.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.62.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.62.0.bb
index 20dc96219a..6e82c6831b 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.56.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.62.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "d21916e98de8d4cb822134b25746dcf321531b8662757a7da402798ba627062e"
+SRC_URI[sha256sum] = "c51340a8a7f13d7265dcc582c4a97907c11e4f3d23d5234d3c2c0e44fb446717"
 
 inherit pypi setuptools3
 
-- 
2.34.1


