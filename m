Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9A1A2786F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id k134so5369157pga.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pwixQW6OdoteleWsxCaaHSLOSR81+/4j6rO1rhnVUCc=;
	b=g2PuCdEFiMcrlsvOQ+Ju2HK7gagIi5LAhpYP6ZQkHmOkJgCdsugx4Y27UFBFy0n+cB
	G3PLx0OQqX62/fzV/6fzq9584msGXSfT4upZpOx3wf58jUAj8Fgm8t0Cc9fAYpZjbxY6
	1EgHXvlqvjbDJECYtl9q3+sMfN6Oe2UAJaaTv0YOvtT4l6DPbUnI8hLRqX7GZUDjcouW
	Niwnspu+WwJlvzkhICd2ealfbqyfi/Vw45GqjWS7tGmOHO8z33KsngWdwcE2tFwI0O9R
	EZXCejbRDLtFxvA/A7dLmmn5MO8us8/PZ010J9kn1yhM3HP6QNEryHEK1RNyeu+zDm67
	inQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pwixQW6OdoteleWsxCaaHSLOSR81+/4j6rO1rhnVUCc=;
	b=Sme7sYxTNG6mo05ci8+oAjmZ66eMDR2IQeiqtZlQeuaHceqcR4EnV1Vi9GlE6q4vbL
	wJK87bsVgwTDN+3qAhYTj+ZjpcrTui0gO/60Nn4HR/RSpEE5ZiP4JYV2lxjeSxO16eZD
	mYML9pW+xkVcabrIxj0cSCcoJ1K0iP8sZ+eD33mVeq9CfJxT5+WO4+fCv04F0fL+aMtI
	4eTCLGV43wnbQJqWKHjyGzP/OkoC977fClbiGWhAK1gJ7y5c4TSZN0uXL2sEA6zr+HU/
	JjgaBcrGF22C+7DzPV27kSTfshIR0HBRjNyiW3eZKmnSW5DJbzyN0wdYz8PJcDh9XKE2
	1A5Q==
X-Gm-Message-State: AJaThX5hHijT4AtmatRiEO6I5yT9eso5dOqb+7XmvMbcWs9uo02HdN1Q
	dvji3ZHrCFex9VmIWglQCUn4pg==
X-Google-Smtp-Source: AGs4zMYulMlJ0QYz0DOYAwEv5iAhEGxqEonVKtaqTnXcA8Jn+6LFzuXyugXW3WM5yawYa+6ni1MAlw==
X-Received: by 10.99.176.76 with SMTP id z12mr7929269pgo.358.1512191591575;
	Fri, 01 Dec 2017 21:13:11 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:10 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:47 -0800
Message-Id: <1512191576-2302-5-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 04/13] python[3]-flask-nav: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:10 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-nav.inc    | 13 +++++++++++++
 meta-python/recipes-devtools/python/python-flask-nav_0.6.bb |  2 ++
 .../recipes-devtools/python/python3-flask-nav_0.6.bb        |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-nav.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-nav.inc b/meta-python/recipes-devtools/python/python-flask-nav.inc
new file mode 100644
index 0000000..932ccdf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-nav.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Easily create navigation for Flask applications."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2729ee82259d601d90d28b0574d12416"
+
+SRC_URI[md5sum] = "4d51cfd06d58f8d0fe85775a6696c0e5"
+SRC_URI[sha256sum] = "44e40b755380a1e68ab521a2f9174de259a2c94ddcdaabf36b3aca2e110a33f4"
+
+PYPI_PACKAGE = "flask-nav"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-blinker \
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
new file mode 100644
index 0000000..30b5b3b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-nav_0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-nav.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
new file mode 100644
index 0000000..d251152
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-nav_0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-nav.inc
-- 
2.7.4


