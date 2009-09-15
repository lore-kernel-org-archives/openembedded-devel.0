Received: from [209.85.132.247] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MnRji-0006Ir-7y
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 08:42:01 +0200
Received: by an-out-0708.google.com with SMTP id c5so1372318anc.42
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2009 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=4TGa1L5MvKTY/HFkFk8NlpZQTtbtnU+R7qNUBPBphXk=;
	b=M58AlTBVYLIycfqjxYRva9eJuAvbYPXt7PrdenjQYZLWJqXeH/k4Lq1fbc/kO6WgYM
	OortxOoyXBOJgDOR2lDhOLiBb94SRIHfipoT+QUcaw5HFkcIDi3+ZKKH0a3q8lU4Ocye
	4U9OYPRDU4DQJ2krmgSrDYEqmsWXtDrEZ0pOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=uzL9wKXiHYemmVjqlK0F16/uppVDC22KRD/hPiwPsnVZF7s3UWEfvtLWMDxJRxBkyQ
	FX5IDEHwRYMycHHQs4CWX3r7kEQ9tsU7NCoJr3D/1oGlTCJ9jtEy4Xp1U4b6tqYnouCq
	V1pKC0atSWxcT+RrWjA2eA30liOdTniEO3jEc=
Received: by 10.101.47.6 with SMTP id z6mr7066968anj.140.1252996888928;
	Mon, 14 Sep 2009 23:41:28 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id c9sm2744ana.4.2009.09.14.23.41.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 14 Sep 2009 23:41:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2009 23:41:15 -0700
Message-Id: <1252996876-782-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1252996876-782-1-git-send-email-raj.khem@gmail.com>
References: <1252996876-782-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.132.247
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH 2/3] proxy-libintl_20080418.bb: Build shared library instead of static.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Sep 2009 06:42:01 -0000

* with libint.a the link order matters and generally for uclibc
  targets we append -lintl to LDFLAGS and sometime it gets specified
  before the objects and symbols do not get pulled in. Better we
  generate shared object so the linking order does not matter

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/proxy-libintl/proxy-libintl_20080418.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/proxy-libintl/proxy-libintl_20080418.bb b/recipes/proxy-libintl/proxy-libintl_20080418.bb
index dbe7b92..6c625d6 100644
--- a/recipes/proxy-libintl/proxy-libintl_20080418.bb
+++ b/recipes/proxy-libintl/proxy-libintl_20080418.bb
@@ -5,16 +5,18 @@ LICENSE = "LGPL"
 
 PR = "r1"
 PROVIDES = "virtual/libintl"
-
+LEAD_SONAME = "libintl.so"
 
 SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/binaries/win32/dependencies/${PN}-${PV}.zip \
     file://stub-only.patch;patch=1 \
+    file://create-as-shared-lib.patch;patch=1 \
 "
 
 
 S = "${WORKDIR}"
-FILES_${PN}-dev = "${includedir} ${libdir}"
+FILES_${PN}-dev = "${includedir}"
+FILES_${PN} = "${libdir}/libintl.so"
 
 
 CFLAGS_append = " -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
@@ -32,15 +34,13 @@ do_install() {
     install -d ${D}/usr/lib
     
     install -m 0644 ${WORKDIR}/include/libintl.h ${D}/${includedir}
-    install -m 0644 ${WORKDIR}/lib/libintl.a ${D}/${libdir}
+    install -m 0644 ${WORKDIR}/lib/libintl.so ${D}/${libdir}
 }
 
 
 
 do_stage() {
     install -m 0644 ${WORKDIR}/include/libintl.h ${STAGING_INCDIR}/
-    oe_libinstall -a -C lib libintl ${STAGING_LIBDIR}/
+    oe_libinstall -a -so -C lib libintl ${STAGING_LIBDIR}/
 }
 
-
-
-- 
1.6.3.3



