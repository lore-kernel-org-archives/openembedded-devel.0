Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDEF7E2AD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 11:54:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t7so5639786wrr.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 04:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4yq5DKlRSrOrq9i5d4AVs3HSB1WLirnQ1jNBpnWJ+dU=;
	b=pmQ6TDpmZrC0QIQX61+KjFhzUI/R8m1hud/UQ+yBBgA4vag5jWZMUAewc68zJ+AVac
	5De5MWRV8hQ+iVLVS6qO5zzN2Bk2mZkJuefDnYHd6fC+Gl04f4a1vgfR4VQDBSygIQzS
	zssXJCZ5nnnYKqHbuGi+xaTtubvBJ8qDLJDmE1QBRCbidOhvJMqGrHRkuzMSjgBDJ5YP
	62x2oHmhUAJvXkzR0qnRhC4HLFZsHhxbv22h1YuizO5Tjob54lAwJemTclRZ5KkpiJGg
	ISvDBYLNctHseu18pi2NbZZlDh1ahNv6X3+XDM+s3DVgS710rHchjVBDZ6LslNjvWZLz
	DZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4yq5DKlRSrOrq9i5d4AVs3HSB1WLirnQ1jNBpnWJ+dU=;
	b=r0/rs+bQifrNC5OTwrvbC5EdD+RbkEAH99b8lKRzuf9hgBRE5lR9DAYXnhuNir52A/
	lr93x2hewB78T0lgz+6xeIithRiSUsVZYT1OiR0sWnTXCNNTvT9GKujfKb6oZLSZlqdL
	tLpwDcDTD2LAV2Hx45HZUfzIcqXngQZp7DDtr84KDTBXJy89UTzLxq2ZbIi94yTjLY+V
	ZPbL90Tzqjr36pXxCUlp4OY6YAgvk13OlF8sFila/vrbQ0EodXQjTJf64LWA9Bh1j1wi
	gP1RaawX/9DGTuMCd95ttdOpwEpj+4OgYTs5PjFNxTOECjfuTj4jl2RH0mT+mwCUc4pN
	FR5w==
X-Gm-Message-State: APjAAAUKBbuAS0sKb+5CFhp8QN71N+BkVDVs2hBYaaJ+gwpyEt4FCrki
	OJ1ryNfjAaKWYtfpT+I9NoLMGUJL
X-Google-Smtp-Source: APXvYqylStk0EpSrjhi+RwD+DV3c52+v0B5F8IkdQBJbAHtMuAQ/9YJ30aOWNqNoW5yF41a44EhBUQ==
X-Received: by 2002:adf:ff88:: with SMTP id j8mr640848wrr.99.1558612497692;
	Thu, 23 May 2019 04:54:57 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	v5sm57273164wra.83.2019.05.23.04.54.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 May 2019 04:54:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 11:54:58 +0000
Message-Id: <20190523115505.18245-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH 1/8] uriparser: upgrade to 0.9.3
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
X-List-Received-Date: Thu, 23 May 2019 11:54:57 -0000

* LIC_FILES_CHKSUM changed only with formal changes:
  commit 093f10a3539b02a38efa835022ef08e52e71ea52
  Author: Sebastian Pipping <sebastian@pipping.org>
  Date:   Wed Nov 4 22:33:13 2015 +0100

    dos2unix COPYING

  commit 62a6150417636afe3c6956c030a3e4b1b1c1fe57
  Author: Sebastian Pipping <sebastian@pipping.org>
  Date:   Wed Nov 4 22:30:29 2015 +0100

    Update e-mail address

* use CMake instead of autotools

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../uriparser/uriparser_0.8.4.bb               | 16 ----------------
 .../recipes-support/uriparser/uriparser_git.bb | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 16 deletions(-)
 delete mode 100644 meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
 create mode 100644 meta-oe/recipes-support/uriparser/uriparser_git.bb

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
deleted file mode 100644
index bfcdf83737..0000000000
--- a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "RFC 3986 compliant URI parsing library"
-HOMEPAGE = "https://uriparser.github.io"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=72b0f9c74ae96eeab8cf1bf3efe08da2"
-
-SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
-
-inherit autotools
-
-EXTRA_OECONF = "--disable-test --disable-doc"
-
-SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
-SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
-
-BBCLASSEXTEND += "native"
diff --git a/meta-oe/recipes-support/uriparser/uriparser_git.bb b/meta-oe/recipes-support/uriparser/uriparser_git.bb
new file mode 100644
index 0000000000..09e8befcf8
--- /dev/null
+++ b/meta-oe/recipes-support/uriparser/uriparser_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "RFC 3986 compliant URI parsing library"
+HOMEPAGE = "https://uriparser.github.io"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fc3bbde670fc6e95392a0e23bf57bda0"
+
+PV = "0.9.3+git${SRCPV}"
+
+SRCREV = "737e95f67bc2e5d8b90a1392797b353b52e5124a"
+SRC_URI = "git://github.com/uriparser/${BPN}.git"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DURIPARSER_BUILD_DOCS:BOOL=OFF -DURIPARSER_BUILD_TESTS:BOOL=OFF"
+
+BBCLASSEXTEND += "native"
-- 
2.17.1


