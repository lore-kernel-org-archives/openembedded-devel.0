Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE4F70034
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 04:05:27 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id e61so9842232qgf.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z3dfeO6WzgzUikOVeIEFesAhin14q8KyvxCiiYoQ61c=;
	b=bCTsr5u07rWl6EYxrllEgSCWKMR9r2KJG3TJQXQ1EROZhEvZ8wExwb+TaXGAngQSHx
	+jAYMdLINIC2cqzC1KYYtnAqQ/LNlGKfD1ckbjZrkaaZ2S/O19QqOcOKRc4nv7PovLB1
	GXLGYkHTqHmKnWIRCAkeLRCbO0CsuoG46j9ltCyfhtgXg2N361xSzE9m3mKfPHhROXnH
	DLvpdiPByy6mz8K3QtcjtASQMqvs/UffRJZmjD9GGfgUpmjgtaCkxduy7PraDe03cjOs
	n3sWoyui7NPjZFohLmEafJXwakdXMU4LA5jUZo5tdQwLCbta0LSb0rWBrpO2XYsDS3nK
	8hOw==
X-Gm-Message-State: AG10YORnmDpTDXlxz/RbSZ2OmMqDkY63AjKFiEPwi9SzwC3KX6XqQyRSAc141E3tD9csdA==
X-Received: by 10.140.239.66 with SMTP id k63mr19108097qhc.11.1455509128001;
	Sun, 14 Feb 2016 20:05:28 -0800 (PST)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	s64sm10387543qgd.28.2016.02.14.20.05.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 20:05:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Feb 2016 23:05:16 -0500
Message-Id: <1455509118-16863-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455509118-16863-1-git-send-email-derek@asterius.io>
References: <1455509118-16863-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH v2 2/4] Update python3 recipes to use the updated pypi class
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
X-List-Received-Date: Mon, 15 Feb 2016 04:05:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb | 2 +-
 meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb   | 2 +-
 meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb  | 2 +-
 meta-python/recipes-devtools/python/python3-flask_0.10.1.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb    | 2 +-
 meta-python/recipes-devtools/python/python3-jinja2_2.8.bb           | 2 +-
 meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb        | 2 +-
 meta-python/recipes-devtools/python/python3-pymongo_3.2.bb          | 2 +-
 meta-python/recipes-devtools/python/python3-redis_2.10.5.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-requests_2.9.1.bb       | 2 +-
 meta-python/recipes-devtools/python/python3-six_1.10.0.bb           | 2 +-
 meta-python/recipes-devtools/python/python3-tornado_4.3.bb          | 2 +-
 meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb      | 2 +-
 meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb         | 2 +-
 meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb           | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb b/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
index dfdd6e9..70f674b 100644
--- a/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-certifi_2015.11.20.1.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-certifi.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb b/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
index 5d46954..2d23fe1 100644
--- a/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-login_0.2.11.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-flask-login.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb b/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
index 19d33ff..2102554 100644
--- a/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-pymongo_0.4.0.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-flask-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb b/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
index 1ab2c02..cd43990 100644
--- a/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_0.10.1.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-flask.inc
diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
index 8c791cc..cd30825 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_0.24.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-itsdangerous.inc
diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb b/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
index e2f9c1e..61156b6 100644
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
+++ b/meta-python/recipes-devtools/python/python3-jinja2_2.8.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-jinja2.inc
diff --git a/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb b/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
index 1271832..18180a0 100644
--- a/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-passlib_1.6.5.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-passlib.inc
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
index d2cfd55..5164b18 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb b/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
index 59c4803..b192ed8 100644
--- a/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_2.10.5.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-redis.inc
diff --git a/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb b/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
index c2eb056..e5220fa 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.9.1.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-requests.inc
diff --git a/meta-python/recipes-devtools/python/python3-six_1.10.0.bb b/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
index 2bc5bc5..7f76157 100644
--- a/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-six.inc
diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.3.bb b/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
index 21a4300..eecc1f0 100644
--- a/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tornado_4.3.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-tornado.inc
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
index 6386664..af2d86a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-werkzeug.inc
diff --git a/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb b/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
index 91f7018..5d8af30 100644
--- a/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-whoosh_2.7.0.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-whoosh.inc
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb b/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb
index 407346f..b7bd969 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb
@@ -1,2 +1,2 @@
-inherit pypi3
+inherit pypi setuptools3
 require python-xlrd.inc
-- 
1.9.1


