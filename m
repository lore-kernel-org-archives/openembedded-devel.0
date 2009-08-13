Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1Mbc3X-0001Jt-Ek
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 17:17:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2DCA9537A88;
	Thu, 13 Aug 2009 11:00:52 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13434-07-2; Thu, 13 Aug 2009 11:00:52 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id D6ABD4CE58F; Thu, 13 Aug 2009 11:00:47 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 31B6753A52E;
	Thu, 13 Aug 2009 11:00:44 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 2FD1241A96; Thu, 13 Aug 2009 11:00:44 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Aug 2009 11:00:38 -0400
Message-Id: <1250175641-4869-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 1/4] site/x86_64-linux: Add some vars from ix86-common
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
X-List-Received-Date: Thu, 13 Aug 2009 15:17:31 -0000

ix86-common had a few updates in the past couple of years; bring
them to x86_64.

Some of these could probably be moved to common-glibc.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 site/x86_64-linux |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/site/x86_64-linux b/site/x86_64-linux
index 3c47a56..83d1511 100644
--- a/site/x86_64-linux
+++ b/site/x86_64-linux
@@ -42,6 +42,8 @@ db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
 db_cv_posixmutexes=${db_cv_posixmutexes=no}
 db_cv_sprintf_count=${db_cv_sprintf_count=yes}
 db_cv_uimutexes=${db_cv_uimutexes=no}
+
+# glib
 glib_cv_hasinline=${glib_cv_hasinline=yes}
 glib_cv_has__inline=${glib_cv_has__inline=yes}
 glib_cv_has__inline__=${glib_cv_has__inline__=yes}
@@ -61,6 +63,8 @@ glib_cv_uscore=${glib_cv_uscore=no}
 glib_cv___va_copy=${glib_cv___va_copy=yes}
 glib_cv_va_copy=${glib_cv_va_copy=yes}
 glib_cv_va_val_copy=${glib_cv_va_val_copy=no}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
 lftp_cv_va_copy=${lftp_cv_va_copy=yes}
 nano_cv_func_regexec_segv_emptystr=${nano_cv_func_regexec_segv_emptystr=no}
 samba_cv_HAVE_VA_COPY=${samba_cv_HAVE_VA_COPY=yes}
@@ -80,3 +84,12 @@ am_cv_func_working_getline=${am_cv_func_working_getline=yes}
 
 #gcc
 ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
+
+# eds-dbus
+ac_cv_libiconv_utf8=${ac_cv_libiconv_utf8=yes}
+
+#dbus
+ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
+
+# p3scan / quagga
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
-- 
1.6.3



