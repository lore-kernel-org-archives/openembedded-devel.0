Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id E993979802
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Sep 2018 07:11:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f6-v6so7550787plo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Sep 2018 00:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FAu1Dv9BS8dGayQb73fVYu9eqA9QvS2nxdjsqnkK3yI=;
	b=MaRIwuAazGCZcq7nGd7MpCJqd5TbDCSNBA3yKfEWpabGNl/rIAdS7k48Wx0P69tb1g
	ylTzoS0tR45PHY26xAbSP55HT9c9uwe3mLUjhv1h+AEEvck4sQzsO5loT1qVz/W3g5y7
	0KC6v6RKNc+msTfk5G/FZJY7R6GNvmDwLv4X2GBiGCAAlBLTfR/umGKNZoIpdLjVdgM0
	aebnZrCR3WmGPd449Dwh1Je/Z2qKVYGKyP/MPHAihebiuLS9T2xTNyGmQ5xTRTQlx5dO
	mLA/VXEj5VGzmTSWLtlnVrEG6pROFTm9muZZKSPoZXNhQXl3biM/I/Yzc11IluBRZ+4B
	8QHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FAu1Dv9BS8dGayQb73fVYu9eqA9QvS2nxdjsqnkK3yI=;
	b=haTgCbcOTS6uOZGuZ0ZM9tUnf8pGfcoUBaDFiZSABMdlLfqlB/Hfl2k2OiF9zufrAo
	H+oti3+D5sHgZ8/LeEE5AuOxUvPB95uhvLTiTszMAyM5Fq1tCX2LthAE3Cy0Qvbz9aV6
	kblwKe5du1qVdrnAQACGG3rbRrOwOTTHkuJPU2AfmkwUONyAGIj9O9XMqnn11vpVAT4J
	Z0NjidapVqzlF3o9mft7sGdXn91a3Hbe6CzoBXFMqnFGu//dVzlJJ8tqrQvFVWzUiJos
	34hcCSYMIicY4EwTU5Y4Gwev1/O7VgXPIzGHTKMiJo+z+NuY426SIBVaYJy7kgyYWt8y
	1D4Q==
X-Gm-Message-State: APzg51B9fVKmqDJYRHn8wfZDYM9sOBNVZXKZ7XOShpG9K3D2q9nj1Khu
	y6VsVs9WF3fCNxCgGBJUWGEYf2F0
X-Google-Smtp-Source: ANB0VdZbfXDa6yLIANGYThvTAFZ+/gWqU2db83eUInABziULP5iWAZrUBNdK7mRohbyh+33BGQZxWA==
X-Received: by 2002:a17:902:1566:: with SMTP id
	b35-v6mr11621663plh.135.1536390696503; 
	Sat, 08 Sep 2018 00:11:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm18702212pfe.32.2018.09.08.00.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Sep 2018 00:11:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Sep 2018 00:11:22 -0700
Message-Id: <20180908071125.28282-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180908071125.28282-1-raj.khem@gmail.com>
References: <20180908071125.28282-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/5] md5deep: Upgrade to latest master
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
X-List-Received-Date: Sat, 08 Sep 2018 07:11:36 -0000

* Add clang fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-errors-found-by-clang.patch      |  32 -----
 ...identifier-spacing-as-dictated-by-C-.patch | 128 ++++++++++++++++++
 .../files/wrong-variable-expansion.patch      |  26 +---
 .../{md5deep_4.4.bb => md5deep_git.bb}        |  12 +-
 4 files changed, 140 insertions(+), 58 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
 create mode 100644 meta-oe/recipes-extended/md5deep/files/0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch
 rename meta-oe/recipes-extended/md5deep/{md5deep_4.4.bb => md5deep_git.bb} (71%)

diff --git a/meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch b/meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
deleted file mode 100644
index cc7cdc3364..0000000000
--- a/meta-oe/recipes-extended/md5deep/files/0001-Fix-errors-found-by-clang.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6ef69a26126ee4e69a25392fd456b8a66c51dffd Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Nov 2016 02:46:55 +0000
-Subject: [PATCH] Fix errors found by clang
-
-Fixes errors like
-
-../../git/src/hash.cpp:282:19: error: ordered comparison between pointer and zero ('const unsigned char *' and 'int')
-            if(fdht->base>0){
-               ~~~~~~~~~~^~
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/hash.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/hash.cpp b/src/hash.cpp
-index 4216157..52f419b 100644
---- a/src/hash.cpp
-+++ b/src/hash.cpp
-@@ -279,7 +279,7 @@ void file_data_hasher_t::hash()
- 		MAP_FILE|
- #endif
- 		MAP_SHARED,fd,0);
--	    if(fdht->base>0){		
-+	    if(fdht->base != (void *) -1){
- 		/* mmap is successful, so set the bounds.
- 		 * if it is not successful, we default to reading the fd
- 		 */
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-extended/md5deep/files/0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch b/meta-oe/recipes-extended/md5deep/files/0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch
new file mode 100644
index 0000000000..69460b314b
--- /dev/null
+++ b/meta-oe/recipes-extended/md5deep/files/0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch
@@ -0,0 +1,128 @@
+From 7d7b60e38ca701819d4d00b38161faddce01e2ae Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 6 Sep 2018 23:21:22 -0700
+Subject: [PATCH] Fix literal and identifier spacing as dictated by C++11
+
+Fixes clang error like below
+
+error: invalid suffix on literal; C++11 requires a space between literal and identifier [-Wreserved-user-defined-literal]
+|         status("  Known files not found: %"PRIu64, this->match.unused);
+
+Upstream-Status: Submitted [https://github.com/jessek/hashdeep/pull/385/commits/18a6b5d57f7a648d2b7dcc6e50ff00a1e4b05fcc]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/display.cpp  | 16 ++++++++--------
+ src/files.cpp    |  4 ++--
+ src/hash.cpp     |  2 +-
+ src/hashlist.cpp |  4 ++--
+ src/xml.h        |  2 +-
+ 5 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/src/display.cpp b/src/display.cpp
+index b23335d..2eddc23 100644
+--- a/src/display.cpp
++++ b/src/display.cpp
+@@ -311,7 +311,7 @@ void display::display_realtime_stats(const file_data_hasher_t *fdht, const hash_
+ 
+ 	ss << mb_read << "MB of " << fdht->stat_megs() << "MB done, ";
+ 	char msg[64];
+-	snprintf(msg,sizeof(msg),"%02"PRIu64":%02"PRIu64":%02"PRIu64" left", hour, min, seconds);
++	snprintf(msg,sizeof(msg),"%02" PRIu64 ":%02" PRIu64 ":%02" PRIu64 " left", hour, min, seconds);
+ 	ss << msg;
+     }
+     ss << "\r";
+@@ -424,14 +424,14 @@ void display::display_audit_results()
+   
+     if (opt_verbose)    {
+ 	if(opt_verbose >= MORE_VERBOSE){
+-	    status("   Input files examined: %"PRIu64, this->match.total);
+-	    status("  Known files expecting: %"PRIu64, this->match.expect);
++	    status("   Input files examined: %" PRIu64, this->match.total);
++	    status("  Known files expecting: %" PRIu64, this->match.expect);
+ 	}
+-	status("          Files matched: %"PRIu64, this->match.exact);
+-	status("Files partially matched: %"PRIu64, this->match.partial);
+-	status("            Files moved: %"PRIu64, this->match.moved);
+-	status("        New files found: %"PRIu64, this->match.unknown);
+-	status("  Known files not found: %"PRIu64, this->match.unused);
++	status("          Files matched: %" PRIu64, this->match.exact);
++	status("Files partially matched: %" PRIu64, this->match.partial);
++	status("            Files moved: %" PRIu64, this->match.moved);
++	status("        New files found: %" PRIu64, this->match.unknown);
++	status("  Known files not found: %" PRIu64, this->match.unused);
+     }
+ }
+ 
+diff --git a/src/files.cpp b/src/files.cpp
+index 89c6984..3dfd363 100644
+--- a/src/files.cpp
++++ b/src/files.cpp
+@@ -509,7 +509,7 @@ int state::parse_encase_file(const char *fn, FILE *handle,uint32_t expected_hash
+         
+ 	    // Users expect the line numbers to start at one, not zero.
+ 	    if ((!ocb.opt_silent) || (mode_warn_only)) {
+-		ocb.error("%s: No hash found in line %"PRIu32, fn, count + 1);
++		ocb.error("%s: No hash found in line %" PRIu32, fn, count + 1);
+ 		ocb.error("%s: %s", fn, strerror(errno));
+ 		return status_t::STATUS_USER_ERROR;
+ 	    }
+@@ -542,7 +542,7 @@ int state::parse_encase_file(const char *fn, FILE *handle,uint32_t expected_hash
+     }
+ 
+     if (expected_hashes != count){
+-	ocb.error("%s: Expecting %"PRIu32" hashes, found %"PRIu32"\n", 
++	ocb.error("%s: Expecting %" PRIu32 " hashes, found %" PRIu32 "\n", 
+ 			fn, expected_hashes, count);
+     }
+     return status_t::status_ok;
+diff --git a/src/hash.cpp b/src/hash.cpp
+index 52f419b..a4b3128 100644
+--- a/src/hash.cpp
++++ b/src/hash.cpp
+@@ -124,7 +124,7 @@ bool file_data_hasher_t::compute_hash(uint64_t request_start,uint64_t request_le
+     
+ 	// If an error occured, display a message and see if we need to quit.
+ 	if ((current_read_bytes<0) || (this->handle && ferror(this->handle))){
+-	    ocb->error_filename(this->file_name,"error at offset %"PRIu64": %s",
++	    ocb->error_filename(this->file_name,"error at offset %" PRIu64 ": %s",
+ 				request_start, strerror(errno));
+ 	   
+ 	    if (file_fatal_error()){
+diff --git a/src/hashlist.cpp b/src/hashlist.cpp
+index b5b275f..eb0d45a 100644
+--- a/src/hashlist.cpp
++++ b/src/hashlist.cpp
+@@ -342,7 +342,7 @@ hashlist::load_hash_file(display *ocb,const std::string &fn)
+     file_data_t *t = new (std::nothrow) file_data_t();
+     if (NULL == t)
+     {
+-      ocb->fatal_error("%s: Out of memory in line %"PRIu64,
++      ocb->fatal_error("%s: Out of memory in line %" PRIu64,
+ 		       fn.c_str(), line_number);
+     }
+ 
+@@ -390,7 +390,7 @@ hashlist::load_hash_file(display *ocb,const std::string &fn)
+       if ( !algorithm_t::valid_hash(hash_column[column_number],word))
+       {
+ 	if (ocb)
+-	  ocb->error("%s: Invalid %s hash in line %"PRIu64,
++	  ocb->error("%s: Invalid %s hash in line %" PRIu64,
+ 		     fn.c_str(),
+ 		     hashes[hash_column[column_number]].name.c_str(),
+ 		     line_number);
+diff --git a/src/xml.h b/src/xml.h
+index bfe0c94..017dba7 100644
+--- a/src/xml.h
++++ b/src/xml.h
+@@ -100,7 +100,7 @@ public:
+     void xmlout(const std::string &tag,const std::string &value){ xmlout(tag,value,"",true); }
+     void xmlout(const std::string &tag,const int value){ xmlprintf(tag,"","%d",value); }
+     void xmloutl(const std::string &tag,const long value){ xmlprintf(tag,"","%ld",value); }
+-    void xmlout(const std::string &tag,const int64_t value){ xmlprintf(tag,"","%"PRId64,value); }
++    void xmlout(const std::string &tag,const int64_t value){ xmlprintf(tag,"","%" PRId64,value); }
+     void xmlout(const std::string &tag,const double value){ xmlprintf(tag,"","%f",value); }
+     void xmlout(const std::string &tag,const struct timeval &ts){
+ 	xmlprintf(tag,"","%d.%06d",(int)ts.tv_sec, (int)ts.tv_usec);
+-- 
+2.18.0
+
diff --git a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
index 3a4c4f4c2c..73c6cb126a 100644
--- a/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
+++ b/meta-oe/recipes-extended/md5deep/files/wrong-variable-expansion.patch
@@ -1,6 +1,8 @@
---- a/configure.ac	2014-08-22 12:22:54.290884351 +0200
-+++ b/configure.ac	2014-08-22 12:23:15.822306295 +0200
-@@ -42,18 +42,6 @@
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac
++++ git/configure.ac
+@@ -42,18 +42,6 @@ case $host in
       ;;		 		     
  esac
  
@@ -19,21 +21,3 @@
  #
  #
  ################################################################
-@@ -71,7 +59,7 @@
- 
- if test $mingw = "no" ; then
-   # add the warnings we don't want to do on mingw
--  $WARNINGS_TO_TEST="$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Weffc++"
-+  WARNINGS_TO_TEST="$WARNINGS_TO_TEST -Wall -Wstrict-prototypes  -Weffc++"
- fi
- 
- for option in $WARNINGS_TO_TEST
-@@ -105,7 +93,7 @@
- 
- if test $mingw = "no" ; then
-   # add the warnings we don't want to do on mingw
--  $WARNINGS_TO_TEST="$WARNINGS_TO_TEST  -Weffc++"
-+  WARNINGS_TO_TEST="$WARNINGS_TO_TEST  -Weffc++"
- fi
- 
- for option in $WARNINGS_TO_TEST
diff --git a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
similarity index 71%
rename from meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
rename to meta-oe/recipes-extended/md5deep/md5deep_git.bb
index bb30abedd9..e8c6864c1f 100644
--- a/meta-oe/recipes-extended/md5deep/md5deep_4.4.bb
+++ b/meta-oe/recipes-extended/md5deep/md5deep_git.bb
@@ -4,13 +4,15 @@ AUTHOR = "Jesse Kornblum, Simson L. Garfinkel"
 HOMEPAGE = "http://md5deep.sourceforge.net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9190f660105b9a56cdb272309bfd5491"
-# Release 4.4
-SRCREV = "cd2ed7416685a5e83eb10bb659d6e9bec01244ae"
+
+PV = "4.4+git${SRCPV}"
+
+SRCREV = "877613493ff44807888ce1928129574be393cbb0"
 
 SRC_URI = "git://github.com/jessek/hashdeep.git \
-        file://wrong-variable-expansion.patch \
-        file://0001-Fix-errors-found-by-clang.patch \
-        "
+           file://wrong-variable-expansion.patch \
+           file://0001-Fix-literal-and-identifier-spacing-as-dictated-by-C-.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


