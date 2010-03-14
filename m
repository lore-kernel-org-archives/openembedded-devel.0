Received: from qmta02.emeryville.ca.mail.comcast.net ([76.96.30.24])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1Nqvmk-0004hN-6k
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Mar 2010 22:55:51 +0100
Received: from omta08.emeryville.ca.mail.comcast.net ([76.96.30.12])
	by qmta02.emeryville.ca.mail.comcast.net with comcast
	id t7Lw1d0040FhH24A29rjx5; Sun, 14 Mar 2010 21:51:43 +0000
Received: from [192.168.1.100] ([67.188.141.116])
	by omta08.emeryville.ca.mail.comcast.net with comcast
	id t9rh1d00E2WszPn8U9rhv3; Sun, 14 Mar 2010 21:51:42 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201003141558.24266.holger+oe@freyther.de>
References: <1268511676.24057.12.camel@ed-hp-laptop>
	<201003141558.24266.holger+oe@freyther.de>
Date: Sun, 14 Mar 2010 14:51:40 -0700
Message-ID: <1268603500.2247.27.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 76.96.30.24
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Alignment trap - deprecation.pyo
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
X-List-Received-Date: Sun, 14 Mar 2010 21:55:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-03-14 at 15:58 +0100, Holger Hans Peter Freyther wrote:
> > # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
> > matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.py
> > import gtk._lazyutils # precompiled
> > from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/_lazyutils.pyo
> > # /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
> > matches /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.py
> > import gtk.deprecation # precompiled
> > from /usr/lib/python2.6/site-packages/gtk-2.0/gtk/deprecation.pyo
> > Alignment trap: python (2412) PC=0x40bfa3c4 Instr=0x280069c0
> > Address=0xffffffff FSR 0x813
> > Segmentation fault
> > 
> > 
> > Does anyone have any ideas why it chokes at deprecation.pyo?????
> 
> No. but you could enable the generation of a coredump with ulimit and then use 
> gdb to figure out where it was generating this alignment trap.
> 
> 

Holger thanks for responding.  I know you and everyone else on the list 
are very busy and I appreciate if I get a response.  I try and find help
using google but that does not always pan out.

So taking your suggestion I am trying to use gdbsever but without much
success.    This is what I have done.

1. Built image to include gdbserver.
2. Downloaded to my PC python2.6-dbg
3. Downloaded GDB Macros and placed in home/ed/  as .gdbinit
4. On host in terminal window
     a. $gdb python
     b. (gdb) target remote 192.168.1.104:2345
     c. where 192.168.1.104 is IP address of target board(mini2440)
     d. Go to target machine and do step 5.
     e. eventually I get connection timed out.
     f.  I can ping the target machine from the host.
5. On target machine
     a. Verify that ulimit is set to unlimted
     b. #gdbserver 192.168.1.100:2345 python pygtkHelloWorld
     c. where 192.168.1.100 is the IP address of the host machine
     d. nothing comes back when I enter the above command.  I would have
thought from reading the wiki page
http://en.wikipedia.org/wiki/Gdbserver that I should see something after
entering the command.

I did an strace on # strace gdbserver 192.168.1.100:2345 python
and to see if it would work with just running python.  I get the
following trace.

root@mini2440:~# strace gdbserver 192.168.1.100:2345 python
execve("/usr/bin/gdbserver", ["gdbserver", "192.168.1.100:2345",
"python"], [/* 12 vars */]) = 0
brk(0)                                  = 0x21000
uname({sys="Linux", node="mini2440", ...}) = 0
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or
directory)
open("/var/run/ld.so.cache", O_RDONLY)  = -1 ENOENT (No such file or
directory)
open("/lib/tls/v4l/half/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No
such file or directory)
stat64("/lib/tls/v4l/half", 0xbe8ae220) = -1 ENOENT (No such file or
directory)
open("/lib/tls/v4l/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No such
file or directory)
stat64("/lib/tls/v4l", 0xbe8ae220)      = -1 ENOENT (No such file or
directory)
open("/lib/tls/half/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No such
file or directory)
stat64("/lib/tls/half", 0xbe8ae220)     = -1 ENOENT (No such file or
directory)
open("/lib/tls/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No such file
or directory)
stat64("/lib/tls", 0xbe8ae220)          = -1 ENOENT (No such file or
directory)
open("/lib/v4l/half/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No such
file or directory)
stat64("/lib/v4l/half", 0xbe8ae220)     = -1 ENOENT (No such file or
directory)
open("/lib/v4l/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No such file
or directory)
stat64("/lib/v4l", 0xbe8ae220)          = -1 ENOENT (No such file or
directory)
open("/lib/half/libthread_db.so.1", O_RDONLY) = -1 ENOENT (No such file
or directory)
stat64("/lib/half", 0xbe8ae220)         = -1 ENOENT (No such file or
directory)
open("/lib/libthread_db.so.1", O_RDONLY) = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\0\17\0\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=26304, ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4001c000
mmap2(NULL, 57676, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0)
= 0x40025000
mprotect(0x4002b000, 28672, PROT_NONE)  = 0
mmap2(0x40032000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x5) = 0x40032000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\344K\1\000"...,
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1127916, ...}) = 0
mmap2(NULL, 1163712, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) = 0x40034000
mprotect(0x40143000, 32768, PROT_NONE)  = 0
mmap2(0x4014b000, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_DENYWRITE, 3, 0x10f) = 0x4014b000
mmap2(0x4014e000, 8640, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|
MAP_ANONYMOUS, -1, 0) = 0x4014e000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) = 0x4001d000
syscall_983045(0x4001cd40, 0x4001cd40, 0x68c, 0x4001d418, 0x40024060,
0x40024000, 0, 0xf0005, 0x60, 0xffff5874, 0, 0xbe8aeae4, 0, 0xbe8ae7e0,
0x40002010, 0x40002028, 0x20000010, 0x4001cd40, 0xb719, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0) = 0
mprotect(0x4014b000, 8192, PROT_READ)   = 0
mprotect(0x40032000, 4096, PROT_READ)   = 0
mprotect(0x40023000, 4096, PROT_READ)   = 0
rt_sigaction(SIGIO, {SIG_IGN}, {SIG_DFL}, 8) = 0
rt_sigprocmask(SIG_UNBLOCK, [IO], NULL, 8) = 0
brk(0)                                  = 0x21000
brk(0x42000)                            = 0x42000
clone(child_stack=0x22068, flags=CLONE_VM|SIGCHLD) = 2898
wait4(2898,  <unfinished ... exit status 0>
Process 2897 detached

==========================

Is there something I have not set up correctly or some step that is not
done correctly?  
Any help will be appreciated.
Thanks
Ed


  

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




