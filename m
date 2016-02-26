Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBA577251
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2016 00:55:15 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id yy13so3613158pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 16:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=s2aL7hleMTcfmluQKbd3Vc5UGvSSVCq5AqEl63pht4A=;
	b=RgCoR4tiAFKjyn/GL80jH6RSeQ8wWBP0IpM59rQnUjBQwe+Wm6McwWVFEqBstazLO3
	1/kiakxmJQPD0RtPmv4541eM9iLQE23WdEFpaMfKejgDqR9b2dvFGkkPBJ5BEp9Bfhb5
	5u2YV5uU1ie1JPP5e1SOjCdHJSufDHJZrJ53e+qvmlNVbWkdPyqfwQs6y5M1UHN89cxY
	O8lVDtJX0lK2QHbShwLNvH1bSekr0jeTyweKwWtXilKuBs/WHAJD0iRc4Y2OoTWvC2D9
	Qvv7eGc/aGhLjPYnsKjJyNTx1Y97fNLiX5ydcP3RNdHU3GqsKqUfc+i0eZzPt5WCRKVG
	4riw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=s2aL7hleMTcfmluQKbd3Vc5UGvSSVCq5AqEl63pht4A=;
	b=fuNeVMWkWbiRYKUK+MoqkhkZj+r+lG5NbkHOyu8lgdVSjRpj8iFIsN1/P0/0NuSFLh
	MULkrAMNZZLD6Jl/YwL6MqiLrftsMBzV62oymG2/m57JBcY0SeKWHBst21dp0Tff7xbY
	NkQsQ8jWBm81RN4x8fxccIEeypMDDmCNd+hGmj9i3oZY/GaFmZjem8Ksjxx2HAl2ftDI
	HiJtuAGih82a8L06I4AwYd2AAOTEgBkMg6/ZEPFRcxFUlH6HzzGggZ8hV+deXbLCejPf
	/G3/cYPMoTPgJrq/GFf7N/xNt+Mr8nZrjVc1A3s4cighcJWmgIaKCm41aCtx+eFz8FE4
	XRTw==
X-Gm-Message-State: AG10YOTYLNajPkdLz63ubFWurxLWLo9MqS4d+yIQdtTbqBGmgS6SJuZuA2DsJEkGr14jEw==
X-Received: by 10.66.251.162 with SMTP id zl2mr68202425pac.116.1456448116145; 
	Thu, 25 Feb 2016 16:55:16 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	ko9sm14769286pab.37.2016.02.25.16.55.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Feb 2016 16:55:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:55:09 -0800
Message-Id: <1456448109-11375-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1456448109-11375-1-git-send-email-akuster808@gmail.com>
References: <1456448109-11375-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 3/3] xerces-c: Package update, QA fix and CVE-2016-0729
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
X-List-Received-Date: Fri, 26 Feb 2016 00:55:15 -0000

includes;
CVE-2016-0729: Apache Xerces-C XML Parser Crashes on Malformed Input

Also  fixes;

ERROR: xerces-c-3.1.3-r0 do_populate_sysroot: QA Issue: xerces-c.pc failed sanity test (tmpdir) in path /home/akuster/oss/maint/mylayers/poky/build/tmp/work/armv5e-poky-linux-gnueabi/xerces-c/3.1.3-r0/sysroot-destdir/usr/lib/pkgconfig [pkgconfig]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xerces-c/{xerces-c_3.1.2.bb => xerces-c_3.1.3.bb}        | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-devtools/xerces-c/{xerces-c_3.1.2.bb => xerces-c_3.1.3.bb} (84%)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.3.bb
similarity index 84%
rename from meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
rename to meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.3.bb
index 6e870dd..2355c9d 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.3.bb
@@ -10,14 +10,19 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "http://apache.lauf-forum.at/xerces/c/3/sources/${BP}.tar.bz2"
-SRC_URI[md5sum] = "d987b8bb576aea456e92454781fe3615"
-SRC_URI[sha256sum] = "95d8655c4c50668ad60d555b59da9f31937b2c53638aa8d5768cb169f192d5e1"
+SRC_URI[md5sum] = "5e333b55cb43e6b025ddf0e5d0f0fb0d"
+SRC_URI[sha256sum] = "fc5e5e0247b108b8d64d75aeb124cabdee9b7fcd725a89fe2242b4637b25c1fa"
 
 inherit autotools
 
 PACKAGECONFIG ??= "curl icu"
 PACKAGECONFIG[curl] = "--with-curl=${STAGING_DIR},--with-curl=no,curl"
 PACKAGECONFIG[icu] = "--with-icu=${STAGING_DIR},--with-icu=no,icu"
+
+do_install_prepend () {
+        sed -i -e 's:-L${STAGING_DIR}/lib:-L\$\{libdir\}:g' ${B}/xerces-c.pc
+}
+
 PACKAGES = "libxerces-c \
             libxerces-c-dbg \
             libxerces-c-dev \
@@ -39,6 +44,3 @@ FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
 FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
 
 BBCLASSEXTEND = "native"
-
-# http://errors.yoctoproject.org/Errors/Details/35144/
-PNBLACKLIST[xerces-c] ?= "BROKEN: QA Issue: xerces-c.pc failed sanity test (tmpdir)"
-- 
2.3.5


