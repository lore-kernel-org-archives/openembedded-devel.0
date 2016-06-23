Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9448870100
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 20:31:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id l81so17768127qke.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 13:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pl1VmHxaHYc+tZ4wepvJEYWmkISbc54KthwTYbjgUBg=;
	b=K5zpstdD1G0KhyA5wQBVImoLPXb/5bEvIfaUaDYHiqnCCz6n0kzhVINtzXCu8jJO+Q
	6T7VEDOrXb8QxgWbg1eMtuQFSVYRrAlG8WGANWQpOhP709NonSsLCzskaVWw07ISrbfT
	QVzS+dbzU1JVlyeRG1Hyu4SgrAt+8JPx6wmbjwioC75UWzH1mtfGmNQ8u0Gc50d5T8vB
	X/Tn0PAuuYRTtF2s6oSk64+kc2DrgjZO1wgr+WyuteRW7COzODWWIwjxIyAoO/cWe+NP
	LhGfZkBs1vWdVtEi2sP7wFznKVt9rJqj29IkhEBPjDeq5SbdRiVZdlAHCVkRZUG1I5wx
	OTBA==
X-Gm-Message-State: ALyK8tL305+BpBOU/8OjtSpPw6Jfl9bAT0yctno0Ae62g+yD9wcJJ3WKyfZzQ/ZyIIgZCA==
X-Received: by 10.237.36.108 with SMTP id s41mr554103qtc.66.1466713894219;
	Thu, 23 Jun 2016 13:31:34 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id l27sm718968qtc.34.2016.06.23.13.31.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 13:31:33 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 16:31:24 -0400
Message-Id: <1466713884-4740-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-flask: upgrade to version 0.11.1
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
X-List-Received-Date: Thu, 23 Jun 2016 20:31:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask.inc                | 6 +++---
 .../python/{python-flask_0.10.1.bb => python-flask_0.11.1.bb}       | 0
 .../python/{python3-flask_0.10.1.bb => python3-flask_0.11.1.bb}     | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask_0.10.1.bb => python-flask_0.11.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask_0.10.1.bb => python3-flask_0.11.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index 4923726..ee7f7c2 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -4,10 +4,10 @@ Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
 intentions. And before you ask: It’s BSD licensed!"
 HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=79aa8b7bc4f781210d6b5c06d6424cb0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=19866b76b054ab30c270c0eb9d7e43d7"
 
-SRC_URI[md5sum] = "378670fe456957eb3c27ddaef60b2b24"
-SRC_URI[sha256sum] = "4c83829ff83d408b5e1d4995472265411d2c414112298f2eb4b359d9e4563373"
+SRC_URI[md5sum] = "d2af95d8fe79cf7da099f062dd122a08"
+SRC_URI[sha256sum] = "b4713f2bfb9ebc2966b8a49903ae0d3984781d5c878591cf2f7b484d28756b0e"
 
 PYPI_PACKAGE = "Flask"
 
diff --git a/meta-python/recipes-devtools/python/python-flask_0.10.1.bb b/meta-python/recipes-devtools/python/python-flask_0.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask_0.10.1.bb
rename to meta-python/recipes-devtools/python/python-flask_0.11.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb b/meta-python/recipes-devtools/python/python3-flask_0.11.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_0.11.1.bb
-- 
1.9.1


