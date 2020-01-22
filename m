Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id B3C8C7FF32
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:59:42 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id n9so2399141pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 16:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jClhoVwid88SEBp1An/3SzVbHHjMr282zqNTnbqXGxQ=;
	b=Hl2D60WkUcSZW4XIr43GyNgawEbbdHIbBb6nFqU3JS0wyvrGGvs68bbel5bbww59aT
	A2Esp+nChVvF/MiLZ44xr3c4trJXg6oplpN+i+z8sFYBJ00rn9llSWY9/WwTdyP6O+bV
	o1570STpVI1ultHY5fa7uyWYrdJJqtLK5lbRDOOEYdqRqY8fCzLHBIbsrKhLOtViHD8P
	AMHb+wPu0Fqn0wU1b4XzFMEMp+5PkHzD+SZBNc4jcWbRFNgzBlzbM8eaYBZ56iKwABOM
	qsg7VO8CR2Obh3aKK5y+NLJGfPavGmZttpqemtdbHPBPbDRlK6cP3tsuhClCwKGwIYOY
	Mp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=jClhoVwid88SEBp1An/3SzVbHHjMr282zqNTnbqXGxQ=;
	b=iPyd1zX46YUQ9Bd8x/WdJUeHtuMIOpztBPri1XnULNgjbm0INlrOEnp3aXZWXL8K+n
	YVorNFS382jV1+x7kUri/Nw2+Xl+aEoJ5borpMFKxpXiFNBrJMcWC3z3ezxPmwA4B7EW
	wFDr5J2k/O46yiMAcWGwzFy1sJdrwNHNQOSy3pQ1pHe6xh1rNbB1bHzK7ikksmstxHgE
	2G2wOOUxABcbyxwurBJxQfLQLZB0EW8OUaIIUXvrYPVN7vuZ3+gljqX3oUf+D5daqssd
	XFbSFozcDWcae8O28L+XsqxbNMpFr5BKyFjbS53T51T8MibifLJFQK1N7p7vJ7yMS7VH
	nENQ==
X-Gm-Message-State: APjAAAWBK60XD5p2C3mj3EMdMARf7MIfmEREnK9vgZq+e/S3ZUTqMDei
	xiEYZMlF8F0PZe28VV/rV8e2rOxnYW0=
X-Google-Smtp-Source: APXvYqxDijNLW40dlHVCuQu8rTovtFwpPAzH/rsznhy/F7a7ts+ueb56wiVXaM5L1IaQiX8r09P+QQ==
X-Received: by 2002:a63:ff52:: with SMTP id s18mr8424602pgk.253.1579654783106; 
	Tue, 21 Jan 2020 16:59:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	z26sm46107269pfa.90.2020.01.21.16.59.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 16:59:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 16:59:36 -0800
Message-Id: <20200122005941.3706171-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122005941.3706171-1-raj.khem@gmail.com>
References: <20200122005941.3706171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/7] telepathy-python: Rename to telepathy-python3
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
X-List-Received-Date: Wed, 22 Jan 2020 00:59:42 -0000
Content-Transfer-Encoding: 8bit

This avoid recipe conflict with py2 version and adjust to delete
__pycache__ files which are py3 specific

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../parallel_make.patch                              |  0
 .../remove_duplicate_install.patch                   |  0
 .../telepathy-python_fix_for_automake_1.12.patch     |  0
 ...ython_0.15.19.bb => telepathy-python3_0.15.19.bb} | 12 +++++++-----
 4 files changed, 7 insertions(+), 5 deletions(-)
 rename meta-python/recipes-connectivity/telepathy/{telepathy-python-0.15.19 => telepathy-python3-0.15.19}/parallel_make.patch (100%)
 rename meta-python/recipes-connectivity/telepathy/{telepathy-python-0.15.19 => telepathy-python3-0.15.19}/remove_duplicate_install.patch (100%)
 rename meta-python/recipes-connectivity/telepathy/{telepathy-python-0.15.19 => telepathy-python3-0.15.19}/telepathy-python_fix_for_automake_1.12.patch (100%)
 rename meta-python/recipes-connectivity/telepathy/{telepathy-python_0.15.19.bb => telepathy-python3_0.15.19.bb} (66%)

diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/parallel_make.patch
similarity index 100%
rename from meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/parallel_make.patch
rename to meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/parallel_make.patch
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
similarity index 100%
rename from meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
rename to meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/remove_duplicate_install.patch
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/telepathy-python_fix_for_automake_1.12.patch
similarity index 100%
rename from meta-python/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
rename to meta-python/recipes-connectivity/telepathy/telepathy-python3-0.15.19/telepathy-python_fix_for_automake_1.12.patch
diff --git a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
similarity index 66%
rename from meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
rename to meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
index 2e8da0805d..11ac0d93a1 100644
--- a/meta-python/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta-python/recipes-connectivity/telepathy/telepathy-python3_0.15.19.bb
@@ -7,13 +7,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 DEPENDS = "libxslt-native"
 RDEPENDS_${PN} += "python-dbus"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-python/telepathy-python-${PV}.tar.gz \
            file://parallel_make.patch \
            file://remove_duplicate_install.patch \
            file://telepathy-python_fix_for_automake_1.12.patch"
 
 PR = "r6"
 
+S = "${WORKDIR}/telepathy-python-${PV}"
+
 inherit autotools python3native
 
 SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
@@ -25,8 +27,8 @@ FILES_${PN} += "\
 "
 
 do_install_append () {
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyc
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*.pyo
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyc
-    rm -f ${D}${libdir}/python*/site-packages/telepathy/*/*.pyo
+    rm -fr ${D}${libdir}/python*/site-packages/telepathy/__pycache__
+    rm -fr ${D}${libdir}/python*/site-packages/telepathy/__pycache__
+    rm -fr ${D}${libdir}/python*/site-packages/telepathy/*/__pycache__
+    rm -fr ${D}${libdir}/python*/site-packages/telepathy/*/__pycache__
 }
-- 
2.25.0


