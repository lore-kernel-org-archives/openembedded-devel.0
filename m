Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87D1A6BA9D
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 07:34:29 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so3360628wru.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Dec 2019 23:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MirCwbccXfi7lakrOq/8BJgMWqhzSjKKQAehzesbTp8=;
	b=JvybOIxNYgxUtcXVv+4gV5SpJJ0K6XRV3jnA5EYdjBt9Tq9EQ4G5LAWSFkryT7pnT6
	bwbuiH2aA1McOoxC29qEaZLS0Ti/o2prlGAqoVugiihBJ9t4ZW0CstXGSvlRDTXbzBLl
	obpOLDFWqlPOlbvJ1AqpvCHBsGteHpyR4HqOrM78k1dZ7JUfJBnRBpLrJZpHolMrtyq/
	teNqq9WVdRlwjtwZMRGxb+XpsNvrWyYf3Kpu9ZrQbF7mgjGTj5weapriO55HDQc1xCS4
	Z9Soi0NXI7BO97UVPKst3uVlUFsvQp0eAI3fPJUDEX1U7qzrGbOgc3HZ19IrzUT6P80R
	Fuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MirCwbccXfi7lakrOq/8BJgMWqhzSjKKQAehzesbTp8=;
	b=DYODDj6cRk3ezNtXm1k4B0M9oDgcqqdLbKnAGO3riI2z7aceiIufi066tH8QJnYonB
	CwJ/riyynPrTmbiIPRw8/IXnO2gjah+uOoPSzCm18nECTC5YBBCfl99NNKyut7MJE/wf
	A6qYR3+NqD6Urs0/MKQAjT7tk5+YTXWXLA3INNcG4cookrBbHYnaip5S39z6PM456z0V
	N+69wif/BM2iX1avIUe79B2ehzmCU0RsnE4nFWbUqwGP1Er9LAXm36x6IjPmg/ATMMuh
	OGwXCJyN5Jsjsl9qrhLtbEJJ32uy26hjCwWKi7+FE/SqEibjTtU3Di0092DsfICfxllE
	pF1w==
X-Gm-Message-State: APjAAAXOQxTOxWEIRrxYO04la7oqcUxR3cro4s6fJPq/roBQXNqmKnxf
	AG8M+rkf3vcrGCjzO48tyfp3GKvk
X-Google-Smtp-Source: APXvYqz99g6l4knPtpWBiW0Xpj9WGq3Plsu8B6g8nWqkYY0JUgNqxBX4PqJlThqUO+4KKDREfa3d0Q==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr22837760wro.360.1576395270016;
	Sat, 14 Dec 2019 23:34:30 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f12sm16961525wmf.28.2019.12.14.23.34.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Dec 2019 23:34:29 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 07:34:23 +0000
Message-Id: <20191215073423.89510-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215073423.89510-1-alex.kiernan@gmail.com>
References: <20191215073423.89510-1-alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/2] ostree: Add support for gjs tests
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
X-List-Received-Date: Sun, 15 Dec 2019 07:34:29 -0000

Now gjs is packaged in meta-gnome, if that layer is available then
enable the gjs tests. Also weaken test for python3-pyyaml so that
building ptest without meta-python is possible (though more tests will
have to be skipped).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-extended/ostree/ostree_2019.6.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
index 86a7aac31c27..374ceb397ba0 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
@@ -86,6 +86,10 @@ EXTRA_OECONF_class-native = " \
     --disable-otmpfile \
 "
 
+CACHED_CONFIGUREVARS += " \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'gnome-layer', 'ac_cv_path_GJS=${bindir}/gjs', '', d)} \
+"
+
 # Path to ${prefix}/lib/ostree/ostree-grub-generator is hardcoded on the
 # do_configure stage so we do depend on it
 SYSROOT_DIR = "${STAGING_DIR_TARGET}"
@@ -166,9 +170,10 @@ RDEPENDS_${PN}-ptest += " \
     grep \
     python3-core \
     python3-multiprocessing \
-    python3-pyyaml \
     tar \
     ${PN}-trivial-httpd \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'gnome-layer', 'gjs', '', d)} \
+    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
 "
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
 
@@ -179,9 +184,3 @@ SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
 SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
 
 BBCLASSEXTEND = "native"
-
-python __anonymous() {
-    if bb.utils.contains('PTEST_ENABLED', '1', 'True', '', d):
-        if not bb.utils.contains_any('BBFILE_COLLECTIONS', 'meta-python', 'True', '', d):
-            raise bb.parse.SkipRecipe('ptest requires meta-python to be present.')
-}
-- 
2.17.1


