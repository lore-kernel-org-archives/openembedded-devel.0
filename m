Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE4FC5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:26:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web10.16690.1673414803227327786
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:26:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K86i3kY6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414801; i=@fujitsu.com;
	bh=X6gceaY7QD6+9CQJa+1cedcsXnMJQhS3x6uxjb2jhTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K86i3kY6LObRXqfkjOPNm42OG9Ddl3OVql7WVOO03MqDMtcySu4E7wYromQEo63BR
	 p3snSbneZhoFrNdj+DBJZaFuJw9npjlyIiInZkOoiQ4Yh8zxNfEdVn8JCvXaNkZt8M
	 6J8IKOBfnT6IFj170RYf7W4lv+XA1f8CbyRtPb9l0ssYhC5Sp6RrANdU9pIvPMgujx
	 IF9foVM1cgzqP5tI7ioymUzMKJA6JR+/ILO4v682n3cfNZbEDmJan6187TRutKnw/v
	 pV9lqBdrVmLgLSv+fTDIte/FTVQjW0tL8ERIpLIRafwAyPl3u3KRCvS4W7rrY7xoO/
	 phpOmMDLrAiaQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSXeCx75
  kg78LxSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyH9z0K3nBWnD1+kb2BsY+zi5GLQ0jgCaPE
  5S3PWSCcG0wS07b8g3L2Mkos3rCRsYuRk4NNQErixv3/bCC2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhgSCJzu79YPUsAqoS+1uWg9XzCjhJtG3+DlYjIaAgMeXhe7BeTgFniaaTP8DiQkA1F5ZsZ4
  SoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdKtH74BWWrSVw9t4l5AqPgLCTts5C0L2BkWsV
  oVpxaVJZapGupl1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5da
  sokRGLwpxem5OxgvLfujd4hRkoNJSZQ3T2JfshBfUn5KZUZicUZ8UWlOavEhRhkODiUJXhVXo
  JxgUWp6akVaZg4wkmDSEhw8SiK8tY5Aad7igsTc4sx0iNQpRkUpcV5nd6CEAEgiozQPrg0WvZ
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfMyOwNN4cnMK4Gb/gpoMRPQ4sNde0EWlyQipKQ
  amOZ+jL+9b+Wfi5qtmosnL02raG46v/Wq+Z+fxy7JGFyLZAizVtzDvl03eXrqX6sbrCdmfg+N
  eXbMmum0kFCUSoT7Pg9n/Ze2e39PFds5J7tYhkG7eUYNW8BUHY2fga81P39iX7xvnf/2KatZW
  z8Y5UwX6bZdc+aIwYHjSdd/TPKS3VvZo7Tz3cS9Tg56zd/umoW0s+V7rOqrM9l7MrBBjk9Ec5
  EdX8Oe8+dYlUW+HOi6fiy8XHXZkhudH8/bfJqj/6dMRPzJp/arm5l1ZkyUWPbiy/Z0YfUfvuk
  nN83/8nN7UtUfzgVFghvfZoXdlz/Y97h3SclLtcv9u2WunHTfO5mp0PHnglCzDwtYXtf9Olql
  xFKckWioxVxUnAgAqwNiwFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1673414800!502124!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21123 invoked from network); 11 Jan 2023 05:26:40 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:26:40 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C9C4D1000DC
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:39 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B07401000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:26:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 6.0.1 -> 6.0.2
Date: Wed, 11 Jan 2023 13:26:19 +0800
Message-ID: <1673414780-13856-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
References: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100536

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/robotframework/robotframework/blob/master/doc/releasenotes/rf-6.0.2.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-robotframework_6.0.1.bb => python3-robotframework_6.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_6.0.1.bb => python3-robotframework_6.0.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_6.0.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_6.0.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_6.0.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_6.0.2.bb
index 5f58a2ae5..19c765275 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_6.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_6.0.2.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "b2d9a82912dfd27aae7afaad64771c58f5d948ca9d64e3ae72b16721b5e022ea"
+SRC_URI[sha256sum] = "6a9c06deb220099990f190c6e4e772675f625e4d5d84640fca6f0ad46ff538d0"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1


