Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id EEBDC7F98C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:49:44 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 193so8589491pfc.13
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=p8bxrPfPme51fqfqFuK9mshkdwoKRwZZEgdx7tVdIxI=;
	b=jtrr4n+ot24cr/gqq6+gWbkrFqnfa/nS42Gtowk/G1u36lZ9+ICx/mE4MLj6hDvpkG
	wY/+3X58jwIQjPRhzFfPQfElBxfU48kXBnVlksdeyQj+b2XPkOAKb4b5gt5WFQLez/tc
	3PdrbXMr2CAaL+fAeddwBzpZt0FcZ8la2bFPNXgaohB4JgZW32loywT07a0OVQITBSaV
	mQACLj4Wl0qI26P4sQAAp3DYBeFplfwkHowvX4nS5fBLi+kC5ZXQpLOY5/d+U00BQ4Zi
	Q1MXOT4FwQOtZlPmVmihKTYkOtDVI0GEW6f+J1l1m8hnuGHOP+31eDMY7jDDN8Phcsg/
	20ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=p8bxrPfPme51fqfqFuK9mshkdwoKRwZZEgdx7tVdIxI=;
	b=XbLwzb0WjpVphgjBi1loFNVztp4vOoHwKA9BhXmmp0j0QF2HEJUiJBcsumlJ/Gv9xm
	hfe6n4H17oHSvgDGOqKWcQg1cRPwVZlUZiQ5aZyENmYKn7hL4Lg2+XauZB5n7o6gYyjd
	PPy80Mpxuvx+1Ra4DtTN2oQOKDZUb7D+hQqj9g+578yu18vcxLHxYwpReNslTmtlRm/Y
	JUes8/kahOMypidfTcgmlFZx/cl8VkxhrdZXvzs28lVRfduGnrISAmzYf2f8WseiAgNj
	yK8QwTBxPVJS/X1H/ZdgjwFk1K2UIklgBrWpIL45WEDwg75KlYOdJtlAlvvxsiP+vXM3
	n+tQ==
X-Gm-Message-State: APjAAAXeV2/s9qZSonssd5sToYKhiENkjJJtRjDtRdO1g4QUWwlC+CJs
	PQJH5upVYT5kV4XlEiqx4xNs6nnnk4s=
X-Google-Smtp-Source: APXvYqxKBwEpFDN8ffowKFSe9ojSQC02Bxyayd8zVjUuIdTXRAQb0K+x4i+sua1p2XEKn9LBzFliww==
X-Received: by 2002:aa7:9189:: with SMTP id x9mr15902587pfa.41.1573962585580; 
	Sat, 16 Nov 2019 19:49:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id
	w15sm14881103pfn.13.2019.11.16.19.49.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 16 Nov 2019 19:49:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:49:29 -0800
Message-Id: <20191117034929.3298760-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191117034929.3298760-1-raj.khem@gmail.com>
References: <20191117034929.3298760-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] gperftools: Convert static and libunwind support to packageconfig
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
X-List-Received-Date: Sun, 17 Nov 2019 03:49:45 -0000
Content-Transfer-Encoding: 8bit

Disable libunwind on musl/arm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/gperftools/gperftools_2.7.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
index fdb82519bc..2cdb2e2740 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.7.bb
@@ -2,7 +2,6 @@ SUMMARY = "Fast, multi-threaded malloc() and nifty performance analysis tools"
 HOMEPAGE = "https://github.com/gperftools/gperftools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
-DEPENDS += "libunwind"
 
 SRCREV = "9608fa3bcf8020d35f59fbf70cd3cbe4b015b972"
 SRC_URI = "git://github.com/gperftools/gperftools \
@@ -28,9 +27,11 @@ COMPATIBLE_HOST_mipsarch_libc-glibc = "null"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
 
-# Ensure static libs are always enabled, as they seem to be not produced by
-# default at least on ARM.
-EXTRA_OECONF_append += " --enable-static"
+PACKAGECONFIG ?= "libunwind static"
+PACKAGECONFIG_remove_arm_libc-musl = "libunwind"
+
+PACKAGECONFIG[libunwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+PACKAGECONFIG[static] = "--enable-static,--disable-static,"
 
 PACKAGE_BEFORE_PN += "libtcmalloc-minimal"
 FILES_libtcmalloc-minimal = "${libdir}/libtcmalloc_minimal*${SOLIBS} ${libdir}/libtcmalloc_minimal_debug*${SOLIBS}"
-- 
2.24.0


