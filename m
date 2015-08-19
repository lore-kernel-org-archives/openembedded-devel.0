Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 644BD7585F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 11:21:48 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so117355713wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 04:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=AztN3fVRnTXkzjLPXo6Um3idBsusUmDyoUsP63VF7Cw=;
	b=R4Gl2TuesD0+6T313+/xUSLHD5U1QKgRCPVDIkzUhXK+djQhJr4C6PkIVYTfJlbr2F
	ihnwHpkV8JGd2cl9ncRc1KxKeWH2dUmMBYn9nrtClLLPEun2/VglAb5p/LczJZQIKgxQ
	zQc68tUShcmB/H0re2S/c4s6GClnngiScehETmKHezfzVgxQ8ndOuNx3tNSxpRAA0I7E
	TzQ6abxwOCWg+LwynclUpJpQMWC33Ojj6eGErwNEh3WRdI8S90hAw3Ecf7Yc21UvNUNy
	HDbfrX7TJTO4xZ4/sAfcphgWVVOXCoFIy60Wy1S4XXFckQMEa4qW9by0ufxjbuuJcTpx
	q1Nw==
X-Gm-Message-State: ALoCoQkYklhx5byvIx/32eeOR/rzrzc3aIs0CDdGDT+QDzoMN1Poub5XS0ftDgGjJtvd4mVuPLAd
X-Received: by 10.195.11.202 with SMTP id ek10mr22827664wjd.12.1439983308057; 
	Wed, 19 Aug 2015 04:21:48 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id
	lg8sm1139895wic.12.2015.08.19.04.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Aug 2015 04:21:47 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Aug 2015 13:02:10 +0200
Message-Id: <1439982130-4423-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439982130-4423-1-git-send-email-koen.kooi@linaro.org>
References: <1439982130-4423-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH 2/2] mariadb: update to 5.5.45
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
X-List-Received-Date: Wed, 19 Aug 2015 11:21:48 -0000

This is the latest release in the 5.5.x stable series. The CVE patch has been applied upstream.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 ...b-native_5.5.43.bb => mariadb-native_5.5.45.bb} |  0
 meta-oe/recipes-support/mysql/mariadb.inc          |  5 +--
 .../mysql/mariadb/fix-CVE-2015-2305.patch          | 43 ----------------------
 .../mysql/{mariadb_5.5.43.bb => mariadb_5.5.45.bb} |  0
 4 files changed, 2 insertions(+), 46 deletions(-)
 rename meta-oe/recipes-support/mysql/{mariadb-native_5.5.43.bb => mariadb-native_5.5.45.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch
 rename meta-oe/recipes-support/mysql/{mariadb_5.5.43.bb => mariadb_5.5.45.bb} (100%)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.5.43.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb-native_5.5.43.bb
rename to meta-oe/recipes-support/mysql/mariadb-native_5.5.45.bb
diff --git a/meta-oe/recipes-support/mysql/mariadb.inc b/meta-oe/recipes-support/mysql/mariadb.inc
index a11924a..e265a7d 100644
--- a/meta-oe/recipes-support/mysql/mariadb.inc
+++ b/meta-oe/recipes-support/mysql/mariadb.inc
@@ -11,11 +11,10 @@ SRC_URI = "http://mirrors.supportex.net/mariadb/mariadb-${PV}/source/mariadb-${P
            file://mysqld.service \
            file://configure.cmake-fix-valgrind.patch \
            file://fix-a-building-failure.patch \
-           file://fix-CVE-2015-2305.patch \
           "
 
-SRC_URI[md5sum] = "c8760d6b5890fc1de76c07af48092c88"
-SRC_URI[sha256sum] = "a0709997140549154edb87c9dfab564cd4755b238251acbf42369118f9bb4d01"
+SRC_URI[md5sum] = "6ec397f717f6e2e4e9154e76de9ec9fc"
+SRC_URI[sha256sum] = "4dc3aff6941ef1068412002915d795bcf67db0eaa38a5c6f3af57474c4226fb0"
 
 S = "${WORKDIR}/mariadb-${PV}"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch b/meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch
deleted file mode 100644
index 2d1b467..0000000
--- a/meta-oe/recipes-support/mysql/mariadb/fix-CVE-2015-2305.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f5c1d00a9ceb61acfe038dcf2ec0236c2939328c Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Mon, 1 Jun 2015 15:31:48 +0800
-Subject: [PATCH] From 70bc2965604b6b8aaf260049e64c708dddf85334 Mon Sep 17
- 00:00:00 2001 From: Gary Houston <ghouston@arglist.com> Date: Wed, 25 Feb
- 2015 13:29:03 +1100 Subject: [PATCH] Bug fix for integer overflow in regcomp
- for excessively long  pattern strings. CERT Vulnerability Note VU#695940.
- Found by Guido Vranken.
-
-Upsteam-Status: Backport
-
-https://bugzilla.suse.com/attachment.cgi?id=627001
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- regex/regcomp.c | 11 ++++++++++-
- 1 file changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/regex/regcomp.c b/regex/regcomp.c
-index abc1817..31e57c1 100644
---- a/regex/regcomp.c
-+++ b/regex/regcomp.c
-@@ -138,7 +138,16 @@ struct cclass cclasses[CCLASS_LAST+1]= {
- 							(NC-1)*sizeof(cat_t));
- 	if (g == NULL)
- 		return(REG_ESPACE);
--	p->ssize = (long) (len/(size_t)2*(size_t)3 + (size_t)1); /* ugh */
-+	{
-+	  /* Patched for CERT Vulnerability Note VU#695940, Feb 2015. */
-+	  size_t new_ssize = len/(size_t)2*(size_t)3 + (size_t)1; /* ugh */
-+	  if (new_ssize < len || new_ssize > LONG_MAX / sizeof(sop)) {
-+	    free((char *) g);
-+	    return REG_INVARG;
-+	  }
-+	  p->ssize = new_ssize;
-+	}
-+
- 	p->strip = (sop *)malloc(p->ssize * sizeof(sop));
- 	p->slen = 0;
- 	if (p->strip == NULL) {
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.5.43.bb b/meta-oe/recipes-support/mysql/mariadb_5.5.45.bb
similarity index 100%
rename from meta-oe/recipes-support/mysql/mariadb_5.5.43.bb
rename to meta-oe/recipes-support/mysql/mariadb_5.5.45.bb
-- 
2.1.0


