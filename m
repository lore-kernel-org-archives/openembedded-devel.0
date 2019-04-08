Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id C24757D577
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Apr 2019 20:51:45 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v22so12515982lje.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2019 13:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=nnfw7XvnbaTfjHOxRRzYiZYFv2hSCL+6qaQmLPzn9M8=;
	b=fZp7aMo5tFLcik02bxTfu6JDFAqyS9seoS62AQrYQo+1xun8+jRyvlh+/OFKF8qPWD
	RzEAm3BgQCAL5x8zRL6YJEfwbQFk9lWKWBHvFWwjwotx6DiLE+lK8r3Oope2c9j2WMEx
	hJ96CPEVZeLuR7MEpI7C40PtbbSlEkIj0H7r0sVIutF0XIHkFjK2gLIieIYtwAoL43Kj
	u5cMeyylBJ7piYIUKc/39WbCyKGM/9OfMfIKVCmRfukLEoNxK03JlqB0sZCqSebV9HvS
	Eo76x5COM6tpszTyEd4xDZkXXH0dppv7BVxCJ03agCS+yfwS8jUy9LMBy9R1/qJep4dx
	MzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nnfw7XvnbaTfjHOxRRzYiZYFv2hSCL+6qaQmLPzn9M8=;
	b=lt/qeIHjgcnAhtoOxb53bY0/XYxad6SMz/9CJk9YikWiCTNBtetBIZaTlaQYsScUlI
	ksE2muQ9x5+B6mUvckwm7Aawc4xSj9AN6nAIyrINPX2xYXPZdkzKQsxZhmrS2lXd/VRN
	yw5sPZRZAKkoz+Tx0hAUaMYPKfQyBYKPggIBi/CXjBirma+gbkfjmm61svYgj2PCuZKx
	u8Wo7dJnaykre6q3PEZjNbTN/jhv8o6fMivSAnj6CEESaB1baFMlI/0As5ss1IGESDEb
	dg33sQe4iKK9xPlUYsWgU41FV/Qibn+yiAkulNX0rPmIAb6IlBi5A83nUvsZZyG1iF78
	GYTA==
X-Gm-Message-State: APjAAAUfK2LHQUk5vINroU59EKEkvD8Ub86YyG0oVgpZTYkxOcwm+PY4
	XAgF2jazKgTcK3VsJ9/QxtICBs264nc=
X-Google-Smtp-Source: APXvYqwdvTpdgI4rhkA8mJB5PFfbI3S4YbyLDotCqNz7abaClr4UuCrt7HEEEvqpFC7ElxHEENvuqg==
X-Received: by 2002:a2e:894e:: with SMTP id b14mr17634849ljk.158.1554756706194;
	Mon, 08 Apr 2019 13:51:46 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	z15sm6406673ljz.55.2019.04.08.13.51.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Apr 2019 13:51:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2019 22:51:38 +0200
Message-Id: <20190408205138.29472-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] ell: remove recipe
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
X-List-Received-Date: Mon, 08 Apr 2019 20:51:46 -0000

This recipe will be moved to poky instead as newer versions of some of
its components depend on it.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/recipes-core/ell/ell_0.17.bb | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-oe/recipes-core/ell/ell_0.17.bb

diff --git a/meta-oe/recipes-core/ell/ell_0.17.bb b/meta-oe/recipes-core/ell/ell_0.17.bb
deleted file mode 100644
index 27f11cfbe..000000000
--- a/meta-oe/recipes-core/ell/ell_0.17.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY  = "Embedded Linux Library"
-DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
-LICENSE  = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
-SECTION = "libs"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/git"
-SRCREV = "ebc021cee3b2d20ca2af5e3ed02495da616b2fd3"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
-
-do_configure_prepend () {
-    mkdir -p ${S}/build-aux
-}
-
-DEPENDS = "dbus"
-- 
2.17.1


