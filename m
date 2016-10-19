Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C483A719A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:52 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id s8so1421896pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Jmzy+ULoSePJuaJXTSLOzXTRPjQqk8NDKYkHn6LES3c=;
	b=EN2JZvUomKh4DN2roJIVEQ1eidiOheGXqZKjuXhJmrXzL7Q3hom3ZTaLv3TkFJde0D
	h30FHuWpKO6BXZOctUuQlkeGxOd24IejnI7gkfbpmbw72ZoT2VFuVt4543AfdOKh0m/+
	yhaBmB+F7x1JY9v8lx51EyPdpUXb9CqzrMFpt6IUPIQ4DmzlXhuV/BT7O8cWr3w+z3DP
	Hw02VtSF8UJmZvfC/37Jnc/Cf7yTA7XVi3YGRydJ8BLayPtd9kXcY1y6Qap2IxaBd8w+
	+mgsxEANlnfQ9pmlhOtjSsBRc/GmxM3McfkWTdVv6CHi4HTk4kJWJ856lzMm0CWuIr3z
	75ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Jmzy+ULoSePJuaJXTSLOzXTRPjQqk8NDKYkHn6LES3c=;
	b=DQUCmrMY7Kt1nMcPueJhXVw1j8108pSzud90/S2KHdEXObIitgh06mXoqCIEe9683y
	2GcdTYOPN2is/trd/mgujIsB2RzK01+6ffapyMPqYKOGwHgWtD4tKt05uIdtxrfJA77l
	vpxm4GAAKng+G/fKQOWMjA83vLUwdwydhvVExWY+lHeyX/7qNWBTNqlYlZ7zUSUdK6JG
	hdl3MqqZyfG+B4qlM9huqc5tYbVNKh7x2yrB0jR9DMSxasMimxVmf+HcfzTTS3HU9/SC
	Lb5DGkeJheyn4fORa7aBd4l1oDYXfN6898MA7pohs3hqBNzivJEpMsJ0E5sY8UFeP4Kj
	Ru4w==
X-Gm-Message-State: AA6/9RnoInIq4/w9C0nJCXj9DRHkPRvqw1CIJWJP/iY2KmONnbrrmP8r/NLqez6Jn86m9g==
X-Received: by 10.99.149.28 with SMTP id p28mr6349457pgd.150.1476855534557;
	Tue, 18 Oct 2016 22:38:54 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:34 -0700
Message-Id: <20161019053834.11523-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/16] mg: Update to 20161005
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:52 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mg/{mg_20110905.bb => mg_20161005.bb}            | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-support/mg/{mg_20110905.bb => mg_20161005.bb} (59%)

diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-support/mg/mg_20161005.bb
similarity index 59%
rename from meta-oe/recipes-support/mg/mg_20110905.bb
rename to meta-oe/recipes-support/mg/mg_20161005.bb
index 95aeb62..f9ceb46 100644
--- a/meta-oe/recipes-support/mg/mg_20110905.bb
+++ b/meta-oe/recipes-support/mg/mg_20161005.bb
@@ -1,15 +1,13 @@
 SUMMARY = "A portable version of the mg maintained by the OpenBSD team"
 HOMEPAGE = "http://homepage.boetes.org/software/mg/"
 LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://version.c;md5=811e1b67a5cd60c12b218a2b7c1adbf2"
-DEPENDS = "ncurses"
+LIC_FILES_CHKSUM = "file://version.c;md5=1895eb37bf6bd79cdc5c89d8166fabfb"
+DEPENDS = "ncurses libbsd"
 SECTION = "console/editors"
 
-SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz \
-           file://remove_ncurses_check.patch"
-
-SRC_URI[md5sum] = "2de35316fa8ebafe6003efaae70b723e"
-SRC_URI[sha256sum] = "1cd37d7e6a3eecc890a5718c38b8f38495057ba93856762a756ccee2f9618229"
+SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz"
+SRC_URI[md5sum] = "fc6faeeee7308bb46f3512b75867ed51"
+SRC_URI[sha256sum] = "b7fcb5136a6783ca24c8463ab0852fc1f26bdb2bb1c24759b2c51ccfc46c5e61"
 
 # CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=
 EXTRA_OEMAKE = "\
@@ -21,13 +19,13 @@ EXTRA_OEMAKE = "\
     'libdir=${libdir}' \
     'includedir=${includedir}' \
     'mandir=${mandir}' \
+    'PKG_CONFIG=pkg-config' \
 "
 
-do_configure () {
-    sed -i Makefile.in -e 's,^prefix=.*,prefix=${prefix},'
-    ./configure
-}
+CFLAGS += "-I${STAGING_INCDIR}/bsd"
 
 do_install () {
     oe_runmake install DESTDIR=${D}
 }
+
+inherit pkgconfig
-- 
2.10.0


