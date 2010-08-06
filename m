Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OhJQ3-0002Z5-2y
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 11:40:53 +0200
Received: by fxm12 with SMTP id 12so3825383fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=oCQ6BkiUGzyeKhzcIKmH8dDYAHjHEy7Ik8b3qwXK6MI=;
	b=XHcNZNac3pJuvWGVZZ4PgI9VMzSEobKMmlpkexN9/MyYlMZC0NyHEBaBwESxSHIHf7
	u59TEBmMDieO/Uofsm6LK1v82YnNRkWjLp/lVA7xOD568PJTLKvJ7Sg32gd9greJtf3b
	UfyCKjOlmbp+/CLWYpoymPlrpjMf6dr8Oya+I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=o+WWFLSMXDhlAv0BMIkRumxJGV8Dm7VLKBUaCI8+WRoVnUw1ZBUTYsWR4DIMn2SvJS
	+EfzrHHvLcYcO7RqJy01d+lrvus9+R8Q7oLJduLm5AJh6QsLpeR1DK7ZHjco5Q4vDf0S
	ET5VksmfC4vrqpSt8N2/OtywATYMuqzU3iUb8=
Received: by 10.223.121.133 with SMTP id h5mr12399686far.74.1281087641313;
	Fri, 06 Aug 2010 02:40:41 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id 14sm537272fav.26.2010.08.06.02.40.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 06 Aug 2010 02:40:40 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OhJPp-00035a-7A; Fri, 06 Aug 2010 11:40:37 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Aug 2010 11:40:31 +0200
Message-Id: <1281087632-11759-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
References: <1281087632-11759-1-git-send-email-rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/4] git: add 1.7.2.1
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
X-List-Received-Date: Fri, 06 Aug 2010 09:40:53 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../files/git-gui-install-mode-arg-spaces.patch    |   32 --------------------
 recipes/git/files/git-less-hardlinks.diff          |   11 ++++---
 recipes/git/git-native_1.7.0.2.bb                  |    8 -----
 recipes/git/git.inc                                |    2 -
 recipes/git/git_1.7.0.2.bb                         |   28 -----------------
 recipes/git/git_1.7.2.1.bb                         |   29 ++++++++++++++++++
 6 files changed, 35 insertions(+), 75 deletions(-)
 delete mode 100644 recipes/git/files/git-gui-install-mode-arg-spaces.patch
 delete mode 100644 recipes/git/git-native_1.7.0.2.bb
 delete mode 100644 recipes/git/git_1.7.0.2.bb
 create mode 100644 recipes/git/git_1.7.2.1.bb

diff --git a/recipes/git/files/git-gui-install-mode-arg-spaces.patch b/recipes/git/files/git-gui-install-mode-arg-spaces.patch
deleted file mode 100644
index 10e4eb2..0000000
--- a/recipes/git/files/git-gui-install-mode-arg-spaces.patch
+++ /dev/null
@@ -1,32 +0,0 @@
---- git/git-gui/Makefile.orig	2007-12-26 17:16:42.000000000 +1030
-+++ git/git-gui/Makefile	2007-12-26 17:17:16.000000000 +1030
-@@ -31,11 +31,11 @@
- 	INSTALL = install
- endif
- 
--INSTALL_D0 = $(INSTALL) -d -m755 # space is required here
-+INSTALL_D0 = $(INSTALL) -d -m 755 # space is required here
- INSTALL_D1 =
--INSTALL_R0 = $(INSTALL) -m644 # space is required here
-+INSTALL_R0 = $(INSTALL) -m 644 # space is required here
- INSTALL_R1 =
--INSTALL_X0 = $(INSTALL) -m755 # space is required here
-+INSTALL_X0 = $(INSTALL) -m 755 # space is required here
- INSTALL_X1 =
- INSTALL_L0 = rm -f # space is required here
- INSTALL_L1 = && ln # space is required here
-@@ -50,11 +50,11 @@
- 	QUIET_2DEVNULL = 2>/dev/null
- 
- 	INSTALL_D0 = dir=
--	INSTALL_D1 = && echo ' ' DEST $$dir && $(INSTALL) -d -m755 "$$dir"
-+	INSTALL_D1 = && echo ' ' DEST $$dir && $(INSTALL) -d -m 755 "$$dir"
- 	INSTALL_R0 = src=
--	INSTALL_R1 = && echo '   ' INSTALL 644 `basename $$src` && $(INSTALL) -m644 $$src
-+	INSTALL_R1 = && echo '   ' INSTALL 644 `basename $$src` && $(INSTALL) -m 644 $$src
- 	INSTALL_X0 = src=
--	INSTALL_X1 = && echo '   ' INSTALL 755 `basename $$src` && $(INSTALL) -m755 $$src
-+	INSTALL_X1 = && echo '   ' INSTALL 755 `basename $$src` && $(INSTALL) -m 755 $$src
- 
- 	INSTALL_L0 = dst=
- 	INSTALL_L1 = && src=
diff --git a/recipes/git/files/git-less-hardlinks.diff b/recipes/git/files/git-less-hardlinks.diff
index 183fe8f..be4924c 100644
--- a/recipes/git/files/git-less-hardlinks.diff
+++ b/recipes/git/files/git-less-hardlinks.diff
@@ -33,17 +33,18 @@ This patch isn't complete though:
  	ln -s $< $@ 2>/dev/null || \
  	cp $< $@
  
-@@ -1830,13 +1828,11 @@
+@@ -2081,14 +2081,12 @@
  		cp "$$bindir/git$X" "$$execdir/git$X"; } ; } && \
- 	{ for p in $(BUILT_INS); do \
+ 	for p in $(BUILT_INS); do \
  		$(RM) "$$execdir/$$p" && \
 -		ln "$$execdir/git$X" "$$execdir/$$p" 2>/dev/null || \
  		ln -s "git$X" "$$execdir/$$p" 2>/dev/null || \
  		cp "$$execdir/git$X" "$$execdir/$$p" || exit; \
- 	  done; } && \
- 	{ for p in $(REMOTE_CURL_ALIASES); do \
+ 	done && \
+ 	remote_curl_aliases="$(REMOTE_CURL_ALIASES)" && \
+ 	for p in $$remote_curl_aliases; do \
  		$(RM) "$$execdir/$$p" && \
 -		ln "$$execdir/git-remote-http$X" "$$execdir/$$p" 2>/dev/null || \
  		ln -s "git-remote-http$X" "$$execdir/$$p" 2>/dev/null || \
  		cp "$$execdir/git-remote-http$X" "$$execdir/$$p" || exit; \
- 	  done; } && \
+ 	done && \
diff --git a/recipes/git/git-native_1.7.0.2.bb b/recipes/git/git-native_1.7.0.2.bb
deleted file mode 100644
index b55070a..0000000
--- a/recipes/git/git-native_1.7.0.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require git.inc
-inherit native
-DEPENDS = "openssl-native curl-native zlib-native expat-native"
-PR = "r4"
-SRC_URI[src.md5sum] = "76518fa774b36de81d160b85fa4f19c1"
-SRC_URI[src.sha256sum] = "5601df7fc282fdd66de196b282694eb77dcfc50438f01587de144b3ead1a6b2f"
-
-EXTRA_OECONF_append = " --without-python"
diff --git a/recipes/git/git.inc b/recipes/git/git.inc
index 8275adb..1e69682 100644
--- a/recipes/git/git.inc
+++ b/recipes/git/git.inc
@@ -4,8 +4,6 @@ LICENSE = "GPL"
 
 SRC_URI = "http://www.kernel.org/pub/software/scm/git/git-${PV}.tar.bz2;name=src"
 
-S = "${WORKDIR}/git-${PV}"
-
 inherit autotools
 
 EXTRA_OEMAKE = "NO_TCLTK=1"
diff --git a/recipes/git/git_1.7.0.2.bb b/recipes/git/git_1.7.0.2.bb
deleted file mode 100644
index a3a73f0..0000000
--- a/recipes/git/git_1.7.0.2.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require git.inc
-
-SRC_URI[src.md5sum] = "76518fa774b36de81d160b85fa4f19c1"
-SRC_URI[src.sha256sum] = "5601df7fc282fdd66de196b282694eb77dcfc50438f01587de144b3ead1a6b2f"
-
-SRC_URI += "file://git-less-hardlinks.diff"
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes"
-
-
-DEPENDS = "openssl curl zlib expat"
-RDEPENDS_${PN} = "perl perl-module-file-path cpio findutils sed"
-
-# Dropbear ssh needs a wrapper script, so install openssh-ssh to make it work out of the box
-RRECOMMENDS_${PN} = "openssh-ssh"
-
-PR = "r6"
-
-do_install_append() {
-	# Fix broken hardlinks
-	for gitprog in git-receive-pack git-upload-archive ; do
-		rm ${D}${bindir}/$gitprog 
-		ln -sf ${bindir}/git ${D}${bindir}/$gitprog
-	done
-	rm ${D}${libexecdir}/git-core/git && ln -sf ${bindir}/git ${D}${libexecdir}/git-core/git
-}
-
-FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
diff --git a/recipes/git/git_1.7.2.1.bb b/recipes/git/git_1.7.2.1.bb
new file mode 100644
index 0000000..4e07d86
--- /dev/null
+++ b/recipes/git/git_1.7.2.1.bb
@@ -0,0 +1,29 @@
+require git.inc
+
+SRC_URI[src.md5sum] = "24a443a120a0ab372185cb6bc0dbd934"
+SRC_URI[src.sha256sum] = "5446b4ece3b8d81b1fcbcd6c4b91f1961b6f4047a3f6173e3200bee368724921"
+
+SRC_URI += "file://git-less-hardlinks.diff"
+BBCLASSEXTEND = "native"
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no ac_cv_c_c99_format=yes"
+EXTRA_OECONF_append-native = " --without-python"
+
+DEPENDS = "openssl curl zlib expat"
+RDEPENDS_${PN} = "perl perl-module-file-path cpio findutils sed"
+
+# Dropbear ssh needs a wrapper script, so install openssh-ssh to make it work out of the box
+RRECOMMENDS_${PN} = "openssh-ssh"
+
+PR = "r0"
+
+do_install_append() {
+	# Fix broken hardlinks
+	#for gitprog in git-receive-pack git-upload-archive ; do
+	#	rm ${D}${bindir}/$gitprog 
+	#	ln -sf ${bindir}/git ${D}${bindir}/$gitprog
+	#done
+	#rm ${D}${libexecdir}/git-core/git && ln -sf ${bindir}/git ${D}${libexecdir}/git-core/git
+}
+
+FILES_${PN}-dbg += "${libexecdir}/git-core/.debug"
-- 
1.7.1



