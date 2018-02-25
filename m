Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id BF5CD601F1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 20:22:41 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id g14so16547744qti.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 12:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RrKfQOTiBJsKbRPr4XwYlFFxGi6IVQ5jxHaj5efDP6E=;
	b=RgGhou6TVuW1/M/e0I/3bp5EP4y/YflAfbAoc9HlGt5n6fyZdxiPmtofwRa5KdMb4U
	+puvNlqk/NoXclhaJU6pVX/DMR7KApvHbyUkH+gGUtrVc2YM6BhyNs9t4w1DeCuKxFFG
	DHJxsQTWzphWbF8cnoxL9p3VSlZGGCtZb2W8Enohe/hV8mBMsV0ZvnJVWCCirEUhzWhv
	1wzyp+yUKhQYug4cDS7ZZxc08zBolZ4YDZmI40yS8l/SDnnnCsX4acOFUKnRMfRPK8VH
	TBZrnpIIneS2MequuSJIqg+yEQdWQXLQye1aEE43twGI0pOaI5Arr8LizmACUYVJHx/w
	t2OA==
X-Gm-Message-State: APf1xPDm4Jde0mFiZlzCkIxg0mm1pYP5y64UpGtox9sT9vLGyuh2tQZW
	GYAs3ctxFfwcYoTh4dY6w8+snWZi
X-Google-Smtp-Source: AG47ELscRfaOX8IkHd/FC0Pdj+plU+dBa41gH0OTVaHgb1+J6Wzo2exXE/Mxs644/svxw7Zx1VfFyA==
X-Received: by 10.200.54.39 with SMTP id m36mr14608683qtb.304.1519590162452;
	Sun, 25 Feb 2018 12:22:42 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	r22sm4956446qkr.21.2018.02.25.12.22.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 12:22:42 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 15:22:33 -0500
Message-Id: <1519590153-7797-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-alembic: update to version 0.9.8
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
X-List-Received-Date: Sun, 25 Feb 2018 20:22:42 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_0.9.7.bb => python-alembic_0.9.8.bb}       | 0
 .../python/{python3-alembic_0.9.7.bb => python3-alembic_0.9.8.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_0.9.7.bb => python-alembic_0.9.8.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_0.9.7.bb => python3-alembic_0.9.8.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index dfaf882..f1a6412 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5f1361296835ff94bda73db7dd312a6"
 
-SRC_URI[md5sum] = "3e82bbe325464fd542ab4cc44929c813"
-SRC_URI[sha256sum] = "46f4849c6dce69f54dd5001b3215b6a983dee6b17512efee10e237fa11f20cfa"
+SRC_URI[md5sum] = "5cfef58641c9a94d4a5d547e951a7dda"
+SRC_URI[sha256sum] = "13b8611788acf0d7b617775db5c2ae26554a6d4263c590ef628d448fd05aef56"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_0.9.7.bb b/meta-python/recipes-devtools/python/python-alembic_0.9.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_0.9.7.bb
rename to meta-python/recipes-devtools/python/python-alembic_0.9.8.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_0.9.7.bb b/meta-python/recipes-devtools/python/python3-alembic_0.9.8.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_0.9.7.bb
rename to meta-python/recipes-devtools/python/python3-alembic_0.9.8.bb
-- 
2.7.4


