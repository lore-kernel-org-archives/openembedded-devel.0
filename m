Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MdArj-0007OP-Rh
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 00:39:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id D8F0853BA0E;
	Mon, 17 Aug 2009 18:22:47 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14416-08; Mon, 17 Aug 2009 18:22:47 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id B4EAB53BB07; Mon, 17 Aug 2009 18:22:47 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 3B9684FCEC1;
	Mon, 17 Aug 2009 18:22:44 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 32646A0C0D6; Mon, 17 Aug 2009 18:22:44 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 18:22:42 -0400
Message-Id: <1250547762-18690-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] site/common-linux: centralize bash configure vars
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
X-List-Received-Date: Mon, 17 Aug 2009 22:39:48 -0000

If the other site files are accurate, almost all of the bash vars
are universal across Linux.

Did this to fix bash on x86_64. Also bump bash PRs to help track
breakage later.

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/bash/bash_3.0.bb |    2 +-
 recipes/bash/bash_3.2.bb |    2 +-
 site/arm-common          |   14 --------------
 site/avr32-common        |    3 ---
 site/common-linux        |   15 +++++++++++++++
 site/ix86-common         |   14 --------------
 site/mips-linux          |   14 --------------
 site/mipsel-linux        |   14 --------------
 site/mipsel-linux-uclibc |   14 --------------
 site/powerpc-common      |   14 --------------
 site/sh-common           |   14 --------------
 site/sparc-linux         |    3 ---
 site/x86_64-linux        |    4 +++-
 site/x86_64-linux-uclibc |    1 -
 14 files changed, 20 insertions(+), 108 deletions(-)

diff --git a/recipes/bash/bash_3.0.bb b/recipes/bash/bash_3.0.bb
index e23887a..8165d07 100644
--- a/recipes/bash/bash_3.0.bb
+++ b/recipes/bash/bash_3.0.bb
@@ -1,5 +1,5 @@
 require bash.inc
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "\
   file://bash-3.0-fixes.patch;patch=1 \
diff --git a/recipes/bash/bash_3.2.bb b/recipes/bash/bash_3.2.bb
index 6a48a4b..e175467 100644
--- a/recipes/bash/bash_3.2.bb
+++ b/recipes/bash/bash_3.2.bb
@@ -1,6 +1,6 @@
 require bash.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "\
            file://builtins.patch;patch=1 \
diff --git a/site/arm-common b/site/arm-common
index 5d3e68a..39eb30b 100644
--- a/site/arm-common
+++ b/site/arm-common
@@ -14,21 +14,7 @@ apr_cv_tcp_nodelay_with_cork=${apr_cv_tcp_nodelay_with_cork=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # coreutils
 utils_cv_sys_open_max=${utils_cv_sys_open_max=1019}
diff --git a/site/avr32-common b/site/avr32-common
index 2d26a3a..fedd104 100644
--- a/site/avr32-common
+++ b/site/avr32-common
@@ -16,9 +16,6 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 #gstreamer
 as_cv_unaligned_access=${as_cv_unaligned_access=no}
 
-#readline
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
-
 #libpcap
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
 
diff --git a/site/common-linux b/site/common-linux
index 8d915d0..ffb209b 100644
--- a/site/common-linux
+++ b/site/common-linux
@@ -10,3 +10,18 @@ samba_cv_HAVE_IRIX_SPECIFIC_CAPABILITIES=${samba_cv_HAVE_IRIX_SPECIFIC_CAPABILIT
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
 
+# bash
+bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
+bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
+bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
+bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
+bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
+bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
+bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
+bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
+bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
+bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
+bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
+bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
+bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
+bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
diff --git a/site/ix86-common b/site/ix86-common
index a5c4b60..de637ec 100644
--- a/site/ix86-common
+++ b/site/ix86-common
@@ -55,21 +55,7 @@ ac_cv_file_lib_src_libmad_frame_h=${ac_cv_file_lib_src_libmad_frame_h=no}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # clamav
 clamav_av_func_working_snprintf_long=${clamav_av_func_working_snprintf_long=yes}
diff --git a/site/mips-linux b/site/mips-linux
index 11c6033..43f4aef 100644
--- a/site/mips-linux
+++ b/site/mips-linux
@@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
diff --git a/site/mipsel-linux b/site/mipsel-linux
index 06602ca..4685c75 100644
--- a/site/mipsel-linux
+++ b/site/mipsel-linux
@@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
diff --git a/site/mipsel-linux-uclibc b/site/mipsel-linux-uclibc
index 9545fea..25fa8b5 100644
--- a/site/mipsel-linux-uclibc
+++ b/site/mipsel-linux-uclibc
@@ -8,21 +8,7 @@ ac_cv_func_malloc_0_nonnull=${ac_cv_func_malloc_0_nonnull=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_accrights_in_msghdr=${ac_cv_have_accrights_in_msghdr=no}
diff --git a/site/powerpc-common b/site/powerpc-common
index cc523bc..f5acef8 100644
--- a/site/powerpc-common
+++ b/site/powerpc-common
@@ -208,21 +208,7 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # openssh
 ac_cv_have_broken_dirname=${ac_cv_have_broken_dirname='yes'}
diff --git a/site/sh-common b/site/sh-common
index a9ccf2f..02ea89d 100644
--- a/site/sh-common
+++ b/site/sh-common
@@ -223,21 +223,7 @@ cvs_cv_func_printf_ptr=${cvs_cv_func_printf_ptr=yes}
 
 # bash
 ac_cv_c_long_double=${ac_cv_c_long_double=yes}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=missing}
-bash_cv_must_reinstall_sighandlers=${bash_cv_must_reinstall_sighandlers=no}
-bash_cv_func_strcoll_broken=${bash_cv_func_strcoll_broken=no}
-bash_cv_dup2_broken=${bash_cv_dup2_broken=no}
-bash_cv_opendir_not_robust=${bash_cv_opendir_not_robust=no}
-bash_cv_type_rlimit=${bash_cv_type_rlimit=rlim_t}
-bash_cv_getenv_redef=${bash_cv_getenv_redef=yes}
-bash_cv_ulimit_maxfds=${bash_cv_ulimit_maxfds=yes}
-bash_cv_getcwd_calls_popen=${bash_cv_getcwd_calls_popen=no}
-bash_cv_printf_a_format=${bash_cv_printf_a_format=yes}
-bash_cv_pgrp_pipe=${bash_cv_pgrp_pipe=no}
-bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
-bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
-bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
 # mono
 cv_mono_sizeof_sunpath=108
diff --git a/site/sparc-linux b/site/sparc-linux
index 491dc74..ea6386b 100644
--- a/site/sparc-linux
+++ b/site/sparc-linux
@@ -53,6 +53,3 @@ glib_cv_stack_grows=${glib_cv_stack_grows=no}
 
 #linux
 ac_cv_linux_vers=${ac_cv_linux_vers=2}
-
-#bash
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
diff --git a/site/x86_64-linux b/site/x86_64-linux
index 83d1511..9180cd6 100644
--- a/site/x86_64-linux
+++ b/site/x86_64-linux
@@ -25,7 +25,6 @@ ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
@@ -93,3 +92,6 @@ ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
 
 # p3scan / quagga
 ac_cv_func_realloc_0_nonnull=${ac_cv_func_realloc_0_nonnull=yes}
+
+# bash
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
diff --git a/site/x86_64-linux-uclibc b/site/x86_64-linux-uclibc
index fe235d0..2f7bacd 100644
--- a/site/x86_64-linux-uclibc
+++ b/site/x86_64-linux-uclibc
@@ -24,7 +24,6 @@ ac_cv_sizeof_short_int=${ac_cv_sizeof_short_int=2}
 ac_cv_sizeof_size_t=${ac_cv_sizeof_size_t=8}
 ac_cv_sizeof_void_p=${ac_cv_sizeof_void_p=8}
 ac_cv_strerror_r_SUSv3=${ac_cv_strerror_r_SUSv3=no}
-bash_cv_have_mbstate_t=${bash_cv_have_mbstate_t=yes}
 db_cv_alignp_t=${db_cv_alignp_t='unsigned long long'}
 db_cv_align_t=${db_cv_align_t='unsigned long long'}
 db_cv_fcntl_f_setfd=${db_cv_fcntl_f_setfd=yes}
-- 
1.6.3



