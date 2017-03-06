Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id E3AE9774FF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:57:43 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id j127so27117213qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Mar 2017 07:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ydhfLw0STgvNy00dEGtKqgXTw+v13bWXVnpgcbtA9Oo=;
	b=Vg24M9hprrt8mSGemLNrViApgEtt8l1Qy0G2O7dRosL+/fgTIRUBrV3Lt/feaXc5Ls
	duAEJwGFiYNYwg4jbBHS16vVM7krsEh0LIcYlZRT/1psFzzjXVuWR7Mp0mQGJ9GMfsNL
	bQo8YBxTO1NxGbLLqUPmm0ZsrcHr4dKqRFeg10fth77Ya8wKIZnmGHwGsJ1DQkhvGSGF
	FpyVS/BTz6TJMr7DYUrbl004bLV3unR9Lx/FPPpZ+XIe3Bl97s6E3VUIkJFUjO/jE73x
	BJi7duO9FHG+aME5p50YpDFLHh5HUOHa1Ys+aHkRK4+aXSzDGnXa0MyXgostk+2WLtKQ
	bRwQ==
X-Gm-Message-State: AMke39l1zRYSMSZXGswRCmjF1MikEW3MqPk3joXhA8PI0cZ6zov5LdAmRqcjzw1pNysMrA==
X-Received: by 10.237.62.104 with SMTP id m37mr16316072qtf.23.1488815864718;
	Mon, 06 Mar 2017 07:57:44 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	s75sm13658874qka.36.2017.03.06.07.57.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 07:57:44 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Mar 2017 10:57:35 -0500
Message-Id: <1488815855-30150-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-flask-sqlalchemy: update to version 2.2
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
X-List-Received-Date: Mon, 06 Mar 2017 15:57:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...ython-flask-sqlalchemy_2.1.bb => python-flask-sqlalchemy_2.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask-sqlalchemy_2.1.bb => python-flask-sqlalchemy_2.2.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.2.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb
rename to meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.2.bb
index a258713..1190f34 100644
--- a/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.1.bb
+++ b/meta-python/recipes-devtools/python/python-flask-sqlalchemy_2.2.bb
@@ -2,11 +2,11 @@ DESCRIPTION = "Adds SQLAlchemy support to your Flask application."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ed1b8cc741515a835a7f6bf2f62ef4a"
 
-SRC_URI[md5sum] = "dc15fe08b07b434d3d2c4063b4674b72"
-SRC_URI[sha256sum] = "c5244de44cc85d2267115624d83faef3f9e8f088756788694f305a5d5ad137c5"
+SRC_URI[md5sum] = "a93e6af389afac6666733e369c06c798"
+SRC_URI[sha256sum] = "f0d8241efba723d7b878f73550f5d3c0fbb042416123b52b36640b7491fa208b"
 
 PYPI_PACKAGE = "Flask-SQLAlchemy"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-sqlalchemy"
+RDEPENDS_${PN} = "${PYTHON_PN}-sqlalchemy ${PYTHON_PN}-flask"
-- 
2.7.4


