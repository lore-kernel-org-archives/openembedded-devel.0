Return-Path: <bill.randle@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A8A66786EA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Dec 2017 05:13:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id p84so5549221pfd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 21:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ts67ehOBSspbo4l6zZc9EcYXN9h+dxNQjT5ZO0dczS0=;
	b=THbrJx8NzM8fkfBZScqA+DfY0365VVnwNY2ZYoTisj7bqwKprz4d4UXhAZGs61yK3e
	+tlCAn+0f+O8jkPBxv64put7lz1nSApSt2RrRw45h3j8FKwYLzrIa1Wxndot8HovmBvE
	XxI9Pi4lT9zIOT2FEEBYfpy3L/DPO50P7rw5tuydQdrwveGCgVigs5W+V9jcSZCGgeb7
	6Sfl/ztM4HoLDi9d0y9NlrMtr1wXFfqoku6qvzbCcwMKAY42GqRRTajGJ961IX2OSsuS
	oIQwYpgU3amkdSnFOHqrBWKFY5yz5MkNeXtKYfJftLx1LzyDpYT4nzk4qaBNNN+nqqDJ
	ohAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ts67ehOBSspbo4l6zZc9EcYXN9h+dxNQjT5ZO0dczS0=;
	b=O9QyjDFH6N58211ygQyKqZnxbt7bkslgOMIxSWMR7iLbCaVW61/aA6gRnLGw8jJPiH
	WxiGRdFNhIB/0toRQMA2R+lawbWk4WaY/ugpznBiSmnVGcZdttJP9GkruvU0GTjm2Tpx
	4iqty52mvnv+WppwajH+9brXjz2bfq4qA5xiYtZ6YfcFz+j1t/7jlp6Pl9TrtILVrAm3
	rzWdgUBIzETSP8frSkm+t634Xfa/lqdZrgUqqug9w9CntFste3KOGF9pAxGTmDZqTp9Z
	Hgz3qtJlOnuCdKwBAKYmbCA13g1/zxWtlkhs3MiDqoRM4TOpq5nupA+uS1Dm5WDqtzZF
	mMvg==
X-Gm-Message-State: AJaThX7JqTBqPT3fg9kPFWx+pd5cM9jdDC9ZKyGriMWSWff53swSPCY/
	6EJCHA0A3mavo9wAdoDGOV2/Eg==
X-Google-Smtp-Source: AGs4zMYC81lM+VbClB8vqkd/qBd6mJZXQJi38GUxjFN1sDHjUbiDIKSFUotQO3V3kpSjk9wM5HKzVA==
X-Received: by 10.99.171.13 with SMTP id p13mr3233837pgf.30.1512191592573;
	Fri, 01 Dec 2017 21:13:12 -0800 (PST)
Received: from neosoft.neocat.org (184-100-225-25.ptld.qwest.net.
	[184.100.225.25]) by smtp.gmail.com with ESMTPSA id
	r1sm14681137pfg.98.2017.12.01.21.13.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Dec 2017 21:13:11 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Dec 2017 21:12:48 -0800
Message-Id: <1512191576-2302-6-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
References: <1512191576-2302-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 05/13] python[3]-flask-uploads: new recipes
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
X-List-Received-Date: Sat, 02 Dec 2017 05:13:11 -0000

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


