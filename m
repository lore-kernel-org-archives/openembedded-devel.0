Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E42417FA20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 18:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472gCK2S2LzCK
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 19:31:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572373885;
	bh=eF5xm+1isUaaK6vilKGyagg0njrRlB3M0b33DhlBh6k=;
	h=From:To:Subject:Date:From;
	b=rAfimVcYGxc5BgGGoTUCk3VgMAJeagb6u1PCXI4z543cBy/5WX03KLvmqOW2NTwyx
	LdJjwh1/tY24EpbLJl3OX7GgexBHuK0Eb2EyBY2E07IiZHnZPXhX+OTCL6Qr0fApiF
	cSPGbFRW8jM4YszYx2/L3QvXbuCzxxibbZ/2Wj5jnwy+YqKxJZTh5+Q08d5nMJiHdS
	FHGkhBu+67iCk0g9YRxZKXbOjTduCBubD3KHUYO/9lldybzPLoBoXNuVI9v+9cUlq9
	DHylYggeN9y3fFyNX2RK9NvTom9i9pOLh0xoZjiMW9QH6zzd8ik6Oae1+tK8js6TwT
	PmrjOLgMV9G1RBN2zoPyAF9z8yZ+P42xiGW5uiJseOKOwxap3cuNSnF72W/pupqygo
	p0TzSwOW//yHeSvyzTe1brpOlqQHno/KFiyKZO1a3szk2/JwwgcZTArfWYB5zBcTOQ
	ZFa76AxLi2LWSJdP9skpRu+G5v8WL5l+mLbMN6/BQAfUwuHZmO5BwIjcQeo0RQ1MXu
	X5ajK69XfJyw2o3p2qo8WwKVIQ1YhRIm3bgwvOj0GoU9nDKLi+WJfwnpnmoeAkiSNk
	4yMvVDqu7yP9cwQsj2YaNnbRrF/P8DvLjQ4FcL/y00GQa4gLWweueJefSZS+Rr5EG7
	Y2QuKds0Rhzb2vNyyiVN/VoY=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 20:31:16 +0200
Message-Id: <20191029183123.1868-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] cgdb: Upgrade 0.6.8 -> 0.7.1
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
X-List-Received-Date: Tue, 29 Oct 2019 18:31:26 -0000

Obsolete patch removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../cgdb/cgdb/remove-help2man.patch           | 47 -------------------
 .../cgdb/{cgdb_0.6.8.bb => cgdb_0.7.1.bb}     |  8 ++--
 2 files changed, 4 insertions(+), 51 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
 rename meta-oe/recipes-devtools/cgdb/{cgdb_0.6.8.bb => cgdb_0.7.1.bb} (75%)

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch b/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
deleted file mode 100644
index 4358629b7..000000000
--- a/meta-oe/recipes-devtools/cgdb/cgdb/remove-help2man.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Disable building manpages so that make install doesn't fail due to lack of help2man
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
----
- configure.ac    | 3 ---
- doc/Makefile.am | 5 -----
- 2 files changed, 8 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ee7eca0..1f0d924 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -134,9 +134,6 @@ dnl check that the required tools are available to generate documentation
- if test "$HAS_MAKEINFO" != "yes" ; then
- 	AC_MSG_ERROR([Please install makeinfo before installing])
- fi
--if test "$HAS_HELP2MAN" != "yes" ; then
--	AC_MSG_ERROR([Please install help2man])
--fi
- 
- dnl Checking for log10 function in math - I would like to remove this
- AC_CHECK_LIB(m, log10)
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index 60662f6..0ae0013 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -1,15 +1,10 @@
- info_TEXINFOS = cgdb.texi
- cgdb_TEXINFOS = gpl.texi
- 
--dist_man_MANS = cgdb.1
- EXTRA_DIST = cgdb.txt
- 
- dist_pkgdata_DATA = cgdb.txt
- 
--# generate the man page using help2man.
--cgdb.1:
--	help2man --output=$(top_srcdir)/doc/cgdb.1 $(top_builddir)/cgdb/cgdb$(EXEEXT)
--
- cgdb.txt: cgdb.texi $(srcdir)/version.texi $(cgdb_TEXINFOS)
- TEXTS = cgdb.txt
- text-am: $(TEXTS)
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
similarity index 75%
rename from meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
rename to meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
index 74019fb62..c2315aeb2 100644
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.6.8.bb
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.7.1.bb
@@ -10,11 +10,11 @@ DEPENDS = "flex-native readline ncurses"
 inherit autotools
 
 SRC_URI = "http://cgdb.me/files/${BP}.tar.gz \
-    file://remove-help2man.patch"
-SRC_URI[md5sum] = "7bd38c79bf4d794d239928fef401fca3"
-SRC_URI[sha256sum] = "be203e29be295097439ab67efe3dc8261f742c55ff3647718d67d52891f4cf41"
+"
+SRC_URI[md5sum] = "a104862ffd3145b076303992e9a3af26"
+SRC_URI[sha256sum] = "bb723be58ec68cb59a598b8e24a31d10ef31e0e9c277a4de07b2f457fe7de198"
 
-CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2"
+CACHED_CONFIGUREVARS = "ac_cv_file__dev_ptmx=yes ac_cv_rl_version=6.2 ac_cv_file__proc_self_status=yes"
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR} \
     --with-ncurses=${STAGING_LIBDIR}"
 
-- 
2.17.1


