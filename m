Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DB0F660444
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 02:59:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99103441"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 31 Jul 2015 11:02:55 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6V2vTgd014912
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:57:29 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 31 Jul 2015 10:59:20 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 31 Jul 2015 10:59:19 +0800
Message-ID: <1438311559-15856-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-networking][PATCH 1/5] vsftpd: upgrade 3.0.2->3.0.3
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
X-List-Received-Date: Fri, 31 Jul 2015 02:59:28 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../vsftpd/vsftpd-3.0.2/makefile-destdir.patch     |  44 ---------
 .../vsftpd/vsftpd-3.0.2/makefile-libs.patch        |  21 ----
 .../vsftpd/vsftpd-3.0.2/makefile-strip.patch       |  17 ----
 .../vsftpd-3.0.2/nopam-with-tcp_wrappers.patch     |  17 ----
 .../vsftpd/vsftpd-3.0.2/nopam.patch                |  16 ---
 .../vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch  |  77 ---------------
 .../vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch |  25 -----
 .../vsftpd/vsftpd-3.0.3/makefile-destdir.patch     |  44 +++++++++
 .../vsftpd/vsftpd-3.0.3/makefile-libs.patch        |  21 ++++
 .../vsftpd/vsftpd-3.0.3/makefile-strip.patch       |  17 ++++
 .../vsftpd-3.0.3/nopam-with-tcp_wrappers.patch     |  17 ++++
 .../vsftpd/vsftpd-3.0.3/nopam.patch                |  16 +++
 .../vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch  |  77 +++++++++++++++
 .../vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch |  25 +++++
 .../recipes-daemons/vsftpd/vsftpd_3.0.2.bb         | 107 ---------------------
 .../recipes-daemons/vsftpd/vsftpd_3.0.3.bb         | 107 +++++++++++++++++++++
 16 files changed, 324 insertions(+), 324 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
 delete mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch
deleted file mode 100644
index 1980d09..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-destdir.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Use DESTDIR within install to allow installing under a prefix
-
-Upstream-Status: Pending
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -24,21 +24,21 @@
- 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
- 
- install:
--	if [ -x /usr/local/sbin ]; then \
--		$(INSTALL) -m 755 vsftpd /usr/local/sbin/vsftpd; \
-+	if [ -x ${DESTDIR}/usr/local/sbin ]; then \
-+		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/local/sbin/vsftpd; \
- 	else \
--		$(INSTALL) -m 755 vsftpd /usr/sbin/vsftpd; fi
--	if [ -x /usr/local/man ]; then \
--		$(INSTALL) -m 644 vsftpd.8 /usr/local/man/man8/vsftpd.8; \
--		$(INSTALL) -m 644 vsftpd.conf.5 /usr/local/man/man5/vsftpd.conf.5; \
--	elif [ -x /usr/share/man ]; then \
--		$(INSTALL) -m 644 vsftpd.8 /usr/share/man/man8/vsftpd.8; \
--		$(INSTALL) -m 644 vsftpd.conf.5 /usr/share/man/man5/vsftpd.conf.5; \
-+		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/sbin/vsftpd; fi
-+	if [ -x ${DESTDIR}/usr/local/man ]; then \
-+		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/local/man/man8/vsftpd.8; \
-+		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/local/man/man5/vsftpd.conf.5; \
-+	elif [ -x ${DESTDIR}/usr/share/man ]; then \
-+		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/share/man/man8/vsftpd.8; \
-+		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/share/man/man5/vsftpd.conf.5; \
- 	else \
--		$(INSTALL) -m 644 vsftpd.8 /usr/man/man8/vsftpd.8; \
--		$(INSTALL) -m 644 vsftpd.conf.5 /usr/man/man5/vsftpd.conf.5; fi
--	if [ -x /etc/xinetd.d ]; then \
--		$(INSTALL) -m 644 xinetd.d/vsftpd /etc/xinetd.d/vsftpd; fi
-+		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/man/man8/vsftpd.8; \
-+		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/man/man5/vsftpd.conf.5; fi
-+	if [ -x ${DESTDIR}/etc/xinetd.d ]; then \
-+		$(INSTALL) -m 644 xinetd.d/vsftpd ${DESTDIR}/etc/xinetd.d/vsftpd; fi
- 
- clean:
- 	rm -f *.o *.swp vsftpd
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch
deleted file mode 100644
index 9a10f72..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-libs.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Hardcode LIBS instead of using a script to determine available libs
-
-We want to avoid this dynamic detection so we have a deterministic
-build.
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -5,7 +5,7 @@
- #CFLAGS = -g
- CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
- 
--LIBS	=	`./vsf_findlibs.sh`
-+LIBS	=	-lssl -lcrypto -lnsl -lresolv
- LINK	=	-Wl,-s
- 
- OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch
deleted file mode 100644
index fd31600..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/makefile-strip.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Disable stripping at link time
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -9,7 +9,6 @@ CFLAGS	=	-O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 \
- 	#-pedantic -Wconversion
- 
- LIBS	=	-lssl -lcrypto -lnsl -lresolv
--LINK	=	-Wl,-s
- LDFLAGS	=	-fPIE -pie -Wl,-z,relro -Wl,-z,now
- 
- OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch
deleted file mode 100644
index fdcf3a0..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam-with-tcp_wrappers.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Disable PAM
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
-diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
---- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
-+++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
-@@ -2,7 +2,7 @@
- #define VSF_BUILDDEFS_H
- 
- #define VSF_BUILD_TCPWRAPPERS
--#define VSF_BUILD_PAM
-+#undef VSF_BUILD_PAM
- #undef VSF_BUILD_SSL
- 
- #endif /* VSF_BUILDDEFS_H */
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
deleted file mode 100644
index cf0d68e..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/nopam.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Disable PAM
-
-Upstream-Status: Inappropriate [config]
-
-diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
---- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
-+++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
-@@ -2,7 +2,7 @@
- #define VSF_BUILDDEFS_H
- 
- #undef VSF_BUILD_TCPWRAPPERS
--#define VSF_BUILD_PAM
-+#undef VSF_BUILD_PAM
- #undef VSF_BUILD_SSL
- 
- #endif /* VSF_BUILDDEFS_H */
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch
deleted file mode 100644
index 32f7e82..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-Fix the CVE-2015-1419
-
-Upstream-Status: Pending
-
-Try to fix deny_file parsing to do more what is expected. Taken
-from fedora. CVE-2015-1419
-
-ftp://195.220.108.108/linux/fedora/linux/development/rawhide/source/SRPMS/v/vsftpd-3.0.2-13.fc22.src.rpm
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
-diff -up vsftpd-2.1.0/ls.c.filter vsftpd-2.1.0/ls.c
---- vsftpd-2.1.0/ls.c.filter	2008-02-02 02:30:41.000000000 +0100
-+++ vsftpd-2.1.0/ls.c	2009-01-08 19:31:15.000000000 +0100
-@@ -239,9 +239,31 @@ vsf_filename_passes_filter(const struct 
-   int ret = 0;
-   char last_token = 0;
-   int must_match_at_current_pos = 1;
-+  
-+  
-   str_copy(&filter_remain_str, p_filter_str);
--  str_copy(&name_remain_str, p_filename_str);
--
-+  
-+  if (!str_isempty (&filter_remain_str) && !str_isempty(p_filename_str)) {
-+    if (str_get_char_at(p_filter_str, 0) == '/') {
-+      if (str_get_char_at(p_filename_str, 0) != '/') {
-+        str_getcwd (&name_remain_str);
-+     
-+        if (str_getlen(&name_remain_str) > 1) /* cwd != root dir */
-+          str_append_char (&name_remain_str, '/');
-+          
-+        str_append_str (&name_remain_str, p_filename_str);
-+      }
-+      else
-+       str_copy (&name_remain_str, p_filename_str);
-+    } else {
-+      if (str_get_char_at(p_filter_str, 0) != '{')
-+        str_basename (&name_remain_str, p_filename_str);
-+      else
-+        str_copy (&name_remain_str, p_filename_str);
-+    }
-+  } else
-+    str_copy(&name_remain_str, p_filename_str);
-+  
-   while (!str_isempty(&filter_remain_str) && *iters < VSFTP_MATCHITERS_MAX)
-   {
-     static struct mystr s_match_needed_str;
-diff -up vsftpd-2.1.0/str.c.filter vsftpd-2.1.0/str.c
---- vsftpd-2.1.0/str.c.filter	2008-12-17 06:54:16.000000000 +0100
-+++ vsftpd-2.1.0/str.c	2009-01-08 19:31:15.000000000 +0100
-@@ -680,3 +680,14 @@ str_replace_unprintable(struct mystr* p_
-   }
- }
- 
-+void
-+str_basename (struct mystr* d_str, const struct mystr* path)
-+{
-+  static struct mystr tmp;
-+
-+  str_copy (&tmp, path);
-+  str_split_char_reverse(&tmp, d_str, '/');
-+
-+  if (str_isempty(d_str))
-+   str_copy (d_str, path);
-+}
-diff -up vsftpd-2.1.0/str.h.filter vsftpd-2.1.0/str.h
---- vsftpd-2.1.0/str.h.filter	2008-12-17 06:53:23.000000000 +0100
-+++ vsftpd-2.1.0/str.h	2009-01-08 19:32:14.000000000 +0100
-@@ -100,6 +100,7 @@ void str_replace_unprintable(struct myst
- int str_atoi(const struct mystr* p_str);
- filesize_t str_a_to_filesize_t(const struct mystr* p_str);
- unsigned int str_octal_to_uint(const struct mystr* p_str);
-+void str_basename (struct mystr* d_str, const struct mystr* path);
- 
- /* PURPOSE: Extract a line of text (delimited by \n or EOF) from a string
-  * buffer, starting at character position 'p_pos'. The extracted line will
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch
deleted file mode 100644
index 69745b3..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-tcp_wrappers-support.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Enable tcp_wrapper.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Roy.Li <rongqing.li@windriver.com>
----
- builddefs.h |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/builddefs.h b/builddefs.h
-index e908352..0106d1a 100644
---- a/builddefs.h
-+++ b/builddefs.h
-@@ -1,7 +1,7 @@
- #ifndef VSF_BUILDDEFS_H
- #define VSF_BUILDDEFS_H
- 
--#undef VSF_BUILD_TCPWRAPPERS
-+#define VSF_BUILD_TCPWRAPPERS
- #define VSF_BUILD_PAM
- #undef VSF_BUILD_SSL
- 
--- 
-1.7.1
-
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
new file mode 100644
index 0000000..1980d09
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-destdir.patch
@@ -0,0 +1,44 @@
+Use DESTDIR within install to allow installing under a prefix
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -24,21 +24,21 @@
+ 	$(CC) -o vsftpd $(OBJS) $(LINK) $(LIBS)
+ 
+ install:
+-	if [ -x /usr/local/sbin ]; then \
+-		$(INSTALL) -m 755 vsftpd /usr/local/sbin/vsftpd; \
++	if [ -x ${DESTDIR}/usr/local/sbin ]; then \
++		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/local/sbin/vsftpd; \
+ 	else \
+-		$(INSTALL) -m 755 vsftpd /usr/sbin/vsftpd; fi
+-	if [ -x /usr/local/man ]; then \
+-		$(INSTALL) -m 644 vsftpd.8 /usr/local/man/man8/vsftpd.8; \
+-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/local/man/man5/vsftpd.conf.5; \
+-	elif [ -x /usr/share/man ]; then \
+-		$(INSTALL) -m 644 vsftpd.8 /usr/share/man/man8/vsftpd.8; \
+-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/share/man/man5/vsftpd.conf.5; \
++		$(INSTALL) -m 755 vsftpd ${DESTDIR}/usr/sbin/vsftpd; fi
++	if [ -x ${DESTDIR}/usr/local/man ]; then \
++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/local/man/man8/vsftpd.8; \
++		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/local/man/man5/vsftpd.conf.5; \
++	elif [ -x ${DESTDIR}/usr/share/man ]; then \
++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/share/man/man8/vsftpd.8; \
++		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/share/man/man5/vsftpd.conf.5; \
+ 	else \
+-		$(INSTALL) -m 644 vsftpd.8 /usr/man/man8/vsftpd.8; \
+-		$(INSTALL) -m 644 vsftpd.conf.5 /usr/man/man5/vsftpd.conf.5; fi
+-	if [ -x /etc/xinetd.d ]; then \
+-		$(INSTALL) -m 644 xinetd.d/vsftpd /etc/xinetd.d/vsftpd; fi
++		$(INSTALL) -m 644 vsftpd.8 ${DESTDIR}/usr/man/man8/vsftpd.8; \
++		$(INSTALL) -m 644 vsftpd.conf.5 ${DESTDIR}/usr/man/man5/vsftpd.conf.5; fi
++	if [ -x ${DESTDIR}/etc/xinetd.d ]; then \
++		$(INSTALL) -m 644 xinetd.d/vsftpd ${DESTDIR}/etc/xinetd.d/vsftpd; fi
+ 
+ clean:
+ 	rm -f *.o *.swp vsftpd
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
new file mode 100644
index 0000000..9a10f72
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-libs.patch
@@ -0,0 +1,21 @@
+Hardcode LIBS instead of using a script to determine available libs
+
+We want to avoid this dynamic detection so we have a deterministic
+build.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -5,7 +5,7 @@
+ #CFLAGS = -g
+ CFLAGS	=	-O2 -Wall -W -Wshadow #-pedantic -Werror -Wconversion
+ 
+-LIBS	=	`./vsf_findlibs.sh`
++LIBS	=	-lssl -lcrypto -lnsl -lresolv
+ LINK	=	-Wl,-s
+ 
+ OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
new file mode 100644
index 0000000..fd31600
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/makefile-strip.patch
@@ -0,0 +1,17 @@
+Disable stripping at link time
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/Makefile b/Makefile
+--- a/Makefile
++++ b/Makefile
+@@ -9,7 +9,6 @@ CFLAGS	=	-O2 -fPIE -fstack-protector --param=ssp-buffer-size=4 \
+ 	#-pedantic -Wconversion
+ 
+ LIBS	=	-lssl -lcrypto -lnsl -lresolv
+-LINK	=	-Wl,-s
+ LDFLAGS	=	-fPIE -pie -Wl,-z,relro -Wl,-z,now
+ 
+ OBJS	=	main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o \
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
new file mode 100644
index 0000000..fdcf3a0
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam-with-tcp_wrappers.patch
@@ -0,0 +1,17 @@
+Disable PAM
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
+--- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
++++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
+@@ -2,7 +2,7 @@
+ #define VSF_BUILDDEFS_H
+ 
+ #define VSF_BUILD_TCPWRAPPERS
+-#define VSF_BUILD_PAM
++#undef VSF_BUILD_PAM
+ #undef VSF_BUILD_SSL
+ 
+ #endif /* VSF_BUILDDEFS_H */
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
new file mode 100644
index 0000000..cf0d68e
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/nopam.patch
@@ -0,0 +1,16 @@
+Disable PAM
+
+Upstream-Status: Inappropriate [config]
+
+diff -ur vsftpd-2.0.1_org/builddefs.h vsftpd-2.0.1_patch/builddefs.h
+--- vsftpd-2.0.1_org/builddefs.h	2004-07-02 16:36:59.000000000 +0200
++++ vsftpd-2.0.1_patch/builddefs.h	2004-07-21 09:34:49.044900488 +0200
+@@ -2,7 +2,7 @@
+ #define VSF_BUILDDEFS_H
+ 
+ #undef VSF_BUILD_TCPWRAPPERS
+-#define VSF_BUILD_PAM
++#undef VSF_BUILD_PAM
+ #undef VSF_BUILD_SSL
+ 
+ #endif /* VSF_BUILDDEFS_H */
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
new file mode 100644
index 0000000..32f7e82
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-2.1.0-filter.patch
@@ -0,0 +1,77 @@
+Fix the CVE-2015-1419
+
+Upstream-Status: Pending
+
+Try to fix deny_file parsing to do more what is expected. Taken
+from fedora. CVE-2015-1419
+
+ftp://195.220.108.108/linux/fedora/linux/development/rawhide/source/SRPMS/v/vsftpd-3.0.2-13.fc22.src.rpm
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+
+diff -up vsftpd-2.1.0/ls.c.filter vsftpd-2.1.0/ls.c
+--- vsftpd-2.1.0/ls.c.filter	2008-02-02 02:30:41.000000000 +0100
++++ vsftpd-2.1.0/ls.c	2009-01-08 19:31:15.000000000 +0100
+@@ -239,9 +239,31 @@ vsf_filename_passes_filter(const struct 
+   int ret = 0;
+   char last_token = 0;
+   int must_match_at_current_pos = 1;
++  
++  
+   str_copy(&filter_remain_str, p_filter_str);
+-  str_copy(&name_remain_str, p_filename_str);
+-
++  
++  if (!str_isempty (&filter_remain_str) && !str_isempty(p_filename_str)) {
++    if (str_get_char_at(p_filter_str, 0) == '/') {
++      if (str_get_char_at(p_filename_str, 0) != '/') {
++        str_getcwd (&name_remain_str);
++     
++        if (str_getlen(&name_remain_str) > 1) /* cwd != root dir */
++          str_append_char (&name_remain_str, '/');
++          
++        str_append_str (&name_remain_str, p_filename_str);
++      }
++      else
++       str_copy (&name_remain_str, p_filename_str);
++    } else {
++      if (str_get_char_at(p_filter_str, 0) != '{')
++        str_basename (&name_remain_str, p_filename_str);
++      else
++        str_copy (&name_remain_str, p_filename_str);
++    }
++  } else
++    str_copy(&name_remain_str, p_filename_str);
++  
+   while (!str_isempty(&filter_remain_str) && *iters < VSFTP_MATCHITERS_MAX)
+   {
+     static struct mystr s_match_needed_str;
+diff -up vsftpd-2.1.0/str.c.filter vsftpd-2.1.0/str.c
+--- vsftpd-2.1.0/str.c.filter	2008-12-17 06:54:16.000000000 +0100
++++ vsftpd-2.1.0/str.c	2009-01-08 19:31:15.000000000 +0100
+@@ -680,3 +680,14 @@ str_replace_unprintable(struct mystr* p_
+   }
+ }
+ 
++void
++str_basename (struct mystr* d_str, const struct mystr* path)
++{
++  static struct mystr tmp;
++
++  str_copy (&tmp, path);
++  str_split_char_reverse(&tmp, d_str, '/');
++
++  if (str_isempty(d_str))
++   str_copy (d_str, path);
++}
+diff -up vsftpd-2.1.0/str.h.filter vsftpd-2.1.0/str.h
+--- vsftpd-2.1.0/str.h.filter	2008-12-17 06:53:23.000000000 +0100
++++ vsftpd-2.1.0/str.h	2009-01-08 19:32:14.000000000 +0100
+@@ -100,6 +100,7 @@ void str_replace_unprintable(struct myst
+ int str_atoi(const struct mystr* p_str);
+ filesize_t str_a_to_filesize_t(const struct mystr* p_str);
+ unsigned int str_octal_to_uint(const struct mystr* p_str);
++void str_basename (struct mystr* d_str, const struct mystr* path);
+ 
+ /* PURPOSE: Extract a line of text (delimited by \n or EOF) from a string
+  * buffer, starting at character position 'p_pos'. The extracted line will
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
new file mode 100644
index 0000000..69745b3
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.3/vsftpd-tcp_wrappers-support.patch
@@ -0,0 +1,25 @@
+Enable tcp_wrapper.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ builddefs.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/builddefs.h b/builddefs.h
+index e908352..0106d1a 100644
+--- a/builddefs.h
++++ b/builddefs.h
+@@ -1,7 +1,7 @@
+ #ifndef VSF_BUILDDEFS_H
+ #define VSF_BUILDDEFS_H
+ 
+-#undef VSF_BUILD_TCPWRAPPERS
++#define VSF_BUILD_TCPWRAPPERS
+ #define VSF_BUILD_PAM
+ #undef VSF_BUILD_SSL
+ 
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
deleted file mode 100644
index 9d1c1cc..0000000
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
+++ /dev/null
@@ -1,107 +0,0 @@
-SUMMARY = "Very Secure FTP server"
-HOMEPAGE = "https://security.appspot.com/vsftpd.html"
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
-
-DEPENDS = "libcap openssl"
-
-SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
-           file://makefile-destdir.patch \
-           file://makefile-libs.patch \
-           file://makefile-strip.patch \
-           file://init \
-           file://vsftpd.conf \
-           file://vsftpd.user_list \
-           file://vsftpd.ftpusers \
-           file://change-secure_chroot_dir.patch \
-           file://volatiles.99_vsftpd \
-           file://vsftpd.service \
-           file://vsftpd-2.1.0-filter.patch \
-"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
-                        file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
-                        file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
-SRC_URI[md5sum] = "8b00c749719089401315bd3c44dddbb2"
-SRC_URI[sha256sum] = "be46f0e2c5528fe021fafc8dab1ecfea0c1f183063a06977f8537fcd0b195e56"
-
-
-PACKAGECONFIG ??= "tcp-wrappers"
-PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
-SRC_URI +="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)}"
-
-DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
-PAMLIB = "${@base_contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
-NOPAM_SRC ="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
-SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)}"
-
-inherit update-rc.d useradd systemd
-
-CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
-LDFLAGS_append =" -lcrypt -lcap"
-
-do_configure() {
-    # Fix hardcoded /usr, /etc, /var mess.
-    cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g \
-    |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
-    mv tunables.c.new tunables.c
-}
-
-do_compile() {
-   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
-}
-
-do_install() {
-    install -d ${D}${sbindir}
-    install -d ${D}${mandir}/man8
-    install -d ${D}${mandir}/man5
-    oe_runmake 'DESTDIR=${D}' install
-    install -d ${D}${sysconfdir}
-    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
-    install -d ${D}/${sysconfdir}/default/volatiles
-    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
-
-    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
-    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
-    if ! test -z "${PAMLIB}" ; then
-        install -d ${D}${sysconfdir}/pam.d/
-        cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
-        sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
-        sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
-    fi
-    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
-        install -d ${D}${sysconfdir}/tmpfiles.d
-        echo "d /var/run/vsftpd/empty 0755 root root -" \
-        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
-    fi
-
-    # Install systemd unit files
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/vsftpd.service ${D}${systemd_unitdir}/system
-    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/vsftpd.service
-}
-
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME_${PN} = "vsftpd"
-INITSCRIPT_PARAMS_${PN} = "defaults 80"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp \
-                       --shell /bin/false ftp "
-GROUPADD_PARAM_${PN} = "-r ftp"
-
-SYSTEMD_SERVICE_${PN} = "vsftpd.service"
-
-pkg_postinst_${PN}() {
-    if [ -z "$D" ]; then
-	if type systemd-tmpfiles >/dev/null; then
-	    systemd-tmpfiles --create
-	elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
-	    ${sysconfdir}/init.d/populate-volatile.sh update
-	fi
-    fi
-}
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
new file mode 100644
index 0000000..580dabe
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.3.bb
@@ -0,0 +1,107 @@
+SUMMARY = "Very Secure FTP server"
+HOMEPAGE = "https://security.appspot.com/vsftpd.html"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271"
+
+DEPENDS = "libcap openssl"
+
+SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
+           file://makefile-destdir.patch \
+           file://makefile-libs.patch \
+           file://makefile-strip.patch \
+           file://init \
+           file://vsftpd.conf \
+           file://vsftpd.user_list \
+           file://vsftpd.ftpusers \
+           file://change-secure_chroot_dir.patch \
+           file://volatiles.99_vsftpd \
+           file://vsftpd.service \
+           file://vsftpd-2.1.0-filter.patch \
+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
+                        file://COPYRIGHT;md5=04251b2eb0f298dae376d92454f6f72e \
+                        file://LICENSE;md5=654df2042d44b8cac8a5654fc5be63eb"
+SRC_URI[md5sum] = "da119d084bd3f98664636ea05b5bb398"
+SRC_URI[sha256sum] = "9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7"
+
+
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
+SRC_URI +="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://vsftpd-tcp_wrappers-support.patch', '', d)}"
+
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
+RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-listfile', '', d)}"
+PAMLIB = "${@base_contains('DISTRO_FEATURES', 'pam', '-L${STAGING_BASELIBDIR} -lpam', '', d)}"
+NOPAM_SRC ="${@base_contains('PACKAGECONFIG', 'tcp-wrappers', 'file://nopam-with-tcp_wrappers.patch', 'file://nopam.patch', d)}"
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '', '${NOPAM_SRC}', d)}"
+
+inherit update-rc.d useradd systemd
+
+CONFFILES_${PN} = "${sysconfdir}/vsftpd.conf"
+LDFLAGS_append =" -lcrypt -lcap"
+
+do_configure() {
+    # Fix hardcoded /usr, /etc, /var mess.
+    cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g \
+    |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
+    mv tunables.c.new tunables.c
+}
+
+do_compile() {
+   oe_runmake "LIBS=-L${STAGING_LIBDIR} -lcrypt -lcap ${PAMLIB} -lwrap"
+}
+
+do_install() {
+    install -d ${D}${sbindir}
+    install -d ${D}${mandir}/man8
+    install -d ${D}${mandir}/man5
+    oe_runmake 'DESTDIR=${D}' install
+    install -d ${D}${sysconfdir}
+    install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
+    install -d ${D}/${sysconfdir}/default/volatiles
+    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
+
+    install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
+    install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
+    if ! test -z "${PAMLIB}" ; then
+        install -d ${D}${sysconfdir}/pam.d/
+        cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
+        sed -i "s:/lib/security:${base_libdir}/security:" ${D}${sysconfdir}/pam.d/vsftpd
+        sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
+    fi
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/tmpfiles.d
+        echo "d /var/run/vsftpd/empty 0755 root root -" \
+        > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
+    fi
+
+    # Install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/vsftpd.service ${D}${systemd_unitdir}/system
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/vsftpd.service
+}
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "vsftpd"
+INITSCRIPT_PARAMS_${PN} = "defaults 80"
+
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM_${PN} = "--system --home-dir /var/lib/ftp --no-create-home -g ftp \
+                       --shell /bin/false ftp "
+GROUPADD_PARAM_${PN} = "-r ftp"
+
+SYSTEMD_SERVICE_${PN} = "vsftpd.service"
+
+pkg_postinst_${PN}() {
+    if [ -z "$D" ]; then
+	if type systemd-tmpfiles >/dev/null; then
+	    systemd-tmpfiles --create
+	elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+	    ${sysconfdir}/init.d/populate-volatile.sh update
+	fi
+    fi
+}
-- 
1.8.4.2


