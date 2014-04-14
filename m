Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id D3EE265E88
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 11:38:00 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id w61so8082204wes.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 04:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f/yWuoUgtALxocrb6gkUGwSd/foLiuwBDeSW3YzHqV0=;
	b=f00O4NHoXH3inSu1C7jzLfNNJpZQZLR37IMVXyVcjhq/jBxztnz47SXRpTEwEtH+YE
	qLCzH9EJHeE2gPm113MqXEPbPJz6SAuseq09GaQc7iJpo8lEhARBYBaX2zSetf/9lOUE
	7hk6SjwUzsNriDrna3LNH8/P2SuflGsxQggl9JjS2CyW2apqUHLMjhhuo3PvZ6nL+anc
	t/Ep4U0eiANDY8oy1hycAq0F7h5W61MZBmcUWF9AFx523oqzyADgCnBfBRO/fmr9r238
	t/REH/0SAhKPBrvDPZJI7YM4Nojz3K+AfjQUoACCn1lD4y4v9ACw9+vNbkYs9AaF/Tr7
	uARQ==
X-Received: by 10.194.120.101 with SMTP id lb5mr133872wjb.74.1397475480918;
	Mon, 14 Apr 2014 04:38:00 -0700 (PDT)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginm.net. [81.110.75.141])
	by mx.google.com with ESMTPSA id ez5sm24666147wjd.9.2014.04.14.04.37.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Apr 2014 04:38:00 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Apr 2014 12:37:51 +0100
Message-Id: <1397475471-23068-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1397475471-23068-1-git-send-email-paul@paulbarker.me.uk>
References: <1397475471-23068-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] fftw: Upgrade to v3.3.4
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
X-List-Received-Date: Mon, 14 Apr 2014 11:38:03 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/fftw/fftw_3.3.3.bb  | 4 ----
 meta-oe/recipes-support/fftw/fftw_3.3.4.bb  | 4 ++++
 meta-oe/recipes-support/fftw/fftwf_3.3.3.bb | 8 --------
 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb | 8 ++++++++
 meta-oe/recipes-support/fftw/fftwl_3.3.3.bb | 6 ------
 meta-oe/recipes-support/fftw/fftwl_3.3.4.bb | 6 ++++++
 6 files changed, 18 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/fftw/fftw_3.3.3.bb
 create mode 100644 meta-oe/recipes-support/fftw/fftw_3.3.4.bb
 delete mode 100644 meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
 create mode 100644 meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
 delete mode 100644 meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
 create mode 100644 meta-oe/recipes-support/fftw/fftwl_3.3.4.bb

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.3.bb b/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
deleted file mode 100644
index b889c91..0000000
--- a/meta-oe/recipes-support/fftw/fftw_3.3.3.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require fftw.inc
-
-SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2"
-SRC_URI[sha256sum] = "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3"
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
new file mode 100644
index 0000000..5824d41
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
@@ -0,0 +1,4 @@
+require fftw.inc
+
+SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
+SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
deleted file mode 100644
index 5e4e8ed..0000000
--- a/meta-oe/recipes-support/fftw/fftwf_3.3.3.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require fftw.inc
-
-EXTRA_OECONF += "--enable-single \
-    ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
-"
-
-SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2"
-SRC_URI[sha256sum] = "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3"
diff --git a/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
new file mode 100644
index 0000000..59f4a11
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftwf_3.3.4.bb
@@ -0,0 +1,8 @@
+require fftw.inc
+
+EXTRA_OECONF += "--enable-single \
+    ${@base_contains('TUNE_FEATURES', 'neon', '--enable-neon', '', d)} \
+"
+
+SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
+SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
deleted file mode 100644
index 9c67354..0000000
--- a/meta-oe/recipes-support/fftw/fftwl_3.3.3.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require fftw.inc
-
-EXTRA_OECONF += "--enable-long-double"
-
-SRC_URI[md5sum] = "0a05ca9c7b3bfddc8278e7c40791a1c2"
-SRC_URI[sha256sum] = "85cdfc0a0ba10d8fa4f0f8e733aac1a5936c859832a9e3d5c0731fb5c54a97f3"
diff --git a/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
new file mode 100644
index 0000000..8f37346
--- /dev/null
+++ b/meta-oe/recipes-support/fftw/fftwl_3.3.4.bb
@@ -0,0 +1,6 @@
+require fftw.inc
+
+EXTRA_OECONF += "--enable-long-double"
+
+SRC_URI[md5sum] = "2edab8c06b24feeb3b82bbb3ebf3e7b3"
+SRC_URI[sha256sum] = "8f0cde90929bc05587c3368d2f15cd0530a60b8a9912a8e2979a72dbe5af0982"
-- 
1.9.2


