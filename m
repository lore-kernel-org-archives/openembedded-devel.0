Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id D155778650
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 13:40:49 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id g5so4264471qth.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Mar 2018 06:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HNVJ+E0BnjFo0ho03dZpHe8LKoNqRDzv32j+3xxhk6c=;
	b=J3/Wnsm0enytJGWNojvLu3+YAnN8BuT1inKPCWpuLWM/B/8ateccqclYRIQ9hXO4Aq
	Veq9QFyhT/baz9FUKzhXMPAeg6uRT8dDfsHDWae4N5DMQh1vRDxkhuN4sVYi3oxTGHSj
	B/uwrLTDH7zufShAR+5p9nrG9DpcwARowWyFQ1ZNE5FZZrv9ITJ4JKCY/nHzeradEhO5
	F1mIGJ1rXci2v5cbiUYjSpqKIv48MjSzSPKJLfus/wTBKwvcnksWzw6lOfvPqo9hHEOL
	0glo3uQoI4ewrxwZ2rsSUnXiG6ProvLneSbGs78tt8go59D2E6/j+1IrBO8ZIX85KP5q
	1pfA==
X-Gm-Message-State: AElRT7H9lO+Vmh2HWVyLmP9k/QbtGZSn4BLQ12vxRiT0MHkzA1djppt9
	JL8pBxrrkVB+oFotOkzoJQgbaDP1
X-Google-Smtp-Source: AG47ELtBuWA0+FFR3iH8RvzzpYU5QBKmp2ube767JDEAzT0Cu+aUnqSmTxbgMNakd8qe0HCJjKxK8Q==
X-Received: by 10.200.26.251 with SMTP id h56mr46326037qtk.223.1521898850415; 
	Sat, 24 Mar 2018 06:40:50 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	m24sm8260314qtc.81.2018.03.24.06.40.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 24 Mar 2018 06:40:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 24 Mar 2018 09:40:41 -0400
Message-Id: <1521898841-1212-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-alembic: update to version 0.9.9
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
X-List-Received-Date: Sat, 24 Mar 2018 13:40:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-alembic.inc                | 4 ++--
 .../python/{python-alembic_0.9.8.bb => python-alembic_0.9.9.bb}       | 0
 .../python/{python3-alembic_0.9.8.bb => python3-alembic_0.9.9.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-alembic_0.9.8.bb => python-alembic_0.9.9.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-alembic_0.9.8.bb => python3-alembic_0.9.9.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-alembic.inc b/meta-python/recipes-devtools/python/python-alembic.inc
index f1a6412..5e7f3de 100644
--- a/meta-python/recipes-devtools/python/python-alembic.inc
+++ b/meta-python/recipes-devtools/python/python-alembic.inc
@@ -2,8 +2,8 @@ DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c5f1361296835ff94bda73db7dd312a6"
 
-SRC_URI[md5sum] = "5cfef58641c9a94d4a5d547e951a7dda"
-SRC_URI[sha256sum] = "13b8611788acf0d7b617775db5c2ae26554a6d4263c590ef628d448fd05aef56"
+SRC_URI[md5sum] = "c74c6b8b3b2c405b48a9bfeed9a0bd2d"
+SRC_URI[sha256sum] = "85bd3ea7633024e4930900bc64fb58f9742dedbc6ebb6ecf25be2ea9a3c1b32e"
 
 PYPI_PACKAGE = "alembic"
 
diff --git a/meta-python/recipes-devtools/python/python-alembic_0.9.8.bb b/meta-python/recipes-devtools/python/python-alembic_0.9.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-alembic_0.9.8.bb
rename to meta-python/recipes-devtools/python/python-alembic_0.9.9.bb
diff --git a/meta-python/recipes-devtools/python/python3-alembic_0.9.8.bb b/meta-python/recipes-devtools/python/python3-alembic_0.9.9.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-alembic_0.9.8.bb
rename to meta-python/recipes-devtools/python/python3-alembic_0.9.9.bb
-- 
2.7.4


