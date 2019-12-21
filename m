Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 07E527FC4A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:47 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id bg7so4329269pjb.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6GITvU1YnPnH9RXLVSMwzEgaE2HZccHVsgyVVyDA9so=;
	b=AdAfn1fso4POY2kC4ypmqoyDg798r0jYw3bnyV5iXk6rCkSgrvzW1pmL6Tm3cCf9Hh
	GU8CVwT7m8Du/GKGztdd0hrt/egtyYmSahUugXvVfu71T83MTG827BzlUYy8YfqNINy0
	wyrkCuVnaCkpJE/ur9S2AzdtEwPd2Qlr7+IWcC3TVVxA4i0L8sfHs3ZEYHgXYS9JKn9K
	sJfVnBki6iZel2tNoiLBIHFNXhQgHbK/eSRyN3cfXMEx2wLE62Clp3/L67oUtrWVEdwH
	v77FNLV5rpFpgjuYYWsqmq9BXdNwGW5yqKaKXQwWuTpNEvb2LvlOwsu1tccMC7UTkTNS
	jw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6GITvU1YnPnH9RXLVSMwzEgaE2HZccHVsgyVVyDA9so=;
	b=aO229rfarW4V/Hg9iVsJKoQhoLdOnDiPDmRAV5jp9Hl5S+ko2Q9ClLbzPPxp6zZUJJ
	6nrLaOB/N9+SfUYDuuTObEYUjXXxacZFTWFj+Ctw2oCp84tKH9fCoQAqV75/yjfHJoEl
	qTa8XVaBzfZgPP0LxQupdn2Tgelefigl8l/uRAtY637zsacTGbPpsrJyTdWlv+EaWwzA
	UCUxHUDL3GiZ/DARj3J/cTOZ5ACqoq5B4UKkZBuwqYBe2A7AOFZP/JR5de+VGM2vdc63
	0hN/pCW0wd8HXWsLvYeXy4CY6g/HPSbUnhwie+Gtk4cbwlVhE2L/7NuF/IXPJj/VxO6F
	wxZw==
X-Gm-Message-State: APjAAAXaQLLKIrACSCnjl9wiGT1uO6eFuYsOBFEjf81OrdrTLI08kvwl
	3lX/tgKQtu6PfXO1reAcO47GkUAaHg8=
X-Google-Smtp-Source: APXvYqwNNQ9lY9KmzFpaAvCckggaiPYAjoR4fKPVEgWhfdXWR+bU/FjSGyRUmrvDPQvIIKKXnj4/Ug==
X-Received: by 2002:a17:90a:6346:: with SMTP id
	v6mr18850290pjs.51.1576886808635; 
	Fri, 20 Dec 2019 16:06:48 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:16 -0800
Message-Id: <20191221000635.1573390-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 04/23] lockdev: Make baselib configurable
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:48 -0000
Content-Transfer-Encoding: 8bit

This ensures that baselib can be passed from bitbake tasks via
environment

Refresh patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lockdev/lockdev/build.patch       | 2 +-
 .../recipes-support/lockdev/lockdev/cross_compile.patch   | 8 +++++---
 meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb          | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/lockdev/lockdev/build.patch b/meta-oe/recipes-support/lockdev/lockdev/build.patch
index 6ec91d2316..f9fe48b2a6 100644
--- a/meta-oe/recipes-support/lockdev/lockdev/build.patch
+++ b/meta-oe/recipes-support/lockdev/lockdev/build.patch
@@ -18,7 +18,7 @@ Date:   Tue Feb 9 14:56:23 2010 +0100
  soname	= ${libname}.so.${MVER}
  
  # overwritten by caller (e.g.: debian/rules)
-@@ -72,6 +72,7 @@ install_doc:	docs/lockdev.3
+@@ -73,6 +73,7 @@ install_doc:	docs/lockdev.3
  install_run:	${shared}
  	install -m755 -d	${libdir}
  	install -m644 ${shared}	${libdir}
diff --git a/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch b/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
index aa8f6a4d85..aa8b0f6923 100644
--- a/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
+++ b/meta-oe/recipes-support/lockdev/lockdev/cross_compile.patch
@@ -1,14 +1,16 @@
 --- a/Makefile
 +++ b/Makefile
-@@ -15,17 +15,17 @@ shared	= ${libname}.${VER}.so
+@@ -15,17 +15,18 @@ shared	= ${libname}.${VER}.so
  soname	= ${libname}.so.${MVER}
  
  # overwritten by caller (e.g.: debian/rules)
 -basedir	= /usr/local
 +basedir	?= /usr/local
++baselib ?= lib
  srcdir=.
  
- libdir	= ${basedir}/lib
+-libdir	= ${basedir}/lib
++libdir	= ${basedir}/${baselib}
  incdir	= ${basedir}/include
  mandir	= ${basedir}/share/man
  
@@ -17,7 +19,7 @@
 -CFLAGS	= -g
 -LDLIBS	= -llockdev
 +CC	?= gcc
-+LCFLAGS	?= -g -O2 -fPIC -Wall -pipe -D_REENTRANT 
++LCFLAGS	?= -g -O2 -fPIC -Wall -pipe -D_REENTRANT
 +CFLAGS	?= -g
 +LDLIBS	?= -llockdev
  
diff --git a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
index 5b862bd1fe..9d8800ebde 100644
--- a/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
+++ b/meta-oe/recipes-support/lockdev/lockdev_1.0.3.bb
@@ -15,15 +15,15 @@ SRC_URI[debianpatch.md5sum] = "5ef6267c42fca9145e0af006ccb6aff7"
 SRC_URI[debianpatch.sha256sum] = "a5405c6ee5e97e45eeb1c81330a7e9f444a58bda5e6771fa30007516c115007e"
 
 inherit lib_package perlnative
-export basedir="${D}${prefix}"
 
 CFLAGS += " -D__GNU_LIBRARY__"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+EXTRA_OEMAKE = "basedir=${D}${prefix} baselib=${baselib} LD='${CC}' LD='${CC}'"
 do_compile() {
-        oe_runmake basedir=${D}${prefix} LD="${CC}" LD="${CC}" shared static
+        oe_runmake shared static
 }
 do_install() {
-        oe_runmake DESTDIR=${D} basedir=${D}${prefix} install
+        oe_runmake DESTDIR=${D} install
 }
-- 
2.24.1


