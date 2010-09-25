Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OzdvQ-0006vU-C5
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 01:13:09 +0200
Received: by pxi11 with SMTP id 11so1118058pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Sep 2010 16:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=NZKCfNhwhVK/Qpl2HIMu4M74jpq37jksfSGk66e6XBU=;
	b=Op2GZNiKYvcgxyAMLkgx0XPbvnBD7aaa2pUc7Y58FlfCoEd0Uir5YnqltA3uTfEdKP
	f8l3xTQuWaFH904ZBP1nRgFlVTxCzZ6YYhxLnyys7Ga6egxmRK4HJTnaR38BDJFxeNdK
	BvNrRaCsPvsZgKFF0Q8SxqTQ/jaxJs8hoc4Tk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xdzVWS7zvPN+otjPDylENbEWWWfNsMH+1sug2LvrcL/2oZcz+CS49TNrjSnrD3r4+f
	iLUeBSPwUkt+RizSeW56imZGZWgd0fyKXPyPai6oizPuB3q5GvvItSc51A/bCpc9jKuB
	Z8Uc7C6pd5YKKc/ETgHLjkX/He5nNb8DS4k04=
Received: by 10.114.75.16 with SMTP id x16mr5880425waa.189.1285456370926;
	Sat, 25 Sep 2010 16:12:50 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r37sm6791851wak.23.2010.09.25.16.12.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 25 Sep 2010 16:12:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Sep 2010 16:12:24 -0700
Message-Id: <1285456353-27457-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
References: <1285456353-27457-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 03/12] siteinfo.bbclass, site/: Add mips64/mips64el to siteinfo data
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
X-List-Received-Date: Sat, 25 Sep 2010 23:13:11 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/siteinfo.bbclass   |    2 +
 site/mip64el-linux         |  120 ++++++++++++++++++++++++++++++++++++++++++
 site/mips64-linux          |  116 +++++++++++++++++++++++++++++++++++++++++
 site/mips64-linux-uclibc   |  116 +++++++++++++++++++++++++++++++++++++++++
 site/mips64el-linux-uclibc |  124 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 478 insertions(+), 0 deletions(-)
 create mode 100644 site/mip64el-linux
 create mode 100644 site/mips64-linux
 create mode 100644 site/mips64-linux-uclibc
 create mode 100644 site/mips64el-linux-uclibc

diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index 0122bdb..2ce0f71 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -27,6 +27,8 @@ def siteinfo_data(d):
         "i686": "endian-little bit-32 ix86-common",
         "ia64": "endian-little bit-64",
         "mips": "endian-big bit-32 mips-common",
+        "mips64": "endian-big bit-64 mips-common",
+        "mips64el": "endian-little bit-64 mips-common",
         "mipsel": "endian-little bit-32 mips-common",
         "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
diff --git a/site/mip64el-linux b/site/mip64el-linux
new file mode 100644
index 0000000..61932d1
--- /dev/null
+++ b/site/mip64el-linux
@@ -0,0 +1,120 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# mysql
+ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
+ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# db3
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# sudo
+sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+#lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# mono
+cv_mono_sizeof_sunpath=108
+mono_cv_sizeof_sunpath=108
+mono_cv_uscore=${mono_cv_uscore=no}
+
diff --git a/site/mips64-linux b/site/mips64-linux
new file mode 100644
index 0000000..4f1297a
--- /dev/null
+++ b/site/mips64-linux
@@ -0,0 +1,116 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# db3
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# sudo
+sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+# lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# mono
+cv_mono_sizeof_sunpath=108
+mono_cv_sizeof_sunpath=108
+mono_cv_uscore=${mono_cv_uscore=no}
+
diff --git a/site/mips64-linux-uclibc b/site/mips64-linux-uclibc
new file mode 100644
index 0000000..4f1297a
--- /dev/null
+++ b/site/mips64-linux-uclibc
@@ -0,0 +1,116 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
+ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
+
+# db3
+db_cv_align_t=${db_cv_align_t='unsigned long long'}
+db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
+db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
+db_cv_posixmutexes=${db_cv_posixmutexes=no}
+db_cv_uimutexes=${db_cv_uimutexes=no}
+db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
+db_cv_sprintf_count=${db_cv_sprintf_count=yes}
+db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
+db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
+db_cv_path_cp=${db_cv_path_cp=/bin/cp}
+db_cv_path_ln=${db_cv_path_ln=/bin/ln}
+db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
+db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
+db_cv_path_rm=${db_cv_path_rm=/bin/rm}
+db_cv_path_sh=${db_cv_path_sh=/bin/sh}
+db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
+
+# rrdtool
+rd_cv_ieee_works=${rd_cv_ieee_works=yes}
+# ac_cv_path_PERL=${ac_cv_path_PERL=no}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# sudo
+sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
+
+# intercom
+ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
+
+# lmbench
+ac_cv_uint=${ac_cv_unit=yes}
+
+# D-BUS
+ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
+
+# mono
+cv_mono_sizeof_sunpath=108
+mono_cv_sizeof_sunpath=108
+mono_cv_uscore=${mono_cv_uscore=no}
+
diff --git a/site/mips64el-linux-uclibc b/site/mips64el-linux-uclibc
new file mode 100644
index 0000000..c0c4648
--- /dev/null
+++ b/site/mips64el-linux-uclibc
@@ -0,0 +1,124 @@
+
+ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
+ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
+ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
+
+# tslib, others
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# mysql
+ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
+ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
+
+# bash
+ac_cv_c_long_double=${ac_cv_c_long_double=no}
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# openssh
+ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
+ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
+ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
+ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
+ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
+
+# fget
+compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
+
+# glib
+glib_cv___va_copy=${glib_cv___va_copy=yes}
+glib_cv_has__inline=${glib_cv_has__inline=yes}
+glib_cv_has__inline__=${glib_cv_has__inline__=yes}
+glib_cv_hasinline=${glib_cv_hasinline=yes}
+glib_cv_long_long_format=${glib_cv_long_long_format=ll}
+glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
+glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
+glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
+glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+glib_cv_va_copy=${glib_cv_va_copy=yes}
+glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
+
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
+ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
+
+# slrn
+slrn_cv___va_copy=${slrn_cv___va_copy=yes}
+slrn_cv_va_copy=${slrn_cv_va_copy=yes}
+slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
+
+# libidl
+libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
+
+# ncftp
+ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
+wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
+wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
+wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
+
+# gettext
+am_cv_func_working_getline=${am_cv_func_working_getline=yes}
+
+# samba
+# from samba 3.0.14a on 5/29/2005
+ac_cv_func_memcmp_working=${ac_cv_func_memcmp_working=yes}
+ac_cv_have_asprintf_decl=${ac_cv_have_asprintf_decl=yes}
+ac_cv_have_setresgid_decl=${ac_cv_have_setresgid_decl=yes}
+ac_cv_have_setresuid_decl=${ac_cv_have_setresuid_decl=yes}
+ac_cv_have_vasprintf_decl=${ac_cv_have_vasprintf_decl=yes}
+fu_cv_sys_stat_statvfs64=${fu_cv_sys_stat_statvfs64=yes}
+samba_cv_FTRUNCATE_NEEDS_ROOT=${samba_cv_FTRUNCATE_NEEDS_ROOT=no}
+samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=${samba_cv_HAVE_BROKEN_FCNTL64_LOCKS=no}
+samba_cv_HAVE_BROKEN_GETGROUPS=${samba_cv_HAVE_BROKEN_GETGROUPS=no}
+samba_cv_HAVE_BROKEN_READDIR=${samba_cv_HAVE_BROKEN_READDIR=no}
+samba_cv_HAVE_C99_VSNPRINTF=${samba_cv_HAVE_C99_VSNPRINTF=yes}
+samba_cv_HAVE_DEV64_T=${samba_cv_HAVE_DEV64_T=no}
+samba_cv_HAVE_DEVICE_MAJOR_FN=${samba_cv_HAVE_DEVICE_MAJOR_FN=yes}
+samba_cv_HAVE_DEVICE_MINOR_FN=${samba_cv_HAVE_DEVICE_MINOR_FN=yes}
+samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=${samba_cv_HAVE_EXPLICIT_LARGEFILE_SUPPORT=yes}
+samba_cv_HAVE_FCNTL_LOCK=${samba_cv_HAVE_FCNTL_LOCK=yes}
+samba_cv_HAVE_FTRUNCATE_EXTEND=${samba_cv_HAVE_FTRUNCATE_EXTEND=yes}
+samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
+samba_cv_HAVE_INO64_T=${samba_cv_HAVE_INO64_T=no}
+samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=${samba_cv_HAVE_KERNEL_CHANGE_NOTIFY=yes}
+samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=${samba_cv_HAVE_KERNEL_OPLOCKS_LINUX=yes}
+samba_cv_HAVE_KERNEL_SHARE_MODES=${samba_cv_HAVE_KERNEL_SHARE_MODES=yes}
+samba_cv_HAVE_MAKEDEV=${samba_cv_HAVE_MAKEDEV=yes}
+samba_cv_HAVE_MMAP=${samba_cv_HAVE_MMAP=yes}
+samba_cv_HAVE_OFF64_T=${samba_cv_HAVE_OFF64_T=no}
+samba_cv_HAVE_QUOTACTL_4A=${samba_cv_HAVE_QUOTACTL_4A=yes}
+samba_cv_HAVE_ROOT=${samba_cv_HAVE_ROOT=no}
+samba_cv_HAVE_SECURE_MKSTEMP=${samba_cv_HAVE_SECURE_MKSTEMP=yes}
+samba_cv_HAVE_SENDFILE64=${samba_cv_HAVE_SENDFILE64=yes}
+samba_cv_HAVE_STRUCT_DIRENT64=${samba_cv_HAVE_STRUCT_DIRENT64=yes}
+samba_cv_HAVE_STRUCT_FLOCK64=${samba_cv_HAVE_STRUCT_FLOCK64=yes}
+samba_cv_HAVE_TRUNCATED_SALT=${samba_cv_HAVE_TRUNCATED_SALT=no}
+samba_cv_HAVE_UNSIGNED_CHAR=${samba_cv_HAVE_UNSIGNED_CHAR=no}
+samba_cv_HAVE_WORKING_AF_LOCAL=${samba_cv_HAVE_WORKING_AF_LOCAL=no}
+samba_cv_HAVE_Werror=${samba_cv_HAVE_Werror=yes}
+samba_cv_REALPATH_TAKES_NULL=${samba_cv_REALPATH_TAKES_NULL=no}
+samba_cv_REPLACE_INET_NTOA=${samba_cv_REPLACE_INET_NTOA=no}
+samba_cv_SIZEOF_INO_T=${samba_cv_SIZEOF_INO_T=yes}
+samba_cv_SIZEOF_OFF_T=${samba_cv_SIZEOF_OFF_T=yes}
+samba_cv_SYSCONF_SC_NGROUPS_MAX=${samba_cv_SYSCONF_SC_NGROUPS_MAX=yes}
+samba_cv_SYSCONF_SC_NPROC_ONLN=${samba_cv_SYSCONF_SC_NPROC_ONLN=no}
+samba_cv_SYSQUOTA_FOUND=${samba_cv_SYSQUOTA_FOUND=yes}
+samba_cv_SYSQUOTA_WORKS=${samba_cv_SYSQUOTA_WORKS=yes}
+samba_cv_USE_SETRESUID=${samba_cv_USE_SETRESUID=yes}
+samba_cv_have_longlong=${samba_cv_have_longlong=yes}
+samba_cv_have_setresgid=${samba_cv_have_setresgid=yes}
+samba_cv_have_setresuid=${samba_cv_have_setresuid=yes}
+samba_cv_sysquotas_file=${samba_cv_sysquotas_file=lib/sysquotas_4A.c}
+# This cached value needs a local patch to pick it up, upstream 3.0.14a
+# doesn't cache it.
+samba_cv_LINUX_LFS_SUPPORT=${samba_cv_LINUX_LFS_SUPPORT=yes}
+
+# vim
+ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
+
+# rp-pppoe
+rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-- 
1.7.0.4



