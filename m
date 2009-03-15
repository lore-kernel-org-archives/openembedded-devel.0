Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LitDd-0006Ct-CC
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Mar 2009 17:29:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id D19611422AA2;
	Sun, 15 Mar 2009 17:29:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tWeIhI7-uHxe; Sun, 15 Mar 2009 17:29:31 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7])
	by ns.penguin.cz (Postfix) with ESMTP id 41EA21416BA8;
	Sun, 15 Mar 2009 17:29:30 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <565965130903142037q21baab90h86bdb37f03ba68ed@mail.gmail.com>
References: <1237070100.9302.8.camel@utx.utx.cz>
	<565965130903142037q21baab90h86bdb37f03ba68ed@mail.gmail.com>
Date: Sun, 15 Mar 2009 17:29:10 +0100
Message-Id: <1237134550.5673.24.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Opkg devel List <opkg-devel@googlegroups.com>
Subject: Re: "opkg install ncurses-terminfo" needs 1GB of memory
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
X-List-Received-Date: Sun, 15 Mar 2009 16:29:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tick wrote in Sun 03/15 2009 at 11:37 +0800:=20
> Hi,
>  What version of opkg and OE branch do you use?

It was opkg-nogpg - 0.1.6+svnr203-r3.1 from org.openembedded.dev on
spitz. opkg-nogpg-dbg_0.1.6+svnr204-r3.1 has the same problem.

> Do you have the backstrace and log when opkg failed?

No, but I cannot create one.

Here is a backtrace created by Ctrl+C when memory footprint of opkg was
more than 300 MB:

(gdb) run
Starting program: /usr/bin/opkg install ncurses-terminfo
[Thread debugging using libthread_db enabled]
[New Thread 0x4001e940 (LWP 3811)]
Upgrading ncurses-terminfo on root from 5.4-r17.1 to 5.4-r18.1...
Downloading file:///home/sb/deploy/ipk/armv5te/ncurses-terminfo_5.4-r18.1=
_armv5te.ipk
^C
Program received signal SIGINT, Interrupt.
[Switching to Thread 0x4001e940 (LWP 3811)]
0x40207834 in _int_malloc (av=3D0x402be034, bytes=3D28) at malloc.c:4420
4420	malloc.c: No such file or directory.
	in malloc.c
(gdb) bt
#0  0x40207834 in _int_malloc (av=3D0x402be034, bytes=3D28) at malloc.c:4=
420
#1  0x40208850 in *__GI___libc_malloc (bytes=3D28) at malloc.c:3549
#2  0x4020c8f8 in *__GI___strdup (s=3D0xbedae4b8 "/usr/share/terminfo/d/d=
132\n") at strdup.c:43
#3  0x4003ca70 in file_read_line_alloc (file=3D0x11ae4a20) at file_util.c=
:82
#4  0x40037044 in pkg_get_installed_files (pkg=3D0x76ff88) at pkg.c:1390
#5  0x4003adc8 in file_hash_set_file_owner (conf=3D<value optimized out>,=
 file_name=3D0x10396d8 "/usr/share/terminfo/i/iq140", owning_pkg=3D0x16eb=
148)
    at pkg_hash.c:634
#6  0x40033dbe in opkg_install_pkg (conf=3D0xbedaeb2c, pkg=3D0x16eb148, f=
rom_upgrade=3D<value optimized out>) at opkg_install.c:445
#7  0x400346f0 in opkg_install_by_name (conf=3D0xbedaeb2c, pkg_name=3D0xb=
edaeed1 "ncurses-terminfo") at opkg_install.c:220
#8  0x40031c54 in opkg_install_cmd (conf=3D0xbedaeb2c, argc=3D1, argv=3D<=
value optimized out>) at opkg_cmd.c:583
#9  0x400308c4 in opkg_cmd_exec (cmd=3D<value optimized out>, conf=3D0xbe=
daeb2c, argc=3D239461632, argv=3D0x39, userdata=3D0x0) at opkg_cmd.c:167
#10 0x4002f0e0 in opkg_op (argc=3D3, argv=3D0xbedaede4) at libopkg.c:160
#11 0x000085b4 in main (argc=3D214626048, argv=3D0xe45e500) at opkg-front=
end.c:27

And a bit later, when memory footprint nearly reached 500 MB:
(gdb) cont
Continuing.
^C
Program received signal SIGINT, Interrupt.
0x40207834 in _int_malloc (av=3D0x402be034, bytes=3D26) at malloc.c:4420
4420	in malloc.c
(gdb) bt
#0  0x40207834 in _int_malloc (av=3D0x402be034, bytes=3D26) at malloc.c:4=
420
#1  0x40208850 in *__GI___libc_malloc (bytes=3D26) at malloc.c:3549
#2  0x4020c8f8 in *__GI___strdup (s=3D0xbedae4b8 "/usr/share/terminfo/s/s=
4\n") at strdup.c:43
#3  0x4003ca70 in file_read_line_alloc (file=3D0x19de6ad0) at file_util.c=
:82
#4  0x40037044 in pkg_get_installed_files (pkg=3D0x76ff88) at pkg.c:1390
#5  0x4003adc8 in file_hash_set_file_owner (conf=3D<value optimized out>,=
 file_name=3D0x10471d0 "/usr/share/terminfo/o/opennt-100-nti", owning_pkg=
=3D0x16eb148)
    at pkg_hash.c:634
#6  0x40033dbe in opkg_install_pkg (conf=3D0xbedaeb2c, pkg=3D0x16eb148, f=
rom_upgrade=3D<value optimized out>) at opkg_install.c:445
#7  0x400346f0 in opkg_install_by_name (conf=3D0xbedaeb2c, pkg_name=3D0xb=
edaeed1 "ncurses-terminfo") at opkg_install.c:220
#8  0x40031c54 in opkg_install_cmd (conf=3D0xbedaeb2c, argc=3D1, argv=3D<=
value optimized out>) at opkg_cmd.c:583
#9  0x400308c4 in opkg_cmd_exec (cmd=3D<value optimized out>, conf=3D0xbe=
daeb2c, argc=3D386664208, argv=3D0x39, userdata=3D0x0) at opkg_cmd.c:167
#10 0x4002f0e0 in opkg_op (argc=3D3, argv=3D0xbedaede4) at libopkg.c:160
#11 0x000085b4 in main (argc=3D103383328, argv=3D0x170c0710) at opkg-fron=
tend.c:27

Next try:

root@zaurus:~# gdb opkg --args opkg install ncurses-terminfo
GNU gdb 6.8
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.h=
tml>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying=
"
and "show warranty" for details.
This GDB was configured as "arm-angstrom-linux-gnueabi"...
(gdb) run
Starting program: /usr/bin/opkg install ncurses-terminfo
[Thread debugging using libthread_db enabled]
[New Thread 0x4001e940 (LWP 3891)]
Upgrading ncurses-terminfo on root from 5.4-r17.1 to 5.4-r18.1...
Downloading file:///home/sb/deploy/ipk/armv5te/ncurses-terminfo_5.4-r18.1=
_armv5te.ipk
^C
Program received signal SIGINT, Interrupt.
[Switching to Thread 0x4001e940 (LWP 3891)]
0x401dd44c in _IO_vfprintf_internal (s=3D0xbea79790, format=3D0x400437a4 =
"%s", ap=3D0xbea798d0) at vfprintf.c:1359
1359	vfprintf.c: No such file or directory.
	in vfprintf.c
(gdb) bt
#0  0x401dd44c in _IO_vfprintf_internal (s=3D0xbea79790, format=3D0x40043=
7a4 "%s", ap=3D0xbea798d0) at vfprintf.c:1359
#1  0x401fee78 in _IO_vsnprintf (string=3D0xb107ab8 "", maxlen=3D100, for=
mat=3D0x400437a4 "%s", args=3D0xbea798d0) at vsnprintf.c:120
#2  0x4003d720 in sprintf_alloc (str=3D0xbea798e0, fmt=3D0x400437a4 "%s")=
 at sprintf_alloc.c:53
#3  0x40037092 in pkg_get_installed_files (pkg=3D0x76ff88) at pkg.c:1412
#4  0x4003adc8 in file_hash_set_file_owner (conf=3D<value optimized out>,=
 file_name=3D0x102e6f0 "/usr/share/terminfo/a/ansi+idl1", owning_pkg=3D0x=
16eb148)
    at pkg_hash.c:634
#5  0x40033dbe in opkg_install_pkg (conf=3D0xbea79b2c, pkg=3D0x16eb148, f=
rom_upgrade=3D<value optimized out>) at opkg_install.c:445
#6  0x400346f0 in opkg_install_by_name (conf=3D0xbea79b2c, pkg_name=3D0xb=
ea79ed1 "ncurses-terminfo") at opkg_install.c:220
#7  0x40031c54 in opkg_install_cmd (conf=3D0xbea79b2c, argc=3D1, argv=3D<=
value optimized out>) at opkg_cmd.c:583
#8  0x400308c4 in opkg_cmd_exec (cmd=3D<value optimized out>, conf=3D0xbe=
a79b2c, argc=3D-1, argv=3D0x402a2a98, userdata=3D0x0) at opkg_cmd.c:167
#9  0x4002f0e0 in opkg_op (argc=3D3, argv=3D0xbea79de4) at libopkg.c:160
#10 0x000085b4 in main (argc=3D0, argv=3D0xffffffff) at opkg-frontend.c:2=
7


It look like a memory leak on each file. ncurses-terminfo just contains
several thousands files.
=EF=BB=BF
opkg files ncurses-terminfo | wc -l
2489

Note: Initial installation of ncurses-terminfo on a bare image is a bit
slow, but succeeds. Later, when my system contains many packages, it
fails.


________________________________________________________________________

Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



