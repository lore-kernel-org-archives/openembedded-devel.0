Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PL1pv-0000CL-D9
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 23:59:44 +0100
Received: by pzk34 with SMTP id 34so2344304pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 14:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=XV6+SXD+rYperh3xsIbn1JvElGq6HW6DMv1x+6t6lmg=;
	b=nhtLsEAWyRKn6qcWWQTJN9DRpaxshlZEEfuwzTmEt8vtunlmNMCrybmTQkTJgMU+Ri
	UncELQHU0BzVPw9NObTPLZPwMJ4+AUbHjLcOmgDTZcMyWlJA7iDyHcKNzOx0RT1A/kBi
	P60LQScDJG7uQqJDtjnrU0dUKqR7jdCxS52SM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=qtoB44oEZBSyucgXx2Nh6kza7Fsc2kQzORCrwBuhy49bcvtSm0uBPQay9ZNzMX/iCL
	Jtn2TLNndm9jwSLC2CFIvixJwd3d1mUbaOHA3gAjoELcQXBLsh1k0HhL/I+dVqSkcAfE
	4WEAe5sSagYVO38JR6x9HEcb5k6qHdE2FOaPY=
Received: by 10.142.136.6 with SMTP id j6mr1730266wfd.422.1290553107329;
	Tue, 23 Nov 2010 14:58:27 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id q13sm8526837wfc.5.2010.11.23.14.58.18
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 23 Nov 2010 14:58:21 -0800 (PST)
Message-ID: <4CEC4704.1030303@gmail.com>
Date: Wed, 24 Nov 2010 09:28:12 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3] strace: Fix build on mips{, el} when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 23 Nov 2010 22:59:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

While here,
 - make 4.5.20 the default for mips instead of 4.5.18.
 - Fix LICENSE fields.

| mipsel-oe-linux-uclibc-gcc -march=mips32 -Wall -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os  -L/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib -Wl,-rpath-link,/mnt/oe/tmp/sysroots/mipsel-oe-linux-uclibc/lib -Wl,-O1 -o strace strace.o syscall.o count.o util.o desc.o file.o ipc.o io.o ioctl.o mem.o net.o process.o bjm.o quota.o resource.o signal.o sock.o system.o term.o time.o proc.o scsi.o stream.o
| syscall.o:(.data.rel.ro+0x14904): undefined reference to `sys_truncate64'
| syscall.o:(.data.rel.ro+0x14918): undefined reference to `sys_ftruncate64'
| syscall.o:(.data.rel.ro+0x149a4): undefined reference to `sys_getdents64'
| syscall.o:(.data.rel.ro+0x14c74): undefined reference to `sys_statfs64'
| syscall.o:(.data.rel.ro+0x14c88): undefined reference to `sys_fstatfs64'
| collect2: ld returned 1 exit status
| make[1]: *** [strace] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 .../strace/strace-4.5.20/mips-nolargefile.patch    |   41 ++++++++++++++++++++
 recipes/strace/strace_4.5.11.bb                    |    2 +-
 recipes/strace/strace_4.5.12.bb                    |    2 +-
 recipes/strace/strace_4.5.14.bb                    |    2 +-
 recipes/strace/strace_4.5.15.bb                    |    2 +-
 recipes/strace/strace_4.5.18.bb                    |    4 +-
 recipes/strace/strace_4.5.20.bb                    |    7 ++-
 7 files changed, 51 insertions(+), 9 deletions(-)
 create mode 100644 recipes/strace/strace-4.5.20/mips-nolargefile.patch

diff --git a/recipes/strace/strace-4.5.20/mips-nolargefile.patch b/recipes/strace/strace-4.5.20/mips-nolargefile.patch
new file mode 100644
index 0000000..6132356
--- /dev/null
+++ b/recipes/strace/strace-4.5.20/mips-nolargefile.patch
@@ -0,0 +1,41 @@
+--- strace-4.5.20/linux/mips/syscallent.h.orig	2010-11-23 13:25:49.000000000 +1030
++++ strace-4.5.20/linux/mips/syscallent.h	2010-11-23 13:28:23.000000000 +1030
+@@ -4213,15 +4213,24 @@
+ 	{ 0,	0,	printargs,		"SYS_4208"	}, /* 4208 */
+ 	{ 0,	0,	printargs,		"SYS_4209"	}, /* 4209 */
+ 	{ 6,	0,	sys_mmap,		"mmap"		}, /* 4210 */
++#ifdef _LFS64_LARGEFILE
+ 	{ 4,	TF,	sys_truncate64,		"truncate64"	}, /* 4211 */
+ 	{ 4,	TD,	sys_ftruncate64,	"ftruncate64"	}, /* 4212 */
++#else
++	{ 4,	TF,	printargs,		"truncate64"	}, /* 4211 */
++	{ 4,	TD,	printargs,		"ftruncate64"	}, /* 4212 */
++#endif
+ 	{ 2,	TF,	printargs,		"stat64"	}, /* 4213 */
+ 	{ 2,	TF,	sys_lstat64,		"lstat64"	}, /* 4214 */
+ 	{ 2,	TD,	sys_fstat64,		"fstat64"	}, /* 4215 */
+ 	{ 2,	TF,	sys_pivotroot,		"pivot_root"	}, /* 4216 */
+ 	{ 3,	0,	printargs,		"mincore"	}, /* 4217 */
+ 	{ 3,	0,	sys_madvise,		"madvise"	}, /* 4218 */
++#ifdef _LFS64_LARGEFILE
+ 	{ 3,	TF,	sys_getdents64,		"getdents64"	}, /* 4219 */
++#else
++	{ 3,	TF,	printargs,		"getdents64"	}, /* 4219 */
++#endif
+ 	{ 3,	TD,	sys_fcntl,		"fcntl64"	}, /* 4220 */
+ 	{ 0,	0,	printargs,		"SYS_4221"	}, /* 4221 */
+ 	{ 0,	0,	printargs,		"gettid"	}, /* 4222 */
+@@ -4257,8 +4266,13 @@
+ 	{ 1,	0,	printargs,		"set_tid_address"}, /* 4252 */
+ 	{ 0,	0,	sys_restart_syscall,	"restart_syscall"}, /* 4253 */
+ 	{ 6,	0,	sys_fadvise64_64,	"fadvise64_64"	}, /* 4254 */
++#ifdef _LFS64_LARGEFILE
+ 	{ 3,	TF,	sys_statfs64,		"statfs64"	}, /* 4255 */
+ 	{ 2,	TD,	sys_fstatfs64,		"fstatfs64"	}, /* 4256 */
++#else
++	{ 3,	TF,	printargs,		"statfs64"	}, /* 4255 */
++	{ 2,	TD,	printargs,		"fstatfs64"	}, /* 4256 */
++#endif
+ 	{ 3,	0,	sys_timer_create,	"timer_create"	}, /* 4257 */
+ 	{ 4,	0,	sys_timer_settime,	"timer_settime"	}, /* 4258 */
+ 	{ 2,	0,	sys_timer_gettime,	"timer_gettime"	}, /* 4259 */
diff --git a/recipes/strace/strace_4.5.11.bb b/recipes/strace/strace_4.5.11.bb
index 2386b44..f3a4ea6 100644
--- a/recipes/strace/strace_4.5.11.bb
+++ b/recipes/strace/strace_4.5.11.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPL"
+LICENSE = "BSD"
 SECTION = "console/utils"
 PR = "r2"
 
diff --git a/recipes/strace/strace_4.5.12.bb b/recipes/strace/strace_4.5.12.bb
index 3832091..9bf3e1b 100644
--- a/recipes/strace/strace_4.5.12.bb
+++ b/recipes/strace/strace_4.5.12.bb
@@ -1,4 +1,4 @@
-LICENSE = "GPL"
+LICENSE = "BSD"
 SECTION = "console/utils"
 PR = "r1"
 
diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.14.bb
index 8526c91..33a44ad 100644
--- a/recipes/strace/strace_4.5.14.bb
+++ b/recipes/strace/strace_4.5.14.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
-LICENSE = "GPL"
+LICENSE = "BSD"
 PR = "r9"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
diff --git a/recipes/strace/strace_4.5.15.bb b/recipes/strace/strace_4.5.15.bb
index ae12146..12f9a96 100644
--- a/recipes/strace/strace_4.5.15.bb
+++ b/recipes/strace/strace_4.5.15.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
-LICENSE = "GPL"
+LICENSE = "BSD"
 PR = "r1"
 
 # this recipe is missing patches for arm and sh
diff --git a/recipes/strace/strace_4.5.18.bb b/recipes/strace/strace_4.5.18.bb
index de025ea..f5a0719 100644
--- a/recipes/strace/strace_4.5.18.bb
+++ b/recipes/strace/strace_4.5.18.bb
@@ -1,13 +1,11 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
-LICENSE = "GPL"
+LICENSE = "BSD"
 PR = "r2"
 
 # this recipe is missing patches for arm and sh
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_avr32 = "1"
-DEFAULT_PREFERENCE_mips = "1"
-DEFAULT_PREFERENCE_mipsel = "1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
           "
diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.20.bb
index 873ce52..89c5fd3 100644
--- a/recipes/strace/strace_4.5.20.bb
+++ b/recipes/strace/strace_4.5.20.bb
@@ -1,11 +1,14 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
-LICENSE = "GPL"
-PR = "r0"
+LICENSE = "BSD"
+PR = "r1"
 
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_mips = "1"
+DEFAULT_PREFERENCE_mipsel = "1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
+          file://mips-nolargefile.patch \
           "
 
 inherit autotools
-- 
1.7.1



