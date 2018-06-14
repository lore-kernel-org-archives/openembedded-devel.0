Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 793D87875F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2018 06:56:41 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id q1-v6so2727658pff.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 23:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CNM9PPV7xBOuC8ByAiATX+or3Y5Ug2II3rPXLs3X/bY=;
	b=reksvtohgQYhTHKuS/myl6fqPUrj73nESvAiZWR75tHsn8p69dy2mxDvM29UBWv+qc
	xSkSaLZxuaczij7PRQ/EMtqtW1o5qA3pNM6EU4mvw2gfaAqkFbvxim4vWrk4M6cbrCER
	IiWhL/DPCyUbY/2JS67wIoXs8MAhmHeDxl0oqfe0mp2KlJ7vcRctOlfUriyGhTli4a1G
	2SXtwM+Bwub9f/xOMdN6wNxP+iX8RmP7/m0Hg2pSm2zv7w8NSEYUaLtl7Gho39K3nnSp
	9xNvzB8EkH0EhFGUaGEqlzqwlKvguVdAeKdZPwNESBqXgKNBVhCmtdplPf3PlIq9G2Um
	0tiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CNM9PPV7xBOuC8ByAiATX+or3Y5Ug2II3rPXLs3X/bY=;
	b=A0e50UiQZkaH5wv5p+tLiTSsqqtsRwgy9mw7nNzFjgLadmZROH8pnmi/7uC3PQA97T
	fDXISl9kaQoU3D+la2iE+UfJPLD6mDQA3jVCBg1R8hEPI1Ty0pCBHPlDhOGiQpx4BMLN
	eMoj8GyYXUi8MlgRAmlaK5+X4ql/vxN3jIKnqD5KL4ZhaVOZn3xGkiMALqdANYkx0rrO
	8mfEYDZ4fszc9WDFWfXvbt4nsLgTd7siUs2RB8zc1WaUz5Gu31MEnFTlBpqXzN4FLg++
	tzKQzHh0s2tXu0e2wHjxiQhUS7ykBOvOFiP+T8PC4OAi+HZaVmmoeXUUzlHlZtPdelrQ
	5Lfg==
X-Gm-Message-State: APt69E21q8jUG8flDN8+m9ONGdHT7PIumxxdYoRqKcz+yevFnqAZhmS0
	aHct/5//sdjXEbz+XALN+urFrw==
X-Google-Smtp-Source: ADUXVKJ68Ino3rZUxqQbegTI7CAFkufDJKE4Uwfc1yJoFqfS+/8Q+AHICS9PIrznVsOIX1+CLpsesw==
X-Received: by 2002:a65:5b8b:: with SMTP id
	i11-v6mr1199492pgr.225.1528959402140; 
	Wed, 13 Jun 2018 23:56:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	n68-v6sm8220209pfk.145.2018.06.13.23.56.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 23:56:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Jun 2018 23:56:41 -0700
Message-Id: <20180614065642.15059-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH 1/2] htpdate: Add recipe
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
X-List-Received-Date: Thu, 14 Jun 2018 06:56:41 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ent-variables-assignments-to-be-weak.patch | 31 +++++++++++++++
 .../recipes-support/htpdate/htpdate_1.2.0.bb  | 38 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-support/htpdate/htpdate/0001-Make-environment-variables-assignments-to-be-weak.patch
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
diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
new file mode 100644
index 0000000000..ccbeaf8ca8
--- /dev/null
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.2.0.bb
@@ -0,0 +1,38 @@
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


