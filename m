Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E51CB7803F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:41:25 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f2so24646564qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iE0KfNpkWB9DYncUz226DajTeMiCt7u4UV32pNW6OA0=;
	b=IvsBsl4V304VjMCeptPUoZ5jjDKSlMsMiW3UzBwX2rKnsoA+05GhbN7og1v3b6Ofy4
	M7hy2dAxLb7kfa1XyzxgkWP0R7FJRbm+YYUp57hAvCvZeuItv8emr+dcptfE3M2jx9Mm
	wuDnU6y4R6KP+dd+DbT57BHqnRTTJRdmm/E0s4d+IWhJcLppwHgYr035ZG3pUGe8wSE8
	9jmnoe8ohoh/GKzHhx7NHfbV2+qJirlOVQa/9BKLSEseNtks9PeMwJRTs1qk0tWkNHGE
	9kWY0ocR9P9Cmy0uOq8ysV8hWn5FFp5OLGwFxKrbCz6xd+nEYHP446dzCXXcgaLGZ8Wg
	XwRQ==
X-Gm-Message-State: AKGB3mK5OT0224W+vu+kgt12RSF1rU21W1L10qNJ51MoGxZaPS8H9wse
	l3Sf/VKdJc+jDbLKG2sEALWex26p
X-Google-Smtp-Source: ACJfBosKX8gTgvpYcKdYlA0COVRz+MswfQNfma7TzC7KbGNlrwvO+iYELZTX6LWnYbX2q5O1JSRbew==
X-Received: by 10.237.37.5 with SMTP id v5mr5386089qtc.32.1513698086593;
	Tue, 19 Dec 2017 07:41:26 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r22sm10157029qtc.71.2017.12.19.07.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 07:41:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 10:41:20 -0500
Message-Id: <1513698080-22451-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-simplejson: update to version 3.13.2
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
X-List-Received-Date: Tue, 19 Dec 2017 15:41:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-simplejson.inc             | 4 ++--
 .../{python-simplejson_3.12.0.bb => python-simplejson_3.13.2.bb}      | 0
 .../{python3-simplejson_3.12.0.bb => python3-simplejson_3.13.2.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-simplejson_3.12.0.bb => python-simplejson_3.13.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.12.0.bb => python3-simplejson_3.13.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 50524f3..95df3f3 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "048548acae58984b3e939b3bcf182c8e"
-SRC_URI[sha256sum] = "df5e38f5e0a24abe0e02276aa5c3f8504150047a51c0b6b848b8153e6e6d395e"
+SRC_URI[md5sum] = "870bf6257465ce2ee8cad14e2394f7eb"
+SRC_URI[sha256sum] = "4c4ecf20e054716cc1e5a81cadc44d3f4027108d8dd0861d8b1e3bd7a32d4f0a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.12.0.bb b/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-simplejson_3.12.0.bb
rename to meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.12.0.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
-- 
2.7.4


