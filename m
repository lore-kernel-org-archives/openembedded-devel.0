Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2B3C27883B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:41:12 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id p44so5586958qtj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Nov 2017 04:41:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=IYGGYXa1Ien20J+CAeIe3F/RN4HR8qbP8nl0mql4fa0=;
	b=ZvcZdPqP5tHcpFDib9oDnuKDeuN3EILFHY6kZw2wCWdqIyKnSJG7rVTf0QqB3TZ9P/
	p+ZRXf4lZlP9ClZIi1KzxzP7Da0nYBNJptMPgAZ+t8kkqGxI60AQkNwNA8wXaRWXyx4l
	ZXJfs2HKLhjjnNA1DAicG1vcZm4bxeLx+ZysIKOq39AmsXrkpcf7cx4/4uCvYJgNtscH
	nNxa/VWSP4WR0K7+BT/u/n28/Ov8ZOMmPd/JU6+bWp9WPKmnZXWt2IOUxa9ZVHSwrtnv
	BWoTYN3XojQShrnize2cDiT+nwKr4ZDm03hbERXsI7tfz2EI0tqZ8jcatgGBd/+f/AQA
	vSqg==
X-Gm-Message-State: AJaThX4isgUf1RtPhQbPolJv93J3WNcBd/7IOoNZCMtyFWT/zG9gZW/h
	A3jhShsV6fQ8JSm40ji6mqW91w==
X-Google-Smtp-Source: AGs4zMZTXw2tUeTVp2lCya4LinJ4wvG5kx2ppqFgMMmiZbHF5t4fIEBAIKcquBWxR8rVtlTiY7ZD6w==
X-Received: by 10.233.239.70 with SMTP id d67mr7973475qkg.308.1510922473572;
	Fri, 17 Nov 2017 04:41:13 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	y23sm2486862qtj.11.2017.11.17.04.41.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 17 Nov 2017 04:41:12 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 17 Nov 2017 10:41:04 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Nov 2017 10:41:02 -0200
Message-Id: <20171117124103.8185-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 1/2] python-pycrypto: Consolidate recipe code inside of .inc
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
X-List-Received-Date: Fri, 17 Nov 2017 12:41:13 -0000

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


