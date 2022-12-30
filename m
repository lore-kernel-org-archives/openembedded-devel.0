Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311E7C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:40:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.3723.1672803628418312672
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:40:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nVLQla3i;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803626; i=@fujitsu.com;
	bh=20pvDAC7Fjr8tfP9MXIR5P0b1CG/5urnr8CqnZB5NVw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nVLQla3iBxoCea1qYBJljkt17O7cOPAgCy/4vBfarO+IvpO7HEhhpOIE+k6YRaA2m
	 ov12VWJfDjkWW5cuWrr3yPd2X8ELmBI6hKnUn405zex1Sm5ZBbM6NhikyNjWyGfGYg
	 Kpb4X8GQDPDt09ZAnLTevc6d3ux6As7p+5Loe15DvuJsEkTQTcasY6iRa+G9qOB7FX
	 rSM+j1t8rerUbKEOAlhFT4J7IPgbekdcETkmOKjnp/n2/UzrvSDMQ7PwxSKF/xz1OT
	 XZ1oBDeTtzGRaFilwgPQxnzCFxjhxhwYGoyXndhPBlSP2sMTtziu/dOucI6+oBG1f0
	 arGucQ3CWAsrA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWVfz65Z
  kg2PdihYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8adrdNYCo7LVvxo2crYwHhJsouRi0NI4CGj
  ROvhQ6wQzhUmiUmfVkE5uxklln+6zdbFyMnBJiAlceP+fzBbREBfYunsPcwgNrOAisSL3z3sI
  LawgLfEjykvwGwWAVWJv1e+sIDYvAJOElsaHzGB2BICChJTHr4H6+UUcJb49nonWI0QUM2fo0
  +ZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKzZrVBzVSTuHpuE/MERsFZSNpnIWlfwMi
  0itG0OLWoLLVI10IvqSgzPaMkNzEzRy+xSjdRL7VUtzy1uETXSC+xvFgvtbhYr7gyNzknRS8v
  tWQTIzB4U4rVt+5gPLzsj94hRkkOJiVR3pLPW5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfCqf
  wLKCRalpqdWpGXmACMJJi3BwaMkwpsF0spbXJCYW5yZDpE6xWjJcXfh3r3MHFtuHwCSm/Z1HW
  AWYsnLz0uVEud9CtIgANKQUZoHNw4W7ZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOuBpn
  Ck5lXArf1FdBBTEAHJa3ZCHJQSSJCSqqBSe5gf7H4qrl3z7eGy1i3reXd80/r6e6DdxoX5y2y
  KI9hvLf/x4pzfncqpu5Tfz6jYHuA5Kvg1+srww+v3MKwjv/kVoOJxW/X8J554ulUYHLg8quy7
  aqvVWXdtvCcS7Zf8/fZA07Dvzb6WxdxiWTEcObLead5Kwh58XrbSDC/CP30pORI6sobmt+rT8
  2psNd/vTtYNsi1SqrjkHiGQqfxw7f20b9Y5yYZWN46Xhj598m7fA+enheBxVuOHVqb2/Lubue
  nLEdNP/Mtebunvv6hu6nIJEXxSqpgW7OzfEXbx4pZd9ZXL1npforp/nopAzHl0+sWrP2WpWuz
  ZpGEzBT5i6yna+pWXornuF3j2Ft0UYmlOCPRUIu5qDgRAAK9ogJxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1672803625!367426!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13896 invoked from network); 4 Jan 2023 03:40:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:40:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 43E0C152
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 37669151
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:40:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:40:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyephem: upgrade 4.1.3 -> 4.1.4
Date: Fri, 30 Dec 2022 12:56:49 +0800
Message-ID: <1672376212-25291-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
References: <1672376212-25291-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100372

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Don-t-set-tp_print-on-Python-3.patch
removed since it's included in 4.1.4

Changelog:
==========
In previous versions, if you asked for the position of a body (a) whose
elliptical or hyperbolic orbit has an eccentricity very close to 1.0 and (b)
which is very far from perihelion, then the underlying C library would print
a warning Near-parabolic orbit: inaccurate result but let your Python script
continue on unawares. Now, no message is printed directly to the screen, and
instead a RuntimeError will tell you why PyEphem can't compute the body's
position.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-Don-t-set-tp_print-on-Python-3.patch | 44 -------------------
 ...phem_4.1.3.bb => python3-pyephem_4.1.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch
 rename meta-python/recipes-extended/python-pyephem/{python3-pyephem_4.1.3.bb => python3-pyephem_4.1.4.bb} (67%)

diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch b/meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch
deleted file mode 100644
index a84d852fb0..0000000000
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem/0001-Don-t-set-tp_print-on-Python-3.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 866f7560034e8b7a604432611b3cb2c92e76def9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 28 Aug 2022 11:03:39 -0700
-Subject: [PATCH] Don't set tp_print on Python 3.
-
-In 3.8 it produces a compilation warning, in earlier versions it is ignored.
-
-Upstream-Status: Submitted [https://github.com/brandon-rhodes/pyephem/pull/245]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- extensions/_libastro.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/extensions/_libastro.c b/extensions/_libastro.c
-index ce07d93..c9ef1e6 100644
---- a/extensions/_libastro.c
-+++ b/extensions/_libastro.c
-@@ -372,7 +372,11 @@ static PyTypeObject AngleType = {
-      sizeof(AngleObject),
-      0,
-      0,				/* tp_dealloc */
-+#if PY_MAJOR_VERSION < 3
-      Angle_print,		/* tp_print */
-+#else
-+     0,				/* reserved in 3.x */
-+#endif
-      0,				/* tp_getattr */
-      0,				/* tp_setattr */
-      0,				/* tp_compare */
-@@ -669,7 +673,11 @@ static PyTypeObject DateType = {
-      sizeof(PyFloatObject),
-      0,
-      0,				/* tp_dealloc */
-+#if PY_MAJOR_VERSION < 3
-      Date_print,		/* tp_print */
-+#else
-+     0,				/* tp_print slot is reserved and unused in Python 3 */
-+#endif
-      0,				/* tp_getattr */
-      0,				/* tp_setattr */
-      0,				/* tp_compare */
--- 
-2.37.2
-
diff --git a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.4.bb
similarity index 67%
rename from meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
rename to meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.4.bb
index 8c4f0eb405..8850b79e8c 100644
--- a/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.3.bb
+++ b/meta-python/recipes-extended/python-pyephem/python3-pyephem_4.1.4.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "http://rhodesmill.org/pyephem/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9c930b395b435b00bb13ec83b0c99f40"
 
-SRC_URI += "file://0001-Don-t-set-tp_print-on-Python-3.patch"
-SRC_URI[sha256sum] = "7fa18685981ba528edd504052a9d5212a09aa5bf15c11a734edc6a86e8a8b56a"
+SRC_URI[sha256sum] = "73a59f0d2162d1624535c3c3b75f956556bdbb2055eaf554a7bef147d3f9c760"
 
 PYPI_PACKAGE = "ephem"
 
-- 
2.25.1


