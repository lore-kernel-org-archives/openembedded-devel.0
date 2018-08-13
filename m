Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8B178EAA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:24:15 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id b15-v6so18397305qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=2d8uBPFT0+MWeRg0cr5WMHeyyJnNBoqeYGsN5LrBkXw=;
	b=uAA/35OyO8Q2qfiK748MTLjOF/YSzI+CmHAQroAzLziiNcYZm+AwJhZCAVz2HuRe/3
	r3WoLIVE6/9JZ0TToRcbEZCvGIw+3Qskbiu7+Rd9ALbDAuXsmPvLjbryUgJjQ+ABYpSk
	yiPyADue2mW9zZx+qmxdm9mzPjUqh4WyP525b0mkGvm1NRLpXhW4XLGe1x2K03rxYky1
	VD+i7T8GQmMpp2GeGNpHYDyvgzuV/65NUObGe0R63an44JpmqYCXRVlP/qKFyrGqwvI1
	oAKy8xpzU/Yi6KpT55ySCT567x+g7dEUKC76Qs/KhW2cxTGDFOogERMPSYPFW0DpJTRj
	LE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=2d8uBPFT0+MWeRg0cr5WMHeyyJnNBoqeYGsN5LrBkXw=;
	b=l9G2/9SLwJ4wN2PyBOhOQzMCyCBu9d4ZKuhUYXWOkBUJKJFTZgfL+Ig4mb3IVQXXOL
	gt6zWN5bznPeGJrW0To6CNakIb7VpeT+N/fl4Zta05SEzzPkHpgmINGKHbxVbcseFDIO
	MaK6ODJgP4lrUQg5AULc/ubIpcrKsJCLil+HnPjtu3FCdU0mwswrN4M3/PGScX7d/erO
	TtlPqBA27LJeZDPgqSdijAmRoCNhscTQ+yKB4DePBpszrysqGb0d8pTh7N6niqSvKo0b
	/TbG1JxcwerUbXYNBNyauVNUoG8N8bfZF014wbmbVhNrekU9EQlbAZmHtltjBxoI3X+i
	CD+A==
X-Gm-Message-State: AOUpUlFpLa0of8PsKoNJfHRhiKDlpeFe1CeNBenoUSlTMOatioWC2dw0
	wDlQ7tq6ZooCZxbgaw6MHvELSHUsgsBHVriwGs4=
X-Google-Smtp-Source: AA+uWPwRGx0Ay3BdItmdDNndyocJxvpwW4ifIEpb+IqVgJFAWmRpWKKGesAguhxA+0lnBONMsZahfDWoLHIfdrvt0eo=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr18522346qta.128.1534184656407; 
	Mon, 13 Aug 2018 11:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <MAXPR01MB0348B0F7FCE0B995544DA5B291390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAXPR01MB0348B0F7FCE0B995544DA5B291390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 11:23:49 -0700
Message-ID: <CAMKF1sosfZqgHsHaKi7ifNPobSiZxnzULf=15BLOXRw9TCa-nA@mail.gmail.com>
To: Aditya Tayade <Aditya.Tayade@kpit.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ltrace: added alternate source
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Aug 2018 18:24:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 13, 2018 at 5:37 AM Aditya Tayade <Aditya.Tayade@kpit.com> wrot=
e:
>
> Description:
> As alioth (the Debian service hosting anonscm) has been discontinued usin=
g https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz as a new s=
ource for ltrace.
> The new source tree SRCREV SHA "ea8928dab8" and old source tree (from dis=
continued link)SRCREV SHA "c22d359433" points to same git history but have =
some diffs.
> Hence added a patch which applies the diff to SHA "ea8928dab8" to make it=
 same as SHA "c22d359433" from the earlier git source.
>

it might be better to push a repo from
https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz into
github or some place. Have we asked the debian salsa migration team if
this is planned for migration at all ?

> ERROR:
> WARNING: ltrace-1_7.91+gitAUTOINC+c22d359433 do_fetch: Failed to fetch UR=
L git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dmaster, attempt=
ing MIRRORS if available
>
> Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> ---
> .../recipes-devtools/ltrace/ltrace/add-support-for-old-source-commit-SHA-=
c22d359433.patch  | 435 ++++++++++++++++++++++++++++++++++++++++++++
> meta-oe/recipes-devtools/ltrace/ltrace_git.bb                            =
                  |  19 +-
> 2 files changed, 451 insertions(+), 3 deletions(-)
> create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/add-support-for=
-old-source-commit-SHA-c22d359433.patch
>
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/add-support-for-old-s=
ource-commit-SHA-c22d359433.patch b/meta-oe/recipes-devtools/ltrace/ltrace/=
add-support-for-old-source-commit-SHA-c22d359433.patch
> new file mode 100644
> index 0000000..ce420c4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace/add-support-for-old-source-c=
ommit-SHA-c22d359433.patch
> @@ -0,0 +1,435 @@
> +ltrace: add support for old source commit SHA "c22d359433"
> +
> +Description:
> +As alioth (the Debian service hosting anonscm) has been discontinued usi=
ng https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz as a new =
source.
> +The new source tree SRCREV SHA "ea8928dab8" and old source tree (from di=
scontinued link)SRCREV SHA "c22d359433" points to same git history but have=
 some diffs.
> +This patch applies the diff to sha "ea8928dab8" to make it same as SHA "=
c22d359433" from the earlier git source.
> +
> +Signed-off-by: Aditya Tayade <Aditya.Tayade@kpit.com>
> +Upstream-Status: Pending
> +
> +diff --git a/sysdeps/linux-gnu/mksyscallent_s390 b/sysdeps/linux-gnu/mks=
yscallent_s390
> +index 4186785..1964d14 100755
> +--- a/sysdeps/linux-gnu/mksyscallent_s390
> ++++ b/sysdeps/linux-gnu/mksyscallent_s390
> +@@ -20,10 +20,11 @@
> + #
> + # Generate syscall table for s390/s390x
> + #
> +-# Use this on arch/s390/kernel/syscalls.S
> ++# Use this on arch/s390/kernel/syscall.s after removing the first few
> ++# nonsyscall lines.
> + #
> +-# mksyscallent_s390 syscalls.S > syscalls31.h
> +-# mksyscallent_s390 -x syscalls.S > syscalls64.h
> ++# cat syscall.s | mksyscallent_s390 > syscalls31.h
> ++# cat syscall.s | mksyscallent_s390 -x > syscalls64.h
> + #
> +
> + use Getopt::Std;
> +@@ -36,19 +37,16 @@ $opt_x and $s390x =3D 1;
> + while (<>) {
> + chomp;
> +
> +- next unless /^NI_SYSCALL/ || /^SYSCALL/;
> + if ($s390x=3D=3D1) {
> +- s/^SYSCALL\(//;
> ++    s/^SYSCALL\([^,]*,//;
> + } else {
> +- s/^SYSCALL\([^,]*\,//;
> ++            s/^SYSCALL\(//;
> + }
> +
> + s/,.*//;
> +- s/^compat_//;
> + s/^sys_//;
> +- s/^s390_//;
> +- s/\).*//;
> +- s/id16$/id/;
> ++ s/^s390[x]*_//;
> ++ s/_glue$//;
> + s/^ni_syscall.*/$i/i;
> + $len =3D 32 - length();
> + $tab =3D $len / 8;
> +diff --git a/sysdeps/linux-gnu/s390/syscalls31.h b/sysdeps/linux-gnu/s39=
0/syscalls31.h
> +index e185656..46f4cf3 100644
> +--- a/sysdeps/linux-gnu/s390/syscalls31.h
> ++++ b/sysdeps/linux-gnu/s390/syscalls31.h
> +@@ -35,15 +35,15 @@
> +     "time",    /* 13 */
> +     "mknod",    /* 14 */
> +     "chmod",    /* 15 */
> +-    "lchown", /* 16 */
> ++    "lchown16", /* 16 */
> +     "17",      /* 17 */
> +     "18",      /* 18 */
> +     "lseek",    /* 19 */
> +     "getpid",  /* 20 */
> +     "mount",    /* 21 */
> +-    "umount",        /* 22 */
> +-    "setuid",  /* 23 */
> +-    "getuid",  /* 24 */
> ++    "oldumount",        /* 22 */
> ++    "setuid16", /* 23 */
> ++    "getuid16", /* 24 */
> +     "stime",    /* 25 */
> +     "ptrace",  /* 26 */
> +     "alarm",    /* 27 */
> +@@ -65,11 +65,11 @@
> +     "times",    /* 43 */
> +     "44",      /* 44 */
> +     "brk",      /* 45 */
> +-    "setgid",  /* 46 */
> +-    "getgid",  /* 47 */
> ++    "setgid16", /* 46 */
> ++    "getgid16", /* 47 */
> +     "signal",  /* 48 */
> +-    "geteuid", /* 49 */
> +-    "getegid", /* 50 */
> ++    "geteuid16",        /* 49 */
> ++    "getegid16",        /* 50 */
> +     "acct",    /* 51 */
> +     "umount",  /* 52 */
> +     "53",      /* 53 */
> +@@ -89,18 +89,18 @@
> +     "sigaction",        /* 67 */
> +     "68",      /* 68 */
> +     "69",      /* 69 */
> +-    "setreuid", /* 70 */
> +-    "setregid", /* 71 */
> ++    "setreuid16",      /* 70 */
> ++    "setregid16",      /* 71 */
> +     "sigsuspend",      /* 72 */
> +     "sigpending",      /* 73 */
> +     "sethostname",      /* 74 */
> +     "setrlimit",        /* 75 */
> +-    "getrlimit",    /* 76 */
> ++    "old_getrlimit",    /* 76 */
> +     "getrusage",        /* 77 */
> +     "gettimeofday",    /* 78 */
> +     "settimeofday",    /* 79 */
> +-    "getgroups",      /* 80 */
> +-    "setgroups",      /* 81 */
> ++    "getgroups16",      /* 80 */
> ++    "setgroups16",      /* 81 */
> +     "82",      /* 82 */
> +     "symlink", /* 83 */
> +     "84",      /* 84 */
> +@@ -108,13 +108,13 @@
> +     "uselib",  /* 86 */
> +     "swapon",  /* 87 */
> +     "reboot",  /* 88 */
> +-    "readdir",      /* 89 */
> +-    "mmap", /* 90 */
> ++    "89",      /* 89 */
> ++    "old_mmap", /* 90 */
> +     "munmap",  /* 91 */
> +     "truncate", /* 92 */
> +     "ftruncate",        /* 93 */
> +     "fchmod",  /* 94 */
> +-    "fchown", /* 95 */
> ++    "fchown16", /* 95 */
> +     "getpriority",      /* 96 */
> +     "setpriority",      /* 97 */
> +     "98",      /* 98 */
> +@@ -157,11 +157,11 @@
> +     "sysfs",    /* 135 */
> +     "personality",      /* 136 */
> +     "137",      /* 137 */
> +-    "setfsuid", /* 138 */
> +-    "setfsgid", /* 139 */
> +-    "_llseek", /* 140 */
> ++    "setfsuid16",      /* 138 */
> ++    "setfsgid16",      /* 139 */
> ++    "llseek",  /* 140 */
> +     "getdents", /* 141 */
> +-    "_newselect", /* 142 */
> ++    "select",  /* 142 */
> +     "flock",    /* 143 */
> +     "msync",    /* 144 */
> +     "readv",    /* 145 */
> +@@ -183,14 +183,14 @@
> +     "sched_rr_get_interval",    /* 161 */
> +     "nanosleep",        /* 162 */
> +     "mremap",  /* 163 */
> +-    "setresuid",        /* 164 */
> +-    "getresuid",        /* 165 */
> ++    "setresuid16",      /* 164 */
> ++    "getresuid16",      /* 165 */
> +     "166",      /* 166 */
> +     "167",      /* 167 */
> +     "poll",    /* 168 */
> +-    "169",      /* 169 */
> +-    "setresgid",        /* 170 */
> +-    "getresgid",        /* 171 */
> ++    "nfsservctl",      /* 169 */
> ++    "setresgid16",      /* 170 */
> ++    "getresgid16",      /* 171 */
> +     "prctl",    /* 172 */
> +     "rt_sigreturn",    /* 173 */
> +     "rt_sigaction",    /* 174 */
> +@@ -201,7 +201,7 @@
> +     "rt_sigsuspend",    /* 179 */
> +     "pread64", /* 180 */
> +     "pwrite64", /* 181 */
> +-    "chown", /* 182 */
> ++    "chown16", /* 182 */
> +     "getcwd",  /* 183 */
> +     "capget",  /* 184 */
> +     "capset",  /* 185 */
> +@@ -217,25 +217,25 @@
> +     "stat64",  /* 195 */
> +     "lstat64", /* 196 */
> +     "fstat64", /* 197 */
> +-    "lchown32", /* 198 */
> +-    "getuid32", /* 199 */
> +-    "getgid32",  /* 200 */
> +-    "geteuid32", /* 201 */
> +-    "getegid32", /* 202 */
> +-    "setreuid32", /* 203 */
> +-    "setregid32", /* 204 */
> +-    "getgroups32",        /* 205 */
> +-    "setgroups32",        /* 206 */
> +-    "fchown32",  /* 207 */
> +-    "setresuid32",        /* 208 */
> +-    "getresuid32",        /* 209 */
> +-    "setresgid32",        /* 210 */
> +-    "getresgid32",        /* 211 */
> +-    "chown32",    /* 212 */
> +-    "setuid32",  /* 213 */
> +-    "setgid32",  /* 214 */
> +-    "setfsuid32", /* 215 */
> +-    "setfsgid32", /* 216 */
> ++    "lchown",  /* 198 */
> ++    "getuid",  /* 199 */
> ++    "getgid",  /* 200 */
> ++    "geteuid", /* 201 */
> ++    "getegid", /* 202 */
> ++    "setreuid", /* 203 */
> ++    "setregid", /* 204 */
> ++    "getgroups",        /* 205 */
> ++    "setgroups",        /* 206 */
> ++    "fchown",  /* 207 */
> ++    "setresuid",        /* 208 */
> ++    "getresuid",        /* 209 */
> ++    "setresgid",        /* 210 */
> ++    "getresgid",        /* 211 */
> ++    "chown",    /* 212 */
> ++    "setuid",  /* 213 */
> ++    "setgid",  /* 214 */
> ++    "setfsuid", /* 215 */
> ++    "setfsgid", /* 216 */
> +     "pivot_root",      /* 217 */
> +     "mincore", /* 218 */
> +     "madvise", /* 219 */
> +@@ -287,9 +287,9 @@
> +     "statfs64", /* 265 */
> +     "fstatfs64",        /* 266 */
> +     "remap_file_pages", /* 267 */
> +-    "mbind",    /* 268 */
> +-    "get_mempolicy",    /* 269 */
> +-    "set_mempolicy",    /* 270 */
> ++    "268",      /* 268 */
> ++    "269",      /* 269 */
> ++    "270",      /* 270 */
> +     "mq_open", /* 271 */
> +     "mq_unlink",        /* 272 */
> +     "mq_timedsend",    /* 273 */
> +@@ -306,7 +306,7 @@
> +     "inotify_init",    /* 284 */
> +     "inotify_add_watch",        /* 285 */
> +     "inotify_rm_watch", /* 286 */
> +-    "migrate_pages",    /* 287 */
> ++    "287",      /* 287 */
> +     "openat",  /* 288 */
> +     "mkdirat", /* 289 */
> +     "mknodat", /* 290 */
> +@@ -329,67 +329,3 @@
> +     "sync_file_range", /* 307 */
> +     "tee",      /* 308 */
> +     "vmsplice", /* 309 */
> +-    "move_pages",      /* 310 */
> +-    "getcpu",  /* 311 */
> +-    "epoll_pwait",      /* 312 */
> +-    "utimes",  /* 313 */
> +-    "fallocate",        /* 314 */
> +-    "utimensat",        /* 315 */
> +-    "signalfd", /* 316 */
> +-    "317",      /* 317 */
> +-    "eventfd", /* 318 */
> +-    "timerfd_create",  /* 319 */
> +-    "timerfd_settime", /* 320 */
> +-    "timerfd_gettime", /* 321 */
> +-    "signalfd4",        /* 322 */
> +-    "eventfd2", /* 323 */
> +-    "inotify_init1",    /* 324 */
> +-    "pipe2",    /* 325 */
> +-    "dup3",    /* 326 */
> +-    "epoll_create1",    /* 327 */
> +-    "preadv",  /* 328 */
> +-    "pwritev", /* 329 */
> +-    "rt_tgsigqueueinfo",        /* 330 */
> +-    "perf_event_open", /* 331 */
> +-    "fanotify_init",    /* 332 */
> +-    "fanotify_mark",    /* 333 */
> +-    "prlimit64",        /* 334 */
> +-    "name_to_handle_at",        /* 335 */
> +-    "open_by_handle_at",        /* 336 */
> +-    "clock_adjtime",    /* 337 */
> +-    "syncfs",  /* 338 */
> +-    "setns",    /* 339 */
> +-    "process_vm_readv", /* 340 */
> +-    "process_vm_writev",        /* 341 */
> +-    "s390_runtime_instr",    /* 342 */
> +-    "kcmp",    /* 343 */
> +-    "finit_module",    /* 344 */
> +-    "sched_setattr",    /* 345 */
> +-    "sched_getattr",    /* 346 */
> +-    "renameat2",        /* 347 */
> +-    "seccomp", /* 348 */
> +-    "getrandom",        /* 349 */
> +-    "memfd_create",    /* 350 */
> +-    "bpf",      /* 351 */
> +-    "s390_pci_mmio_write",  /* 352 */
> +-    "s390_pci_mmio_read",    /* 353 */
> +-    "execveat", /* 354 */
> +-    "userfaultfd",      /* 355 */
> +-    "membarrier",      /* 356 */
> +-    "recvmmsg", /* 357 */
> +-    "sendmmsg", /* 358 */
> +-    "socket",  /* 359 */
> +-    "socketpair",      /* 360 */
> +-    "bind",    /* 361 */
> +-    "connect", /* 362 */
> +-    "listen",  /* 363 */
> +-    "accept4", /* 364 */
> +-    "getsockopt",      /* 365 */
> +-    "setsockopt",      /* 366 */
> +-    "getsockname",      /* 367 */
> +-    "getpeername",      /* 368 */
> +-    "sendto",  /* 369 */
> +-    "sendmsg", /* 370 */
> +-    "recvfrom", /* 371 */
> +-    "recvmsg", /* 372 */
> +-    "shutdown", /* 373 */
> +diff --git a/sysdeps/linux-gnu/s390/syscalls64.h b/sysdeps/linux-gnu/s39=
0/syscalls64.h
> +index 939b996..f2ec7f4 100644
> +--- a/sysdeps/linux-gnu/s390/syscalls64.h
> ++++ b/sysdeps/linux-gnu/s390/syscalls64.h
> +@@ -41,7 +41,7 @@
> +     "lseek",    /* 19 */
> +     "getpid",  /* 20 */
> +     "mount",    /* 21 */
> +-    "umount",        /* 22 */
> ++    "oldumount",        /* 22 */
> +     "23",      /* 23 */
> +     "24",      /* 24 */
> +     "25",      /* 25 */
> +@@ -109,7 +109,7 @@
> +     "swapon",  /* 87 */
> +     "reboot",  /* 88 */
> +     "89",      /* 89 */
> +-    "mmap", /* 90 */
> ++    "old_mmap", /* 90 */
> +     "munmap",  /* 91 */
> +     "truncate", /* 92 */
> +     "ftruncate",        /* 93 */
> +@@ -188,7 +188,7 @@
> +     "166",      /* 166 */
> +     "167",      /* 167 */
> +     "poll",    /* 168 */
> +-    "169",      /* 169 */
> ++    "nfsservctl",      /* 169 */
> +     "170",      /* 170 */
> +     "171",      /* 171 */
> +     "prctl",    /* 172 */
> +@@ -287,9 +287,9 @@
> +     "statfs64", /* 265 */
> +     "fstatfs64",        /* 266 */
> +     "remap_file_pages", /* 267 */
> +-    "mbind",    /* 268 */
> +-    "get_mempolicy",    /* 269 */
> +-    "set_mempolicy",    /* 270 */
> ++    "268",      /* 268 */
> ++    "269",      /* 269 */
> ++    "270",      /* 270 */
> +     "mq_open", /* 271 */
> +     "mq_unlink",        /* 272 */
> +     "mq_timedsend",    /* 273 */
> +@@ -306,7 +306,7 @@
> +     "inotify_init",    /* 284 */
> +     "inotify_add_watch",        /* 285 */
> +     "inotify_rm_watch", /* 286 */
> +-    "migrate_pages",    /* 287 */
> ++    "287",      /* 287 */
> +     "openat",  /* 288 */
> +     "mkdirat", /* 289 */
> +     "mknodat", /* 290 */
> +@@ -329,67 +329,3 @@
> +     "sync_file_range", /* 307 */
> +     "tee",      /* 308 */
> +     "vmsplice", /* 309 */
> +-    "move_pages",      /* 310 */
> +-    "getcpu",  /* 311 */
> +-    "epoll_pwait",      /* 312 */
> +-    "utimes",  /* 313 */
> +-    "fallocate",        /* 314 */
> +-    "utimensat",        /* 315 */
> +-    "signalfd", /* 316 */
> +-    "317",      /* 317 */
> +-    "eventfd", /* 318 */
> +-    "timerfd_create",  /* 319 */
> +-    "timerfd_settime", /* 320 */
> +-    "timerfd_gettime", /* 321 */
> +-    "signalfd4",        /* 322 */
> +-    "eventfd2", /* 323 */
> +-    "inotify_init1",    /* 324 */
> +-    "pipe2",    /* 325 */
> +-    "dup3",    /* 326 */
> +-    "epoll_create1",    /* 327 */
> +-    "preadv",  /* 328 */
> +-    "pwritev", /* 329 */
> +-    "rt_tgsigqueueinfo",        /* 330 */
> +-    "perf_event_open", /* 331 */
> +-    "fanotify_init",    /* 332 */
> +-    "fanotify_mark",    /* 333 */
> +-    "prlimit64",        /* 334 */
> +-    "name_to_handle_at",        /* 335 */
> +-    "open_by_handle_at",        /* 336 */
> +-    "clock_adjtime",    /* 337 */
> +-    "syncfs",  /* 338 */
> +-    "setns",    /* 339 */
> +-    "process_vm_readv", /* 340 */
> +-    "process_vm_writev",        /* 341 */
> +-    "s390_runtime_instr", /* 342 */
> +-    "kcmp",    /* 343 */
> +-    "finit_module",    /* 344 */
> +-    "sched_setattr",    /* 345 */
> +-    "sched_getattr",    /* 346 */
> +-    "renameat2",        /* 347 */
> +-    "seccomp", /* 348 */
> +-    "getrandom",        /* 349 */
> +-    "memfd_create",    /* 350 */
> +-    "bpf",      /* 351 */
> +-    "s390_pci_mmio_write", /* 352 */
> +-    "s390_pci_mmio_read",  /* 353 */
> +-    "execveat", /* 354 */
> +-    "userfaultfd",      /* 355 */
> +-    "membarrier",      /* 356 */
> +-    "recvmmsg", /* 357 */
> +-    "sendmmsg", /* 358 */
> +-    "socket",  /* 359 */
> +-    "socketpair",      /* 360 */
> +-    "bind",    /* 361 */
> +-    "connect", /* 362 */
> +-    "listen",  /* 363 */
> +-    "accept4", /* 364 */
> +-    "getsockopt",      /* 365 */
> +-    "setsockopt",      /* 366 */
> +-    "getsockname",      /* 367 */
> +-    "getpeername",      /* 368 */
> +-    "sendto",  /* 369 */
> +-    "sendmsg", /* 370 */
> +-    "recvfrom", /* 371 */
> +-    "recvmsg", /* 372 */
> +-    "shutdown", /* 373 */
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index abe015d..02ea964 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -10,12 +10,16 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539feef013de476e68b5c=
50a"
>
>  PE =3D "1"
> -PV =3D "7.91+git${SRCPV}"
> -SRCREV =3D "c22d359433b333937ee3d803450dc41998115685"
> +PV =3D "7.92"
> +SRCREV =3D "ea8928dab8a0a1f549d0ed8ebc6ec563e9fa1159"
> +
> +SRC_URI[md5sum] =3D "f6375033b1963cf6835e808051e93477"
> +SRC_URI[sha256sum] =3D "1861e358fa86b9ec12557d3c3f3e583e1ee01a0984453a82=
78065d877ac337bc"
>
>  DEPENDS =3D "elfutils"
>  RDEPENDS_${PN} =3D "elfutils"
> -SRC_URI =3D "git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dm=
aster \
> +SRC_URI =3D "https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar=
.xz;protocol=3Dhttps \
> +           file://add-support-for-old-source-commit-SHA-c22d359433.patch=
 \
>             file://configure-allow-to-disable-selinux-support.patch \
>             file://0001-replace-readdir_r-with-readdir.patch \
>             file://0001-Use-correct-enum-type.patch \
> @@ -34,6 +38,15 @@ PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'selinux', d)}"
>  PACKAGECONFIG[unwind] =3D "--with-libunwind,--without-libunwind,libunwin=
d"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x,libselinux"
>
> +do_unpack_extra () {
> +    if [ -d "${WORKDIR}/ltrace.git" ]; then
> +    git clone ${WORKDIR}/ltrace.git ${S}
> +    rm -rf ${WORKDIR}/ltrace.git
> +    fi
> +}
> +
> +addtask unpack_extra after do_unpack before do_patch
> +
>  do_configure_prepend () {
>      ( cd ${S}; ./autogen.sh )
>  }
>
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

