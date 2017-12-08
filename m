Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 432D9786AC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Dec 2017 05:49:28 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id f12so6178136pgo.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Dec 2017 21:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ts67ehOBSspbo4l6zZc9EcYXN9h+dxNQjT5ZO0dczS0=;
	b=R1rFWkOCFqviWGpOpvHtgLrXC1SZaCqUlv4yA5uUvbKyWlsmRExZA2FBG8j1X5ATg+
	y8egLUh3KHGp+7Y1HCMuEdVwBCC4qoihgG2+9JUU10y4UMR9C5D/XmWP3rixGMjUL/yA
	4J+pasj8a/J41r3k9MtPsmCOxUzT4uJlc2Pyk3mz692OdYGhEvqi4o55urwIvNGmRSy8
	9f/MwmsXjTj0+SsgpkToURvVzhf04sDet/yYZXkBRs8psFNZOJ6NKCud1R13dNspq/sa
	3TIcvLWmB99koFkgJeV8X+2R0D5ymKmxUQ9ViFaSLxms3O6OwzddCVP8+c0ey4cRZRpR
	JIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ts67ehOBSspbo4l6zZc9EcYXN9h+dxNQjT5ZO0dczS0=;
	b=Bql8BrL0/0jwTbSP2c6q2sigS/DEWJdXZa/F+8eWjpJOdRwClJokFRSZlaDG2MCtVF
	v8BE0qpTCB+3uH6vvpSce2MJJQ0BR55i8TDTVuDB9cEpeV1JycFRKGknfWpQlgEkP6Wd
	gwrX0onmSkL21B/GlDD507aMNAFWZv/jnE4JN3gjm8ULp0QvLKzu7gEQC2N3WCIVyKog
	JsQ+RfdyQRwrUs5VYE6IhD21fwWGvQCwTlJWkcPyCyFayJmyynK+9DqI8JWLwq+gaGkr
	30DxRDXHbD6S7dXedNC4TgTwRemayfsGgDxQjsIG+LzzuhbC2BYfNFWQ/D/JXi/RsX02
	LnYA==
X-Gm-Message-State: AJaThX5/3n0UkP+1qqbwGknsvW3TTcr2adg5FvJypPwQBFCOQgkHQfMe
	VNX7MWCu970M/gtLAkoE3hUx9w==
X-Google-Smtp-Source: AGs4zMaStiOoZUaOHc8diAueoXDEryXA0JBJorE5KxEMOawhtVYBbuLjpy/jZv2KLgx6B6JnKe8qfA==
X-Received: by 10.99.158.18 with SMTP id s18mr27686921pgd.176.1512712169410;
	Thu, 07 Dec 2017 21:49:29 -0800 (PST)
Received: from neosoft.neocat.org (67-5-135-101.ptld.qwest.net. [67.5.135.101])
	by smtp.gmail.com with ESMTPSA id
	y5sm12500814pfd.63.2017.12.07.21.49.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Dec 2017 21:49:28 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Dec 2017 21:49:03 -0800
Message-Id: <20171208054911.27014-6-bill.randle@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20171208054911.27014-1-bill.randle@gmail.com>
References: <20171208054911.27014-1-bill.randle@gmail.com>
Subject: [meta-python][V2 PATCH 05/13] python[3]-flask-uploads: new recipes
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
X-List-Received-Date: Fri, 08 Dec 2017 05:49:28 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-python/recipes-devtools/python/python-flask-uploads.inc | 12 ++++++++++++
 .../recipes-devtools/python/python-flask-uploads_0.2.1.bb    |  2 ++
 .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb   |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-uploads.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-uploads.inc b/meta-python/recipes-devtools/python/python-flask-uploads.inc
new file mode 100644
index 0000000..cd7ac1a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-uploads.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "Flexible and efficient upload handling for Flask"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
+
+SRC_URI[md5sum] = "e5eee34aa92b64a4d22847672b3858a1"
+SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
+
+PYPI_PACKAGE = "Flask-Uploads"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-flask \
+    "
diff --git a/meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
new file mode 100644
index 0000000..d39b07f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-uploads_0.2.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-flask-uploads.inc
diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
new file mode 100644
index 0000000..758c2ac
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-flask-uploads.inc
-- 
2.7.4


