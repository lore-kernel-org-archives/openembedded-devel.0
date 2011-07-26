Received: from qmta07.emeryville.ca.mail.comcast.net ([76.96.30.64])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bb1@halebob.net>) id 1QlWcG-0000lC-Kh
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 03:39:25 +0200
Received: from omta20.emeryville.ca.mail.comcast.net ([76.96.30.87])
	by qmta07.emeryville.ca.mail.comcast.net with comcast
	id CRH81h0021smiN4A7Ra51p; Tue, 26 Jul 2011 01:34:05 +0000
Received: from smithers.halebob.net ([69.255.41.253])
	by omta20.emeryville.ca.mail.comcast.net with comcast
	id CRaR1h00s5TjpzZ8gRaSdN; Tue, 26 Jul 2011 01:34:27 +0000
Received: from www.halebob.net (smithers.halebob.net [192.168.1.6])
	by smithers.halebob.net (8.13.8/8.13.8) with ESMTP id p6Q1Y3iT021348
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jul 2011 21:34:03 -0400
MIME-Version: 1.0
Date: Mon, 25 Jul 2011 20:34:03 -0500
From: Robert Brick <bb1@halebob.net>
To: <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1311626490.3098.22.camel@lenovo.internal.reciva.com>
References: <aca10ad4ca204fe1dbc0276dbffed2b2@smithers>
	<1311624488.3098.14.camel@lenovo.internal.reciva.com>
	<c1ad379acab6c0bbe50c200c46bd7951@smithers>
	<1311626490.3098.22.camel@lenovo.internal.reciva.com>
Message-ID: <fb27ae1c3b063d8673a09ee265113c08@smithers>
X-Sender: bb1@halebob.net
User-Agent: Roundcube Webmail/0.4
Subject: Re: i18n problems with eglibc
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
X-List-Received-Date: Tue, 26 Jul 2011 01:39:25 -0000
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, 25 Jul 2011 21:41:30 +0100, Phil Blundell <philb@gnu.org>
wrote:
> On Mon, 2011-07-25 at 15:34 -0500, Robert Brick wrote:
>> I should have mentioned it in my initial mail.  I believe that the
>> glibc message catalog is installed correctly.
>>
>> root@cpc3xx:/bin# ls -l /usr/share/locale/es/LC_MESSAGES/
>> total 232
>> -rw-r--r-- 1 root root 110655 jul 23 13:57 coreutils.mo
>> -rw-r--r-- 1 root root 120808 jul 21 01:15 libc.mo
>> root@cpc3xx:/bin#
>>
>> Is there any other file other than .../es/LC_MESSAGES/libc.mo that make
>> up the message catalog?
> 
> Oh, very strange then.  That does look correct; as far as I know libc.mo
> is the only file you should need to get localised output from glibc.
> 
> What does the output from "strace -f ls /nonexistent" look like?

Here you go.  After reviewing this output, I'm still at a loss...

root@cpc3xx:/bin# strace -f ls /nonexistent
execve("/bin/ls", ["ls", "/nonexistent"], [/* 12 vars */]) = 0
brk(0)                                  = 0x101fa000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
open("/etc/ld.so.cache", O_RDONLY)      = -1 ENOENT (No such file or
directory)
open("/lib/tls/ppc603/librt.so.1", O_RDONLY) = -1 ENOENT (No such file
or directory)
stat64("/lib/tls/ppc603", 0xbfc32818)   = -1 ENOENT (No such file or
directory)
open("/lib/tls/librt.so.1", O_RDONLY)   = -1 ENOENT (No such file or
directory)
stat64("/lib/tls", 0xbfc32818)          = -1 ENOENT (No such file or
directory)
open("/lib/ppc603/librt.so.1", O_RDONLY) = -1 ENOENT (No such file or
directory)
stat64("/lib/ppc603", 0xbfc32818)       = -1 ENOENT (No such file or
directory)
open("/lib/librt.so.1", O_RDONLY)       = 3
read(3,
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0\0328\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=30776, ...}) = 0
mmap(0xffd8000, 95576, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xffd8000
mprotect(0xffdf000, 61440, PROT_NONE)   = 0
mmap(0xffee000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x6000) = 0xffee000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3,
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\1\377\0\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1401348, ...}) = 0
mmap(0xfe70000, 1407412, PROT_READ|PROT_EXEC,
MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0xfe70000
mmap(0xffc0000, 20480, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x150000) = 0xffc0000
mmap(0xffc5000, 10676, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xffc5000
close(3)                                = 0
open("/lib/libpthread.so.0", O_RDONLY)  = 3
read(3,
"\177ELF\1\2\1\0\0\0\0\0\0\0\0\0\0\3\0\24\0\0\0\1\0\0QT\0\0\0004"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=88764, ...}) = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4801c000
mmap(0xfe38000, 161516, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE,
3, 0) = 0xfe38000
mprotect(0xfe4d000, 61440, PROT_NONE)   = 0
mmap(0xfe5c000, 8192, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x14000) = 0xfe5c000
mmap(0xfe5e000, 5868, PROT_READ|PROT_WRITE|PROT_EXEC,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xfe5e000
close(3)                                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4801d000
mprotect(0xfe5c000, 4096, PROT_READ)    = 0
mprotect(0xffc0000, 8192, PROT_READ)    = 0
mprotect(0xffee000, 4096, PROT_READ)    = 0
mprotect(0x10030000, 4096, PROT_READ)   = 0
mprotect(0x4802b000, 4096, PROT_READ)   = 0
set_tid_address(0x4801cba8)             = 599
get_robust_list(0x4801cbb0, 0xc, 0xbfc33340) = 0
rt_sigaction(SIGRTMIN, {0xfe3d074, [], SA_SIGINFO}, NULL, 8) = 0
rt_sigaction(SIGRT_1, {0xfe3cc98, [], SA_RESTART|SA_SIGINFO}, NULL, 8)
= 0
rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
getrlimit(RLIMIT_STACK, {rlim_cur=8192*1024, rlim_max=RLIM_INFINITY}) =
0
brk(0)                                  = 0x101fa000
brk(0x1021b000)                         = 0x1021b000
open("/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY) = -1 ENOENT (No such
file or directory)
open("/usr/lib/locale/es_US.UTF-8/LC_IDENTIFICATION", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_IDENTIFICATION", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=343, ...}) = 0
mmap(NULL, 343, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4801e000
close(3)                                = 0
open("/usr/lib/gconv/gconv-modules.cache", O_RDONLY) = -1 ENOENT (No
such file or directory)
open("/usr/lib/gconv/gconv-modules", O_RDONLY) = -1 ENOENT (No such
file or directory)
futex(0xffc4ee4, FUTEX_WAKE_PRIVATE, 2147483647) = 0
open("/usr/lib/locale/es_US.UTF-8/LC_MEASUREMENT", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_MEASUREMENT", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=23, ...}) = 0
mmap(NULL, 23, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4801f000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_TELEPHONE", O_RDONLY) = -1 ENOENT
(No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_TELEPHONE", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=48, ...}) = 0
mmap(NULL, 48, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48020000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_ADDRESS", O_RDONLY) = -1 ENOENT
(No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_ADDRESS", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=140, ...}) = 0
mmap(NULL, 140, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48021000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_NAME", O_RDONLY) = -1 ENOENT (No
such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_NAME", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=62, ...}) = 0
mmap(NULL, 62, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48022000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_PAPER", O_RDONLY) = -1 ENOENT (No
such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_PAPER", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=34, ...}) = 0
mmap(NULL, 34, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48023000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_MESSAGES", O_RDONLY) = -1 ENOENT
(No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_MESSAGES", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFDIR|0755, st_size=232, ...}) = 0
close(3)                                = 0
open("/usr/lib/locale/es_US.utf8/LC_MESSAGES/SYS_LC_MESSAGES",
O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=54, ...}) = 0
mmap(NULL, 54, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48024000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_MONETARY", O_RDONLY) = -1 ENOENT
(No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_MONETARY", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=286, ...}) = 0
mmap(NULL, 286, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48025000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_COLLATE", O_RDONLY) = -1 ENOENT
(No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_COLLATE", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=1171574, ...}) = 0
mmap(NULL, 1171574, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4802e000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_TIME", O_RDONLY) = -1 ENOENT (No
such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_TIME", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=2378, ...}) = 0
mmap(NULL, 2378, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48026000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_NUMERIC", O_RDONLY) = -1 ENOENT
(No such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_NUMERIC", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=54, ...}) = 0
mmap(NULL, 54, PROT_READ, MAP_PRIVATE, 3, 0) = 0x48027000
close(3)                                = 0
open("/usr/lib/locale/es_US.UTF-8/LC_CTYPE", O_RDONLY) = -1 ENOENT (No
such file or directory)
open("/usr/lib/locale/es_US.utf8/LC_CTYPE", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=256324, ...}) = 0
mmap(NULL, 256324, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4814d000
close(3)                                = 0
ioctl(1, TCGETS, {B9600 opost isig icanon echo ...}) = 0
ioctl(1, TIOCGWINSZ, {ws_row=0, ws_col=0, ws_xpixel=0, ws_ypixel=0}) =
0
stat64("/nonexistent", 0x101fd230)      = -1 ENOENT (No such file or
directory)
lstat64("/nonexistent", 0x101fd230)     = -1 ENOENT (No such file or
directory)
open("/usr/share/locale/es_US.UTF-8/LC_MESSAGES/coreutils.mo",
O_RDONLY) = -1 ENOENT (No such file or directory)
open("/usr/share/locale/es_US.utf8/LC_MESSAGES/coreutils.mo", O_RDONLY)
= -1 ENOENT (No such file or directory)
open("/usr/share/locale/es_US/LC_MESSAGES/coreutils.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/es.UTF-8/LC_MESSAGES/coreutils.mo", O_RDONLY) =
-1 ENOENT (No such file or directory)
open("/usr/share/locale/es.utf8/LC_MESSAGES/coreutils.mo", O_RDONLY) =
-1 ENOENT (No such file or directory)
open("/usr/share/locale/es/LC_MESSAGES/coreutils.mo", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=110655, ...}) = 0
mmap(NULL, 110655, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4818c000
close(3)                                = 0
write(2, "ls: ", 4ls: )                     = 4
write(2, "no se puede acceder a /nonexiste"..., 34no se puede acceder a
/nonexistent) = 34
open("/usr/share/locale/es_US.UTF-8/LC_MESSAGES/libc.mo", O_RDONLY) =
-1 ENOENT (No such file or directory)
open("/usr/share/locale/es_US.utf8/LC_MESSAGES/libc.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/es_US/LC_MESSAGES/libc.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/es.UTF-8/LC_MESSAGES/libc.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/es.utf8/LC_MESSAGES/libc.mo", O_RDONLY) = -1
ENOENT (No such file or directory)
open("/usr/share/locale/es/LC_MESSAGES/libc.mo", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=120808, ...}) = 0
mmap(NULL, 120808, PROT_READ, MAP_PRIVATE, 3, 0) = 0x481a8000
close(3)                                = 0
write(2, ": No such file or directory", 27: No such file or directory)
= 27
write(2, "\n", 1
)                       = 1
close(1)                                = 0
close(2)                                = 0
exit_group(2)                           = ?
root@cpc3xx:/bin#

> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



