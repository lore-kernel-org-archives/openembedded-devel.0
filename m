Return-Path: <george.mccollister@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 726F57722C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 18:35:58 +0000 (UTC)
Received: by igbhv6 with SMTP id hv6so46700738igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 10:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=CpfTlWNklLgTUyfcPos/zAQ/4X4GEXrhEyGiKaSzgQY=;
	b=wWGT9Mx6Nc4PST3UtDIJ2Qx320zMWAV922FVT3Laxeaydi5d7U3aHIbsczkDEClZEs
	AADcl3T4uqMDcwH311VGi9m42zCuEkUrnPhms5mW3bFwwZQnVd2do+ysEoaDLt7R/cm8
	x+TXpxdrq0e/L4C7pyY7FnJWSflhMYs16g3PYi0IdtrQkzJdYiuFp3E7YXaSGvUyYOVX
	9uRjy1Hk6wF5wxzitBahkSLpCXdilH7oJRQZ/6OrJVNAmVG3E1RgoPsE6na5Aqp0YXQp
	54Kb7lNTnto3aTEIyF9om4nNF0Aq/KD6xENiV0vSYfE1NOj4FMzGv5FOwbG16DTfY9r+
	518A==
X-Received: by 10.50.131.234 with SMTP id op10mr40002869igb.58.1447353358335; 
	Thu, 12 Nov 2015 10:35:58 -0800 (PST)
Received: from localhost.localdomain (mail.novatech-llc.com. [64.126.95.172])
	by smtp.gmail.com with ESMTPSA id
	qb2sm2975142igb.10.2015.11.12.10.35.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 10:35:57 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 12:35:36 -0600
Message-Id: <1447353336-13579-1-git-send-email-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.4.5
Subject: [PATCH][meta-oe] postgresql: Don't symlink to perl if it's disabled
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
X-List-Received-Date: Thu, 12 Nov 2015 18:36:00 -0000

Don't create a symlink to libperl.so if perl isn't in PACKAGECONFIG.
Attempting to do so will fail if perl hasn't been built.

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta-oe/recipes-support/postgresql/postgresql.inc | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index f3ff225..dbc02a0 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -141,14 +141,16 @@ do_configure() {
         -e "/^TCLSH/s:=.*:= ${bindir}/tclsh:g" \
     ${B}/src/Makefile.global
 
-    # workaround perl package's libperl.so problem
-    # we are using perlnative so this perl should have same version
-    perl_version=`perl -v 2>/dev/null | \
-        sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
-    if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
-         ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
-        ln -sf ../../../libperl.so.5 \
-            ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
+    if ${@bb.utils.contains('PACKAGECONFIG', 'perl', 'true', 'false', d)}; then
+        # workaround perl package's libperl.so problem
+        # we are using perlnative so this perl should have same version
+        perl_version=`perl -v 2>/dev/null | \
+            sed -n 's/This is perl.*v[a-z ]*\([0-9]\.[0-9][0-9.]*\).*$/\1/p'`
+        if [ ! -h "${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so" -a \
+             ! -h "${STAGING_LIBDIR}/libperl.so" ]; then
+            ln -sf ../../../libperl.so.5 \
+                ${STAGING_LIBDIR}/perl/$perl_version/CORE/libperl.so
+        fi
     fi
 }
 
-- 
2.4.5


