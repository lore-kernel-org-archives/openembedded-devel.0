Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9D1C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:24:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.16658.1673414670856718032
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VZ+AnFzX;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414669; i=@fujitsu.com;
	bh=4+RVIznDJcnACPQxT/JF2xME4xSSCwsu0ZsdN/3j374=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VZ+AnFzXuz3mLgRjTieb8XrYWDhlasREdTUqGhm9d2acdoV/ORIQAIlYUgEdubMav
	 M77HvHK2M4dPGx2D//oJ0MY5jw6mXlpZJCkXaDyS10pvguqxIhBsziIFFTW0AfdZWz
	 bB3LGGFUnX+kZHtkHOv7rlwQ2iylvX6ce0lcFY44cczjIAVn0z9p8qY1FFZgsDEM8v
	 dAw3me/K7GoObFDl/mYOLCRBff5gcXhvcBWNd3GOibFs3Xu8nxC/xYpKy4vIV/dpwQ
	 8p0zN0FEUbBlnYo1w+1FgSIOQvw4y1rMzDvizKi8AZojAJWK2aBr+kjaasJgp7Z2fQ
	 ATPQLoWOyLB9A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqMvjsS/
  Z4OV6MYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNp+xOWgoU8FVsuP2BtYFzK3cXIxSEk8IRR
  4kLHQyYI5waTxJOdR5khnL2MEi9XrmPtYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYYEAibeP3EDCLAKqEsen7WcBsXkFnCSa3sxgB7ElBBQkpjx8D9bKKeAssaZrPZgtBF
  RzYNdFNoh6QYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFuiZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBwZtSnGSzg/Hv0j96hxglOZiURHnzJPYlC/El5adUZiQWZ8QXleakFh9ilOHgU
  JLgVXEFygkWpaanVqRl5gAjCSYtwcGjJMJb6wiU5i0uSMwtzkyHSJ1iVJQS53V2B0oIgCQySv
  Pg2mDRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC+zM9AUnsy8Erjpr4AWMwEtPty1F2R
  xSSJCSqqBaa5vuMDfyrC6J4v87m5c1PTp76KeiIt1hzPZG6SCd+iUsKhf0amK+57/yjnoUd9K
  0dgJFqfEm5n32b/7+KFmW6JQ/VdFw0WOjLJB98JjE9L9A7b1cdZWF+mKdAq6vwmb8mj+MqeJk
  zcfSFfb//FXqtHFkuupaQ+fO+UYt/LtnyyhwfhhXmHwkyt6c1Imi2msFVZokp6xe9uvX0xvXU
  /Y7Z3JOnn2S+MFy1PO2+a3tCQL6OZO1XXU3CP7b75mzu3WE+qtARbqSoJ9bHfThdKS85Q73ki
  WOm3PWSCsYrX9bllAV2zosrxfG12erevhObN+h8llHnnma9etJG/ovuj5FdyUfTig7F/Xs7SQ
  mBlKLMUZiYZazEXFiQB03E9VWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-745.messagelabs.com!1673414668!502811!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30370 invoked from network); 11 Jan 2023 05:24:28 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:24:28 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C4D0A100191
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:27 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B8211100043
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:24:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.45 -> 1.4.46
Date: Wed, 11 Jan 2023 13:24:05 +0800
Message-ID: <1673414646-13721-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
References: <1673414646-13721-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:24:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100526

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_14.html#change-1.4.46

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-sqlalchemy_1.4.45.bb => python3-sqlalchemy_1.4.46.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.45.bb => python3-sqlalchemy_1.4.46.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.45.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.46.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.45.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.46.bb
index d5f7b30642..be9c5b7bd2 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.45.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.46.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "fd69850860093a3f69fefe0ab56d041edfdfe18510b53d9a2eaecba2f15fa795"
+SRC_URI[sha256sum] = "6913b8247d8a292ef8315162a51931e2b40ce91681f1b6f18f697045200c4a30"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


