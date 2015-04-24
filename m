Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56E7F73D0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 01:36:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O1aojs022101
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Apr 2015 18:36:50 -0700 (PDT)
Received: from lirq-OptiPlex-780.wrs.com (128.224.162.139) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Thu, 23 Apr 2015 18:36:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Fri, 24 Apr 2015 09:36:48 +0800
Message-ID: <1429839408-7774-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] vsftpd: fix the CVE-2015-1419
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
X-List-Received-Date: Fri, 24 Apr 2015 01:36:53 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Taken Patch from fedora to fix CVE-2015-1419, deny_file parsing to do
more what is expected.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch  | 77 ++++++++++++++++++++++
 .../recipes-daemons/vsftpd/vsftpd_3.0.2.bb         |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch

diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch
new file mode 100644
index 0000000..32f7e82
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd-3.0.2/vsftpd-2.1.0-filter.patch
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
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
index e4d65ee..fbeca9b 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.2.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://change-secure_chroot_dir.patch \
            file://volatiles.99_vsftpd \
            file://vsftpd.service \
+           file://vsftpd-2.1.0-filter.patch \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
-- 
2.1.0


