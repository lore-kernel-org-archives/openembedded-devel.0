Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 407BC78733
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 16:03:50 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z10so11080151qti.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jan 2018 08:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AYMCV2lv+3I3KUZMg3hl5tdHDPJhFguVPa8aRtRnZn8=;
	b=rDyGYfxJOPIUgiIMfiB2FzVKoIhWsnIzUUJIRUkalHkH40J0ZMVT+3M4yDQwC37nG2
	liieOEulkWUpqGviYM1xC8bD2rOf6mnOQzQY2nOvBBR9CYI1Xg5ZjpsNUZQOVD8EhUdA
	WHtBkVx+M12fYtFi6Yfg964YoRbkS+zJQIitJpRdM7IL4fTKHKWrT/4oxqTLMrU1qQtU
	JVW3UwQJg0uQ1KOmtxwvxpxtY8tTrS+pBYUOpof41JJ0knT4tlOnWvklU+1oVBMSSUuf
	RGitbBxY8QUIPQwFWo3cj+Fca/tyt+vIM//sfHlHj5JY2JHIzjaBhLUMtycAGXpb4WXp
	8d1Q==
X-Gm-Message-State: AKwxytcY2NvYQZaydnRNO8qVY88tqrAgSP+KZkLk0CmBfRvOtdDDxfN+
	wNVVzMnxZNcDTi6+KKxNNGlCcSn3
X-Google-Smtp-Source: AH8x224zWUZJhHG6xAsWJ2Y4WI3f9UepOcRzs788lM3rqSih3EquHPQ9URwnxczVqGe7gY6R8t9UmA==
X-Received: by 10.200.19.130 with SMTP id h2mr2960140qtj.155.1516464231909;
	Sat, 20 Jan 2018 08:03:51 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	e68sm1907976qkc.77.2018.01.20.08.03.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Jan 2018 08:03:51 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jan 2018 11:03:45 -0500
Message-Id: <1516464225-16986-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-alembic: update to version 0.9.7
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
X-List-Received-Date: Sat, 20 Jan 2018 16:03:51 -0000

Update RDEPENDS for mako
Update license checksum for copyright date updates

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-alembic.inc         | 10 ++++++----
 .../{python-alembic_0.9.6.bb => python-alembic_0.9.7.bb}       |  0
 .../{python3-alembic_0.9.6.bb => python3-alembic_0.9.7.bb}     |  0
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_0.9.6.bb => python-alembic_0.9.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_0.9.6.bb => python3-alembic_0.9.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index 2ca6023..dfaf882 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -1,13 +1,15 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d07407716fd24408b5747b0fa2262775"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c5f1361296835ff94bda73db7dd312a6"
 
-SRC_URI[md5sum] = "fcb096bccc87c8770bd07a04606cb989"
-SRC_URI[sha256sum] = "042851ebe9efa07be6dc1395b1793b6c1d8964a39b73a0ce1649e2bcd41ea732"
+SRC_URI[md5sum] = "3e82bbe325464fd542ab4cc44929c813"
+SRC_URI[sha256sum] = "46f4849c6dce69f54dd5001b3215b6a983dee6b17512efee10e237fa11f20cfa"
 
 PYPI_PACKAGE = "alembic"
 
 RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-dateutil \
     ${PYTHON_PN}-editor \
+    ${PYTHON_PN}-mako \
     ${PYTHON_PN}-sqlalchemy \
-    "
+"
diff --git a/meta-python/recipes-devtools/python/python-alembic_0.9.6.bb b/meta-python/recipes-devtools/python/python-alembic_0.9.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_0.9.6.bb
rename to meta-python/recipes-devtools/python/python-alembic_0.9.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb b/meta-python/recipes-devtools/python/python3-alembic_0.9.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_0.9.6.bb
rename to meta-python/recipes-devtools/python/python3-alembic_0.9.7.bb
-- 
2.7.4


