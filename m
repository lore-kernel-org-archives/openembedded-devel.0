Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9776B812
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:24 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so180679ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=fk3LY3WhRhDDlYmoL3PTlzIeWZZDaHevQhokrPjxcz0=;
	b=mZsCUMKJK2+59EWYrrEhUqrF2uZCE0d3qZ01xol/QgpBpGuAQuRA8FFuDiSm0btC/b
	rek9L1LUpZc54Vqho6rA3WJrjOltVq2F32D7OOAedgVLUlsoLLHrVRS+61pFtRwJ/ZSy
	fzMoaM/5WJoyfcEWARgubH2oKybyjUDZVinxj5TRvvfhcQ5OCNRHnbQreorC6ByZFqhX
	Wjejbz3B7vvhuyDHKbQtHssCU3+EFNniFxyDBnvsaG6UVd6GsyVE2htluMAvLwFXuszR
	U9Hrb+0T4L8aeaLUWEoTDhglcyIFfHSh4tojQlU/Vtf0KhPvONKcx5Ob5xFNQlz4YwzV
	iFpQ==
X-Received: by 10.14.176.8 with SMTP id a8mr20863152eem.12.1376551165004;
	Thu, 15 Aug 2013 00:19:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l47sm37385927eex.15.2013.08.15.00.19.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:19:04 +0200
Message-Id: <2edc0dda0f6c814075283967f1cbb6945dfbc806.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 24/60] samba: add dependency on zlib popt, PACKAGECONFIG for pam
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:24 -0000

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


