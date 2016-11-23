Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0F98071B03
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y68so449324pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YBuwRIsLr82yXTfVpuL9hnsXg+1JL4YiIkAUQIpXAqQ=;
	b=Ce+ohDALJcb6x9mvmvWtr5pIAt9IxNSW2Mzuvph9hjrYGRar0IH+Zdn/e+hVp+tPCB
	X4xr1xIrsCIeaKQmsqvo6fN1LFAmiunxdJNeM6Yp9XBP9kpGP9S8y2fSRY6XvUN1I3ee
	sY2XqCmKGEmQjLbhZhXG6e2taLOgfBUURxWl0LMOrUx+Ac0M/6XNn4pmWzCmmvfGPxsm
	FRiR8O73JXKyovS2y47OntGAefHmQTKgNlWCnno/rqJ9VUMx7gv9XSXCh7aa8YeK/yS6
	uS9i/7QOVwPZ1KhdJA7JdnMJiCpmRokMZTYZkXFNkFozk/Re/c15qbnlDR3COw4vtwBB
	RWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YBuwRIsLr82yXTfVpuL9hnsXg+1JL4YiIkAUQIpXAqQ=;
	b=I2jKUqyV/mD2ymTiwtjN1c6V0NSNUOyxO0aTYjUWeOV8Rv3aY2iI13ss+boxHHBsT4
	NiaXvvOrwWd+O5L3HXTvsk4OZcoPmEWpa+6sMzBpXaPKUZT9uYrONr5KQGW64rvgxMHJ
	EhejC0LhihbhrmQRvUmdDXExyA0Jj4NvUtuVo9Irky1Qoh7ozcTVISvJ+uVVMlQunM6w
	mVhE6k51iXcJpRcvxQCaZ/rIMyH3t+7wmCdEtsvy3DkGAg0Uzf9sQypIr55COZ1RR1jf
	B+oLnfLqv3I0hKcyiUam6iVGuLCZYMCerRhsQ1gXevnYgL4ceN3DOhFu1ZHZi65AaQwX
	yglw==
X-Gm-Message-State: AKaTC01ApBOHx4hCoE6radGMWpG8KbtAIRDmqpXTjXe1Ea5MHEkiwiQvQvuEJif9xPJHgg==
X-Received: by 10.84.192.131 with SMTP id c3mr4619582pld.149.1479892973714;
	Wed, 23 Nov 2016 01:22:53 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:22:07 -0800
Message-Id: <20161123092209.23699-47-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 47/49] memcached: Update to 1.4.33
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
X-List-Received-Date: Wed, 23 Nov 2016 09:22:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/memcached/memcached/configure.patch     | 13 -------------
 .../memcached/memcached/redundant_comparison.patch          | 13 +++++++++++++
 .../memcached/{memcached_1.4.17.bb => memcached_1.4.33.bb}  |  7 +++----
 3 files changed, 16 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/configure.patch
 create mode 100644 meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.4.17.bb => memcached_1.4.33.bb} (90%)

diff --git a/meta-networking/recipes-support/memcached/memcached/configure.patch b/meta-networking/recipes-support/memcached/memcached/configure.patch
deleted file mode 100644
index 7001a0e..0000000
--- a/meta-networking/recipes-support/memcached/memcached/configure.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: memcached-1.4.17/configure.ac
-===================================================================
---- memcached-1.4.17.orig/configure.ac	2013-12-20 21:44:49.000000000 +0000
-+++ memcached-1.4.17/configure.ac	2014-07-18 07:17:00.593499483 +0000
-@@ -4,7 +4,7 @@
- AC_INIT(memcached, VERSION_NUMBER, memcached@googlegroups.com)
- AC_CANONICAL_SYSTEM
- AC_CONFIG_SRCDIR(memcached.c)
--AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
-+AM_INIT_AUTOMAKE([foreign])
- AM_CONFIG_HEADER(config.h)
- 
- AC_PROG_CC
diff --git a/meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch b/meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch
new file mode 100644
index 0000000..ed86ffa
--- /dev/null
+++ b/meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch
@@ -0,0 +1,13 @@
+Index: memcached-1.4.33/items.c
+===================================================================
+--- memcached-1.4.33.orig/items.c
++++ memcached-1.4.33/items.c
+@@ -148,7 +148,7 @@ item *do_item_alloc(char *key, const siz
+     uint8_t nsuffix;
+     item *it = NULL;
+     char suffix[40];
+-    if (nbytes < 2 || nkey < 0)
++    if (nbytes < 2)
+         return 0;
+ 
+     size_t ntotal = item_make_header(nkey + 1, flags, nbytes, suffix, &nsuffix);
diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.33.bb
similarity index 90%
rename from meta-networking/recipes-support/memcached/memcached_1.4.17.bb
rename to meta-networking/recipes-support/memcached/memcached_1.4.33.bb
index 293f8d4..25ea7b1 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.33.bb
@@ -20,15 +20,14 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
-           file://configure.patch \
+           file://redundant_comparison.patch \
            file://memcached-add-hugetlbfs-check.patch"
+SRC_URI[md5sum] = "2d7f6476283cd36e21e521d901d37a8f"
+SRC_URI[sha256sum] = "83726c8d68258c56712373072abb25a449c257398075a39ec0867fd8ba69771d"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
 
-SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
-SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
-
 python __anonymous () {
     endianness = d.getVar('SITEINFO_ENDIANNESS', True)
     if endianness == 'le':
-- 
2.10.2


