Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 80CF671DD7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:27:50 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id l7so18420027qtd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jan 2017 08:27:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vkHTX5k0o5QscB1iJQM9Xc+egrr5uILVW4ErkGwfVgM=;
	b=AYhmg9riprkiJd/gZAThqQCLKvNkUl8FfPomwd8rFXEnwnURwRqkhqF5XFt5koTC03
	7asDM+Mg/o2Kz1Lr1Jmnz5MSatQXH5TPxWPfcXHwJ6F6ez0bl0xnE2+fQyVEHieHgsET
	r2zvyb+U5VUvENPB4n+V+M5287H87DPi2pzsoN5tG9Ugf3E9liBuItj0VYCBPFckADcL
	DsYbGniUhL3RL1E58MsMjLGJfRTOx/cdMp8HvsTOByJ9tXOJgDjHfTEzY8vykSnu/mlH
	G61htAEGBXG74TgrtEh06MAWb44ToB9FmGDC0iWKo30MYJLqq5GVC8reYdo950fyTRVm
	rvDg==
X-Gm-Message-State: AIkVDXIXwU0eYk386Rjtd3P8DjS8g3YfMIG+kdU9Z5lYn0QnUrYa7oP5cFYTYsN4jErOcQ==
X-Received: by 10.55.135.197 with SMTP id j188mr25518683qkd.71.1485188871252; 
	Mon, 23 Jan 2017 08:27:51 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	m12sm10979967qtm.45.2017.01.23.08.27.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 08:27:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 23 Jan 2017 11:27:38 -0500
Message-Id: <1485188858-12081-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-bootstrap: update to version 3.3.7.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jan 2017 16:27:52 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-bootstrap_3.3.6.0.bb => python-flask-bootstrap_3.3.7.1.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
rename to meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
index a115f23..05a02c6 100644
--- a/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.6.0.bb
+++ b/meta-python/recipes-devtools/python/python-flask-bootstrap_3.3.7.1.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "An extension that includes Bootstrap in your project, without any boilerplate code."
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=3452e378337a5cc2092d32a140178d5a"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=a03749709f06118a17349deb5a210619"
 
-SRC_URI[md5sum] = "b8aedbe51f2bf511af955f2bc288cd8c"
-SRC_URI[sha256sum] = "3a7b71e22596a6d559965e059958960e0bb671adc131537a79edb491a8f31714"
+SRC_URI[md5sum] = "e40d50f5c5b6438c1c6200a6f2871f81"
+SRC_URI[sha256sum] = "cb08ed940183f6343a64e465e83b3a3f13c53e1baabb8d72b5da4545ef123ac8"
 
 PYPI_PACKAGE = "Flask-Bootstrap"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} += "\
+RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-dominate \
     ${PYTHON_PN}-flask \
     ${PYTHON_PN}-visitor \
-- 
2.7.4


