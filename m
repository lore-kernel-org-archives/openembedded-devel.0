Received: from [209.85.217.19] (helo=mail-gx0-f19.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1Kclr3-0001sl-Is
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Sep 2008 20:52:53 +0200
Received: by gxk12 with SMTP id 12so1831874gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Sep 2008 11:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=CLQQeyfsWDPr9Jwqafgco0IiaoTKobmqVarQYfwSFeU=;
	b=i2wnzNCfuiFeLmW+GeyJTA7PI4z6Q4zm3Ef66LvRcsZvk3X56ic7X+9CwUE96WuM54
	D9mWfw/409qii8Rr405n8jvfzKGa49ykCfFOCrzXtSB/6BMoHsBo5KM1MKeL6QRC14na
	I5hyLir/xwk39Lc0hnsOx4yKmJoL0LwVDu+64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=kuq2Y2Wj5kQ2zlucqwoPCeaBa+zUz2slXHglzjkYSJxqGDRfUvW5ZL5m5McGMGJuYx
	IPgCzK2UVGOBFj5zxlppTIKk4mmM7vKXhSQA7Yuxz3Tk3LghxXi+YHRFywBhnAx9GPuz
	kJ1dxjU7b9a0oh3WewQ4YSG7BYoEiIRXXh2uM=
Received: by 10.151.111.1 with SMTP id o1mr6777756ybm.187.1220899822440;
	Mon, 08 Sep 2008 11:50:22 -0700 (PDT)
Received: by 10.151.85.19 with HTTP; Mon, 8 Sep 2008 11:50:22 -0700 (PDT)
Message-ID: <48239d390809081150v371dada7g917b35073a162957@mail.gmail.com>
Date: Mon, 8 Sep 2008 22:50:22 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: problems with generating locales under XEN
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
X-List-Received-Date: Mon, 08 Sep 2008 18:52:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi, all!
I use XEN virtual machine taken from service provider to build OE images.
Everything is OK except generating locales, which stops with error message,
that  the following command failed:
PATH="/home/slapin/OE/tmp/staging/i686-linux/usr/bin/arm-angstrom-linux-gnueabi:/home/slapin/OE/tmp/staging/i686-linux/usr/sbin:/home/slapin/OE/tmp/staging/i686-linux/usr/bin:/home/slapin/OE/tmp/cross/bin:/home/slapin/OE/tmp/staging/i686-linux/sbin:/home/slapin/OE/bitbake/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
I18NPATH="/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree//usr/share/i18n"
qemu-arm -r 2.6.16 -L
/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree
 /home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree
--inputfile=/usr/share/i18n/locales/ru_RU --charmap=UTF-8 ru_RU

When I try to run this line, it just segfaults.

I tried to debug it with gdb and got the following:

slapin@build:~/OE$
PATH="/home/slapin/OE/tmp/staging/i686-linux/usr/bin/arm-angstrom-linux-gnueabi:/home/slapin/OE/tmp/staging/i686-linux/usr/sbin:/home/slapin/OE/tmp/staging/i686-linux/usr/bin:/home/slapin/OE/tmp/cross/bin:/home/slapin/OE/tmp/staging/i686-linux/sbin:/home/slapin/OE/bitbake/bin:/usr/local/bin:/usr/bin:/bin:/usr/games"
I18NPATH="/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree//usr/share/i18n"
gdb --args `which qemu-arm` -r 2.6.16 -L
/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree
 /home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree
--inputfile=/usr/share/i18n/locales/ru_RU --charmap=UTF-8 ru_RU
GNU gdb 6.8-debian
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "i486-linux-gnu"...
(no debugging symbols found)
(gdb) run
Starting program: /usr/bin/qemu-arm -r 2.6.16 -L
/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree
/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree/bin/localedef
--force --old-style --no-archive
--prefix=/home/slapin/OE/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.6.1-r11/locale-tree
--inputfile=/usr/share/i18n/locales/ru_RU --charmap=UTF-8 ru_RU
(no debugging symbols found)
(no debugging symbols found)
Error: Bad syscall: f0005
qemu: unhandled CPU exception 0x2 - aborting
R00=ffffffda R01=4219b4a0 R02=0000068c R03=4219bb78
R04=400a5060 R05=400a5000 R06=00000000 R07=000f0005
R08=00000060 R09=ffff565c R10=00000000 R11=4007f39c
R12=4219c000 R13=4007f098 R14=40091e24 R15=40082fc4
PSR=20000010 --C- A usr32
s00=00000000(       0) s01=00000000(       0) d00=0000000000000000(       0)
s02=00000000(       0) s03=00000000(       0) d01=0000000000000000(       0)
s04=00000000(       0) s05=00000000(       0) d02=0000000000000000(       0)
s06=00000000(       0) s07=00000000(       0) d03=0000000000000000(       0)
s08=00000000(       0) s09=00000000(       0) d04=0000000000000000(       0)
s10=00000000(       0) s11=00000000(       0) d05=0000000000000000(       0)
s12=00000000(       0) s13=00000000(       0) d06=0000000000000000(       0)
s14=00000000(       0) s15=00000000(       0) d07=0000000000000000(       0)
s16=00000000(       0) s17=00000000(       0) d08=0000000000000000(       0)
s18=00000000(       0) s19=00000000(       0) d09=0000000000000000(       0)
s20=00000000(       0) s21=00000000(       0) d10=0000000000000000(       0)
s22=00000000(       0) s23=00000000(       0) d11=0000000000000000(       0)
s24=00000000(       0) s25=00000000(       0) d12=0000000000000000(       0)
s26=00000000(       0) s27=00000000(       0) d13=0000000000000000(       0)
s28=00000000(       0) s29=00000000(       0) d14=0000000000000000(       0)
s30=00000000(       0) s31=00000000(       0) d15=0000000000000000(       0)
FPSCR: 00000000

Program received signal SIGABRT, Aborted.
0x00278402 in tbs ()
(gdb)

Backtrace is meaningless in this case. The message qemu prints does not appear
when run not from gdb. It also appears when run under strace.

Any ideas?

All the best,
S.


