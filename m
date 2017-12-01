Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8E652786BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Dec 2017 12:45:20 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id j207so12908268qke.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Dec 2017 04:45:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=8p/Ykv07PGfUctDZMdV4xD/dqDO7qm7SAboJaOU7MRU=;
	b=NlnRFYp22dmOZx1uiTksCFfDsTncdiHIKptk0jsPe2i+JzHuZnRw0JtYAZFfs1DXFF
	G3wfLprl7VCtBTGdS0P0AgGuL3T+HgPTGn0nk/pxpEgbsMmHpvJ//478JXMZGlNOGT9L
	P6apCX9BvQeP+Jxd59JA3BWNCkgJLbljQk0J6+lF7htD5hiKLbIQbabvbfzZdYTGVSgT
	8T1KJLPS24qS2BhP9lFHBCFXDs9kVBz2cFy+D+T0/trLacN43ZDMWIQiYR9SXBE7L4dk
	fLOkaI4bT/FwUqx7Z1150FNi0xbn8jiUzPNi4Kq4gOhVXnJ3KN5f6QkijYJXnqH7VnmL
	K88A==
X-Gm-Message-State: AKGB3mJsqbESH7yOyI3DK8Gd94I6Qnjsbrq6hIq6DvmPYE5Yw6GgdfDd
	6GuJODNWxIed1jkJBe7w4qOApw==
X-Google-Smtp-Source: AGs4zMb5GxgbH5GaLu8W2xA+N6JRNcgU4Ss84mVbU2NuUL4RsYQELW+EGi/6P+Bz0+JlOuwyg95g3Q==
X-Received: by 10.233.232.13 with SMTP id a13mr7392648qkg.186.1512132321348;
	Fri, 01 Dec 2017 04:45:21 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	f126sm4442158qkd.20.2017.12.01.04.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Dec 2017 04:45:20 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 01 Dec 2017 10:45:13 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  1 Dec 2017 10:45:01 -0200
Message-Id: <20171201124502.18190-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171201124502.18190-1-otavio@ossystems.com.br>
References: <20171201124502.18190-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH v2 2/3] python-pycrypto: Consolidate recipe code inside of .inc
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
X-List-Received-Date: Fri, 01 Dec 2017 12:45:20 -0000

This move the patches and installation tasks inside the .inc. This is
required for the addition of python3 version of the recipe, in next
patch.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

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


