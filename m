Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id CAFE6601B8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2016 04:05:37 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id ot11so15722786pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2016 21:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hZfATfd/8VdkBfeIFS32PRr6Kq1NNeetaPR1WPq+U3g=;
	b=t7DT+GvH+tTq9YET11MwF/D1+V3m/BetgSdTFZQeV5UfAD1TCsTtfxKreCE0SH2f0N
	ooDhZOdDg9CRDq7Cxer4uLIrugLxKNKHYgQ063WlbPss+5/03UNJb1xJehj7dJjqxX25
	HJv0mCj0WNcFLp2YgfFf0QpaL8D/7xdLKN76tTfAPs9HW8vlX4HMq0ofOB9mDkp9zg1n
	dEAqHRutj8XCcLSLLI2C87mp6U1HzoOyq8UOtOsSA2SmyeHxFDfP4AEJQSA/B9xcrvNG
	dy5+1Z9gY1TlfyB1wAFqH+wTDgD4nFUUt4XXidGvJVNrQfpY/NZpOIT2gogsX+U/gZ/O
	YWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hZfATfd/8VdkBfeIFS32PRr6Kq1NNeetaPR1WPq+U3g=;
	b=NW8MoX+dSIogptxJUBTYX4A7jXCrtaZo9Dc2Womq5U5/nYjetfvLUOvTJLXzN2YghF
	wVvGz8b7qJx3cRk9sxudempcNvYtgNQoXgfnN9fI37Uqf53e8E0J7AQqusS0TBrXDSrW
	sq6xLxMgrK/kZiIScVvUuNBBhPZms5E6JQYjqgQWRzLo7hpXHyaV8dVy+7u/GsEjHgfQ
	0Q4hKPFPhtATBhT8nqbYyxVv42GNABmJPCYjDwnpecjivHfA2Viw9XHa9WGkhvlzVAXx
	Oa9CZ6Uv4eC3BVYC9bmqV/JsFQl6f63sa4gD++Dt/7JyLqai8ZALrVk00KYP+H+faoiP
	/W3w==
X-Gm-Message-State: AOPr4FV5rbCz++J7Y4vhCr5DxboP9mdKj3xEzDm1gopYILMHgmDgv36U6ojynraUNw8oSw69
X-Received: by 10.66.149.36 with SMTP id tx4mr8833324pab.64.1460261138255;
	Sat, 09 Apr 2016 21:05:38 -0700 (PDT)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	lq10sm27783214pab.36.2016.04.09.21.05.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Apr 2016 21:05:36 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Apr 2016 09:35:27 +0530
Message-Id: <1460261127-23518-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] iscsitarget: resolve build error with linux kernel 4.3 and above
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
X-List-Received-Date: Sun, 10 Apr 2016 04:05:37 -0000

1. test_bit was used to return true boolean value, if
   BIO_UPTODATE bit of bio->bi_flags is set. But the same
   job can be done by checking bio->bi_error, implemented in
   linux kernel 4.3 and above. If bio->bi_error is set, then
   it denotes error.

Ref: https://github.com/torvalds/linux/commit/4246a0b63bd8f56a1469b12eafeb875b1041a451

It solves below build error:
-- snip --
iscsitarget-1.4.20.3+svn502/kernel/block-io.c:40:19: error: 'BIO_UPTODATE' undeclared (first use in this function)
   error = test_bit(BIO_UPTODATE, &bio->bi_flags) ? error : -EIO;
-- CUT --

2. bio can always be filled to a maximum value of BIO_MAX_PAGES,
   so no need to check for min value for linux kernel 4.3 and above.

Ref: https://github.com/torvalds/linux/commit/b54ffb73cadcdcff9cc1ae0e11f502407e3e2e4c

It solves below build error:
-- snip --
iscsitarget-1.4.20.3+svn502/kernel/block-io.c:80:15: error: implicit declaration of function 'bio_get_nr_vecs' [-Werror=implicit-function-declaration]
    max_pages = bio_get_nr_vecs(bio_data->bdev);
-- CUT --

3. Remove unwanted explicit setting of CFLAGS and CC flags. Setting them in
   oe_runmake command, will override CFLAGS mentioned in iscsitarget Makefile
   and resulting in a below error:

-- snip --
 In file included from iscsid.c:38:0:
 iscsid.h:38:19: fatal error: iet_u.h: No such file or directory
 compilation terminated.
 In file included from conn.c:15:0:
 iscsid.h:38:19: fatal error: iet_u.h: No such file or directory
 compilation terminated.
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 ...pdated_bio_struct_of_linux_v4.3_and_above.patch | 75 ++++++++++++++++++++++
 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb     |  8 +--
 2 files changed, 78 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch

diff --git a/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
new file mode 100644
index 0000000..0e8b792
--- /dev/null
+++ b/meta-networking/recipes-extended/iscsitarget/files/build_with_updated_bio_struct_of_linux_v4.3_and_above.patch
@@ -0,0 +1,75 @@
+1. test_bit was used to return true boolean value, if
+   BIO_UPTODATE bit of bio->bi_flags is set. But the same
+   job can be done by checking bio->bi_error, implemented in
+   linux kernel 4.3 and above. If bio->bi_error is set, then 
+   it denotes error.
+
+Ref: https://github.com/torvalds/linux/commit/4246a0b63bd8f56a1469b12eafeb875b1041a451
+
+It solves below build error:
+-- snip --
+iscsitarget-1.4.20.3+svn502/kernel/block-io.c:40:19: error: 'BIO_UPTODATE' undeclared (first use in this function)
+   error = test_bit(BIO_UPTODATE, &bio->bi_flags) ? error : -EIO;
+-- CUT --
+
+2. bio can always be filled to a maximum value of BIO_MAX_PAGES, 
+   so no need to check for min value for linux kernel 4.3 and above.
+
+Ref: https://github.com/torvalds/linux/commit/b54ffb73cadcdcff9cc1ae0e11f502407e3e2e4c
+
+It solves below build error:
+-- snip --
+iscsitarget-1.4.20.3+svn502/kernel/block-io.c:80:15: error: implicit declaration of function 'bio_get_nr_vecs' [-Werror=implicit-function-declaration]
+    max_pages = bio_get_nr_vecs(bio_data->bdev);
+-- CUT --
+
+Upstream-Status: Pending
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+diff -Naurp iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c iscsitarget-1.4.20.3+svn502/kernel/block-io.c
+--- iscsitarget-1.4.20.3+svn502_org/kernel/block-io.c	2016-04-01 09:07:12.891810059 +0530
++++ iscsitarget-1.4.20.3+svn502/kernel/block-io.c	2016-04-01 09:15:59.076469313 +0530
+@@ -33,7 +33,11 @@ static void blockio_bio_endio(struct bio
+ {
+ 	struct tio_work *tio_work = bio->bi_private;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++	error = bio->bi_error ? -EIO : error;
++#else
+ 	error = test_bit(BIO_UPTODATE, &bio->bi_flags) ? error : -EIO;
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */	
+ 
+ 	if (error)
+ 		atomic_set(&tio_work->error, error);
+@@ -61,6 +65,10 @@ blockio_make_request(struct iet_volume *
+ 	u32 size = tio->size;
+ 	u32 tio_index = 0;
+ 
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++	int err = 0;
++	loff_t ppos = tio->offset;	
++#else	
+ 	int max_pages = 1;
+ 	int err = 0;
+ 
+@@ -69,6 +77,7 @@ blockio_make_request(struct iet_volume *
+ 	/* Calculate max_pages for bio_alloc (memory saver) */
+ 	if (bdev_q)
+ 		max_pages = bio_get_nr_vecs(bio_data->bdev);
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */
+ 
+ 	tio_work = kzalloc(sizeof (*tio_work), GFP_KERNEL);
+ 	if (!tio_work)
+@@ -80,7 +89,11 @@ blockio_make_request(struct iet_volume *
+ 
+ 	/* Main processing loop, allocate and fill all bios */
+ 	while (size && tio_index < tio->pg_cnt) {
++#if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0)
++		bio = bio_alloc(GFP_KERNEL, BIO_MAX_PAGES);
++#else    		
+ 		bio = bio_alloc(GFP_KERNEL, min(max_pages, BIO_MAX_PAGES));
++#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(4, 3, 0) */		
+ 		if (!bio) {
+ 			err = -ENOMEM;
+ 			goto out;
diff --git a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
index 6a2b135..4c5eed6 100644
--- a/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
+++ b/meta-networking/recipes-extended/iscsitarget/iscsitarget_1.4.20.3+svn502.bb
@@ -8,13 +8,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6e233eda45c807aa29aeaa6d94bc48a2"
 DEPENDS = "openssl virtual/kernel"
 
-PNBLACKLIST[iscsitarget] ?= "BROKEN: kernel/block-io.c:36:19: error: 'BIO_UPTODATE' undeclared (first use in this function)"
-
 SRC_URI = "http://ftp.heanet.ie/mirrors/ubuntu/pool/universe/i/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://use-kernel-makefile-to-get-kernel-version.patch \
            file://fix-errors-observed-with-linux-3.19-and-greater.patch \
            file://access-sk_v6_daddr-iff-IPV6-defined.patch \
-	  "
+           file://build_with_updated_bio_struct_of_linux_v4.3_and_above.patch"
+
 SRC_URI[md5sum] = "ef9bc823bbabd3c772208c00d5f2d089"
 SRC_URI[sha256sum] = "d3196ccb78a43266dce28587bfe30d8ab4db7566d7bce96057dfbb84100babb5"
 
@@ -27,8 +26,7 @@ do_configure[noexec] = "1"
 do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
 
 do_compile() {
-    oe_runmake KSRC=${STAGING_KERNEL_DIR} CFLAGS='${CFLAGS}' LDFLAGS='' \
-    CC="${CC}" V=1
+    oe_runmake KSRC=${STAGING_KERNEL_DIR} LDFLAGS='' V=1
 }
 
 do_install() {
-- 
1.9.1


