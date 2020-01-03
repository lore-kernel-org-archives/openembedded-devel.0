Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB347F9E4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id n59so4156370pjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=uWHdS1owgUaxEpUvxBaFYQ6ovp/3d4TmNogwqOF26rw=;
	b=R8BJGzcZmbMsEvhx9Y1RDMdBObOKGvOLRnkpOtNyhccuvEPu6oW+mGJ7g1l14n0USn
	vjx3o+RR18Irs5IEFD3W22ddjITg5XRKtvyCTKIq3JafYzbdiet1mYTf1luHay+VtoAL
	LN7A8iCMtW1UPYfLD/7V2J59ITrCG6LNFqZEGlG7LDup6lfuVOh5N4gLNb0Lq8Z8XZgL
	2ET0eF+U09/XlANjLdHB6SyPeCcsoWXavSUjSSvnPnWzRRpAespp0HVdrEgkWdqVtr6z
	oZpO2qy9sYof/BvMOV+6tmyGIWyf/FKL8EGClwVgD+a2EPA8sezbjO3MlDVqCbP/smrR
	Su2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uWHdS1owgUaxEpUvxBaFYQ6ovp/3d4TmNogwqOF26rw=;
	b=HGeoxrjwPM4bNNUhLgyflG+9AMzxRpsik3Ay2cY6o+01d+SXK6D0PkQOMWxknCe08U
	cxab0l/srLqKzOIM9GaxsAo7hWgYVLCRqHVwg2K3di6WRH5QGxZkMbBPfKTDcGmXV0Aj
	XnvreZCI3L7HsyrhorXCZEwg5PYECMKnVnm3UjH7Jj1TlyaHxge3hU/kzwhIxu/yOz87
	5J/VmR0vmglVvX2gxo6e5/SEic+32Esj5kPQM9TDXXxs18uJVsejxtvF1+YeJcSDWl00
	PJZLb2m5GPPPN68aM+ESSMORyfB1eqTqcLF9XvuxSKEs60FfWMuVFw2eyepFw7j6Ro9J
	Ml1A==
X-Gm-Message-State: APjAAAVpEeJvuMovZSdhPAvFcksDtJNSmvEUT8YPFj5hTyp6lOphuBVi
	kTFGVscSjTmsp1RgFEve9qjkVz6vmL0=
X-Google-Smtp-Source: APXvYqwEQMTPGEMq49Lnp1wwk1Nd5vmKLGw7AQZfBFmalwRYn6dawdpwYSO16zoco+rR9UsKMbb7vw==
X-Received: by 2002:a17:902:b407:: with SMTP id
	x7mr86456859plr.52.1578019784991; 
	Thu, 02 Jan 2020 18:49:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:13 -0800
Message-Id: <811c150417aaae60f18a261ea778723f6c9b4234.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 16/17] python-more-itertools: downgrade 7.2.0 -> 5.0.0
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:44 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Python 2.7 is no longer supported. The 5.0.0 release will be the last
version targeting Python 2.7. [1]

[1] https://github.com/erikrose/more-itertools/commit/560b045b430e8292c18cf5283de4fdc3e13e56f7

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python-more-itertools.inc      | 3 ---
 .../recipes-devtools/python/python-more-itertools_5.0.0.bb | 7 +++++++
 .../recipes-devtools/python/python-more-itertools_7.2.0.bb | 2 --
 .../python/python3-more-itertools_7.2.0.bb                 | 3 +++
 4 files changed, 10 insertions(+), 5 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-more-itertools.inc b/meta-python/recipes-devtools/python/python-more-itertools.inc
index 8d814a6f032..33095b3d387 100644
--- a/meta-python/recipes-devtools/python/python-more-itertools.inc
+++ b/meta-python/recipes-devtools/python/python-more-itertools.inc
@@ -2,6 +2,3 @@ DESCRIPTION = "More routines for operating on iterables, beyond itertools"
 HOMEPAGE = "https://github.com/erikrose/more-itertools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
-
-SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
-SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
new file mode 100644
index 00000000000..6c44df40a3a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-more-itertools_5.0.0.bb
@@ -0,0 +1,7 @@
+inherit pypi setuptools
+require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f2ea58aa336ce6c13b7b225b3bbe305d"
+SRC_URI[sha256sum] = "38a936c0a6d98a38bcc2d03fdaaedaba9f412879461dd2ceff8d37564d6522e4"
+
+PE = "1"
diff --git a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
deleted file mode 100644
index 0702aad4efb..00000000000
--- a/meta-python/recipes-devtools/python/python-more-itertools_7.2.0.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit pypi setuptools
-require python-more-itertools.inc
diff --git a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
index 28ddf88fb85..06d45ce5453 100644
--- a/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-more-itertools_7.2.0.bb
@@ -1,2 +1,5 @@
 inherit pypi setuptools3
 require python-more-itertools.inc
+
+SRC_URI[md5sum] = "f647bfd27243a7bebe53b5ddb6a3b1c4"
+SRC_URI[sha256sum] = "409cd48d4db7052af495b09dec721011634af3753ae1ef92d2b32f73a745f832"
-- 
2.17.1


