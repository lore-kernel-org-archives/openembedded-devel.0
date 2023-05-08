Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E75DC77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:23:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.103813.1683541437133424482
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VUOVxeSl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683541435; i=@fujitsu.com;
	bh=WmhQFNA6J6GpAtK6kkXwAYuKytj0Gsn6E3MLWNx2lJc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=VUOVxeSlX/ChKYq7Nt7q/7gIL9VlzMOYAjcrQ8TzAAKypfUulzLCaiwY534NmXsRr
	 NvO1TSAtM0Eiz4w6Bjza/233T5ypEk75MeI3xuIenYhpqezQ0StXiJraAbhPDOb2Jh
	 M9zpmARKndck/Wj9IO6P/mz4Es591CBYcbXLVhRCI0PWtkxUdFj/SM9ahhw0p1FJ5R
	 q6P5JD9zBZyMfz2a4MVxWGfQVJGU79IeMqMQRZOtRXOEbx1/Ll1aLwOAQXdXv0SiBK
	 WObC1yn4ZduVtCt4sAUc8OP5Eyh26+YF1fA4Sbn3DLmLr2ydZlmEXY6bwamqN3415R
	 /Etv/5wQViZvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRWlGSWpSXmKPExsViZ8ORpLvrbES
  Kwa45lhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8badW8YCw5xVRz6cp+9gXE/ZxcjF4eQwEZG
  iRVd11ggnGlMEj+WTwVyODnYBCQkpu89yQ5iiwjoSnz8MJcRxGYWUJGYMfkIE4gtLOAjcWdWD
  1g9i4CqxKR1X8BqeAWcJOZsuQZWIyGgIDHl4XtmEJtTwFliZ9czNhBbCKimresxC0SNmsTVc5
  uYJzDyLGBkWMVoVpxaVJZapGtopJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomukl1herJdaXKx
  XXJmbnJOil5dasokRGBQpxYpdOxgP7Pqrd4hRkoNJSZTX9GBYihBfUn5KZUZicUZ8UWlOavEh
  RhkODiUJXpfTESlCgkWp6akVaZk5wACFSUtw8CiJ8MoeAUrzFhck5hZnpkOkTjEqSonz8p0BS
  giAJDJK8+DaYFFxiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwLwPIFJ7MvBK46a+AFjMBLf
  a/HA6yuCQRISXVwNQ8+7H52krTo/duveZ8GLf1iUXQItez/p8V/6+t2vBffUr4prd+v62/tiz
  9/CMs1YRXV7h5hsC3jqNv2PpL7/PdtHG4+zg64LPxKbn2pfb7onQ79xbfzC0KOjCH5dD93kU6
  kmGKN2+cnWm+/HL31AXTEuPc+K2rn5wyTl7w9++Gr9btBVGTZj947+x+2H2b8sJbNtt7zS6yi
  d4LsbT6P0GAf9HRlQkpU7T7Xu3POB99okI84N2Vwhb+gy0L1jse+qomPZ0hyfRcZNvkRp1frz
  +VGFhfEPVoSJpudulu0ftLzV9ZF1+ak83a7VBQ1STw5SajYPs+bWPJFNeAac9mvah4qNtR4uu
  b+6l81iLB/RFKLMUZiYZazEXFiQDHjVI3BQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1683541434!182917!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20769 invoked from network); 8 May 2023 10:23:54 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:23:54 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A55A61D2;
	Mon,  8 May 2023 11:23:54 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CC1051C2;
	Mon,  8 May 2023 11:23:53 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyudev: upgrade 0.24.0 -> 0.24.1
Date: Mon,  8 May 2023 18:23:41 +0800
Message-Id: <1683541424-25761-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
References: <1683541424-25761-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102423

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
    Add support for PySide6: #487
    Add missing 'priority' argument for GLib.to_add_watch() #479
    Tidies and Maintenance: #486 #485 #484 #481 #480 #477 #474

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyudev_0.24.0.bb => python3-pyudev_0.24.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.24.0.bb => python3-pyudev_0.24.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.24.0.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
index 84154641ff..98817f9312 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "A libudev binding"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[sha256sum] = "b2a3afe1c99ea751f8296652557eac559874da2a1b1ec0625178706ec5a345f3"
+SRC_URI[sha256sum] = "75e54d37218f5ac45b0da1f0fd9cc5e526a3cac3ef1cfad410cf7ab338b01471"
 
 inherit pypi setuptools3
 
-- 
2.34.1


