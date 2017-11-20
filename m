Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D5DEE787E2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 17:43:48 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d15so15724683qte.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 09:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=IYGGYXa1Ien20J+CAeIe3F/RN4HR8qbP8nl0mql4fa0=;
	b=eGeJPeNKsYUaeInuJJB9W/laK5w1fgU81D4qvfWyjp90DC1x4Znw05k+CRrFobAO3y
	FoXdo6TfkN3s+Mob+vG6b2uOT1LiuPm0yEAT79Guz3ed5QZOuPOfDvOLXMsX86lzwoJd
	sV0qX8RIXcu2qag2/FenCzpfLHdFxq8Cs7sYA1LW79Aimbseczoflj+c93dSC8s+xWXE
	pWtEeD/72MAa/2OBye89FZl3s30PKCi2qd8PrlDvR+nzsMIOErAtts5VYKafwMJT3/FD
	AnqVcmolTPEy2YOwo7yKWHSCEm1DDWdHLEhuH2tKrz9HZw5zUIyxoDzJV4W/jHY6xLsR
	+ARQ==
X-Gm-Message-State: AJaThX5cRalPVM6l/mQHeX/1pFzc6EfuDhx9EkcOUaS6V9tdh5DNU/04
	Qnkt8VYN+Ufcbx52v+ZjErHJ2w==
X-Google-Smtp-Source: AGs4zMY1W9MoQZbJvvUFOBoJG2ZnbO8TtZdIcmUnn3yPUky55Wf5MuDbzcQAwPBRLuhU8rPhHxJBHQ==
X-Received: by 10.200.20.146 with SMTP id l18mr21639222qtj.189.1511199829472; 
	Mon, 20 Nov 2017 09:43:49 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 61sm7225562qta.93.2017.11.20.09.43.46
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 20 Nov 2017 09:43:48 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 20 Nov 2017 15:43:41 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Nov 2017 15:43:30 -0200
Message-Id: <20171120174331.22399-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171120174331.22399-1-otavio@ossystems.com.br>
References: <20171120174331.22399-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 2/3] python-pycrypto: Consolidate recipe code inside of .inc
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
X-List-Received-Date: Mon, 20 Nov 2017 17:43:49 -0000

This move the patches and installation tasks inside the .inc. This is
required for the addition of python3 version of the recipe, in next
patch.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-python/recipes-devtools/python/python-pycrypto.inc      | 6 +++++-
 meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb | 4 ----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
index fb2c17df1..232cdb711 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto.inc
+++ b/meta-python/recipes-devtools/python/python-pycrypto.inc
@@ -3,12 +3,16 @@ HOMEPAGE = "http://www.pycrypto.org/"
 LICENSE = "PSFv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"
 
 DEPENDS += " gmp"
 
 inherit pypi autotools-brokensep
 
+SRC_URI += "file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+           "
+
 SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
 SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
 
diff --git a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 919f91ecb..e13db01b7 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -1,10 +1,6 @@
 inherit distutils
 require python-pycrypto.inc
 
-SRC_URI += "file://cross-compiling.patch \
-            file://CVE-2013-7459.patch \
-           "
-
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
 # provide a "make install" target.
-- 
2.15.0


