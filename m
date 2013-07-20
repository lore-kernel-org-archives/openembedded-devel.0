Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id B31126B27E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 15:08:20 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id z15so2913779ead.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Jul 2013 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fk3LY3WhRhDDlYmoL3PTlzIeWZZDaHevQhokrPjxcz0=;
	b=wV2Q1myCst/s2sFYSBw5fglncCDGZ5cKBkGXpr9Vl7Z+j017KDqy1nWcnAqvGfMve6
	JlfOYjwoT4IeWzYvhwxEAHSmaL+HZxwxZOVUX2HKCSsI4PF4fmT6IOWvrEs98i9k3diA
	4vgntx56f+ynI7mo4Tk0Q5W0JGO5qtEduP4UvGPmRwPq0TLTGKQrHmI93ZJbTx8Wm3oZ
	1G3vMxNs9LsMiadJBgj2++Z0azo1lUuG/u7p/BnGRApRwLKbn4NdRIJ2J2bR3bBb9zqg
	70V0yW5GKbP5rb21Th6NpjnNsIEPQ9EG0m6qU0qYMDxiflQmXxnDK+pfZVJ2nr+REoSr
	ekag==
X-Received: by 10.15.31.9 with SMTP id x9mr20456182eeu.103.1374332900999;
	Sat, 20 Jul 2013 08:08:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	e44sm35891887eeh.11.2013.07.20.08.08.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 20 Jul 2013 08:08:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 20 Jul 2013 17:08:27 +0200
Message-Id: <337b1bac68c548d5e21525961b8a52b72d2cc613.1374332866.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
References: <e15f15a2dcc1291e2cfb749c92f1a5918ae0920a.1374332866.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1374332866.git.Martin.Jansa@gmail.com>
References: <cover.1374332866.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 04/11] samba: add dependency on zlib popt, PACKAGECONFIG for pam
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
X-List-Received-Date: Sat, 20 Jul 2013 15:08:21 -0000

* zlib, popt are autodetected or used in bundled versions
* pam is autodetected if available

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index e7defaa..df8ed68 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -1,6 +1,6 @@
 SECTION = "console/network"
 LICENSE = "GPL-3.0"
-DEPENDS = "readline virtual/libiconv talloc"
+DEPENDS = "readline virtual/libiconv talloc zlib popt"
 
 SRC_URI = "http://samba.org/samba/ftp/stable/samba-${PV}.tar.gz \
            file://volatiles.03_samba \
@@ -33,12 +33,17 @@ EXTRA_OECONF='--disable-cups \
               --with-mandir=${mandir} \
               --with-swatdir=${datadir}/swat \
               --with-aio-support \
+              --with-winbind \
+              --with-wbclient \
               --without-libtalloc \
               --without-acl-support \
               --disable-avahi \
               samba_cv_struct_timespec=yes \
               libreplace_cv_HAVE_MMAP=${SAMBAMMAP}'
 
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+
 INITSCRIPT_PACKAGES = "samba winbind"
 INITSCRIPT_NAME_samba = "samba"
 INITSCRIPT_NAME_winbind = "winbind"
-- 
1.8.3.2


