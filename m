Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8EAC278933
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Mar 2018 14:59:45 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id v90so15393606qte.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Mar 2018 06:59:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=z3e9E5QmVf8CiFzwH5/QvIbOrXQbGZgNzjUBe0tDU9M=;
	b=B46h3spRkZv0ILyq7HnUjBZKDW70uzIq/q3gogKMbzXo4BiN1R7SE2sjSMOdmomkQp
	rUtn2pHuPeVZxDkabS8LMRaUFihrGVERlQeIuWpB4kbBjss6K0KI7WKAJe+hojZVJSK9
	qjAwL5baCt9J0kONibM17vkPZNHYa7aaIj3xtWcB52IcWDJ5pO4YdlHVihAkyJ3LkjMB
	0xlM62PxnvL5HuDzYGQj/vlsQ+NGN6/LzurqfUvPRNIOaJvz9ePZwaK/OZRt+auYiQCB
	80PwlEnh6T1CUDnQhFuGKwa6M8PWcFZPLR+okhDB8ym4TCdwydPx7rDh+ygRwkyW6iMI
	967g==
X-Gm-Message-State: AElRT7H0YF2+Oj9Gp3H3RPxlArShCn5xxiibvDHNntMUXPvHD5YpSNeT
	5UGfMaqnOkmLQjAyDHkX7Kv0oCnV
X-Google-Smtp-Source: AG47ELvJW2nuI4obnEx7WoIaZsqIs6Z+XgOnOsyjHkHedsu6JZKji8pjv5U9uqHG48LIeIdNg+YUQQ==
X-Received: by 10.200.46.6 with SMTP id r6mr14176789qta.8.1520089186283;
	Sat, 03 Mar 2018 06:59:46 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n19sm6336100qtk.56.2018.03.03.06.59.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 03 Mar 2018 06:59:45 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Mar 2018 09:59:30 -0500
Message-Id: <1520089170-25302-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-sqlalchemy: update to version 1.1.17
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
X-List-Received-Date: Sat, 03 Mar 2018 14:59:45 -0000

Update the license checksum for copyright year and verify the terms remain the same

diff -u SQLAlchemy-1.1.15/LICENSE SQLAlchemy-1.1.17/LICENSE
--- SQLAlchemy-1.1.15/LICENSE	2017-11-03 16:47:01.000000000 -0400
+++ SQLAlchemy-1.1.17/LICENSE	2018-02-22 16:08:41.000000000 -0500
@@ -1,6 +1,6 @@
 This is the MIT license: http://www.opensource.org/licenses/mit-license.php

-Copyright (c) 2005-2017 the SQLAlchemy authors and contributors <see AUTHORS file>.
+Copyright (c) 2005-2018 the SQLAlchemy authors and contributors <see AUTHORS file>.
 SQLAlchemy is a trademark of Michael Bayer.

 Permission is hereby granted, free of charge, to any person obtaining a copy of this

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-sqlalchemy.inc           | 6 +++---
 .../{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb}    | 0
 .../{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb}  | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-sqlalchemy_1.1.15.bb => python-sqlalchemy_1.1.17.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.1.15.bb => python3-sqlalchemy_1.1.17.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy.inc b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
index 2683a6a..0c191ae 100644
--- a/meta-python/recipes-devtools/python/python-sqlalchemy.inc
+++ b/meta-python/recipes-devtools/python/python-sqlalchemy.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "Python SQL toolkit and Object Relational Mapper that gives \
 application developers the full power and flexibility of SQL"
 HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=452f4b8adb0feba42e5be5f1fbfbf538"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1c412c9d8d1ce018f7a9374407c22bb"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi
 
-SRC_URI[md5sum] = "077f9bd3339957f53068b5572a152674"
-SRC_URI[sha256sum] = "8b79a5ed91cdcb5abe97b0045664c55c140aec09e5dd5c01303e23de5fe7a95a"
+SRC_URI[md5sum] = "03db1c8f8ae911977c0bf3950a4c9c21"
+SRC_URI[sha256sum] = "6b55ec379c11ad696f9371ce8e0de93c7f21134323f56a56a1b0d8fbef17013c"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-json \
diff --git a/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-sqlalchemy_1.1.15.bb
rename to meta-python/recipes-devtools/python/python-sqlalchemy_1.1.17.bb
diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.15.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.1.17.bb
-- 
2.7.4


