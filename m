Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3326FC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 13:20:26 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.10693.1645449623902712658
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 05:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JrorCgMU;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645449622; i=@fujitsu.com;
	bh=Y1nwma3XsvvhMt6x5TTHrTIQV8yWU7X0ZiLc+rRzqLk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JrorCgMULrmY6RMikHR8xP7u2UWdZNtQ/bihm6Uj7mhfRK00q0Ig8CPkvaf7sa3zJ
	 nGuY1AtNTpb40DWZXtWwA8zLwwm8rLu906JbYKFExLQ2wCBsa7Dhi6i0CSu0SLzcd1
	 MiWA36JqSZF4M6huL6bC6xiSbi9JTbyr8eusktO1PucwkBIGf405ztUYpb0yfJikBj
	 kJ+c1bWmOZfE/MAvzp0ucH/QzOSNzCx7lV0lKRUI9rannNN6jqWVmW1tlYk8yLdFa6
	 VOmZYKFd8vtv8x4H3aYQ/4uFMqM4lSgxSZncG6AWxh6kUqVCBbE8Uu9Jo3FImQEWx9
	 4ysS0mNSMD1Mg==
Received: from [100.115.7.114] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 48/7E-12292-59193126;
 Mon, 21 Feb 2022 13:20:21 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRWlGSWpSXmKPExsViZ8MxRXfqROE
  kgwdHFCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxJKz6wFDyTrOjZfYGtgbFBvIuRi0NIYCaT
  xKb3N9kgnBOMEocmr2LsYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHvYuRg4OYQE7i
  b7ntiAmi4CqxIlzJSAVvAJOEq19J1hAbAkBBYkpD98zQ8QFJU7OfMICMUVC4uCLF8wQNYoSsy
  83Q9VXSMya1cY0gZF3FpKWWUhaFjAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01TUBsgz1Eqt0E/V
  SS3XLU4tLdIHc8mK91OJiveLK3OScFL281JJNjMAASylmSd3B2Nf3U+8QoyQHk5Iob227cJIQ
  X1J+SmVGYnFGfFFpTmrxIUYZDg4lCV7hfqCcYFFqempFWmYOMNhh0hIcPEoivOXNQGne4oLE3
  OLMdIjUKUZjjp1bLu9l5vhw6MpeZiGWvPy8VClx3k8gkwRASjNK8+AGwaLwEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVhXp0JQFN4MvNK4Pa9AjqFCeiUKVlCIKeUJCKkpBqYugqq1Ovdj/2
  K9Xh2dV0Sk6Nuqc3kQ7KWzrwP382cOrnc/KL0rAK3OTXphkmCVrKbz31vCtb+c/zLJdmJ5T53
  +NRNlS/cX2nmvH9e+ip71g/5UtdWXgrkflTpJsu3xmpH4KEUJ/N/n1ayC9yYKC49WTj6Zmrzv
  7qPKl3/57vFZj9euHumqOQZu/Yf61h0dVdOy55R0CvY4h3oVp+nOUdkw8WoDXkHy0SX2M3nCX
  3C+CH3Fisri8J1qaPSUbLGJ3W1ZokXrWXavqPz7LmXIVyyyS1WDYceG3X4HHhZX7PEfsrEY/9
  Zl7+UjFeRVinJyL3fO0vHpuJU4ctq7bZJWyIC8+U63t1s5/Xb0LhU7bQSS3FGoqEWc1FxIgCu
  A6dUPQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1645449621!1243!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13944 invoked from network); 21 Feb 2022 13:20:21 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Feb 2022 13:20:21 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21LDKDHT017111
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:20:21 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 21 Feb 2022 13:20:11 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] gedit: upgrade 40.1 -> 41.0
Date: Mon, 21 Feb 2022 21:19:58 +0800
Message-ID: <1645449601-23151-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 13:20:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95409

0001-Remove-incorrect-args-for-i18n.merge_file.patch
removed since it's included in 41.0

Changelog:
=========
* Fix some crashes, one when opening files, another when
  deleting the open folder with the file browser plugin active
* Fix buttons in the color scheme selector dialog
* Build fixes
* Improve symbolic icon coloring
* Improve Save As behavior when saving error infobar is showing
* Translation updates
* Note that gnome-text-editor will be GNOME's recommended text
  editor beginning with the GNOME 42 release next month

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...e-incorrect-args-for-i18n.merge_file.patch | 34 -------------------
 .../gedit/{gedit_40.1.bb => gedit_41.0.bb}    |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch
 rename meta-gnome/recipes-gnome/gedit/{gedit_40.1.bb => gedit_41.0.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch b/meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch
deleted file mode 100644
index 66df3c269d..0000000000
--- a/meta-gnome/recipes-gnome/gedit/gedit/0001-Remove-incorrect-args-for-i18n.merge_file.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ea9a15afb76c093aea37f6c56c559b61afd9a9f2 Mon Sep 17 00:00:00 2001
-From: rvalue <i@rvalue.moe>
-Date: Wed, 15 Dec 2021 07:02:09 +0000
-Subject: [PATCH] Remove incorrect args for i18n.merge_file
-
-The positional argument has been silently ignored for a time. And it causes failure
-with "ERROR: Function does not take positional arguments" since meson 0.60.0
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gedit/-/merge_requests/124]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- data/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/data/meson.build b/data/meson.build
-index bb61387..28d72a1 100644
---- a/data/meson.build
-+++ b/data/meson.build
-@@ -4,7 +4,6 @@ install_man('gedit.1')
- 
- appdata = 'org.gnome.gedit.appdata.xml'
- appdata_file = i18n.merge_file(
--  appdata,
-   input: appdata + '.in',
-   output: appdata,
-   po_dir: '../po/',
-@@ -23,7 +22,6 @@ endif
- 
- desktop_file = 'org.gnome.gedit.desktop'
- desktop_output_file = i18n.merge_file(
--  desktop_file,
-   type: 'desktop',
-   input: desktop_file + '.in',
-   output: desktop_file,
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
index df8ab620c7..8c11fb52e0 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_40.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_41.0.bb
@@ -23,8 +23,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " file://0001-Remove-incorrect-args-for-i18n.merge_file.patch"
-SRC_URI[archive.sha256sum] = "55e394a82cb65678b1ab49526cf5bd43f00d8fba21476a4849051a8e137d3691"
+SRC_URI[archive.sha256sum] = "7a9b18b158808d1892989165f3706c4f1a282979079ab7458a79d3c24ad4deb5"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


