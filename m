Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P8j42-0006G3-Cl
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 02:31:45 +0200
Received: by pxi18 with SMTP id 18so1076548pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 17:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=fekh3sMaIp/+XY77JwxyOicT+Vk7zp8CKaLJh8G2aww=;
	b=ERkg2lDmu7cqORIdUflTQVN2NK0W6O1ydfetwpFYejvIbXF/KUtBzv9q1HJz21B8sK
	ijyWyiApK3neKCu9KMrOP5VZ3Ixyr/CRvL88FGIKxL5dRcELqz2x94ZTAUm1okpfxgMr
	EOKEZBV84nhafV6gWhMi4PWZHhYeJwCzn0Z6c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=mXNvHDULWSotugD1JYzeGVk0KmTlFzFnQ1wTBaq7I2mvdaNuynuyppBBnHlbzh6IWR
	LBangZCvxjE2wTGaHJX19yx15JVQiA89Zbfl5P8IT/w9KL/ihFEdfItSXE78OE/gTXZh
	gbPvcwzV3S2j/7NH44xAjTZbevRQNcjEykL1U=
Received: by 10.142.109.16 with SMTP id h16mr140272wfc.166.1287621049626;
	Wed, 20 Oct 2010 17:30:49 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id p8sm1284783wff.16.2010.10.20.17.30.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 Oct 2010 17:30:48 -0700 (PDT)
Message-ID: <4CBF89B4.8020601@gmail.com>
Date: Thu, 21 Oct 2010 11:00:44 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] siteinfo.bbclass, mips64: Clone mips-common to mips64-common.
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
X-List-Received-Date: Thu, 21 Oct 2010 00:31:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Orbit has alignment of long = 4 bytes, which is only true of 32 bit mips.
Rename mip64el-linux to mips64el-linux while here.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 classes/siteinfo.bbclass |    4 +-
 site/mip64el-linux       |  120 ----------------------------------------------
 site/mips64-common       |   31 ++++++++++++
 site/mips64el-linux      |  120 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 153 insertions(+), 122 deletions(-)
 delete mode 100644 site/mip64el-linux
 create mode 100644 site/mips64-common
 create mode 100644 site/mips64el-linux

diff --git a/classes/siteinfo.bbclass b/classes/siteinfo.bbclass
index 2ce0f71..bb0ed1f 100644
--- a/classes/siteinfo.bbclass
+++ b/classes/siteinfo.bbclass
@@ -27,8 +27,8 @@ def siteinfo_data(d):
         "i686": "endian-little bit-32 ix86-common",
         "ia64": "endian-little bit-64",
         "mips": "endian-big bit-32 mips-common",
-        "mips64": "endian-big bit-64 mips-common",
-        "mips64el": "endian-little bit-64 mips-common",
+        "mips64": "endian-big bit-64 mips64-common",
+        "mips64el": "endian-little bit-64 mips64-common",
         "mipsel": "endian-little bit-32 mips-common",
         "powerpc": "endian-big bit-32 powerpc-common",
         "nios2": "endian-little bit-32 nios2-common",
diff --git a/site/mip64el-linux b/site/mip64el-linux
deleted file mode 100644
index 61932d1..0000000
--- a/site/mip64el-linux
+++ /dev/null
@@ -1,120 +0,0 @@
-
-ac_cv_func_getpgrp_void=${ac_cv_func_getpgrp_void=yes}
-ac_cv_func_setvbuf_reversed=${ac_cv_func_setvbuf_reversed=no}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-
-# tslib, others
-ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
-
-# mysql
-ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
-ac_cv_conv_longlong_to_float=${ac_cv_conv_longlong_to_float=yes}
-
-# bash
-ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-
-# openssh
-ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
-ac_cv_have_broken_snprintf=${ac_cv_have_broken_snprintf=no}
-ac_cv_have_control_in_msghdr=${ac_cv_have_control_in_msghdr=yes}
-ac_cv_have_openpty_ctty_bug=${ac_cv_have_openpty_ctty_bug=no}
-ac_cv_have_space_d_name_in_struct_dirent=${ac_cv_have_space_d_name_in_struct_dirent=yes}
-
-# fget
-compat_cv_func_snprintf_works=${compat_cv_func_snprintf_works=yes}
-
-# glib
-glib_cv___va_copy=${glib_cv___va_copy=yes}
-glib_cv_has__inline=${glib_cv_has__inline=yes}
-glib_cv_has__inline__=${glib_cv_has__inline__=yes}
-glib_cv_hasinline=${glib_cv_hasinline=yes}
-glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_rtldglobal_broken=${glib_cv_rtldglobal_broken=no}
-glib_cv_sane_realloc=${glib_cv_sane_realloc=yes}
-glib_cv_sizeof_gmutex=${glib_cv_sizeof_gmutex=24}
-glib_cv_sizeof_system_thread=${glib_cv_sizeof_system_thread=4}
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-glib_cv_uscore=${glib_cv_uscore=no}
-glib_cv_va_copy=${glib_cv_va_copy=yes}
-glib_cv_va_val_copy=${glib_cv_va_val_copy=yes}
-
-# glib-2.0
-glib_cv_stack_grows=${glib_cv_stack_grows=no}
-utils_cv_sys_open_max=${utils_cv_sys_open_max=1015}
-ac_cv_func_posix_getpwuid_r=${ac_cv_func_posix_getpwuid_r=yes}
-glib_cv_use_pid_surrogate=${glib_cv_use_pid_surrogate=yes}
-ac_cv_func_posix_getgrgid_r=${ac_cv_func_posix_getgrgid_r=yes}
-
-# libpcap
-ac_cv_linux_vers=${ac_cv_linux_vers=2}
-ac_cv_func_getaddrinfo=${ac_cv_func_getaddrinfo=yes}
-
-# slrn
-slrn_cv___va_copy=${slrn_cv___va_copy=yes}
-slrn_cv_va_copy=${slrn_cv_va_copy=yes}
-slrn_cv_va_val_copy=${slrn_cv_va_val_copy=yes}
-
-# startup-notification
-lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-
-# libidl
-libIDL_cv_long_long_format=${libIDL_cv_long_long_format=ll}
-
-# ncftp
-ac_cv_func_setpgrp_void=${ac_cv_func_setpgrp_void=yes}
-wi_cv_struct_timeval_tv_sec=${wi_cv_struct_timeval_tv_sec=long}
-wi_cv_struct_timeval_tv_usec=${wi_cv_struct_timeval_tv_usec=long}
-wi_cv_unix_domain_sockets=${wi_cv_unix_domain_sockets=yes}
-
-# rp-pppoe
-rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}
-
-# db3
-db_cv_align_t=${db_cv_align_t='unsigned long long'}
-db_cv_alignp_t=${db_cv_alignp_t='unsigned long'}
-db_cv_mutex=${db_cv_mutex=POSIX/pthreads/library}
-db_cv_posixmutexes=${db_cv_posixmutexes=no}
-db_cv_uimutexes=${db_cv_uimutexes=no}
-db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-db_cv_sprintf_count=${db_cv_sprintf_count=yes}
-db_cv_path_ar=${db_cv_path_ar=/usr/bin/ar}
-db_cv_path_chmod=${db_cv_path_chmod=/bin/chmod}
-db_cv_path_cp=${db_cv_path_cp=/bin/cp}
-db_cv_path_ln=${db_cv_path_ln=/bin/ln}
-db_cv_path_mkdir=${db_cv_path_mkdir=/bin/mkdir}
-db_cv_path_ranlib=${db_cv_path_ranlib=/usr/bin/ranlib}
-db_cv_path_rm=${db_cv_path_rm=/bin/rm}
-db_cv_path_sh=${db_cv_path_sh=/bin/sh}
-db_cv_path_strip=${db_cv_path_strip=/usr/bin/strip}
-
-# rrdtool
-rd_cv_ieee_works=${rd_cv_ieee_works=yes}
-# ac_cv_path_PERL=${ac_cv_path_PERL=no}
-
-# gettext
-am_cv_func_working_getline=${am_cv_func_working_getline=yes}
-
-# samba
-samba_cv_HAVE_GETTIMEOFDAY_TZ=${samba_cv_HAVE_GETTIMEOFDAY_TZ=yes}
-
-# vim
-ac_cv_sizeof_int=${ac_cv_sizeof_int=4}
-
-# sudo
-sudo_cv_uid_t_len=${sudo_cv_uid_t_len=10}
-
-# intercom
-ac_cv_func_fnmatch_works=${ac_cv_func_fnmatch_works=yes}
-
-#lmbench
-ac_cv_uint=${ac_cv_unit=yes}
-
-# D-BUS
-ac_cv_func_posix_getpwnam_r=${ac_cv_func_posix_getpwnam_r=yes}
-
-# mono
-cv_mono_sizeof_sunpath=108
-mono_cv_sizeof_sunpath=108
-mono_cv_uscore=${mono_cv_uscore=no}
-
diff --git a/site/mips64-common b/site/mips64-common
new file mode 100644
index 0000000..5001ecd
--- /dev/null
+++ b/site/mips64-common
@@ -0,0 +1,31 @@
+ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
+
+# cvs
+cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
+
+# screen
+screen_cv_sys_bcopy_overlap=${screen_cv_sys_bcopy_overlap=no}
+screen_cv_sys_memcpy_overlap=${screen_cv_sys_memcpy_overlap=no}
+screen_cv_sys_memmove_overlap=${screen_cv_sys_memmove_overlap=no}
+screen_cv_sys_fifo_broken_impl=${screen_cv_sys_fifo_broken_impl=yes}
+screen_cv_sys_fifo_usable=${screen_cv_sys_fifo_usable=yes}
+screen_cv_sys_select_broken_retval=${screen_cv_sys_select_broken_retval=no}
+screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
+screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
+screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
+
+# ORBit2
+ac_cv_alignof_CORBA_octet=1
+ac_cv_alignof_CORBA_boolean=1
+ac_cv_alignof_CORBA_char=1
+ac_cv_alignof_CORBA_wchar=2
+ac_cv_alignof_CORBA_short=2
+ac_cv_alignof_CORBA_long=8
+ac_cv_alignof_CORBA_long_long=8
+ac_cv_alignof_CORBA_float=4
+ac_cv_alignof_CORBA_double=8
+ac_cv_alignof_CORBA_long_double=8
+ac_cv_alignof_CORBA_pointer=4
+ac_cv_alignof_CORBA_struct=1
+
diff --git a/site/mips64el-linux b/site/mips64el-linux
new file mode 100644
index 0000000..61932d1
--- /dev/null
+++ b/site/mips64el-linux
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
-- 
1.7.1



