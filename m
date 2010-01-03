Received: from mail-yx0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NRPO0-0004iE-Ll
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Jan 2010 13:16:47 +0100
Received: by yxe1 with SMTP id 1so13278884yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jan 2010 04:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject:date
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=bXLO6Z5QXKX3LvrIfvZCKNGsw91MzQejvI0HqEQHZr4=;
	b=TEJJqqoqvlWdyLUABHxLBh5M1AbX4+5+nUoTocXwX93szZQTwTYcH0eyNRN8Vg5Z02
	OOA6BvEEg2/nSTO5CezpTmDrvde7+gVuhKRTxQvAAlc3sdxwp7iIcqtR4mVsUebdfBqo
	Omr7jEMQxOo9nWvtI2g/AmUHMGC5qQ8l7UIk0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:date:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=hygt3PABq9OmOaiMOHJfeVZ1fQOeigHWgokq9zzHsLzdePFcFUn50bjxTXtBZjov1t
	5V/mT3zybM84f96Vb4XaTw2ByW32cAJabw2QXbADDsk0pucZMpxFDOM2YIZHpZvZ1P/3
	+FL7DC4iIMn6ooHms9VeBZ8Vlq8BYhjNovYY8=
Received: by 10.150.194.19 with SMTP id r19mr3441591ybf.320.1262520881969;
	Sun, 03 Jan 2010 04:14:41 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 22sm16720271iwn.12.2010.01.03.04.14.38
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 03 Jan 2010 04:14:41 -0800 (PST)
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Date: Sun, 03 Jan 2010 20:14:32 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5yhl8usmn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.171
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: compiling glibc-2.6.1 failed due to undefined reference to `_begin
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
X-List-Received-Date: Sun, 03 Jan 2010 12:16:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys:
    There is a building failure of org.openembedded.dev. I think it may be  
a bug of openembedded. Have anyone met the same bug? Or have some idea  
about it?

Thanks a lot!

compiling glibc-2.6.1 failed and reported the following error:
ccache i686-oe-linux-gcc -march=pentiumpro   -nostdlib -nostartfiles  
-shared -o
/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/elf/ld.so
            \
           -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=both  
-Wl,-z,defs     \

/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/elf/librtld.os
-Wl,--version-script=/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/ld.map
        \
           -Wl,-soname=ld-linux.so.2 -T
/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/elf/ld.so.lds
/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/elf/librtld.os:
In function `_dl_start':
rtld.c:(.text+0xac5): undefined reference to `_begin'
/media/work-disk/workdir/oe-glibc-test/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld:
/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/elf/librtld.os:
relocation R_386_GOTOFF against undefined hidden symbol `_begin' can not be
used when making a shared object
/media/work-disk/workdir/oe-glibc-test/cross/i686/lib/gcc/i686-oe-linux/4.4.2/../../../../i686-oe-linux/bin/ld:
final link failed: Bad value
collect2: ld returned 1 exit status
make[2]: ***
[/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/build-i686-oe-linux/elf/ld.so]
Error 1
make[2]: Leaving directory
`/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/glibc-2.6.1/elf'
make[1]: *** [elf/subdir_lib] Error 2
make[1]: Leaving directory
`/media/work-disk/workdir/oe-glibc-test/work/i686-oe-linux/glibc-2.6.1-r35.0/glibc-2.6.1'
make: *** [all] Error 2
FATAL: oe_runmake failed
when the following conditions:
1. MACHINE=qemux86 DISTRO=micro LIBC="glibc"
2. MACHINE=qemuarm DISTRO=micro LIBC="glibc"
3. MACHINE=qemumips DISTRO=micro LIBC="glibc"

see the following links for more detialed:
http://tinderbox.openembedded.net/packages/399846/

-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


