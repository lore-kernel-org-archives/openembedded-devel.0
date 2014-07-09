Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C94070194
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 06:18:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s696IliP025817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Jul 2014 23:18:47 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 8 Jul 2014 23:18:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Jul 2014 23:18:47 -0700
Message-ID: <1404886727-44130-1-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe] [PATCH] fftwf and fftwl: exclude them from world
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jul 2014 06:18:55 -0000
Content-Type: text/plain

The fftw, fftwf and fftwl provide the same files (different contents), we
should only build one of them, otherwise there would be warning

WARNING: The recipe fftw is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
   sysroots/qemux86-64/usr/include/fftw3.f03
   Matched in manifest-qemux86-64-fftwl.populate_sysroot
manifest-qemux86-64-fftwf.populate_sysroot
   sysroots/qemux86-64/usr/include/fftw3.h
   Matched in manifest-qemux86-64-fftwl.populate_sysroot
manifest-qemux86-64-fftwf.populate_sysroot
   sysroots/qemux86-64/usr/include/fftw3q.f03
   Matched in manifest-qemux86-64-fftwl.populate_sysroot
manifest-qemux86-64-fftwf.populate_sysroot
   sysroots/qemux86-64/usr/include/fftw3.f
   Matched in manifest-qemux86-64-fftwl.populate_sysroot
manifest-qemux86-64-fftwf.populate_sysroot
   sysroots/qemux86-64/usr/include/fftw3l.f03
   Matched in manifest-qemux86-64-fftwl.populate_sysroot
manifest-qemux86-64-fftwf.populate_sysroot
Please verify which package should provide the above files.

and maybe errors (race issue):

The recipe imagemagick.do_compiler error:
  fourier.c:69:19: fatal error: fftw3.h: No such file or directory
   #include <fftw3.h>

This is because imagemagick.do_configure depends on fftw.populate_sysroot, but
the files installed by fftw.populate_sysroot, maybe removed by fftwl or fftwf
when they rebuild.

Only build fftw in the world will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb |    2 ++
 meta-oe/recipes-support/fftw/fftwl_3.3.4.bb |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
index 59f4a11..8731df7 100644
--- a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
@@ -6,3 +6,5 @@ EXTRA_OECONF += "--enable-single \
 
 SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
 SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
index 8f37346..a56bbc8 100644
--- a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
+++ b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
@@ -4,3 +4,5 @@ EXTRA_OECONF += "--enable-long-double"
 
 SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
 SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
1.7.9.5


