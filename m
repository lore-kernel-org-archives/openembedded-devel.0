Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <henning@tarent.de>) id 1ObZyE-0006dK-7N
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Jul 2010 16:08:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 6F78F4036DE78;
	Wed, 21 Jul 2010 16:07:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 681954036DE79;
	Wed, 21 Jul 2010 16:07:37 +0200 (CEST)
X-Virus-Scanned: by amavisd-new-2.6.1 (20080629) (Debian) at tarent.de
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6Vy6aWCdH-5; Wed, 21 Jul 2010 16:07:37 +0200 (CEST)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 37D464036DE78;
	Wed, 21 Jul 2010 16:07:37 +0200 (CEST)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1ObZxB-0006UR-RO; Wed, 21 Jul 2010 16:07:21 +0200
From: heinold@inf.fu-berlin.de
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Jul 2010 16:07:07 +0200
Message-Id: <1279721232-24744-17-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1279721232-24744-1-git-send-email-heinold@inf.fu-berlin.de>
X-SA-Exim-Connect-IP: 212.79.178.249
X-SA-Exim-Mail-From: henning@tarent.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 16/21] fastjar: backport 0.98 version from openembedded-dev
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
X-List-Received-Date: Wed, 21 Jul 2010 14:08:41 -0000

From: Henning Heinold <h.heinold@tarent.de>

---
 conf/checksums.ini                     |    4 +
 recipes/fastjar/fastjar-native.inc     |   18 +++++
 recipes/fastjar/fastjar-native_0.98.bb |    4 +
 recipes/fastjar/fastjar.inc            |   18 +++++
 recipes/fastjar/fastjar_0.98.bb        |    1 +
 recipes/fastjar/files/jartool.patch    |  112 ++++++++++++++++++++++++++++++++
 6 files changed, 157 insertions(+), 0 deletions(-)
 create mode 100644 recipes/fastjar/fastjar-native.inc
 create mode 100644 recipes/fastjar/fastjar-native_0.98.bb
 create mode 100644 recipes/fastjar/fastjar.inc
 create mode 100644 recipes/fastjar/fastjar_0.98.bb
 create mode 100644 recipes/fastjar/files/jartool.patch

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2c18f2e..40eec41 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -6290,6 +6290,10 @@ sha256=84553ff12c5245705806107448e85c96950b4b7a5eaf85461c89987be8ea644d
 md5=92a70f9e56223b653bce0f58f90cf950
 sha256=ca03811490c965abc9f466e75418ae48bb71f14d8e8ed4c43e8109207b85ce54
 
+[http://download.savannah.nongnu.org/releases/fastjar/fastjar-0.98.tar.gz]
+md5=d2d264d343d4d0e1575832cc1023c3bf
+sha256=f156abc5de8658f22ee8f08d7a72c88f9409ebd8c7933e9466b0842afeb2f145
+
 [http://ftp3.ie.freebsd.org/pub/gentoo/distfiles/fbgetty-0.1.698.tar.gz]
 md5=1705bc0f8f1e03fe50d324ba84ac4e56
 sha256=332cbffa7c489b39a7d13d12d581c27dfc57ba098041431a6845b44785cf2d35
diff --git a/recipes/fastjar/fastjar-native.inc b/recipes/fastjar/fastjar-native.inc
new file mode 100644
index 0000000..e4d7084
--- /dev/null
+++ b/recipes/fastjar/fastjar-native.inc
@@ -0,0 +1,18 @@
+DEPENDS = "zlib-native"
+
+S = "${WORKDIR}/fastjar-${PV}"
+
+inherit native
+
+do_configure () {
+	gnu-configize || die "failure running gnu-configize"
+	oe_runconf
+}
+
+do_make() {
+	oe_runmake bin_PROGRAMS
+}
+
+do_stage() {
+	oe_runmake install-binPROGRAMS
+}
diff --git a/recipes/fastjar/fastjar-native_0.98.bb b/recipes/fastjar/fastjar-native_0.98.bb
new file mode 100644
index 0000000..342bf7c
--- /dev/null
+++ b/recipes/fastjar/fastjar-native_0.98.bb
@@ -0,0 +1,4 @@
+require fastjar.inc
+require fastjar-native.inc
+
+PR = "${INC_PR}.1"
diff --git a/recipes/fastjar/fastjar.inc b/recipes/fastjar/fastjar.inc
new file mode 100644
index 0000000..4a798d8
--- /dev/null
+++ b/recipes/fastjar/fastjar.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "jar replacement written in C."
+HOMEPAGE = "http://savannah.nongnu.org/projects/fastjar/"
+SECTION = "devel"
+PRIORITY = "optional"
+LICENSE = "GPL"
+
+DEPENDS = "zlib"
+
+INC_PR = "r4"
+
+SRC_URI = "http://download.savannah.nongnu.org/releases/fastjar/fastjar-${PV}.tar.gz \
+           file://jartool.patch;patch=1 \
+          "
+
+inherit autotools
+
+PACKAGES =+ "${PN}-grepjar"
+FILES_${PN}-grepjar = "${bindir}/grepjar"
diff --git a/recipes/fastjar/fastjar_0.98.bb b/recipes/fastjar/fastjar_0.98.bb
new file mode 100644
index 0000000..35392f2
--- /dev/null
+++ b/recipes/fastjar/fastjar_0.98.bb
@@ -0,0 +1 @@
+require fastjar.inc
diff --git a/recipes/fastjar/files/jartool.patch b/recipes/fastjar/files/jartool.patch
new file mode 100644
index 0000000..b589b62
--- /dev/null
+++ b/recipes/fastjar/files/jartool.patch
@@ -0,0 +1,112 @@
+--- a/jartool.c	2009/09/06 22:16:00	1.59
++++ b/jartool.c	2010/06/10 11:32:48	1.62
+@@ -790,6 +790,7 @@
+ 		   progname, jarfile);
+ 	  return 1;
+ 	}
++      ze->filename[len] = '\0';
+       len = UNPACK_UB4(header, CEN_EFLEN);
+       len += UNPACK_UB4(header, CEN_COMLEN);
+       if (lseek (fd, len, SEEK_CUR) == -1)
+@@ -1257,7 +1258,7 @@
+       exit_on_error("write");
+ 
+   /* write the file name to the zip file */
+-  if (1 == write(jfd, fname, file_name_length))
++  if (-1 == write(jfd, fname, file_name_length))
+     exit_on_error("write");
+ 
+   if(verbose){
+@@ -1730,7 +1731,17 @@
+       struct stat sbuf;
+       int depth = 0;
+ 
+-      tmp_buff = malloc(sizeof(char) * strlen((const char *)filename));
++      if(*filename == '/'){
++	fprintf(stderr, "Absolute path names are not allowed.\n");
++	exit(EXIT_FAILURE);
++      }
++
++      tmp_buff = malloc(strlen((const char *)filename));
++
++      if(tmp_buff == NULL) {
++	fprintf(stderr, "Out of memory.\n");
++	exit(EXIT_FAILURE);
++      }
+ 
+       for(;;){
+         const ub1 *idx = (const unsigned char *)strchr((const char *)start, '/');
+@@ -1738,25 +1749,28 @@
+         if(idx == NULL)
+           break;
+         else if(idx == start){
++	  tmp_buff[idx - filename] = '/';
+           start++;
+           continue;
+         }
+-        start = idx + 1;
+ 
+-        strncpy(tmp_buff, (const char *)filename, (idx - filename));
+-        tmp_buff[(idx - filename)] = '\0';
++	memcpy(tmp_buff + (start - filename), (const char *)start, (idx - start));
++	tmp_buff[idx - filename] = '\0';
+ 
+ #ifdef DEBUG    
+         printf("checking the existance of %s\n", tmp_buff);
+ #endif
+-	if(strcmp(tmp_buff, "..") == 0){
++	if(idx - start == 2 && memcmp(start, "..", 2) == 0){
+ 	  --depth;
+ 	  if (depth < 0){
+ 	    fprintf(stderr, "Traversal to parent directories during unpacking!\n");
+ 	    exit(EXIT_FAILURE);
+ 	  }
+-	} else if (strcmp(tmp_buff, ".") != 0)
++	} else if (idx - start != 1 || *start != '.')
+ 	  ++depth;
++
++        start = idx + 1;
++
+         if(stat(tmp_buff, &sbuf) < 0){
+           if(errno != ENOENT)
+             exit_on_error("stat");
+@@ -1765,6 +1779,7 @@
+ #ifdef DEBUG    
+           printf("Directory exists\n");
+ #endif
++	  tmp_buff[idx - filename] = '/';
+           continue;
+         }else {
+           fprintf(stderr, "Hmmm.. %s exists but isn't a directory!\n",
+@@ -1781,10 +1796,11 @@
+         if(verbose && handle)
+           printf("%10s: %s/\n", "created", tmp_buff);
+ 
++	tmp_buff[idx - filename] = '/';
+       }
+ 
+       /* only a directory */
+-      if(strlen((const char *)start) == 0)
++      if(*start == '\0')
+         dir = TRUE;
+ 
+ #ifdef DEBUG    
+@@ -1792,7 +1808,7 @@
+ #endif
+ 
+       /* If the entry was just a directory, don't write to file, etc */
+-      if(strlen((const char *)start) == 0)
++      if(*start == '\0')
+         f_fd = -1;
+ 
+       free(tmp_buff);
+@@ -1876,7 +1892,8 @@
+       exit(EXIT_FAILURE);
+     }
+ 
+-    close(f_fd);
++    if (f_fd != -1)
++      close(f_fd);
+ 
+     if(verbose && dir == FALSE && handle)
+       printf("%10s: %s\n",
-- 
1.7.0.4



