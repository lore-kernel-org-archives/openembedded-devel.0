Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86557C05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 10:02:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.8367.1676196127166564325
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 02:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NVmR1w3j;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676196124; i=@fujitsu.com;
	bh=wnoCOm9q51ggG0++UT/DNknq1wWZqBKOYz97Cbn6E9c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NVmR1w3jLF4Gyei/VbW4StMyO8WGeDlzAK1t5iY00IpONCaYq0Cam+fZjWM9kxsbb
	 3URShWjqPrVcvxfJvuLM/oUxCk4jpJ5QON8l848zV6CI0W42tgnTLtLzXOq2Sccc+k
	 XxTQy3jZo2zGrROFWoP2iEab3GPJl/BiOUJe+sqkoESmicV/zG8s08wUxJRzN9ucqZ
	 Kp7oBnAQvE1PPaagHCJn0FWxb82pgOuouvmPdSpKiRKV7LrGvGpKoQpV/2R3ApG0A6
	 zM+EgTTvIv9lcVKpMyJ0JsCcd3R4Hym9zbtZIfWzqXnnDuqC81wRyHHmzGDWF3naa4
	 Sa0iRxokHYJ7A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MxSVdm54t
  kg3+v+SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owtdxrZCt7zVBzf0cLUwHiGu4uRk0NI4Amj
  xP/XTl2MXED2DSaJpk9L2SGcvYwSO14cYAapYhOQkrhx/z8biC0ioC+xdPYesDizgIrEi9897
  CC2sIC/RGNHG5jNIqAq8Wb/XTCbV8BJoqWvkQnElhBQkJjy8D0zRFxQ4uTMJywQcyQkDr54wQ
  xRoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGuhV5SUWZ6Rkl
  uYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCimFLO+2cG4re+v3iFG
  SQ4mJVHeZZufJgvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4L2x/UWykGBRanpqRVpmDjAuYNISH
  DxKIrzi64DSvMUFibnFmekQqVOMilLivB9A+gRAEhmleXBtsFi8xCgrJczLyMDAIMRTkFqUm1
  mCKv+KUZyDUUmY9/0WoCk8mXklcNNfAS1mAlrMIPUUZHFJIkJKqoGp9B/D698Gfx8FtVrWzUr
  bw+qYq7b/YmZ0++UvCatMY05W//i34PCtCMfJcj+eF1yZbvKislN2Sq2zgtuVnMjILXcDby+6
  9JM7avFGJ0nruglP1B6fr/+54WRv4tWP+nbqjDN/p5xfFKLzisnN1eJnrTvTuemOX+NqNjct0
  d11nSnryX7ussVrjoZ+3eo/SemT/+f2WMlvM9+XhPve6Du64GzZy4N7jj1cPG+tnqoh36eyrt
  epexrMJ4qmLY8011HvrBSOya7/ai71RWzihLlCbvnhqx+bOUwyaSrsklMwV/2Wa7nVzFWts/W
  D/JOW7wcfNgVtrm+vW73sX+oR0XO53Nb9E97/WWenn/xDZ1e6EktxRqKhFnNRcSIA5ieZgEAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-585.messagelabs.com!1676196124!799355!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32068 invoked from network); 12 Feb 2023 10:02:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 10:02:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id D5D951000DC
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:03 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id CA6331000D2
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:03 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 10:02:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.46 -> 2.0.3
Date: Sun, 12 Feb 2023 18:01:47 +0800
Message-ID: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101048

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
sql
------
- Fixed critical regression in SQL expression formulation in the 2.0 series due
  to #7744 which improved support for SQL expressions that contained many
  elements against the same operator repeatedly; parenthesis grouping would be
  lost with expression elements beyond the first two elements.

typing
-------
  Remove typing.Self workaround, now using PEP 673 for most methods that return
  Self.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-sqlalchemy_1.4.46.bb => python3-sqlalchemy_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.46.bb => python3-sqlalchemy_2.0.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.46.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.46.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3.bb
index be9c5b7bd..d2ff35fb0 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.46.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "6913b8247d8a292ef8315162a51931e2b40ce91681f1b6f18f697045200c4a30"
+SRC_URI[sha256sum] = "c2b924f6d0162ed1c0d8f47db1e56498702b1c3c953ad84f0eefbf5b4e53bb05"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


