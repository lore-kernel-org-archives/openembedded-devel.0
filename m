Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4C64D7F28F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:48:47 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id b3so37482620plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Aug 2019 23:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YsMoW82ZvuerB6tKlXWsT0NAS1DW5LlgDICzCypu884=;
	b=jtVQk7yTd2Hr/eQkb/ErEsBKqlg/bqQWBa0c0i5P+svqdZB+Z9J4zQyC5wbp5uiu9T
	spwrmkVgacQw68zIHfxVzkR3D4gMsEVaHsMLuGrLsQP1Xc0egp9O+FGAGqhv5rtMZjHO
	x/+sDqJWzCrpbN5mjid1hv9r13yGHbpAdB0rr08qNeIWjRBcDaez+3JmtaAZrvXYVcP+
	1Fd5XlBySD1Pv3STVyenjTVSq+AdiwxMAOC2je1k1OGZOkDWjbhp38dYKN7EdMf/tvv9
	J6zRm9u+AMdQTyeQkbb2H+z6UMDH1145mFo8RAxtJ/LCBU/IJUAZpCCRtrWM5is5M4Lg
	2NNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YsMoW82ZvuerB6tKlXWsT0NAS1DW5LlgDICzCypu884=;
	b=BsHful5bUylzh3RteRmEknDVUyRl6v9EiPSIujqhf1FIyL6TimzwmIm+0c987PsC18
	JCByyguK2Tu40zAmKUsBcWrbY3V7WGR3N225zwEbXmZfrnhLL55LxJrLS7zZakLKNGrx
	OpRJkpbvfYJJYI+3m9IE45Hiuy/+tZXi73RLj8GNXnobnJ4ydGLlQeL2Rw1pfKw/6Aa5
	SReJABaxtcs4TPzUju6xQrNrWyzVRhIEvUuUA1X4OFFtS+vG5RfVIYujxdIakwMAcTjv
	8Cu40sU+ryJ7joEBFEWS5D62d51olB0p21//SYOvBT/CxQ0yrbfqJ96nDikBsqtTZfxT
	Rfvw==
X-Gm-Message-State: APjAAAUq5MLipLx7jl/chq/nozDw8eiThuDjGGg58fsIkIaPLoYSm0Fp
	Pfh4jkeC3kU8XuDVjPqp+hfIStGBfAo=
X-Google-Smtp-Source: APXvYqxl4zDgcA/lDpnWd9ICfrcJSYUp5viTHYH0CAl+CGDX5SZkCVOSqBkhn6Q2RcJ6XmbpE8lFOw==
X-Received: by 2002:a17:902:aa88:: with SMTP id
	d8mr1579048plr.274.1565074128156; 
	Mon, 05 Aug 2019 23:48:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	u23sm89377775pfn.140.2019.08.05.23.48.47
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 23:48:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2019 23:48:33 -0700
Message-Id: <20190806064835.33856-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190806064835.33856-1-raj.khem@gmail.com>
References: <20190806064835.33856-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/4] gradm: Upgrade to 3.1-201903191516 release
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
X-List-Received-Date: Tue, 06 Aug 2019 06:48:48 -0000
Content-Transfer-Encoding: 8bit

Pass empty LIBS to build, otherwise its computed using `uname` logic
which does not work in cross builds [1]

Rename recipe to have snapshot number in PV otherwise its not easy to
identify upgrade

[1] https://cvsweb.grsecurity.net/?p=gradm.git;a=commitdiff;h=ef7ff56de7d31b4db1604f0a10fc2c5541a1bff7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gradm/{gradm_3.1.bb => gradm_3.1-201903191516.bb}     | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/gradm/{gradm_3.1.bb => gradm_3.1-201903191516.bb} (84%)

diff --git a/meta-oe/recipes-support/gradm/gradm_3.1.bb b/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
similarity index 84%
rename from meta-oe/recipes-support/gradm/gradm_3.1.bb
rename to meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
index a7d0607f8d..7ed46f82c5 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
@@ -11,12 +11,12 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4641e94ec96f98fabc56ff9cc48be14b"
 DEPENDS = "flex-native bison-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-SRC_URI = "http://grsecurity.net/stable/${BP}-201507191652.tar.gz \
+SRC_URI = "http://grsecurity.net/stable/${BP}.tar.gz \
            file://0001-Makefile-remove-strip.patch \
            file://0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch \
            "
-SRC_URI[md5sum] = "ecec72d3a9b6d84c00eda97957b707b6"
-SRC_URI[sha256sum] = "2f14c357bf0459e502a4e108b76c3f6240aa484762d07bb1687796b9b9297a50"
+SRC_URI[md5sum] = "5099c715433981d5a3eed8ded7c5bbc0"
+SRC_URI[sha256sum] = "d3a0b6383ff97a2054941d71133c737efae66afdd8eef59346c031ae15c75ff3"
 
 S = "${WORKDIR}/gradm"
 
@@ -24,6 +24,7 @@ inherit autotools-brokensep
 
 do_compile() {
     oe_runmake 'CC=${CC}'                               \
+               'LIBS='                                  \
                'OPT_FLAGS=${CFLAGS}'                    \
                'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
                'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \
@@ -34,6 +35,7 @@ do_compile() {
 do_install() {
     oe_runmake 'CC=${CC}'                               \
                'DESTDIR=${D}'                           \
+               'LIBS='                                  \
                'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
                'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \
                'BISON=${STAGING_BINDIR_NATIVE}/bison'   \
-- 
2.22.0


