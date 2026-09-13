Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56978C88E5C
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 15:35:09 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1181.1789313699446500511
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Sep 2026 08:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DAr7JOTI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260913153457ca383221240002075f-ukwtot@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260913153457ca383221240002075f
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 13 Sep 2026 17:34:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q3Fylb5qXqYDF3DVFUOgOkO7jRdBy6Ma3KY+C07Xb+o=;
 b=DAr7JOTI+Qvoy1jP8V4zpxyWv40XXjOq7EeQlr+7OKeNUkwgR6FcH2egLO21NL7P0KdTiS
 fqEIvIk2/JaDHl1Kir1eXAWoQncfZ5QR2Y64o++RYzD+ycBQCyPU3tx6vAZpO9fmSVCinWJy
 5g0MuxBGl2Gkj9lz9fxrZ92lLmdWItAKeHyaad2i4oAbpScgA6h5i5tEjJxvhgwqUGJlQabO
 5w0ZggFaa5uG7M7AtNIi4zAZVSamEzuy/VC3zdzdzoLLuifjS87bEQWxpcKzzJCTIby7JVpy
 OI6AcijMsPfqSOD2ADa8+nZ/oe0P3rjGavtihKX+9IR5CzEAGEmO1ksQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [meta-oe][wrynose][PATCH] recipes: correct homepage
Date: Sun, 13 Sep 2026 17:32:56 +0200
Message-ID: <20260913153257.3203926-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Sep 2026 15:35:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130002

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors for url in
some tools.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(From meta-oe rev: 64dcb55dc5a21c66f9520a0670f4256558c866f8)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-colorzero_2.0.bb    | 2 +-
 .../recipes-devtools/python/python3-flask-login_0.6.3.bb        | 2 +-
 .../recipes-devtools/python/python3-flask-mail_0.10.0.bb        | 2 +-
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pyexpect_1.0.22.bb  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
index bd9725e2de..b876c60d4e 100644
--- a/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-beautifulsoup4_4.14.3.bb
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
index f197119bbc..a50f82abc4 100644
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
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
index 5d3f60cff0..7a1a44d4f9 100644
--- a/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-mail_0.10.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Flask extension for sending email"
 DESCRIPTION = "A Flask extension for sending email"
-HOMEPAGE = " https://github.com/rduplain/flask-email"
+HOMEPAGE = "https://github.com/rduplain/flask-email"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=201f2b80112efa61b78515bd54e9f138"
 
diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index 68d7361519..e808b2e349 100644
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
 

