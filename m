Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 369787F7C3
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Dec 2019 21:28:35 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id bh2so3774005plb.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Dec 2019 13:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w4HpuXfEwvSuz+7hWpY/Df51bFURxtQNmNwLJ0NZJ+g=;
	b=WHd/WYMqcQFPIJs8mBDcySTjhxVJb+UbIb3UwLh1lk8ifTpTb2TE6j7QIQiALJEch4
	BVJrseQFK4Zqb7v/VRciRhw3JgGRc/upLyh0/TKiJ3f8frwLQGFoz71uqL4tLw9ScfCQ
	l7de1TGWyHRHPvzjoO3gFD2p0LDRuLTcFgAUiDBTim4ztjGyp97+U849Qm4QkYu/Zk56
	YH0aFgwi4qRQr3WJNaTGEM4vu+7xsqHSLpV7YKb6Pi6kLDQGsgpGzXXRmbJJh3d0Zr1J
	I+VXprTecou4pkstXqib5pyuvf7wV1h7rxt3ccL1o+fnHuW8PLHWRnC57Tf3ajoHGKlZ
	euFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=w4HpuXfEwvSuz+7hWpY/Df51bFURxtQNmNwLJ0NZJ+g=;
	b=Z8MQXzUKtZA6nXUn8Ibw+XHFYeUbZaeJ34TgmO16pB8j26eJL94U30xtedWtqQYpdV
	I5iSoiZzBnPLp17wW3JJzZACSJg70+9hE87vx4+464t1dJqeJ3pDKex42szyTZ3vHsCv
	ORjmmmlVlsr43GU8FCZjS2ZNvp52W3yiWZdGBNfB1xdAjSBPQPuJ+jZkyBKtl6h39Cg4
	5TYGHFov/h7L1Nx7UMifLwwwpziFdWNLqBLklQIEmbWWoZ8fGFBKRdu0Lk8oVxQVQd1e
	hlCkh7wmJ/mzIkiGfyjWC+bgFwkFn57HIHG5n7pXfwMETJHV6iM6AEMD6FHa2cBMATDT
	tF8w==
X-Gm-Message-State: APjAAAUQ7NDpSFk0ZWtF0CKHbWt8HFcgv3XOlzCGN01N3Z5fGg79RhIH
	qMF92rMVx8bZY5Zk1LTfkgO3zpQfy4E=
X-Google-Smtp-Source: APXvYqzmHwsizR6obANY/sLhfeA67N7tXXWK+RDJDxC5yKl5q7pw9lm1jw3YXB7+Ot9Iv8oSNRDm8w==
X-Received: by 2002:a17:90a:ca12:: with SMTP id
	x18mr28256371pjt.66.1575840516522; 
	Sun, 08 Dec 2019 13:28:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::afb7])
	by smtp.gmail.com with ESMTPSA id
	o14sm6305895pgm.67.2019.12.08.13.28.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 08 Dec 2019 13:28:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  8 Dec 2019 13:28:26 -0800
Message-Id: <20191208212826.3162194-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] id3lib: Update to newer debian patchset
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
X-List-Received-Date: Sun, 08 Dec 2019 21:28:36 -0000
Content-Transfer-Encoding: 8bit

adopt the patch routine, since the format of tarball has changed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/id3lib/id3lib_3.8.3.bb | 40 +++++++++++++++++--
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
index fc80cc0acf..9d311608e4 100644
--- a/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
+++ b/meta-oe/recipes-multimedia/id3lib/id3lib_3.8.3.bb
@@ -7,12 +7,46 @@ DEPENDS = "zlib"
 PR = "r1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
-           http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
+           ${DEBIAN_MIRROR}/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-16.2.debian.tar.xz;name=patch;subdir=${BP} \
            file://acdefine.patch \
 "
 SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
 SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
-SRC_URI[patch.md5sum] = "805c0320a2efb21c40ce06fa13cd7c4b"
-SRC_URI[patch.sha256sum] = "9f03b59ccc8826a5be55a3dcde2f889067d58bdc72bf846416a198c9b933704c"
+SRC_URI[patch.md5sum] = "997c764d3be11c9a51779d93facf1118"
+SRC_URI[patch.sha256sum] = "ac2ee23ec89ba2af51d2c6dd5b1b6bf9f8a9f813de251bc182941439a4053176"
 
 inherit autotools
+
+# Unlike other Debian packages, id3lib*.diff.gz contains another series of
+# patches maintained by quilt. So manually apply them before applying other local
+# patches. Also remove all temp files before leaving, because do_patch() will pop
+# up all previously applied patches in the start
+id3lib_do_patch() {
+    cd ${S}
+    # it's important that we only pop the existing patches when they've
+    # been applied, otherwise quilt will climb the directory tree
+    # and reverse out some completely different set of patches
+    if [ -d ${S}/patches ]; then
+        # whilst this is the default directory, doing it like this
+        # defeats the directory climbing that quilt will otherwise
+        # do; note the directory must exist to defeat this, hence
+        # the test inside which we operate
+        QUILT_PATCHES=${S}/patches quilt pop -a
+    fi
+    if [ -d ${S}/.pc-id3lib ]; then
+        rm -rf ${S}/.pc
+        mv ${S}/.pc-id3lib ${S}/.pc
+        QUILT_PATCHES=${S}/debian/patches quilt pop -a
+        rm -rf ${S}/.pc ${S}/debian
+    fi
+    QUILT_PATCHES=${S}/debian/patches quilt push -a
+    mv ${S}/.pc ${S}/.pc-id3lib
+}
+
+do_unpack[cleandirs] += "${S}"
+
+# We invoke base do_patch at end, to incorporate any local patch
+python do_patch() {
+    bb.build.exec_func('id3lib_do_patch', d)
+    bb.build.exec_func('patch_do_patch', d)
+}
-- 
2.24.0


