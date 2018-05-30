Return-Path: <f.forstmayr@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D826D6006A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 May 2018 06:21:07 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a8-v6so45503188wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 23:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xhVMYtdIcg0bd684HI8rKGtsubha9C3yvXbSjVHnayA=;
	b=CFTiWxqjcSGNbjYs0GK2PMKAO1XZ3b/b6Aox2/U/9vPu3fgtwSurMOh/oM3T9ZMipf
	kwFlzWuyugaAfsd+TpZ9D4+zbIZmWIfK4NtlmTnt250oFknZaPBRjiUxIOO9nIjpgsgL
	+kDIGnIhrgDWfOmvy2Ayh9zUbHhUmm2ZFv8jyilMUM4m9Dx7w2RNuvkQY4/SgZmc3EnP
	DSt0KFJ8u4cLq/WtNdUFMcW+atL7g4hcDH2dMDoGYiO7Sh46iwKbxpubO+isgBjkDWCu
	aw8CIPtlSRBDv4O3tta2s9YA9pTaR9RsTPJ+H480lW8tZ+Ldmgzl/J9ta70toEWOqd8R
	Tubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xhVMYtdIcg0bd684HI8rKGtsubha9C3yvXbSjVHnayA=;
	b=Y/JbA5BXHI/HUxvafikuGYe2A+MpGitt+SwhtfMPg7c64XFbyo4SXMr814Dvdl16bO
	50RbmNfaMmBjamPoP82jXqJzi7D0BglNFI7f0Ypz+VENLoiEtgIYjcD4kRAJfogsixLe
	WbtgD3Bd8VwAFkbjRolQjDBCLcna8dmBNiWopefkTYFbYHSQkgIaQXIU3I+iM/ICwZQc
	l/BTar7AJUEdKexYPRD5jMu9iykBogWSqDovDW2hWYYe7q1bJqzd7fs3bcHB+o3ZlhFa
	d2D/FcwAglJhop/4w0fbLkdIL85ieRGQJ9M6+NZzBcadyo6SEDPait06FcrfL8jgwAKY
	crPw==
X-Gm-Message-State: ALKqPwebeNwxexIYyTLUvprhh21g0N140Y+xNs9mvc7S292jXyI7iuBB
	z04oPk8uUj6jpmYTfA8VDgTWig==
X-Google-Smtp-Source: ADUXVKIWB+dD+jM5QoBI/w8xijF/J5th5q0yuWAbQKjYrQ6XPzQ9kwYI98PyZQVuN1fFHclRkQ6xBQ==
X-Received: by 2002:a1c:b484:: with SMTP id d126-v6mr448286wmf.0.1527661267981;
	Tue, 29 May 2018 23:21:07 -0700 (PDT)
Received: from localhost.localdomain ([212.68.101.163])
	by smtp.gmail.com with ESMTPSA id
	x16-v6sm14972595wmc.42.2018.05.29.23.21.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 23:21:06 -0700 (PDT)
From: Franz Forstmayr <f.forstmayr@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 May 2018 07:40:28 +0200
Message-Id: <20180530054028.24766-3-f.forstmayr@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180530054028.24766-1-f.forstmayr@gmail.com>
References: <20180530054028.24766-1-f.forstmayr@gmail.com>
Cc: Franz Forstmayr <franz.forstmayr@rosenberger.com>
Subject: [meta-python][PATCH 3/3] Added python-flask-sijax package
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
X-List-Received-Date: Wed, 30 May 2018 06:21:08 -0000

From: Franz Forstmayr <franz.forstmayr@rosenberger.com>

---
This patch adds the Flask-Sijax package. This one requires Sijax from the previous patch.
 .../recipes-devtools/python/python-flask-sijax.inc        | 8 ++++++++
 .../recipes-devtools/python/python-flask-sijax_0.4.1.bb   | 4 ++++
 .../recipes-devtools/python/python3-flask-sijax_0.4.1.bb  | 4 ++++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-sijax.inc
 create mode 100644 meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python-flask-sijax.inc b/meta-python/recipes-devtools/python/python-flask-sijax.inc
new file mode 100644
index 000000000..ff4e70a53
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-sijax.inc
@@ -0,0 +1,8 @@
+DESCRIPTION = "An extension for the Flask microframework that adds Sijax support."
+HOMEPAGE = "https://github.com/spantaleev/flask-sijax"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
+
+PYPI_PACKAGE = "Flask-Sijax"
+RDEPENDS_${PN} = "${PYTHON_PN}-sijax"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb
new file mode 100644
index 000000000..74738fc2f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-sijax_0.4.1.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools
+require python-flask-sijax.inc
+
+SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
new file mode 100644
index 000000000..e9a65c4ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools3
+require python-flask-sijax.inc
+
+SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
\ No newline at end of file
-- 
2.17.0


