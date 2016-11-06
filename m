Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 401B27199C
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Nov 2016 22:07:10 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p190so13518449wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Nov 2016 14:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V8Gw+3WXGs9u96Q0amDobT76QZWQ9KdZcl6eCwUmqm4=;
	b=edp1xn0KuXWpz5L/rWRu2ZUA2iySnU/F/oRXI2mt4DAobqxwCmST1jNRxGxFp0nSDy
	65oVYatnPY9axuLrlY6XP3ExU5DbmowZ8zYrkragefeRdUQl6XhveJ6j+rZRqZbTuCZ4
	cXTydnKcq6BrBOT1NCKRKsbIBCWDgbdov58zY9F0PfFEEKAc492+EUJSmETn622zrji+
	ma5hukDG21ju3Zdu7+6G6XvyW7CWEndRFbCHlrIgx33pEbnmMykp5ieJEU2yMtjNEm43
	kRHGk5wpvdMdzZWYs+Y8akRiXwF9DExPVIFTppHeuRmjtN5+hk04Xz66oo1ro/ADcqT0
	GCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=V8Gw+3WXGs9u96Q0amDobT76QZWQ9KdZcl6eCwUmqm4=;
	b=aYSRb4qipOLPzPufskQdrjZ5T2h11T/2j2aPiGRWxJMyZ0FueGVEKAkt5EQDjRaYua
	2qKocCTzYCBLHkvdSkNoVyTbgUM8tOBBq0LKk6QCrV0S8/nKqBTzScszWHaPqZuVz8Wo
	bvrlxmcFK8Tb0+mRzMH06Yd3D7mfQ3NIz7GIWfr+pnJQHMd2qpov202OBGCGPknT4WAU
	6dcGl7PSKPSXiq5Ek+1Q+1MbxUk1tn38LJQoNEJPgMpJmGcxhcoqZMyysZtDRE6LfOLR
	jvjoF88ilLutl00lfXvAEWFkOfU/MwfXvZQ28r4D/TIw6tKFt7tqSRhzytIwtyT4VyzX
	OyCw==
X-Gm-Message-State: ABUngven95oakW91QBfYaIB1Fi6Fcolvvm6GLOYc4AKcoDEBhwrVh7pKf+jPHVNrN2JrpQ==
X-Received: by 10.194.71.228 with SMTP id y4mr3629508wju.136.1478470031614;
	Sun, 06 Nov 2016 14:07:11 -0800 (PST)
Received: from localhost.localdomain (p4FDF1D71.dip0.t-ipconnect.de.
	[79.223.29.113]) by smtp.googlemail.com with ESMTPSA id
	k2sm16044363wjv.11.2016.11.06.14.07.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Nov 2016 14:07:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Nov 2016 23:06:39 +0100
Message-Id: <1478470013-27247-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 01/15] Revert "physfs: move to sources found at github/supertux"
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
X-List-Received-Date: Sun, 06 Nov 2016 22:07:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This reverts commit 3bbec2b7921c83e13b64e808ef34122a608933f0.

The commit was intended to make supertux in meta-games happy. Now I found out
that:

* other packets e.g meta-retro d1x-rebirth segfault with supertux version of physfs
* supertux can be configured to use it's own physfs as static library

To avoid package version counting backwards PE = 1 was added. The patch
required for supertux was already applied in meta-games.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 ----------------------
 .../recipes-support/physfs/physfs_2.0.3.bb         | 13 ++++++
 .../recipes-support/physfs/physfs_git.bb           | 15 -------
 3 files changed, 13 insertions(+), 67 deletions(-)
 delete mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
 create mode 100644 meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
 delete mode 100644 meta-filesystems/recipes-support/physfs/physfs_git.bb

diff --git a/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch b/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
deleted file mode 100644
index 805c4a1..0000000
--- a/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 06fe4c205094e0b65d3e5d1244f52089ed5bdafb Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sun, 25 Sep 2016 23:50:22 +0200
-Subject: [PATCH] fix build with gcc-6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/archiver_zip.c | 1 -
- src/physfs_miniz.h | 3 +++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/archiver_zip.c b/src/archiver_zip.c
-index 5c4996d..3b436db 100644
---- a/src/archiver_zip.c
-+++ b/src/archiver_zip.c
-@@ -845,7 +845,6 @@ static ZIPentry *zip_hash_ancestors(ZIPinfo *info, char *name)
-     if (sep)
-     {
-         const size_t namelen = (sep - name) + 1;
--        ZIPentry *parent;
- 
-         *sep = '\0';  /* chop off last piece. */
-         retval = zip_find_entry(info, name);
-diff --git a/src/physfs_miniz.h b/src/physfs_miniz.h
-index 619cb71..fd877c0 100644
---- a/src/physfs_miniz.h
-+++ b/src/physfs_miniz.h
-@@ -194,6 +194,8 @@ struct tinfl_decompressor_tag
-     code_len = TINFL_FAST_LOOKUP_BITS; do { temp = (pHuff)->m_tree[~temp + ((bit_buf >> code_len++) & 1)]; } while (temp < 0); \
-   } sym = temp; bit_buf >>= code_len; num_bits -= code_len; } MZ_MACRO_END
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wmisleading-indentation"
- static tinfl_status tinfl_decompress(tinfl_decompressor *r, const mz_uint8 *pIn_buf_next, size_t *pIn_buf_size, mz_uint8 *pOut_buf_start, mz_uint8 *pOut_buf_next, size_t *pOut_buf_size, const mz_uint32 decomp_flags)
- {
-   static const int s_length_base[31] = { 3,4,5,6,7,8,9,10,11,13, 15,17,19,23,27,31,35,43,51,59, 67,83,99,115,131,163,195,227,258,0,0 };
-@@ -465,6 +467,7 @@ common_exit:
-   }
-   return status;
- }
-+#pragma GCC diagnostic pop
- 
- /* Flush values. For typical usage you only need MZ_NO_FLUSH and MZ_FINISH. The other stuff is for advanced use. */
- enum { MZ_NO_FLUSH = 0, MZ_PARTIAL_FLUSH = 1, MZ_SYNC_FLUSH = 2, MZ_FULL_FLUSH = 3, MZ_FINISH = 4, MZ_BLOCK = 5 };
--- 
-2.5.5
-
diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
new file mode 100644
index 0000000..dc2c106
--- /dev/null
+++ b/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
@@ -0,0 +1,13 @@
+SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
+HOMEAPAGE = "http://icculus.org/physfs"
+LICENSE = "Zlib"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5d94e3eaaa10b00ca803ba35a3e87cde"
+DEPENDS = "readline zlib"
+
+inherit cmake
+
+PE = "1"
+
+SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
+SRC_URI[md5sum] = "c2c727a8a8deb623b521b52d0080f613"
+SRC_URI[sha256sum] = "ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69"
diff --git a/meta-filesystems/recipes-support/physfs/physfs_git.bb b/meta-filesystems/recipes-support/physfs/physfs_git.bb
deleted file mode 100644
index a50715c..0000000
--- a/meta-filesystems/recipes-support/physfs/physfs_git.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "PhysicsFS is a library to provide abstract access to various archives"
-HOMEAPAGE = "http://icculus.org/physfs"
-LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4424d2cfb8a288df2843c4467b5d719a"
-DEPENDS = "readline zlib"
-
-inherit cmake
-
-SRC_URI = " \
-    git://github.com/SuperTux/physfs.git \
-    file://0001-fix-build-with-gcc-6.patch \
-"
-SRCREV = "f3b45a94d0b7c0a85469b1e60fefd8383b6719ba"
-S = "${WORKDIR}/git"
-PV = "2.0.3+git${SRCPV}"
-- 
2.5.5


