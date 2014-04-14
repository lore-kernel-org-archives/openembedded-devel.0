Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id D85B460C22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 11:37:59 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id t60so7929575wes.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 04:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=qcVS0yYcsPtf8DlD46TDr1W5QdeoA3UirJzYz7NhOuw=;
	b=YIRnBt2+LmTrmN6U1E6pzgyjao0qnKmVA96JeB4LJ4CjBCPGKGVa/FWPvtfBzLX0T1
	V+uhSlrkoSiC3FWkJDI8moQAdcBtUaBIGAPXe3fqnU+X5CvWV5WvaEn+Rrx5ALJ+WgKJ
	SNCC+RTNFCcunvYUZzuVeZL1nBCRWNacEGedAfEedOgnER0OJoIaTH8tUfYGQMsTpLAY
	m580BfTtvFtCt1Bue8Vb+6iTmM24a4GcNd8KTRTE7kBin2nAnZDKdpxQBGCtz9R4Tm2M
	ZZkjMhA5c8SapsLQHJt3ZfpDaKmdsMttI4nygv+Z6rGzgS8kco8ZLRRzCBRbhytNe69k
	s/aQ==
X-Received: by 10.194.48.100 with SMTP id k4mr1792227wjn.49.1397475479689;
	Mon, 14 Apr 2014 04:37:59 -0700 (PDT)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginm.net. [81.110.75.141])
	by mx.google.com with ESMTPSA id ez5sm24666147wjd.9.2014.04.14.04.37.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Apr 2014 04:37:58 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Apr 2014 12:37:50 +0100
Message-Id: <1397475471-23068-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH 1/2] fftw: Refactor EXTRA_OECONF
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
X-List-Received-Date: Mon, 14 Apr 2014 11:38:02 -0000

The configure flags common to all three fftw recipes are moved into fftw.inc and
then each recipe just appends the extra flags it needs. This makes it easier to
read and modify options which affect all three recipes.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/fftw/fftw.inc       | 2 ++
 meta-oe/recipes-support/fftw/fftw_3.3.3.bb  | 3 ---
 meta-oe/recipes-support/fftw/fftwf_3.3.3.bb | 4 +---
 meta-oe/recipes-support/fftw/fftwl_3.3.3.bb | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/fftw/fftw.inc b/meta-oe/recipes-support/fftw/fftw.inc
index 074a53b..6bd622d 100644
--- a/meta-oe/recipes-support/fftw/fftw.inc
+++ b/meta-oe/recipes-support/fftw/fftw.inc
@@ -11,6 +11,8 @@ S = "${WORKDIR}/fftw-${PV}"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
+
 do_configure_prepend() {
     echo 'AM_PROG_AS' >> ${S}/configure.ac 
 }
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.3.bb b/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
index 03a1274..b889c91 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
@@ -1,7 +1,4 @@
 require fftw.inc
 
-EXTRA_OECONF = "--disable-fortran --enable-shared --enable-threads"
-
 SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2"
 SRC_URI[sha256sum] = "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3"
-
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
index e2989d6..5e4e8ed 100644
--- a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
+++ b/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
@@ -1,10 +1,8 @@
 require fftw.inc
 
-EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared \
-    --enable-threads \
+EXTRA_OECONF += "--enable-single \
     ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
 "
 
 SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2"
 SRC_URI[sha256sum] = "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3"
-
diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
index b28784e..9c67354 100644
--- a/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
+++ b/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
@@ -1,7 +1,6 @@
 require fftw.inc
 
-EXTRA_OECONF = "--disable-fortran --enable-long-double --enable-shared --enable-threads"
+EXTRA_OECONF += "--enable-long-double"
 
 SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2"
 SRC_URI[sha256sum] = "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3"
-
-- 
1.9.2


