Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5052371AFC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 06:14:28 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id d5so7696328pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 23:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z04Mw19vtDKbReTQuPbU9kZye9fIe1d5R4XomHUqW7o=;
	b=fpjZElYMcnul43yeuaTmBHED5fqkwUf+9BYbFvJ8IlhIEkbwK7aXNREJgG0xWz8+ry
	H6TlEFJ6VC2JO0pVHcIif85ggvMPEm90jc9VSrgQpfGcGogs5yKSb/dM8vhLAkU72QPP
	uPcDTVkxc502Iy1a7WlLXY9zR/05lfiZnyItfoX0EPXmmwNrcYFrR5CEbp6dbd380xC4
	6OrWSA52WddsSfyZonSKpZiGGJD6CNqQIEPLiWNPAlJj4YLdWfHvaWZNvcDibkylOACQ
	/1IuSjHdo9gC3lVks6IycU7sg0FpLDXlAAd7hxXk6Qy/NpyG02skl/MH6flzAyuvQ35g
	ANKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z04Mw19vtDKbReTQuPbU9kZye9fIe1d5R4XomHUqW7o=;
	b=uUr6IHIPDeuCS/7mol15BYt9tOfNEn5f3QYZViMWVSHajyRzpeoS+ul/CqLOKvBSgs
	VhQvTn4+ipJXGXAiKEcNGrDHt5VYZ9o+7wvg3WnZlZW3aQTwwcmVYycPlSsRPVuCkF7C
	vXU30FAFGu4ysKh+tO4JD/PiLc9y9JtwQLhuOz5QkOtCBI5cKB4MgWW+79x5zb/xtqXg
	vIlZX4ts1r2ivnWnWuT5bnaX5uD+DCV5GbMqudoppzW8gxhwa9WkrHDYra/iGxH4/lhE
	EKPpb0keMB7TLQZxR6X9LQl5g3eSV3bQNOV1ayaN9ZLRBdNA2aiNXdCoxfdG14H5Q+hb
	O5mg==
X-Gm-Message-State: AKS2vOwx/jowb0qUcSjpW/fk+Y5IJHAkoPbHk7VWANAJSk2rNgn8sIL2
	NoOGZ0lerCqQjJn6
X-Received: by 10.99.67.68 with SMTP id q65mr8829494pga.260.1498630469998;
	Tue, 27 Jun 2017 23:14:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	r129sm2102839pfr.112.2017.06.27.23.14.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 23:14:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 23:14:15 -0700
Message-Id: <20170628061418.16693-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
Subject: [meta-oe][PATCH 1/4] cdrkit: Fix build with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 06:14:29 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb |  8 ++--
 ...001-genisoimage-Fix-fprintf-format-errors.patch | 49 ++++++++++++++++++++++
 2 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch

diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
index 554b89ffa..f0efc51e1 100644
--- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
+++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
@@ -5,10 +5,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b30d3b2750b668133fc17b401e1b98f8"
 
 # While writing download from cdrkit.org was broken so get sources from debian
-SRC_URI = " \
-    ${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
-    file://0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch \
-"
+SRC_URI = "${DEBIAN_MIRROR}/main/c/${BPN}/${BPN}_${PV}.orig.tar.gz \
+           file://0001-do-not-create-a-run-test-to-determine-order-of-bitfi.patch \
+           file://0001-genisoimage-Fix-fprintf-format-errors.patch \
+           "
 SRC_URI[md5sum] = "efe08e2f3ca478486037b053acd512e9"
 SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc78e47da"
 
diff --git a/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch
new file mode 100644
index 000000000..f52f71b63
--- /dev/null
+++ b/meta-oe/recipes-multimedia/cdrkit/files/0001-genisoimage-Fix-fprintf-format-errors.patch
@@ -0,0 +1,49 @@
+From 8547f23c4416ed98f585c53c62e7d8afd8edab36 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 21:05:31 -0700
+Subject: [PATCH] genisoimage: Fix fprintf format errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ genisoimage/genisoimage.c | 4 ++--
+ genisoimage/tree.c        | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/genisoimage/genisoimage.c b/genisoimage/genisoimage.c
+index 46f0cb7..9089081 100644
+--- a/genisoimage/genisoimage.c
++++ b/genisoimage/genisoimage.c
+@@ -3406,7 +3406,7 @@ if (check_session == 0)
+ 	if (goof) {
+ 		fprintf(stderr, "ISO9660/Rock Ridge tree sort failed.\n");
+ 		if(merge_warn_msg)
+-			fprintf(stderr, merge_warn_msg);
++			fprintf(stderr, "%s", merge_warn_msg);
+ 		exit(1);
+ 	}
+ #ifdef UDF
+@@ -3419,7 +3419,7 @@ if (check_session == 0)
+ 	if (goof) {
+ 		fprintf(stderr, "Joliet tree sort failed. The -joliet-long switch may help you.\n");
+ 		if(merge_warn_msg)
+-			fprintf(stderr, merge_warn_msg);
++			fprintf(stderr, "%s", merge_warn_msg);
+ 		exit(1);
+ 	}
+ 	/*
+diff --git a/genisoimage/tree.c b/genisoimage/tree.c
+index 7805888..8412cc3 100644
+--- a/genisoimage/tree.c
++++ b/genisoimage/tree.c
+@@ -647,7 +647,7 @@ got_valid_name:
+      fprintf(stderr, "Unable to sort directory %s\n",
+            this_dir->whole_name);
+      if(merge_warn_msg)
+-        fprintf(stderr, merge_warn_msg);
++        fprintf(stderr, "%s", merge_warn_msg);
+      exit(1);
+ 	}
+ 	/*
+-- 
+2.13.2
+
-- 
2.13.2


