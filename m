Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D976277D3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so8667900wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H6/N8Wrvg7r3Mm1s2D0IHvm3y/nhpBrgwyobq27y47Q=;
	b=DWS0ByaOC0SdlvRy9qTfa54RVZL1EgOz9eOhjil8HGtYY6vyJMf893vZ9wU2yudjiA
	lkSjAaD7ZU2B/oY2YlAoQi2YnUnq5WoG4MJIb8YbwJzqfQfROZhL6yUBxZcfT7eZW0Vu
	IV+FoNLuCNkH/lSUs7CTgY22v1HH8xUFVnNnT8gXp91Y4DVEoBfb2aVIv2x4iFqYgNYU
	Sb1QOb9b4gC1YjFxM15RT35eMHjJ09SguqzNP+peX1GE4CgPlBmudQMimhGvY8/afp3N
	vwf+UfiNNIb2h3BZN4X1ATpnlgy2Xf8FQwFv89KqghDep/KnSJz3X1TVt86bA30d2Oks
	+arA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H6/N8Wrvg7r3Mm1s2D0IHvm3y/nhpBrgwyobq27y47Q=;
	b=LJRMbzRyRWOqirL1vAv1EatU9Obg9fahj0Oh/Otehr7t6gHL2QlvCwyaYAxtDL1R2D
	S3MX0h3TwAT6EZMlSYLIiQZrUz+4fevDNkqvey6axHk08dDMOUVWTi5pKvKrv44vDoWq
	DXDyIxAA8zlcfEUqOUr4m7gg9CevNZwnn5z27NWT+kKeSZiyshdv945goykvDXjzbybQ
	9X6mEl/M3ESxc6Ka5z5LptrszULL3Cn8ps+3Zi8473sCg8HRrttpJ5voUJRCCQDjwRUr
	2zN4wSSDIjIZQJKOGEcbAL/HfBpmDhU6hiR787UE3vmjMdoMRoeApln2jG8FY3OYy8Mf
	wZRQ==
X-Gm-Message-State: AN3rC/5g8DZM1upR4rXE71H1XmSADQ63upnDkqGg9jQZdHHXjOfnBK/J
	peouTbde4XZZ4133
X-Received: by 10.28.16.149 with SMTP id 143mr144wmq.42.1492027032826;
	Wed, 12 Apr 2017 12:57:12 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:12 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:32 +0200
Message-Id: <20170412195638.3243-24-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 23/29] poppler: update 0.51.0 -> 0.53.0
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

c++ is now set by poppler itself [1]

[1] https://lists.freedesktop.org/archives/poppler/2017-March/012106.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../poppler/{poppler_0.51.0.bb => poppler_0.53.0.bb}          | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.51.0.bb => poppler_0.53.0.bb} (78%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.51.0.bb b/meta-oe/recipes-support/poppler/poppler_0.53.0.bb
similarity index 78%
rename from meta-oe/recipes-support/poppler/poppler_0.51.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.53.0.bb
index f683a3a..c1bfb31 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.51.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.53.0.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
     file://0002-fix-gcc-6-math-ambiguous-errors.patch \
 "
-SRC_URI[md5sum] = "342452b9dfd16f3c9912eb029fe0d4e2"
-SRC_URI[sha256sum] = "e997c9ad81a8372f2dd03a02b00692b8cc479c220340c8881edaca540f402c1f"
+SRC_URI[md5sum] = "943679f1030b9bc19a989f24121a282a"
+SRC_URI[sha256sum] = "592bf72960c6b5948b67657594b05e72d9a278daf7613c9f3cdff9a5b73096a8"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
@@ -24,13 +24,6 @@ PACKAGECONFIG[qt5] = "--enable-poppler-qt5 --with-moc-qt5=${STAGING_BINDIR_NATIV
 PACKAGECONFIG[qt4e] = "--enable-poppler-qt4 --with-moc-qt4=${STAGING_BINDIR_NATIVE}/moc4,--disable-poppler-qt4,qt4-embedded"
 PACKAGECONFIG[nss] = "--enable-libnss,--disable-libnss,nss"
 
-# Needed for qt5
-CXXFLAGS += "--std=c++11"
-
-#| /usr/src/debug/glibc/2.25-r0/git/csu/elf-init.c:87: undefined reference to `__init_array_end'
-#| /usr/src/debug/glibc/2.25-r0/git/csu/elf-init.c:87: undefined reference to `__init_array_start'
-#| /mnt/a/build/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/6.2.0/ld: .libs/libpoppler.so.65.0.0: hidden symbol `__init_array_end' isn't defined 
-
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
 EXTRA_OECONF = "\
-- 
2.9.3


