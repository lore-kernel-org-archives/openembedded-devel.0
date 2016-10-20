Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF0466E65F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 21:16:32 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id x23so2170587lfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 14:16:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zAX2TKO6WC+F8Gzh5s+mE+gpBKXQqwS5kaNcldPvqAs=;
	b=GYMhsdNaOhEUn4UaYpzlSBzzHhXqKNzRB+mZPN0Xtqgca2uPpbkm5RMXgKQbzcX5Ty
	Q+z/VA+mx3Lyr5zS82OdaYVYJ7ZBTEBboB9KPrt8QzvhsAbSjIJ4xcoEgHsZVv6XuXwF
	E9Ve8t7qwp/51m6iloz/pOlQC2MtGB76IWVaoTSh/r8NF1dkHMh12kzcUQHYRD3XuF49
	IomZ9ruPRIEQlBuMgUtfVrePR0T76LrYa1c5umbsr8U131u1iBJHZJLqGMlRg8twm5on
	2wWqpHsMdcbWud6weWGGkBJhiRo7Z0mK9p4SC/wykfBQUvlh1F26LFkNdtjVDaD4D3cU
	9daw==
X-Gm-Message-State: AA6/9Rla4VLpW2Y8UibTdNprQr9Y+n74+/G7o2yeQc1o25pKyUyEc2dQFRu9caFQlaMD1A==
X-Received: by 10.28.163.196 with SMTP id m187mr7033677wme.73.1476998192316;
	Thu, 20 Oct 2016 14:16:32 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27]) by smtp.gmail.com with ESMTPSA id
	yo1sm81553728wjc.16.2016.10.20.14.16.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 14:16:31 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2016 22:16:30 +0100
Message-Id: <20161020211630.2707-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH] c-ares: update 1.11.0 -> 1.12.0
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
X-List-Received-Date: Thu, 20 Oct 2016 21:16:33 -0000
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
 .../recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb} (76%)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
similarity index 76%
rename from meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
rename to meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
index c98be7d..8b63972 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37c
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


