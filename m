Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PKjNz-0004Kg-VL
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 04:17:41 +0100
Received: by pvd12 with SMTP id 12so1806372pvd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 19:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=03SE0ahkmHl+nVoDaVPnAvJFcvZkkwsOyWgrtDfmgJM=;
	b=cdlVWzvIMZWjjGnkSwBnZUWHjbDP5CUBtfwOsisZM+p3kDdWGyKFkIykHWbhaD0HEK
	zfG3hzDmctvHLlGc2b91cNy0jl+m1B0x2GgYwcggXvZiEVrpw8og6zAJcFkRFt/54kC7
	J6V8i8wfQPJ8iVjB14liHvRIq6Ts4Iqp3wXP8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=TLuNeIXVQd05NvVKIFcT8GjreI48eOSxSZ/9WPLb4UmGCnBIwfQsouWL53MZUBqvBK
	/DM9EWhKnuL0rZg9xkSEaKKJcyL3Fs1ec2wihN0UxTUifQKrlt7sIKYM0Bd3BBeyk+bZ
	8Nbw7foAFwJKSG5pd8gBiNMRJbJAoD/syK8SA=
Received: by 10.143.159.18 with SMTP id l18mr5922231wfo.98.1290482186143;
	Mon, 22 Nov 2010 19:16:26 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id w42sm7271947wfh.3.2010.11.22.19.16.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 22 Nov 2010 19:16:25 -0800 (PST)
Message-ID: <4CEB3203.9040606@gmail.com>
Date: Tue, 23 Nov 2010 13:46:19 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] strace_4.5.20.bb: Fix build on mips{, el} when DISTRO_FEATURES lacks "largefile".
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
X-List-Received-Date: Tue, 23 Nov 2010 03:17:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


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
 recipes/strace/strace_4.5.20.bb                    |    4 ++
 2 files changed, 45 insertions(+), 0 deletions(-)
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
diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.20.bb
index 873ce52..2fd5170 100644
--- a/recipes/strace/strace_4.5.20.bb
+++ b/recipes/strace/strace_4.5.20.bb
@@ -4,9 +4,13 @@ LICENSE = "GPL"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_mipsel_uclibc = "1"
+DEFAULT_PREFERENCE_mips_uclibc = "1"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
           "
+SRC_URI_append_mipsel += " file://mips-nolargefile.patch "
+SRC_URI_append_mips += " file://mips-nolargefile.patch "
 
 inherit autotools
 
-- 
1.7.1



