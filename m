Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3700171CE3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 08:28:21 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id f128so6376669qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 01:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/B9Dt/TvS0lEriZRyFVhdvU4ayNsCgSgd8g3LH4JOpU=;
	b=ScAjpoF+B66lkd+jJ79q8O6DgzfjyUx6UJ0xH3jLzKyfLlKUu/OZowTxyzqro/XqVT
	ZqwsFQ/gB97TMvvVPV/oEg1zvqNJgeVqKIBS/6bbVO6iH/wXiqNp36CQqVL3nRESqsMX
	d3CAvE2OfOX2l+Sm8ZX0Qf1k7E20l2q2gFKzMqquyxDnBHxm/rI8guiHOCypHlF6Gu45
	j0e9UjoUubCXyk5i44nA6fCRMtLltc6gF+Dfd6hQNLqKwM1I3NMGpFWpJEgGZKDNNYGM
	FYWADkYXjv53fpm4BLfmekdKsoqIQDc1Hd6lDTwNnGaZz4pquyqkLcOiORn1UX2HZHga
	asxQ==
X-Gm-Message-State: ABUngvcV6jr9I50Zds2MTLp9Ft4sAy0CiklWPr9hPPDNn2bmO5jYT+jOCJ1v9TZVQZ1YAA==
X-Received: by 10.194.83.130 with SMTP id q2mr3015910wjy.133.1477038502126;
	Fri, 21 Oct 2016 01:28:22 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id kq7sm1662463wjb.0.2016.10.21.01.28.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Oct 2016 01:28:20 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Oct 2016 09:28:20 +0100
Message-Id: <20161021082820.25575-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161020211630.2707-1-git@andred.net>
References: <20161020211630.2707-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] c-ares: update 1.11.0 -> 1.12.0
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
X-List-Received-Date: Fri, 21 Oct 2016 08:28:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Highlight:
- fix CVE-2016-5180

Other changes, from https://c-ares.haxx.se/changelog.html

c-ares version 1.12.0 - Sep 29 2016
Changes:
    api: add ARES_OPT_NOROTATE optmask value

Bug fixes:
    CVE-2016-5180: ares_create_query single byte out of buffer write
    configure: acknowledge --disable-tests [1]
    man pages: fix typos detected by Lintian
    test: add missing #includes for dns-proto.cc
    test: avoid in6addr_* constants
    test: Build with MinGW on AppVeyor
    Makefile.m32: add support for extra flags
    Makefile.m32: add support for CROSSPREFIX
    configure: check if tests can get built before enabled
    ares_library_cleanup: reset ares_realloc too
    ahost.c: add cast to fix C++ compile
    test: Only pass unused args to GoogleTest
    build: commonize MSVC version detection
    msvc_ver.inc: support Visual Studio 2015 Update 1, 2, 3
    test: for AF_UNSPEC, return CNAME only for AAAA, but valid A record
    ares_getnameinfo: explicitly clear struct servent before use
    test: Update fuzzing function prototype
    init: fix nsort initialization
    test: add fuzzing check script to tests
    web: http => https
    read_tcp_data: remove superfluous NULL check
    LICENSE.md: add a stand-alone license file
    SECURITY.md: suggested "security process" for the project
    ares_init_options: only propagate init failures from options [2]
    headers: remove checks for and defines of variable sizes
    test: fix gMock to work with gcc >= 6.x [3]

Signed-off-by: André Draszik <git@andred.net>
---
 .../recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb} (60%)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
similarity index 60%
rename from meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
rename to meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
index c98be7d..da8e096 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
@@ -4,12 +4,12 @@ DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
 HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
 SECTION = "libs"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37cf1ddd1ef8f8eccce0"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
 
 SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
            file://0001-configure.ac-don-t-override-passed-cflags.patch \
 "
-SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
-SRC_URI[sha256sum] = "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
+SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
+SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
 
 inherit autotools pkgconfig
-- 
2.9.3


