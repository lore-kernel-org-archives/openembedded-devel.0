Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9736BC636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 10:02:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.8368.1676196128868727565
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 02:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XOaLCNK5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676196127; i=@fujitsu.com;
	bh=POZf5d8q4o41UPEMYI60cAC6FE7t+eZJrQn0DFYPUBY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XOaLCNK5fvqwtGuvsnO3q9knCzj7MKU9igjOFFjFr3m92x8Ojz1vJtM4yEx8xXVFs
	 UDNUw6SK1KJ3MNJQbuXiZUR7hpGFG0nMavirW7hs4psBDQTu/QCKIFWhdrefYvOXNe
	 LeQ2CqtfbYjG/jcKimHYqlllQHuQrZT9HDx3+/RZ6AMV9OF4A/2xVWn/n60p0rM6s+
	 YI6NF5AFViUUqlFqDMFqlNdVaVPc8/HEogXI4evkxzgrc3IDTO+9jDwbLdqL87oL9n
	 /miAY3cNvxoZe2VADW9Z3IQ7oEAe8f4GIIlDOBAQJ6UjETmGwbUmjwjgiW5SOWznxo
	 EBodHuMad6xrw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqCu380W
  ywZFD4hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bR3nXsBdu5KtoaJjI2MB7j7GLk4hASeMIo
  cWLHQVYI5waTxM19e9kgnL2MEr9fnGLsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAV+LTxp0sIDaLgKpE+4knQFM5OHgFnCQ+bOQBCUsIKEhMefgerJVTwFlixpnvYOOFgE
  q293eBtfIKCEqcnPmEBWK8hMTBFy+YIXoVJWZfbmaBsCslWj/8grLVJK6e28Q8gVFwFpL2WUj
  aFzAyrWI0LU4tKkst0rXQSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdRLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3ZRi1jc7GLf1/dU7xCjJwaQkyrts89NkIb6k/JTKjMTijPii0pzU4kOMMhwcS
  hK8N7a/SBYSLEpNT61Iy8wBxhFMWoKDR0mEV3wdUJq3uCAxtzgzHSJ1ilFRSpz3A0ifAEgioz
  QPrg0Wu5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfO+3wI0hSczrwRu+iugxUxAixmknoI
  sLklESEk1MCk0TtLkW3j/mpDWDZMMPcnXWTp/d59Ump96+mn5PNFkl74HsSFS76++9RSQvP7v
  0Y3GzzPsXXa16D+0lqyxqA1Qn9gQunEXg2R6lVP34oXzky8xxvrmh73quqO6pM/vhU6fVEnze
  v7XZdzlEunmNhoP57/k/lR89XNFVae++SmWemtP2fpFrPs0yvYGMq3Yy3ugatrXn22T83ZNV9
  /EeldtlUbHwUtpMV15jvXbBVbkam0uVt2y/Xuu9vmHHv0nA9w6JsUGf7UtZL7+M2hjXGp2gPm
  BT6t6bOql5+uGp7wu/JSxejL36eB1tQv0ExaeZqudeeDfLfl595v+TXD6m/Gr9I7OMjP1Iw1T
  v+itUWIpzkg01GIuKk4EAPfHKW9YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1676196126!480092!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16728 invoked from network); 12 Feb 2023 10:02:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 10:02:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 05966100191
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:06 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ED127100043
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 10:02:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.8.1 -> 5.9.0
Date: Sun, 12 Feb 2023 18:01:48 +0800
Message-ID: <1676196111-13722-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
References: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101049

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  Polishing argcomplete support #829
  Test that name and description can be set via constructor. #826

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-traitlets_5.8.1.bb => python3-traitlets_5.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.8.1.bb => python3-traitlets_5.9.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.8.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.8.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
index 3f75df6f1..ee4ac64c3 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.9.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=f17a3ba4cd59794dd6e005c8e150aef0"
 
-SRC_URI[sha256sum] = "32500888f5ff7bbf3b9267ea31748fa657aaf34d56d85e60f91dda7dc7f5785b"
+SRC_URI[sha256sum] = "f6cde21a9c68cf756af02035f72d5a723bf607e862e7be33ece505abf4a3bad9"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


