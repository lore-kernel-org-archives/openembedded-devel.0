Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id AD66076C9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 123so469024wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=9vPTRMgZXueJj2tad13WA+6Yqv98U6YBNuw/XRgrUks=;
	b=uVKZtoOMbtGwV58jbvJwcnhu/6K1Nn54s6zOV69XzTdIt76fgGQF9O4K3dlRStpw+c
	lIvltzfuTakrRJQwl1UwfJymhJwZtUfE+S5x1iMPpnx7YdiyQKkmRrrQQeGD7E1onHnH
	g/+JXvFYW7ij1ufGPiERP+pUw8QpRzEBGcryXgKiujFXniORld79QD0tnpj7Hq+D2hSo
	me5wEKOJJZYaM4ZEunWAdD/HX9KHrPAxTErAeO9NfFm4gHx/FP2SypRx4g8ZcqUGt447
	Laz9s221SJM/2S6h5nc24jU9Pv7EW0s4s3c4pDaUBUaYr9l2wg/fqUqBF1sIiqjTU27p
	56Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=9vPTRMgZXueJj2tad13WA+6Yqv98U6YBNuw/XRgrUks=;
	b=DJfAXjdn2qkl1QOF8mGxdKWh4Bm1PS2pagxHnWxhHoshTSQSChTfgCayyWiI8a08Vr
	u9P2terbWCErgo74Ls6DpHZr6efgoajemIg/m+wAt58UitCqBJGUK0plbX+WADs1FfK4
	sxNkYGwo4FYoyQFH1Wb7zPXcciRY2J3PybeSvI0fdFOlNwsSRZrODlGMAx0uGiqMY7p+
	+1PbskDZMYxzM7JMI3HMnKP5ZLaUAzLMq5PSDQTEj8ceyQimA8R6RoqyiKAQo1EQEcSO
	yclBxMUsIdtsZLi0YDu/3Laea4Mq36IecWE/AFExdiXvScrYmpIQoQZJKuj8Y77NY1Nn
	4Fxg==
X-Gm-Message-State: AG10YORPxQyUc08xr5dVbk2hBTC5oLvd0EdWFv7UZsA4OIgLU0c6/sIKUY4xqflzgKVOsQ==
X-Received: by 10.194.134.134 with SMTP id pk6mr5679312wjb.176.1453505455174; 
	Fri, 22 Jan 2016 15:30:55 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:54 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:13 +0100
Message-Id: <f2494291f5cd7d53bf2f391adb2b46967933d4a4.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 11/21] python(3)-werkzeug: add recipe
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:57 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-werkzeug.inc  | 16 ++++++++++++++++
 .../recipes-devtools/python/python-werkzeug_0.11.3.bb    |  2 ++
 .../recipes-devtools/python/python3-werkzeug_0.11.3.bb   |  2 ++
 3 files changed, 20 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-werkzeug.inc
 create mode 100644 meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb

diff --git a/meta-python/recipes-devtools/python/python-werkzeug.inc b/meta-python/recipes-devtools/python/python-werkzeug.inc
new file mode 100644
index 0000000..fab5a73
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-werkzeug.inc
@@ -0,0 +1,16 @@
+SUMMARY = "The Swiss Army knife of Python web development"
+DESCRIPTION = "\
+Werkzeug started as simple collection of various utilities for WSGI \
+applications and has become one of the most advanced WSGI utility modules. \
+It includes a powerful debugger, full featured request and response objects, \
+HTTP utilities to handle entity tags, cache control headers, HTTP dates, \
+cookie handling, file uploads, a powerful URL routing system and a bunch \
+of community contributed addon modules."
+HOMEPAGE = "http://werkzeug.pocoo.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a68f5361a2b2ca9fdf26b38aaecb6faa"
+
+SRC_URI[md5sum] = "9479bc7ea6a42c2d0d82929d3926df67"
+SRC_URI[sha256sum] = "eb5f700a9bfc96420b055635af9002d3662e43d80c3ffd31f224c25bc0d5f462"
+
+PYPI_PACKAGE = "Werkzeug"
diff --git a/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb b/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
new file mode 100644
index 0000000..2e1d9e2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-werkzeug_0.11.3.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-werkzeug.inc
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
new file mode 100644
index 0000000..6386664
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_0.11.3.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-werkzeug.inc
-- 
1.9.1


