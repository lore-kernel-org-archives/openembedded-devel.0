Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f46.google.com (mail-pl0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id A039275479
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 03:31:04 +0000 (UTC)
Received: by mail-pl0-f46.google.com with SMTP id 30-v6so4616891pld.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 20:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/th/en2cS316w+xtfWCuY34JSYd/Viw5RB7Lx4ekr4g=;
	b=CD0U2ncqd5OHgTnIAc3dlMnMBYwo2htrY28ez6WRX0L9aJT4HyeSaVZRMCEiJNNQQm
	Q30PliCOjAh1gtKtksN6U9dn7oNI/j64dkETlmm/Avy76EUXynWJNK2lDix8f2PVDGZw
	Hh2Rt+rrkQerOcMCytwwy11C1hlZ2JpHxc4Ey1KsJ1BNeYtyp2kQhnbymwNQcBzaKeiE
	toCX1c3jhTZR4wv2Ozq0dJzV39jcsRyKBI10JTJrnDtNvWDHdHXljIEmgI2by3QClIUp
	3yLHdDMijAM+H4JPULtlu+wIgJn+Bz7xAQ6eMeUjWTRGDdhIqBei/B6OlniE0mEWbd15
	enlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/th/en2cS316w+xtfWCuY34JSYd/Viw5RB7Lx4ekr4g=;
	b=l0LIScTA/RCuqXws6fAsyMt+uppN0Yso8u6r/qI9llF+k5iiRz3vfgok50cv2sTPKf
	dNbBVaR+DQ+zOwqcfnsH/tN1vA549ekVsp07zHlePIJ58yajQ4QoP8REi+MyWWQ1kQ8Z
	xj/l+wTKQ3EateV3rLdGZJFNNEdgF08IoS0XKtyxnK1NY9broOY12NxyyEkLL7FjbRkr
	hRtEEXlHcxRKljFbogmeU/GnWOosiMQqmicVKLgw0JqC34hSjhI8VkyR00kKJm3iVms0
	y+Fjf4HU3fhr808TkC1FiAJyacedhU06Nw+AY9Z77H5kqENseBqpapLMC6mY/Rni/QXx
	VlGA==
X-Gm-Message-State: APt69E00dGzwIfhyONRpd08HWm4E04LtE5Yl9JZBatnAC0cGxUvbRK4b
	7n3lnEs7eK7kBm15nXcG/tS3Zg==
X-Google-Smtp-Source: ADUXVKLX/Pubk/8Bj/SSvk62gaKgspOWHJBOfm1KHhHsfUXwxrEhGEVY05U7x13UZeNDJSPKnaUr4A==
X-Received: by 2002:a17:902:b20d:: with SMTP id
	t13-v6mr6023513plr.121.1529033465016; 
	Thu, 14 Jun 2018 20:31:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm23257253pfa.34.2018.06.14.20.31.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jun 2018 20:31:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jun 2018 20:31:05 -0700
Message-Id: <20180615033106.32342-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 1/2] htpdate: Add recipe
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
X-List-Received-Date: Fri, 15 Jun 2018 03:31:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ent-variables-assignments-to-be-weak.patch | 31 ++++++++++++++
 ...01-Replace-ntp_adjtime-with-adjtimex.patch | 40 +++++++++++++++++++
 .../recipes-support/htpdate/htpdate_1.2.0.bb  | 39 ++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
 create mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
 create mode 100644 meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb

diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch b/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
new file mode 100644
index 0000000000..0ee44c1621
--- /dev/null
+++ b/meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
@@ -0,0 +1,31 @@
+From 04603f52d793f964653e6a985944400fe4fa87ee Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jun 2018 17:50:20 -0700
+Subject: [PATCH] Make environment variables assignments to be weak
+
+So that OE can override them for cross builds
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 1c80c09..884126c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,11 +2,11 @@ prefix = $(DESTDIR)/usr
+ bindir = ${prefix}/bin
+ mandir = ${prefix}/share/man
+ 
+-CC = gcc
++CC ?= gcc
+ CFLAGS += -Wall -std=c99 -pedantic -O2
+ 
+-INSTALL = /usr/bin/install -c
+-STRIP = /usr/bin/strip -s
++INSTALL ?= /usr/bin/install -c
++STRIP ?= /usr/bin/strip -s
+ 
+ all: htpdate
+ 
diff --git a/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch b/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
new file mode 100644
index 0000000000..cca8c6c364
--- /dev/null
+++ b/meta-networking/recipes-support/htpdate/htpdate/0001-Replace-ntp_adjtime-with-adjtimex.patch
@@ -0,0 +1,40 @@
+From 75646a2d2df14fdbc4a01e222a779afac94861d1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Jun 2018 20:11:08 -0700
+Subject: [PATCH] Replace ntp_adjtime with adjtimex.
+
+ntp_adjtime in glibc is an alias to adjtimex and
+musl does not provide ntp_adjtime at all
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ htpdate.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/htpdate.c b/htpdate.c
+index 4171efe..ff0bf8d 100644
+--- a/htpdate.c
++++ b/htpdate.c
+@@ -391,7 +391,7 @@ static int htpdate_adjtimex( double drift ) {
+ 
+ 	/* Read current kernel frequency */
+ 	tmx.modes = 0;
+-	ntp_adjtime(&tmx);
++	adjtimex(&tmx);
+ 
+ 	/* Calculate new frequency */
+ 	freq = (long)(65536e6 * drift);
+@@ -406,7 +406,7 @@ static int htpdate_adjtimex( double drift ) {
+ 
+ 	/* Become root */
+ 	swuid(0);
+-	return( ntp_adjtime(&tmx) );
++	return( adjtimex(&tmx) );
+ 
+ }
+ 
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
new file mode 100644
index 0000000000..eb6787846b
--- /dev/null
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
@@ -0,0 +1,39 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "HTTP based time synchronization tool"
+
+DESCRIPTION = "The  HTTP Time Protocol (HTP) is used to synchronize a computer's time with\
+ web servers as reference time source. This program can be used instead\
+ ntpdate or similar, in networks that has a firewall blocking the NTP port.\
+ Htpdate will synchronize the computer time to Greenwich Mean Time (GMT),\
+ using the timestamps from HTTP headers found in web servers response (the\
+ HEAD method will be used to get the information).\
+ Htpdate works through proxy servers. Accuracy of htpdate will be usually\
+ within 0.5 seconds (better with multiple servers).\
+"
+
+HOMEPAGE = "http://www.vervest.org/htp/"
+
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=d7018a4d2c5a6eab392709a05e5e168a"
+
+SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.xz \
+           file://0001-Make-environment-variables-assignments-to-be-weak.patch \
+           file://0001-Replace-ntp_adjtime-with-adjtimex.patch \
+           "
+SRC_URI[md5sum] = "9d5ca69be06edf5d535b52b5f790da4e"
+SRC_URI[sha256sum] = "22b2cf3ec45b0eedecddd3ad2a3d754ac57942ae7dcbac410d254935f0bdbc03"
+
+do_configure () {
+	:
+}
+
+do_compile () {
+	oe_runmake
+}
+
+do_install () {
+	oe_runmake install 'INSTALL=install' 'STRIP=echo' 'DESTDIR=${D}'
+}
+
-- 
2.17.1


