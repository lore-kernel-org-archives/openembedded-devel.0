Return-Path: <net147@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 20034782F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:49:48 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b192so1345989pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 05:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M9Oloyw1nCM9DneDIn49R0axc7jph6Xv/3caHNYCOmY=;
	b=rwA0g/WJN9D3LF68l2iCuPm0yMpRg1piJSNkqwYjyrsabc3G2rS2KGvmFGNo6dNyba
	aGZOwR5/vyJui4ZSfTtHQP4OYfVvEXxJle6klJyXTdrB9IyiTbmNyYerZFftVjO7FF5w
	Y0btUGh/gkzwJyc7fGJjr03NE2+u8UoeguePDwah2UCr8Oc8qCIVGHnqVvCT5V10RbLO
	pC0zkpgdaG8kr0q55tJEoXH5NLjGTcroZrL/6+gMgjCpCwNm4iwUH/gTKqw3bTOqLDkV
	YXTYM/+6fsqJqwbNgPbSjPPGQblEEOh7YdBlDBPLYz5Jyur9bL94qIjs2shMcc8UXkwS
	LUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M9Oloyw1nCM9DneDIn49R0axc7jph6Xv/3caHNYCOmY=;
	b=d0mU7UN1IdOj/+nVjCK9A/PpGiyI06udGB8w1NcQGS9aJ/u30j8Ef6iRV6ZMdgxDZ4
	QLe4zLECnY8qx12bOqA89YNG79lNmIoXBvj8oZeFE9jKm7sNe/SvsIi/Gyr/BUFhZ6sr
	Mk6BciSb2cDC1jxKWzgk0HQiqM1rmSBmtoSiMh3VNmjxF1C4j0XMOuloEHZuxkPxack7
	wVzmFq76PiS2+fUCFq/rHJQw6zgmGmEjxgeiffiOBTh4pzzirJvtXYwSr5fadI27j1J+
	Ox3dS7XNHvyFBEeKYGLnSqiUiQ61yGvW2Td0GWI1bixBnl0Qsvy5MqROuKZR6EB6ncW6
	dwwA==
X-Gm-Message-State: AMCzsaXeAAhzqElFoJTx7PvmX4sXBE/1/qaXnUej3+nabz7ytLPvLDi6
	gSe7HDXADtYaVFcDgD4tcA8=
X-Google-Smtp-Source: AOwi7QBNmPejE7FkIm/PITyJdBzNowIbU/qLEOhwTLshcG7s3UqcFqqpPjsxAVbWP1y+n4PYKyFwfg==
X-Received: by 10.99.56.78 with SMTP id h14mr10945344pgn.192.1508244589904;
	Tue, 17 Oct 2017 05:49:49 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	d12sm16844603pgt.16.2017.10.17.05.49.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Oct 2017 05:49:49 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Oct 2017 23:50:25 +1100
Message-Id: <20171017125025.15374-1-net147@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH] nodejs: Update to 8.7.0
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
X-List-Received-Date: Tue, 17 Oct 2017 12:49:49 -0000

LICENSE checksum updated due to copyright and formatting changes.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-devtools/nodejs/{nodejs_8.4.0.bb => nodejs_8.7.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_8.4.0.bb => nodejs_8.7.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.7.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_8.7.0.bb
index 5bcbc0007..3ef4e6a1c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_8.4.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.7.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & BSD & Artistic-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e4d35c6120f175e1fbe5ff908b1cf2d6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23bbe20ee15d74b4c56e57f73e9c039b"
 
 DEPENDS = "openssl10 zlib"
 
@@ -12,8 +12,8 @@ COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
 "
-SRC_URI[md5sum] = "e6c85c83001340b30671e9432e1bd337"
-SRC_URI[sha256sum] = "5d5aa2a101dcc617231a475812eb8ed87cac21491f1dcc7997b9dd463563f361"
+SRC_URI[md5sum] = "78c297b4a23f7f9c0c031baa77702402"
+SRC_URI[sha256sum] = "5a17d08c68ee7c1e748fd32534edda766cb57c13ed98e693f3075bc9d9a0b59a"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.14.2


