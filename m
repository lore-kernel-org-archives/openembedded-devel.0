Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPsJ-0000ZS-FV
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:46:46 +0100
Received: by ewy24 with SMTP id 24so4866261ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=uZJL/81UyWZ3gaFn8WBPJZEukrD+8jGQ5u4xRHR3CNc=;
	b=mlhUYMm4ScTxq1H74amuwE+GtFpjswWFqmMm2O54ZYLOXuq+CJfqDl4OJFxnocbAhU
	QcX/vd+Q/mOgv/+epcWLAIjQTL/xEfdnXsMVXEI3wu3EiYvnb5Y95cpWve34GLeB8LRR
	HWFkaQZ68xwYDjtCOSUZIFGVqnf5GZEminjMY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=puKa7ESESgxm0sv5Jo/tnV+jRjftUZ3zZhIfpWtM48Gz+4/pfv4PJmsSkghRspwaIz
	FKCWOGQ3ehQeItfoy6oKDuGnwta3LCqZyDVwLOgls9U+6FJKqgFEiIqyg1H4WtrAnwKf
	R12nae/dWn78swzYCONTigrjuYsEU/QuA2Zn8=
Received: by 10.213.102.66 with SMTP id f2mr6306389ebo.12.1260139504648;
	Sun, 06 Dec 2009 14:45:04 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 15sm3113864ewy.12.2009.12.06.14.45.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Dec 2009 14:45:04 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Dec 2009 23:44:39 +0100
Message-Id: <1260139496-21442-4-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
In-Reply-To: <1260139496-21442-3-git-send-email-leon@sidebranch.com>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>
	<1260139496-21442-2-git-send-email-leon@sidebranch.com>
	<1260139496-21442-3-git-send-email-leon@sidebranch.com>
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] site/nios2-linux-uclibc: Configure site file for MMU-less nios2.
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
X-List-Received-Date: Sun, 06 Dec 2009 22:46:46 -0000

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 site/nios2-linux-uclibc |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 site/nios2-linux-uclibc

diff --git a/site/nios2-linux-uclibc b/site/nios2-linux-uclibc
new file mode 100644
index 0000000..3f3f516
--- /dev/null
+++ b/site/nios2-linux-uclibc
@@ -0,0 +1,31 @@
+ac_cv_func_getpgrp_void=yes
+ac_cv_func_setpgrp_void=yes
+ac_cv_func_setgrent_void=yes
+ac_cv_func_malloc_0_nonnull=yes
+ac_cv_func_malloc_works=yes
+
+# these are already in common-uclibc
+#ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+#ac_cv_func_posix_getgrgid_r=${ac_cv_func_getgrgid_r=yes}
+
+ac_cv_func_setvbuf_reversed=no
+ac_cv_sizeof___int64=${ac_cv_sizeof___int64=0}
+ac_cv_sizeof_char=${ac_cv_sizeof_char=1}
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+ac_cv_sizeof_long=${ac_cv_sizeof_long=4}
+ac_cv_sizeof_long_int=${ac_cv_sizeof_long_int=4}
+ac_cv_sizeof_long_long=${ac_cv_sizeof_long_long=8}
+ac_cv_sizeof_short=${ac_cv_sizeof_short=2}
+ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
+ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=4}
+ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=4}
+ac_cv_sizeof_long_double=${ac_cv_sizeof_long_double=8}
+
+ac_cv_sys_restartable_syscalls=yes
+ac_cv_uchar=${ac_cv_uchar=no}
+ac_cv_uint=${ac_cv_uint=yes}
+ac_cv_ulong=${ac_cv_ulong=yes}
+ac_cv_ushort=${ac_cv_ushort=yes}
+
+ac_cv_time_r_type=${ac_cv_time_r_type=POSIX}
+
-- 
1.6.0.4



