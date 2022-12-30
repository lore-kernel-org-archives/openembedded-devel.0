Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE3BC53210
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:44:09 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3778.1672803839368017874
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IrQLzLNn;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803837; i=@fujitsu.com;
	bh=uyWL1DZyvzEUWxF75PL3woGYkiuwPFX9p2VMiviQ1l0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IrQLzLNnlPw/NzR8JZen35rcdu93/tNKmaZ5vEGA4I+yM6z/399fd61aQ7bxSwQaM
	 iK7H6eF6FejX+NKPR1FDEzGs4rFcXxrqsCrdx5yZnWaqvF7F71urDHF+sLf5zHIuu/
	 fHJj+O4+l070JbqUsI8OLuK8eu8rQe/sQKDXe5mbSbnnhk3Nz0b4sAnuwXw/zUsH91
	 BHST+uvjW+efXSrM7gLsTk3QIH82k22SPcJlqZEuPb9h+v31+poSKDlJBoqZbGpI6v
	 oaEQcJDsdsIX2YTgJBdiri93sp9aD/aDzhjSE+sb5KPZBVKnM2Um9+wkwAvWIMUDFJ
	 Fa2VlPGrmFb6Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSffv1y3
  JBtc/sVhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkrjzSyFKzkrnjzr6SBcQFXFyMXh5DAE0aJ
  C2s72SCc60wSaz53MEM4uxklru5tZOxi5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBH4tTKKWA2i4CqxLZjPWD1vAJOEn/OTwCLSwgoSEx5+B6sl1PAWWLS2i4WEFsIqObV/l
  3MEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdI30kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelODlsB2Pv0j96hxglOZiURHlLPm9JFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBq
  /4JKCdYlJqeWpGWmQOMJJi0BAePkghvFkgrb3FBYm5xZjpE6hSjLsfdhXv3Mgux5OXnpUqJ89
  76AlQkAFKUUZoHNwIW1ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOuBlnFk5lXArfpFdA
  RTEBHJK3ZCHJESSJCSqqBqfi/8C1PkbNG7m8UVHxnxajIZV+c9T37ss5Ev6r1z9UuHwpjqUqO
  7e1qevVQsq/xTdudP16trHqFRpynvz9ctPXsZ9b4qbM/brLRZnJKjPErP2v9Ye61CTufG4bKu
  5+PfTzD7yr32cnzrQ6WbeqbfnjWlc/33szN+/HFeIpn0cUTN+9ftjmuJprxtXh5m4un21+X/7
  envtON19X4/WvFolepHxuevJiycDGz99HPp74WtJTG+V5TOs0tJLXunEgIj6rAZK6IuUUCgu+
  TA8zk6854be3/v/7B6wBfNb25i99dtan5bLc+7PtDj6Jtlg4dGVM4c3ny9tplvVbTbjqk7Hep
  4lW1V9Wsg148Nke3yCixFGckGmoxFxUnAgD3YSD2ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-728.messagelabs.com!1672803836!358847!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27139 invoked from network); 4 Jan 2023 03:43:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:43:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8C3611000D7
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 7FFA61000D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:43:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:43:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.2.0 -> 2.2.1
Date: Fri, 30 Dec 2022 13:00:22 +0800
Message-ID: <1672376423-25554-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
References: <1672376423-25554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100383

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Enable mypy to discover type hints as specified in PEP 561 (#933)
 [ci] Set the expected Python version when building release files
 [ci] Update actions versions in use
 [watchmedo] [regression] Fix usage of missing signal.SIGHUP attribute on non-Unix OSes (#935)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.2.0.bb => python3-watchdog_2.2.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.2.0.bb => python3-watchdog_2.2.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
index 12adaf9f7..b76c6de0e 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.2.1.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "83cf8bc60d9c613b66a4c018051873d6273d9e45d040eed06d6a96241bd8ec01"
+SRC_URI[sha256sum] = "cdcc23c9528601a8a293eb4369cbd14f6b4f34f07ae8769421252e9c22718b6f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


