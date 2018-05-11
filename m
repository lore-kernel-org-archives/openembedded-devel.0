Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C66D78423
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:52 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a8-v6so4203361wmg.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=otnHlS4FPPf/dJOEm43JXa1rbSUmvFMBGlK6rujZb1Y=;
	b=BW3FxglD4eYBjLX1s34STibDGZafj4L8oU+jVbZlMXMQKpO+QxSW0hfCgOOHdaMtEo
	Ibpxt5NjdDNc2eKUX99fJpewXI4f6QYI75Lncvn61i1cPA3y6P0OS8SZk1M9rxwpFJeW
	Qrx5wwq2uZJS0QaghiKQkIvmL3SkcmyVBTdDpPfC4Ae2Msm7qWZOxyoF6tdup7IuDnUc
	EHnJthiGe4NY0RHoBkNE4YncUrPju3vxUNetXWRp9H3XLZd16Ej2L9s5Z/FYEvHAtxgX
	spnjifqjO5PCoDylDQz7yNgCadRq0ilANDONrZDzD4JZl92Pxf3gvH6p0zXGcvTmvRgW
	ve2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=otnHlS4FPPf/dJOEm43JXa1rbSUmvFMBGlK6rujZb1Y=;
	b=H43cS4SYFeY58eSaPlOUIdGKUGbjojQIhQcXoo3Gx2jFAeOPHgK/BwYsyzycpyk9vI
	E6G2opuWEjh+pEjHT9LFwdGGUo8y1UYiPAt9cvfnVwwADOgd5iSS7Du1NsIb66G46pXq
	9sq2CtS+oEPK9D8xR3FTfz7Ccrut6aYqm0HQwufWHnJjeR5zwmD4f2XWw4kNuGUTXnoh
	jgxk+KcJl6FX3tuHMNl39euuOgSZNK/jqMKpAlEUc8a4q48RTP/BD2Fl3CUnkYu4N+5W
	wEpxXK2aCQST4pwSCbKWSvoiLoIG3KCxby4LLYmREqNYxGl/OHWYXRkZRYgCMLMUinA6
	Whjg==
X-Gm-Message-State: ALKqPwdoIvWcn7yGCdxyppKWXiHaGGx8TW2nlaZ+O+x9atQEetkRLmvJ
	59twJVShZQOPjDjnjj71JS2bOg==
X-Google-Smtp-Source: AB8JxZqFMUAsHk3RzfSwGjaTAQjw95K4XwQxlckXtXE7HmjMCG7ed+ZwwCkR9x5Br7lIJhxl6fdSsA==
X-Received: by 2002:a1c:d4d2:: with SMTP id
	l201-v6mr2498961wmg.98.1526066513282; 
	Fri, 11 May 2018 12:21:53 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	s5-v6sm4634704wra.48.2018.05.11.12.21.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:38 +0000
Message-Id: <20180511192145.7811-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 2/9] spice: fix dependency on python-pyparsing, add support for native(sdk)
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
X-List-Received-Date: Fri, 11 May 2018 19:21:53 -0000

* drop PR
* add +git to PV
* drop python-pyparsing dependency, because python-pyparsing is in
  meta-python
* replace dependency on python-pyparsing with python-pyparsing-native
  which is used to generate client/generated_marshallers.cpp

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 04e7a25d70..2039841ddf 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -13,8 +13,7 @@ architectures."
 LICENSE = "BSD & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-PR = "r0"
-PV = "0.12.4"
+PV = "0.12.4+git${SRCPV}"
 
 # Actual versions based on the checkouts below
 # spice = "0.12.4"
@@ -44,11 +43,14 @@ S = "${WORKDIR}/git"
 
 inherit autotools gettext pythonnative python-dir pkgconfig
 
-DEPENDS += "python-native celt051 python-pyparsing jpeg pixman alsa-lib glib-2.0"
+DEPENDS += "celt051 jpeg pixman alsa-lib glib-2.0 python-pyparsing-native"
+DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 
 export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
 PACKAGECONFIG ?= "sasl"
 
 PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"
@@ -74,3 +76,5 @@ do_install_append() {
 }
 
 COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


