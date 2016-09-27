Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF6D6078E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Sep 2016 05:55:56 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s29so694663lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 22:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=u8tPIPYJSo/DZDf9XZr9L0eVh2PeZi7Y+Z5kS2WQ/hY=;
	b=VnmHt72rleYdiK0fD1YW4nOvFviky0rWCm1jtXOfYFmT46flL2eaOMR4ML0PF+xVf1
	P2nQFqap++gSjHG4smop0/Ix3xj71XIr/OenTh2NcA7WMEEuP3A9TXajmEb7TqIgPRhP
	piscXdSczxYUhUeEM7wisDaraYnAMi90mkmedUSyu+xyIMGR9Ohtuh7Cy0DledG3P6bp
	EwiGX2vOFKFcJIE1Z1WLj4HhIAVQLOcfVN7SYyIMh1p+ltaP7463VVdrVbkaR29ChA1V
	7uo310+6e4CuHR0+3I64Zj5d4Hd12w5ku/Xi3toSguzXZN36Gsk5CeVlv7jyt3z+kni5
	t9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u8tPIPYJSo/DZDf9XZr9L0eVh2PeZi7Y+Z5kS2WQ/hY=;
	b=k6hpVUUWmzQgKEK++S0zheGATe7ROc6SdWCS5HH6xB/t8yDgACD+VSEke+3kRvxJFp
	SyjbqjV0umR2N+IJ3VwcXeO8q+vw4Qmt+YLlrRnFP5xL7UjketHgbnlddfXqayfHGXEV
	2ALp873J26xXZLC0vyLws+y4i2IQSiYRAXtkVZWRnea9TmlzoZFb41KyjfzdZoK+g98q
	AoXvE/kOkonhEHnHI1IcWmFDBy8kjaP+Nr2Gc86Lx8jA1e+Q+YPOQxR56vynjBkU7PHa
	EOYSoGw9mRipktB8EYFc6tBjToMosjDnpFhWbKg039U6plBS2gDzEdmyO1EmL4DRcLKg
	U20g==
X-Gm-Message-State: AE9vXwNWrGi3gCY0zUku6MRlOqPXgbJUcmkEQAmFZrldUM6plOR0pZTyMfBygl40hRO1Cg==
X-Received: by 10.194.178.130 with SMTP id cy2mr20592572wjc.138.1474955757095; 
	Mon, 26 Sep 2016 22:55:57 -0700 (PDT)
Received: from localhost.localdomain (p4FDF068E.dip0.t-ipconnect.de.
	[79.223.6.142]) by smtp.googlemail.com with ESMTPSA id
	f15sm1156668wmf.8.2016.09.26.22.55.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Sep 2016 22:55:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Sep 2016 07:55:33 +0200
Message-Id: <1474955733-30185-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
References: <1474955733-30185-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] physfs: move to sources found at github/supertux
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
X-List-Received-Date: Tue, 27 Sep 2016 05:55:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems that physfs is still maintained there and has the functionality
required by latest supertux.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../physfs/files/0001-fix-build-with-gcc-6.patch   | 52 ++++++++++++++++++++++
 .../physfs/{physfs_2.0.3.bb => physfs_git.bb}      | 10 +++--
 2 files changed, 59 insertions(+), 3 deletions(-)
 create mode 100644 meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
 rename meta-filesystems/recipes-support/physfs/{physfs_2.0.3.bb => physfs_git.bb} (55%)

diff --git a/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch b/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
new file mode 100644
index 0000000..805c4a1
--- /dev/null
+++ b/meta-filesystems/recipes-support/physfs/files/0001-fix-build-with-gcc-6.patch
@@ -0,0 +1,52 @@
+From 06fe4c205094e0b65d3e5d1244f52089ed5bdafb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Sun, 25 Sep 2016 23:50:22 +0200
+Subject: [PATCH] fix build with gcc-6
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/archiver_zip.c | 1 -
+ src/physfs_miniz.h | 3 +++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/archiver_zip.c b/src/archiver_zip.c
+index 5c4996d..3b436db 100644
+--- a/src/archiver_zip.c
++++ b/src/archiver_zip.c
+@@ -845,7 +845,6 @@ static ZIPentry *zip_hash_ancestors(ZIPinfo *info, char *name)
+     if (sep)
+     {
+         const size_t namelen = (sep - name) + 1;
+-        ZIPentry *parent;
+ 
+         *sep = '\0';  /* chop off last piece. */
+         retval = zip_find_entry(info, name);
+diff --git a/src/physfs_miniz.h b/src/physfs_miniz.h
+index 619cb71..fd877c0 100644
+--- a/src/physfs_miniz.h
++++ b/src/physfs_miniz.h
+@@ -194,6 +194,8 @@ struct tinfl_decompressor_tag
+     code_len = TINFL_FAST_LOOKUP_BITS; do { temp = (pHuff)->m_tree[~temp + ((bit_buf >> code_len++) & 1)]; } while (temp < 0); \
+   } sym = temp; bit_buf >>= code_len; num_bits -= code_len; } MZ_MACRO_END
+ 
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wmisleading-indentation"
+ static tinfl_status tinfl_decompress(tinfl_decompressor *r, const mz_uint8 *pIn_buf_next, size_t *pIn_buf_size, mz_uint8 *pOut_buf_start, mz_uint8 *pOut_buf_next, size_t *pOut_buf_size, const mz_uint32 decomp_flags)
+ {
+   static const int s_length_base[31] = { 3,4,5,6,7,8,9,10,11,13, 15,17,19,23,27,31,35,43,51,59, 67,83,99,115,131,163,195,227,258,0,0 };
+@@ -465,6 +467,7 @@ common_exit:
+   }
+   return status;
+ }
++#pragma GCC diagnostic pop
+ 
+ /* Flush values. For typical usage you only need MZ_NO_FLUSH and MZ_FINISH. The other stuff is for advanced use. */
+ enum { MZ_NO_FLUSH = 0, MZ_PARTIAL_FLUSH = 1, MZ_SYNC_FLUSH = 2, MZ_FULL_FLUSH = 3, MZ_FINISH = 4, MZ_BLOCK = 5 };
+-- 
+2.5.5
+
diff --git a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb b/meta-filesystems/recipes-support/physfs/physfs_git.bb
similarity index 55%
rename from meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
rename to meta-filesystems/recipes-support/physfs/physfs_git.bb
index 5618f28..3f1c156 100644
--- a/meta-filesystems/recipes-support/physfs/physfs_2.0.3.bb
+++ b/meta-filesystems/recipes-support/physfs/physfs_git.bb
@@ -6,6 +6,10 @@ DEPENDS = "readline zlib"
 
 inherit cmake
 
-SRC_URI = "http://icculus.org/${BPN}/downloads/${BP}.tar.bz2"
-SRC_URI[md5sum] = "c2c727a8a8deb623b521b52d0080f613"
-SRC_URI[sha256sum] = "ca862097c0fb451f2cacd286194d071289342c107b6fe69079c079883ff66b69"
+SRC_URI = " \
+    git://github.com/SuperTux/physfs.git \
+    file://0001-fix-build-with-gcc-6.patch \
+"
+SRCREV = "f3b45a94d0b7c0a85469b1e60fefd8383b6719ba"
+S = "${WORKDIR}/git"
+PV = "2.0.3+git${SRCPV}"
-- 
2.5.5


