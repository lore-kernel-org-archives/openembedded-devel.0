Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E9ACF779FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:35:05 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id u36so1215791pgn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=52TzaPOkpz+0siA1cuTFDYB3gnvdxrdNQAM9rjC/CsM=;
	b=FGw0oRnyKylozP+efv1eJZq++RhkBMtoToWjtpV0zbKfLgg3l1LlIFDeSx+1JR+hkw
	9cQYFJ/mOSNiezkRjdW8NWW/qb4QTG3FSxNbM2oeLQ2Oy+jeKE6W0gNMGRsPzHO58JvS
	yJPs9iae85RQ7FVdqUGXNdES0gjnoG9ft8BwVY0xwvopJsaP7qDLTZ2YkrR72P59SCU2
	br/0TUpHF3ueF3gZzmJ+KZnW2CGyWMVvjH7pE634q9YOyJ8oOeJ5gPb3Y2G+626Kn1C3
	bRK4c6o1Jms6xNwFJb+9EnhSSjZRBUN5ilwoNoo77ZqpjhVJf07ggLfHO1QfyDYe/Xgy
	rBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=52TzaPOkpz+0siA1cuTFDYB3gnvdxrdNQAM9rjC/CsM=;
	b=G8Df3TPbWbJu8JPVFhZv1nBcn56X+0buTt75iJBTs0X0Ux2JH+jF6LmeCyXwamcVz5
	qavFzWdvAeyU2cNNUB1zCNYjD5qauSV/B3HskXjYdTy6pF7zrFHZG53Y0VaKPbyVvOyl
	kIxgt4RF8CwvMGeFfB5lVTI87eoNVo44XCkHZbsiyaV10f0aul2LS7N7Icl+xNEX0p+R
	dKCtL3HKNbf7G5bm8KN0XRH96UboF2MUjBDRlpVaIPE1XMj0LcHlGelydPONfacEktp/
	MzA8JaMMBxz74MffVZdYCtPT+V9YjPi7eYmgoZeBGtEzsEGrD3iRFxbcEVkLCTAvyY3m
	tREw==
X-Gm-Message-State: AKS2vOxNiyasiCDt0tPZZ/xqFPoG6OpOWbBTvR9v5YW50oMM2Qrn1ZSd
	/2lOBZ0aPqrazOXj
X-Received: by 10.84.225.145 with SMTP id u17mr22017876plj.255.1498455306627; 
	Sun, 25 Jun 2017 22:35:06 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.35.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:35:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:45 -0700
Message-Id: <20170626053446.37959-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170626053446.37959-1-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 6/7] ssiapi: Fix build with hardening flags
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
X-List-Received-Date: Mon, 26 Jun 2017 05:35:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ssiapi/ssiapi/configure-cflags.patch            | 21 +++++++++++++++++++++
 meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb      |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch

diff --git a/meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch b/meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch
new file mode 100644
index 000000000..d45be590c
--- /dev/null
+++ b/meta-oe/recipes-support/ssiapi/ssiapi/configure-cflags.patch
@@ -0,0 +1,21 @@
+Do not override flags thereby respect the flags coming from environment,
+e.g. we need some optimization level turned on when security flags are enabled
+without this change, the build would fail
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: ssiapi.1.0.1/configure.ac
+===================================================================
+--- ssiapi.1.0.1.orig/configure.ac
++++ ssiapi.1.0.1/configure.ac
+@@ -15,11 +15,6 @@ AC_SUBST(VERSION)
+ AM_INIT_AUTOMAKE(ssi, ${VERSION})
+ AM_CONFIG_HEADER(config.h)
+ 
+-dnl Set the language we use
+-CPPFLAGS="-g3 -gdwarf-2 -Wall -Werror -D_GNU_SOURCE"
+-CFLAGS="-std=gnu99"
+-CXXFLAGS="-std=gnu++98"
+-
+ dnl Automake 1.11 - silent build rules
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
+ 
diff --git a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
index f3c1fc43a..339637087 100644
--- a/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
+++ b/meta-oe/recipes-support/ssiapi/ssiapi_1.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://sourceforge.net/projects/irstessi/files/${BPN}.${PV}.tgz \
            file://0004-engine-Fix-indentation-and-missing-semi-colon.patch \
            file://0005-engine-Define-SENTINEL.patch \
            file://0006-tools-Add-missing-includes-and-use-realpath-instead-.patch \
+           file://configure-cflags.patch \
 "
 SRC_URI[md5sum] = "02f16d7cbd30d28034093212906591f5"
 SRC_URI[sha256sum] = "e10d283b0f211afb8ebd0bde87c097769613d30a052cdf164753e35e803264c7"
@@ -24,6 +25,7 @@ SRC_URI[sha256sum] = "e10d283b0f211afb8ebd0bde87c097769613d30a052cdf164753e35e80
 S ="${WORKDIR}/${BPN}.${PV}"
 
 inherit autotools-brokensep
+CXXFLAGS="-std=gnu++98 -D_GNU_SOURCE"
 
 do_configure_prepend(){
     ./autogen.sh
-- 
2.13.1


