Received: from [76.96.30.16] (helo=QMTA01.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1MuE1Z-0004mr-S2
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Oct 2009 01:28:31 +0200
Received: from OMTA19.emeryville.ca.mail.comcast.net ([76.96.30.76])
	by QMTA01.emeryville.ca.mail.comcast.net with comcast
	id oNHc1c00n1eYJf8A1PSnGQ; Sat, 03 Oct 2009 23:26:47 +0000
Received: from [192.168.1.101] ([67.188.141.116])
	by OMTA19.emeryville.ca.mail.comcast.net with comcast
	id oPTe1c0032WszPn01PTesZ; Sat, 03 Oct 2009 23:27:39 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 03 Oct 2009 16:27:37 -0700
Message-Id: <1254612457.4074.16.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.30.16
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: DirectFB problem
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
X-List-Received-Date: Sat, 03 Oct 2009 23:28:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Tried directfb_1.4.2 but same problem.

Did #strace dfbinfo 

And captured the following output.
I see a lot of no such file or directories.

===========================
root@mini2440:~# strace dfbinfo
execve("/usr/bin/dfbinfo", ["dfbinfo"], [/* 11 vars */]) = 0
brk(0)                                  = 0x13000
uname({sys="Linux", node="mini2440", ...}) = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/v4l/half/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT
(No such file or directory)
stat64("/usr/lib/tls/v4l/half", 0xbeefd260) = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/v4l/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/tls/v4l", 0xbeefd260)  = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/half/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/tls/half", 0xbeefd260) = -1 ENOENT (No such file or
directory)
open("/usr/lib/tls/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT (No such
file or directory)
stat64("/usr/lib/tls", 0xbeefd260)      = -1 ENOENT (No such file or
directory)
open("/usr/lib/v4l/half/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/v4l/half", 0xbeefd260) = -1 ENOENT (No such file or
directory)
open("/usr/lib/v4l/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT (No such
file or directory)
stat64("/usr/lib/v4l", 0xbeefd260)      = -1 ENOENT (No such file or
directory)
open("/usr/lib/half/libdirectfb-1.4.so.0", O_RDONLY) = -1 ENOENT (No
such file or directory)
stat64("/usr/lib/half", 0xbeefd260)     = -1 ENOENT (No such file or
directory)
open("/usr/lib/libdirectfb-1.4.so.0", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\210\327"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=400872, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4001c000
mmap2(NULL, 433924, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x40025000
mprotect(0x40084000, 32768, PROT_NONE)  = 0
mmap2(0x4008c000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x5f) = 0x4008c000
close(3)                                = 0
open("/usr/lib/libfusion-1.4.so.0", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0L\'\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=27248, ...}) = 0
mmap2(NULL, 58800, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x4008f000
mprotect(0x40096000, 28672, PROT_NONE)  = 0
mmap2(0x4009d000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x6) = 0x4009d000
close(3)                                = 0
open("/usr/lib/libdirect-1.4.so.0", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\3409\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=72344, ...}) = 0
mmap2(NULL, 105788, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x4009e000
mprotect(0x400af000, 32768, PROT_NONE)  = 0
mmap2(0x400b7000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x11) = 0x400b7000
close(3)                                = 0
open("/usr/lib/libz.so.1", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0X\27\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=56184, ...}) = 0
mmap2(NULL, 87692, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x400b8000
mprotect(0x400c6000, 28672, PROT_NONE)  = 0
mmap2(0x400cd000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0xd) = 0x400cd000
close(3)                                = 0
open("/usr/lib/libts-1.0.so.0", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0d\t\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=6024, ...}) = 0
mmap2(NULL, 38604, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x400ce000
mprotect(0x400d0000, 28672, PROT_NONE)  = 0
mmap2(0x400d7000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x1) = 0x400d7000
close(3)                                = 0
open("/usr/lib/libm.so.6", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/var/run/ld.so.cache", O_RDONLY)  = -1 ENOENT (No such file or
directory)
open("/lib/tls/v4l/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file
or directory)
stat64("/lib/tls/v4l/half", 0xbeefd1e8) = -1 ENOENT (No such file or
directory)
open("/lib/tls/v4l/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or
directory)
stat64("/lib/tls/v4l", 0xbeefd1e8)      = -1 ENOENT (No such file or
directory)
open("/lib/tls/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or
directory)
stat64("/lib/tls/half", 0xbeefd1e8)     = -1 ENOENT (No such file or
directory)
open("/lib/tls/libm.so.6", O_RDONLY)    = -1 ENOENT (No such file or
directory)
stat64("/lib/tls", 0xbeefd1e8)          = -1 ENOENT (No such file or
directory)
open("/lib/v4l/half/libm.so.6", O_RDONLY) = -1 ENOENT (No such file or
directory)
stat64("/lib/v4l/half", 0xbeefd1e8)     = -1 ENOENT (No such file or
directory)
open("/lib/v4l/libm.so.6", O_RDONLY)    = -1 ENOENT (No such file or
directory)
stat64("/lib/v4l", 0xbeefd1e8)          = -1 ENOENT (No such file or
directory)
open("/lib/half/libm.so.6", O_RDONLY)   = -1 ENOENT (No such file or
directory)
stat64("/lib/half", 0xbeefd1e8)         = -1 ENOENT (No such file or
directory)
open("/lib/libm.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\2001\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=665368, ...}) = 0
mmap2(NULL, 696472, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x400d8000
mprotect(0x4017a000, 28672, PROT_NONE)  = 0
mmap2(0x40181000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0xa1) = 0x40181000
close(3)                                = 0
open("/usr/lib/libdl.so.2", O_RDONLY)   = -1 ENOENT (No such file or
directory)
open("/lib/libdl.so.2", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\254\10\0"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=9708, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4001d000
mmap2(NULL, 41116, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x40183000
mprotect(0x40185000, 28672, PROT_NONE)  = 0
mmap2(0x4018c000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x1) = 0x4018c000
close(3)                                = 0
open("/usr/lib/libpthread.so.0", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\214B\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=80216, ...}) = 0
mmap2(NULL, 119300, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x4018e000
mprotect(0x401a1000, 28672, PROT_NONE)  = 0
mmap2(0x401a8000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x12) = 0x401a8000
mmap2(0x401aa000, 4612, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_ANONYMOUS, -1, 0) = 0x401aa000
close(3)                                = 0
open("/usr/lib/libc.so.6", O_RDONLY)    = -1 ENOENT (No such file or
directory)
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\344K\1\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1127916, ...}) = 0
mmap2(NULL, 1163712, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x401ac000
mprotect(0x402bb000, 32768, PROT_NONE)  = 0
mmap2(0x402c3000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x10f) = 0x402c3000
mmap2(0x402c6000, 8640, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_ANONYMOUS, -1, 0) = 0x402c6000
close(3)                                = 0
open("/usr/lib/libgcc_s.so.1", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/usr/lib/libgcc_s.so.1", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0 \"\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0644, st_size=41844, ...}) = 0
mmap2(NULL, 72068, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x402c9000
mprotect(0x402d3000, 28672, PROT_NONE)  = 0
mmap2(0x402da000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x9) = 0x402da000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4001e000
syscall_983045(0x4001e700, 0x4001e700, 0x68c, 0x4001edd8, 0x40024060,
0x40024000, 0, 0xf0005, 0x60, 0xffff5874, 0, 0xbeefdb24, 0, 0xbeefd820,
0x40002010, 0x40002028, 0x20000010, 0x4001e700, 0xb719, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0) = 0
mprotect(0x402c3000, 8192, PROT_READ)   = 0
mprotect(0x401a8000, 4096, PROT_READ)   = 0
mprotect(0x4018c000, 4096, PROT_READ)   = 0
mprotect(0x40181000, 4096, PROT_READ)   = 0
mprotect(0x40023000, 4096, PROT_READ)   = 0
epoll_wait(0x4001e2a8, 0xbeefde24, 0xbeefde2c, 0x40191934) = 2129
ipc_subcall(0x4001e2b0, 0xc, 0x4001e2cc, 0xffffffec) = 0
rt_sigaction(SIGRTMIN, {0x40191e80, [], SA_SIGINFO|0x4000000}, NULL, 8)
= 0
rt_sigaction(SIGRT_1, {0x40191d50, [], SA_RESTART|SA_SIGINFO|0x4000000},
NULL, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) =
0
brk(0)                                  = 0x13000
brk(0x34000)                            = 0x34000
geteuid32()                             = 0
open("/etc/directfbrc", O_RDONLY)       = -1 ENOENT (No such file or
directory)
open("/home/root/.directfbrc", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/etc/directfbrc.dfbinfo", O_RDONLY) = -1 ENOENT (No such file or
directory)
open("/home/root/.directfbrc.dfbinfo", O_RDONLY) = -1 ENOENT (No such
file or directory)
gettid()                                = 2129
rt_sigaction(SIGHUP, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGINT, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGTERM, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGABRT, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGFPE, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGILL, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGQUIT, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGSEGV, {0x400a5945, [], SA_SIGINFO|0x4000000}, {SIG_DFL},
8) = 0
rt_sigaction(SIGTRAP, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGBUS, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGXCPU, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
rt_sigaction(SIGXFSZ, {0x400a5945, [], SA_NOMASK|SA_SIGINFO|0x4000000},
{SIG_DFL}, 8) = 0
futex(0x400b75dc, FUTEX_WAKE, 2147483647) = 0
write(2, "\n   ~~~~~~~~~~~~~~~~~~~~~~~~~~| "..., 275
   ~~~~~~~~~~~~~~~~~~~~~~~~~~| DirectFB 1.4.2 |
~~~~~~~~~~~~~~~~~~~~~~~~~~
        (c) 2001-2009  The world wide DirectFB Open Source Community
        (c) 2000-2004  Convergence (integrated media) GmbH
      ----------------------------------------------------------------

) = 275
write(2, "(*) DirectFB/Core: Single Applic"..., 64(*) DirectFB/Core:
Single Application Core. (2009-10-03 20:41) 
) = 64
futex(0x4018d090, FUTEX_WAKE, 2147483647) = 0
open("/usr/lib/libdirectfb-1.4.so.2", O_RDONLY) = -1 ENOENT (No such
file or directory)
open("/usr/lib/directfb-1.4-0/systems", O_RDONLY|O_NONBLOCK|O_LARGEFILE|
O_DIRECTORY) = 3
fstat64(3, {st_mode=S_IFDIR|0755, st_size=0, ...}) = 0
fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
getdents(3, /* 4 entries */, 4096)      = 100
open("/usr/lib/directfb-1.4-0/systems/libdirectfb_devmem.so", O_RDONLY)
= 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\4\16\0\000"...,
512) = 512
fstat64(4, {st_mode=S_IFREG|0755, st_size=10324, ...}) = 0
mmap2(NULL, 41828, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0)
= 0x402db000
mprotect(0x402de000, 28672, PROT_NONE)  = 0
mmap2(0x402e5000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 4, 0x2) = 0x402e5000
close(4)                                = 0
open("/usr/lib/directfb-1.4-0/systems/libdirectfb_fbdev.so", O_RDONLY) =
4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0X!\0\000"...,
512) = 512
fstat64(4, {st_mode=S_IFREG|0755, st_size=39240, ...}) = 0
mmap2(NULL, 70752, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0)
= 0x402e6000
mprotect(0x402ef000, 32768, PROT_NONE)  = 0
mmap2(0x402f7000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 4, 0x9) = 0x402f7000
close(4)                                = 0
open("/usr/lib/libsysfs.so.2", O_RDONLY) = 4
read(4, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\340\37\0"...,
512) = 512
fstat64(4, {st_mode=S_IFREG|0755, st_size=25680, ...}) = 0
mmap2(NULL, 57236, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 4, 0)
= 0x402f8000
mprotect(0x402fe000, 28672, PROT_NONE)  = 0
mmap2(0x40305000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 4, 0x5) = 0x40305000
close(4)                                = 0
getdents(3, /* 0 entries */, 4096)      = 0
close(3)                                = 0
munmap(0x402db000, 41828)               = 0
mmap2(NULL, 516096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40306000
mmap2(NULL, 516096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x40384000
gettimeofday({1254616434, 497969}, NULL) = 0
gettimeofday({1254616434, 515077}, NULL) = 0
gettimeofday({1254616434, 517312}, NULL) = 0
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
gettid()                                = 2129
gettimeofday({1254616434, 523286}, NULL) = 0
write(2, "(!) [ 2129:    0.000] --> Caught"..., 42(!) [ 2129:    0.000]
--> Caught signal 11) = 42
write(2, " (at 0x40976008, invalid address"..., 38 (at 0x40976008,
invalid address) <--
) = 38
rt_sigaction(SIGHUP, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGINT, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGTERM, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGABRT, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGFPE, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGILL, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGQUIT, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGSEGV, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGTRAP, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGBUS, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGXCPU, {SIG_DFL}, NULL, 8) = 0
rt_sigaction(SIGXFSZ, {SIG_DFL}, NULL, 8) = 0
statfs64(umovestr: Input/output error
0x851, 2129, {???})            = 0
rt_sigprocmask(SIG_UNBLOCK, [ABRT], NULL, 8) = 0
statfs64(umovestr: Input/output error
0x851, 2129, {???})            = 0
--- SIGABRT (Aborted) @ 0 (0) ---
+++ killed by SIGABRT +++
Process 2129 detached
root@mini2440:~# 






