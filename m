Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A91C88E65
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:33:49 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1156.1789313620244596393
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gqnJuqTW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260913153336f9a2ca7a8e000207fe-jrngnu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260913153336f9a2ca7a8e000207fe
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:33:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=qmFQowcqRunC8hB1EXQ3Z1ZjhNH/SjU4x28SELrMyVM=;
 b=gqnJuqTWu6VzHYlo1LAQiDC41J3spku7xaFoPewslvYL4cDw94X81LU7aLOXNHZGqxVUqC
 8uSu0Wcpf4vNwCjVmuoOQ08ETMe6P13iVAZAmDK3M4cuBICkJvAG1JBGk9nyoXmSuvKzgtm0
 MUbJxXsxwVAjYlo2f9WpbMX51q4lyMT0fDuTilnpdfm3tYmRaRVYD/Tf1S74tTk6xcR9SiAX
 7rLfIFBJPrtImYPg/ObA4OGKZ6NyO3kpCx/ymuixJV9Syky/Ub3SceuC8/Du5cGCeRDmdLFz
 xAAosbn+1Ur0MK/yEO9ijetMGdDuYze0Hs+4aq5kbZJTaegFvMQmXDbg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [meta-oe][scarthgap][PATCH] recipes: correct homepage
Date: Sun, 13 Sep 2026 17:33:26 +0200
Message-ID: <20260913153327.3204016-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 15:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130001

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors for url in
some tools.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From meta-oe rev: 64dcb55dc5a21c66f9520a0670f4256558c866f8)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-colorzero_2.0.bb    | 2 +-
 .../recipes-devtools/python/python3-flask-login_0.6.3.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb | 2 +-
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
index 14dedba922..54bc45d3d4 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.12.3.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Screen-scraping library"
-HOMEPAGE = " https://www.crummy.com/software/BeautifulSoup/bs4"
+HOMEPAGE = "https://www.crummy.com/software/BeautifulSoup/bs4"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=96e0034f7c9443910c486773aa1ed9ac"
 
diff --git a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
index fc1615e670..4f0706f8f4 100644
--- a/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorzero_2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "colorzero is a color manipulation library for Python"
 DESCRIPTION = "colorzero is a color manipulation library for Python \
 (yes, another one) which aims to be reasonably simple to use and \
 "pythonic" in nature."
-HOMEPAGE = " https://github.com/waveform80/colorzero "
+HOMEPAGE = "https://github.com/waveform80/colorzero "
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ae6c62710c0646f3c60d1ad812ea9bf9"
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
index d990d4e80b..df22ca112c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.6.3.bb
@@ -2,7 +2,7 @@ SUMMARY = "User session management for Flask"
 DESCRIPTION = "Flask-Login provides user session management for Flask. \
 It handles the common tasks of logging in, logging out, and remembering \
 your users’ sessions over extended periods of time."
-HOMEPAGE = " https://github.com/maxcountryman/flask-login"
+HOMEPAGE = "https://github.com/maxcountryman/flask-login"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8aa87a1cd9fa41d969ad32cfdac2c596"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
index 1aca3a1619..1b2d431ad0 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.9.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Flask extension for sending email"
 DESCRIPTION = "A Flask extension for sending email"
-HOMEPAGE = " https://github.com/rduplain/flask-email"
+HOMEPAGE = "https://github.com/rduplain/flask-email"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5b16dfa6d3f275ace5985bb92949f770"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index ac449361a4..f722eca4b5 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -2,7 +2,7 @@ SUMMARY = "Customizable user account management for Flask"
 DESCRIPTION = "Customizable User Account Management for Flask; Register \
 Confirm email, Login, Change username, Change password, Forgot Password \
 and more."
-HOMEPAGE = " https://github.com/lingthio/Flask-User"
+HOMEPAGE = "https://github.com/lingthio/Flask-User"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=97de97cd9d6e23c88129d884588ce71a"
 
diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
index 1cbd2384a3..f1f1bc538c 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Python expectaton library"
 DESCRIPTION = "Minimal but very flexible implementation of the expect pattern"
 SECTION = "devel/python"
-HOMEPAGE = " https://bitbucket.org/dwt/pyexpect"
+HOMEPAGE = "https://bitbucket.org/dwt/pyexpect"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
 

