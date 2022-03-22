Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0409DC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 00:09:39 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.3565.1647907778015520842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 17:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NBQz4uUz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647907776; i=@fujitsu.com;
	bh=bgIxH7DBWqz6Zu6xW9GuOtGLv+B/zfuqEf8jDlyNYMY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NBQz4uUzc7imeFEZpOP/noifkeieEW7kKOi0ntHArGpc2SZhM+SU+3bjYxuth8+rV
	 g8cSr9IpXFosKB5WZZqXzxmA89NklhnO6mOXrX0inmF5dF7AZvdUlvBVvKvtkennQA
	 gcDKp6Fu5wgsn4yTsPs4g/POr895hVLwFCZK/kEZQNQ2/GtwtKNgtUWwObO9e8Vm7M
	 AAcDBxWDxL+W5V2N/pudR8zH2yJDwHxDTo1fsVgG+5NebXMiHjDDX9ky3cTLPi12WU
	 qtwrzWupTXwNH1XHBVSIR00HmD/a9ebBR+qz68+XLj+t259rQXR7EDZdL/EuG7XdUO
	 oqUCFjVxNya2Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxRXe/sGW
  Swc1JshYXDy9ltrg3fwGbA5PHuY0rGD06fl9nDGCKYs3MS8qvSGDNePY3q+AXR8WUzU+YGxjn
  cHQxcnEICbxklJjWNIW1i5ETyNnDKDGhoxzEZhNQk5h+6wZYXERAX2Lp7D3MIDazgLzE8k1/2
  EBsYQFXiUXt/5i6GDk4WARUJaZtFQMJ8wo4Skz7eIIdxJYQUJCY8vA9WCungJPE9QVtYOVCQD
  Uz3tdAlAtKnJz5hAViuoTEwRcvmCFaFSVmX25mgbArJGbNamOawMg/C0nLLCQtCxiZVjHaJRV
  lpmeU5CZm5ugaGhjoGhqa6pqZ6xqameklVukm6qWW6ian5pUUJQKl9RLLi/VSi4v1iitzk3NS
  9PJSSzYxAgM1pdh52Q7Gd30/9Q4xSnIwKYnyvnhokSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  ldU0DJJSLAoNT21Ii0zBxg1MGkJDh4lEV7+D0CtvMUFibnFmekQqVOMilLivPFCQH0CIImM0j
  y4NlikXmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzLsYZDtPZl4J3PRXQIuZgBbrs5qBLC5
  JREhJNTD13p5xycmyqylxeWvUJv+qeVcNvx9tiGXbLrTy7s+bK3sDhETX9iuli7L3d56bu77j
  6sI9otbBOzg+OZS8yK5N3HN5YX53vPflXwu4osPbVLdtDhCUESpUc1kz4+wp+3+dnB/mtT+9z
  Ltq4R2HPo/lzsXh3Kvipj1hkAq57ryhf+s95le3crJeyd5de9v64OrLNw7lplxcV/zR6Vrmg3
  D54o+/NsRz/Dy/87HgwUSOnQ/91WW+T0srYTMIcjbw/fEs7+qEysmSoZf37nYvvr3wR7r2Xcc
  H09bor93/08Bo3ebKyboezeenx86wPRlntOPDvD1L1plnHRa9oNdzm1+568WkR0lMqtme4rI5
  y/+4KLEUZyQaajEXFScCAD9my6FPAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-545.messagelabs.com!1647907775!282461!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14907 invoked from network); 22 Mar 2022 00:09:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-7.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 00:09:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 22M09OE4005185
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 22 Mar 2022 00:09:35 GMT
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 00:09:27 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>
Subject: [oe] [meta-gnome] [PATCH] metacity: upgrade 3.42.0 -> 3.44.0
Date: Tue, 22 Mar 2022 08:09:12 +0800
Message-ID: <1647907753-1930-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
References: <1647907753-1930-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 00:09:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96117

From: Upgrade Helper <uh@not.set>

---
 .../metacity/{metacity_3.42.0.bb => metacity_3.44.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.42.0.bb => metacity_3.44.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
index 8baf2bc62b..b6708552ac 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.44.0.bb
@@ -23,7 +23,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "d89d679dcfed9b5eef18f06e2dcb33a7ab543d53b358fa89ce65593c231eeebc"
+SRC_URI[archive.sha256sum] = "19c3c5d79d2171f45baa0f632cc8995f8607bf1231a16014439bac9ba165a7c0"
 SRC_URI += "file://0001-drop-zenity-detection.patch"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
-- 
2.25.1


