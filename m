Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1F86C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 16:40:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id m3so10673983wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 May 2019 09:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7btbqjWfrY+D6O8ICmylW9Jt5xgfaAxU2D1s50Jh194=;
	b=NHGU9gAalyJDLKUL9yKb6oL5OayI2WbxyFEouRa9M2AJjd6+R9tw2WoCwF2OdSKrRW
	Kcvq6o0I4P/v5bpYGditQAyJ9ZT9TM8T5dpqYEQMVOFyG2USxWnYEGx6k9GHgy5QUOjL
	afr7AKS0P6H+NOdFLW+QHvUxsWvYi8ScVru9uJnhtGGeDDGEgKF6WtHfWnlFVkKH2ILW
	IcDcgJrY+FfBQmy2OT9CmzsG3gcs15e2ceZN2K32+CGw34g2P373kzl8ZBJx2YisCdKk
	Qjzoox7d5yjFfeJOls76bPNvDOIgie3kjy0l9i6MuGJcP07/4B0frzDCEdp3VCQDJwkb
	fjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7btbqjWfrY+D6O8ICmylW9Jt5xgfaAxU2D1s50Jh194=;
	b=hwE18CQ3LawEf999sM1gM+o34iDqYSgSAoLVXzuyATlIL2/JI/vvq27QJQShB7+kfl
	AcidmXFHVgXcBCc403m2RMS43d1LTAUJxCiDPgwLqfkmXUeRzv6j/PilOyvfdVstJ9j3
	dRObq/0V5UallRfDFDSw3Ju6toPpOj6dc1P9c548+I+f4eXdkfZB218HDgU4ggY4kPJ1
	2PVeTXkhFwmARIVJHKDaHPW01tRPrdYENxwt2T/EfkOipJbs1huVP1PHxyCAui5hePLv
	XjUNI0hkmcNYPKFmZVC+npD2YDzIZOYROptUsLb9LVHtVyQynKHzPzy6uz3J1B/Yqcjq
	ARTQ==
X-Gm-Message-State: APjAAAUe+KZ4eyzdnh8bxoYTJjvEiH5gHG4e8jeSk9XSvRgeCryeFAFn
	S/MQ0eBh6OGbL2vopQZx9HdGUlJe
X-Google-Smtp-Source: APXvYqzPnT0kxHt2xM+QidUa5k3U3DcBJ+AGFpqyEhQnPpvRqxuCuExGcMB21e3mexwIoAe9C4YMBQ==
X-Received: by 2002:adf:e711:: with SMTP id c17mr26537925wrm.227.1558716027827;
	Fri, 24 May 2019 09:40:27 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 91sm3508364wrs.43.2019.05.24.09.40.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 May 2019 09:40:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 May 2019 16:40:21 +0000
Message-Id: <20190524164021.18767-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCHv2] uriparser: upgrade to 0.9.3
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
X-List-Received-Date: Fri, 24 May 2019 16:40:27 -0000

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

v2: switched from git fetcher to release tarbal

 .../{uriparser_0.8.4.bb => uriparser_0.9.3.bb}      | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_0.8.4.bb => uriparser_0.9.3.bb} (27%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb b/meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
similarity index 27%
rename from meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
rename to meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
index bfcdf83737..8c28c9d93a 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_0.8.4.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_0.9.3.bb
@@ -2,15 +2,14 @@ SUMMARY = "RFC 3986 compliant URI parsing library"
 HOMEPAGE = "https://uriparser.github.io"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=72b0f9c74ae96eeab8cf1bf3efe08da2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fc3bbde670fc6e95392a0e23bf57bda0"
 
-SRC_URI := "${SOURCEFORGE_MIRROR}/project/uriparser/Sources/${PV}/uriparser-${PV}.tar.bz2"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz"
+SRC_URI[md5sum] = "9874b64f6f4ff656f3f69598e38f12b7"
+SRC_URI[sha256sum] = "6cef39d6eaf1a48504ee0264ce85f078758057dafb1edd0a898183b55ff76014"
 
-inherit autotools
+inherit cmake
 
-EXTRA_OECONF = "--disable-test --disable-doc"
-
-SRC_URI[md5sum] = "9aabdc3611546f553f4af372167de6d6"
-SRC_URI[sha256sum] = "ce7ccda4136974889231e8426a785e7578e66a6283009cfd13f1b24a5e657b23"
+EXTRA_OECMAKE += "-DURIPARSER_BUILD_DOCS:BOOL=OFF -DURIPARSER_BUILD_TESTS:BOOL=OFF"
 
 BBCLASSEXTEND += "native"
-- 
2.17.1


