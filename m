Received: from [80.67.172.39] (helo=webmail.no-log.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Ld4v8-0006Sx-5F
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 16:46:55 +0100
Received: by webmail.no-log.org (Postfix, from userid 33)
	id 4951E4BE52; Fri, 27 Feb 2009 16:43:10 +0100 (CET)
X-Squirrel-UserHash: c3wyGAAN
X-Squirrel-FromHash: AFRVDw5RXnw=
Message-ID: <43954.AFRVDw5RXnw=.1235749389.squirrel@webmail.no-log.org>
Date: Fri, 27 Feb 2009 16:43:09 +0100 (CET)
From: "GNUtoo" <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.9a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
Subject: [patch](or sort of): emacs didn't compile[second part: qemu recipe]
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
X-List-Received-Date: Fri, 27 Feb 2009 15:47:07 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

here's my qemu recipe that isn't commitable:
it's a recipe for qemu-arm-eabi:
http://qemu-arm-eabi.wiki.sourceforge.net/

here's the recipe(hardcoded revision,I know it's bad):
diff -Nurd org.openembedded.dev/packages/qemu/qemu_svn.bb
local_packages/packages/qemu/qemu_svn.bb
--- org.openembedded.dev/packages/qemu/qemu_svn.bb	2009-02-12
15:26:46.000000000 +0100
+++ local_packages/packages/qemu/qemu_svn.bb	2009-02-25 11:17:57.00000000=
0
+0100
@@ -1,47 +1,51 @@
 LICENSE =3D "GPL"
 DEPENDS =3D "zlib"
-PV =3D "0.9.1+svnr${SRCREV}"
-PR =3D "r14"
+PV =3D "0.9.1+svnr5391"
+PR =3D "r16"

-FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-0.9.1+sv=
n/"
+#FILESPATH =3D "${FILE_DIRNAME}/qemu-${PV}/:${FILE_DIRNAME}/qemu-0.9.1+s=
vn/"

 SRC_URI =3D "\
-    svn://svn.savannah.nongnu.org/qemu;module=3Dtrunk \
-    file://05_non-fatal_if_linux_hd_missing.patch;patch=3D1;pnum=3D1 \
-    file://06_exit_segfault.patch;patch=3D1;pnum=3D0 \
-    file://10_signal_jobs.patch;patch=3D1;pnum=3D0 \
-    file://11_signal_sigaction.patch;patch=3D1;pnum=3D0 \
-    file://22_net_tuntap_stall.patch;patch=3D1;pnum=3D0 \
-    file://31_syscalls.patch;patch=3D1;pnum=3D0 \
-    file://32_syscall_sysctl.patch;patch=3D1;pnum=3D0 \
-    file://33_syscall_ppc_clone.patch;patch=3D1;pnum=3D0 \
-    file://39_syscall_fadvise64.patch;patch=3D1;pnum=3D0 \
-    file://41_arm_fpa_sigfpe.patch;patch=3D1;pnum=3D0;maxrev=3D4028 \
-    file://52_ne2000_return.patch;patch=3D1;pnum=3D1 \
-    file://61_safe_64bit_int.patch;patch=3D1;pnum=3D0 \
-    file://63_sparc_build.patch;patch=3D1;pnum=3D0 \
-    file://64_ppc_asm_constraints.patch;patch=3D1;pnum=3D1 \
-    file://65_kfreebsd.patch;patch=3D1;pnum=3D0 \
-    file://66_tls_ld.patch;patch=3D1;pnum=3D0 \
-    file://91-oh-sdl-cursor.patch;patch=3D1;pnum=3D0 \
-    file://qemu-0.9.0-nptl.patch;patch=3D1 \
-    file://qemu-0.9.0-nptl-update.patch;patch=3D1;maxrev=3D4028 \
-    file://qemu-amd64-32b-mapping-0.9.0.patch;patch=3D1 \
-    file://workaround_bad_futex_headers.patch;patch=3D1 \
-    file://fix_segfault.patch;patch=3D1 \
-    file://no-strip.patch;patch=3D1 \
-    file://fix_brk.patch;patch=3D1 \
-    file://fix_protection_bits.patch;patch=3D1 \
-    file://revert_arm_tcg.patch.gz;patch=3D1;minrev=3D4242 \
-    file://qemu-n800-support.patch;patch=3D1 \
-    file://fix_baum_c_compilation.patch;patch=3D1 \
-    file://fix_dirent_h_include.patch;patch=3D1"
+svn://svn.savannah.nongnu.org/qemu;module=3Dtrunk;rev=3D5391 \
+file://01_fix_srs_rfe.patch;patch=3D1;pnum=3D0 \
+file://02_fix_page_range_check.patch;patch=3D1;pnum=3D0 \
+file://03_arm_cpu_default.patch;patch=3D1;pnum=3D1 \
+file://04_shmat_strace.patch;patch=3D1;pnum=3D0 \
+file://06_exit_segfault.patch;patch=3D1;pnum=3D0 \
+file://10_signal_jobs.patch;patch=3D1;pnum=3D0 \
+file://19_zero_null.2.read.patch;patch=3D1;pnum=3D1 \
+file://19_zero_null.3.accept.patch;patch=3D1;pnum=3D1 \
+file://19_zero_null.4.acct.patch;patch=3D1;pnum=3D1 \
+file://21_net_soopts.patch;patch=3D1;pnum=3D1 \
+file://22_IPCOP_msg.patch;patch=3D1;pnum=3D1 \
+file://23_msg_syscalls.patch;patch=3D1;pnum=3D1 \
+file://24_IPCOP_sem.patch;patch=3D1;pnum=3D1 \
+file://25_sem_syscalls.patch;patch=3D1;pnum=3D1 \
+file://26_IPCOP_shm.patch;patch=3D1;pnum=3D1 \
+file://27_shm_syscalls.patch;patch=3D1;pnum=3D1 \
+file://30_check_host_to_target_sockaddr_return_value.patch;patch=3D1;pnu=
m=3D0 \
+file://31_syscalls.patch;patch=3D1;pnum=3D1 \
+file://32_syscall_sysctl.patch;patch=3D1;pnum=3D0 \
+file://33_fix_getdents_syscalls.patch;patch=3D1;pnum=3D1 \
+file://34_fix_siocatmark.patch;patch=3D1;pnum=3D0 \
+file://35_syscall_sockaddr.patch;patch=3D1;pnum=3D1 \
+file://36_fix_iovec.patch;patch=3D1;pnum=3D1 \
+file://37_check_target_to_host_sockaddr_return_value.patch;patch=3D1;pnu=
m=3D1 \
+file://38_fix_recvmsg_return_value.patch;patch=3D1;pnum=3D1 \
+file://39_fix_exit_syscall.patch;patch=3D1;pnum=3D1 \
+file://40_clone_child_cleartid.patch;patch=3D1;pnum=3D1 \
+file://44_socklen_t_check.patch;patch=3D1;pnum=3D1 \
+file://48_signal_terminate.patch;patch=3D1;pnum=3D1 \
+file://99_sbox_callhack.patch;patch=3D1;pnum=3D1 \
+file://99_sbox_proc.patch;patch=3D1;pnum=3D1 \
+"

 S =3D "${WORKDIR}/trunk"

 #EXTRA_OECONF +=3D "--disable-sdl"
 #EXTRA_OECONF +=3D "--target-list=3Darm-linux-user,arm-softmmu,i386-soft=
mmu"
 EXTRA_OECONF +=3D "--disable-gfx-check"
+EXTRA_OECONF +=3D "--target-list=3Darm-linux-user"

 inherit autotools

It doesn't compile the full qemu...just the arm part...because compiling
the full qemu resulted in a compilation failure

so that's the ugly part...
I bet I'll have to track down which patch(es) can permit the compilation
of emacs...and It would be long and painful,so I need to automatize
it(what should I use to do that...they do it with toolchains or
projects...do I just have to generate the recipes automatically,and use
the return code of bitbake as a compilation failure or success?)
Denis.


