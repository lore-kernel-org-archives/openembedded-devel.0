Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OlBjw-0002TE-RR
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 04:17:27 +0200
Received: by pvg6 with SMTP id 6so2159915pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 19:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=wlIX5wfDBOzsk6X6Xmiss6ik9h4C91H3ptoZodnWveQ=;
	b=bcNLEGfQyx61I/r7r7NG4InqyDoWUz51xtu29KoHN5NidUGP56wh0VdFhr9yJOIw8H
	i/NdU4OzmVBTmK/y51t7v7lQ59sjLWP7Q26hDpnX3EwqPZXxpOAUu8H6ecu0K83VueOL
	DCAPcW/XqYLdkA12U5ZbeFUwIBzY+U/1ZV5e8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=FukLzbCG45qmfJ5r7HOXo6zOg0IzbIpQUM0vx3bNaCdmj5XIWNQJ9p6znKbaz4eyox
	LzzIU4VjtpiONxMIwFd2kEJELgERZcW6TIxZ4XNA+kJKV2WSNahHTxs2734gNOer7axx
	KoCYvDwXsUIPc9DMJ7P0GUbJpTMSl4TbbJ0kk=
Received: by 10.114.53.20 with SMTP id b20mr7159153waa.56.1282011426124;
	Mon, 16 Aug 2010 19:17:06 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q6sm13323966waj.10.2010.08.16.19.17.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Aug 2010 19:17:05 -0700 (PDT)
Message-ID: <4C69F11C.8060808@gmail.com>
Date: Tue, 17 Aug 2010 11:47:00 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
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
Subject: Re: [oe-commits] Martin Jansa : eglibc: build with -ggdb3 as workaround for alignment traps
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
X-List-Received-Date: Tue, 17 Aug 2010 02:17:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Commit 0dee8eb3458f655ff7e21a898178051c521e5891 broke eglibc on mipsel.

mipsel-oe-linux-gcc -march=mips32 -mabi=32   -shared -static-libgcc -Wl,-O1  -Wl,-z,defs -Wl,-dynamic-linker=/lib/ld.so.1  -B/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/csu/  -Wl,--version-script=/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/libc.map -Wl,-soname=libc.so.6 -Wl,-z,relro -nostdlib -nostartfiles -e __libc_main -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/math -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/dlfcn -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nss -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nis -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svn
r10690/build-mipsel-oe-linux/rt -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/resolv -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/crypt -L/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nptl -Wl,-rpath-link=/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/math:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/dlfcn:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nss:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nis:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/rt:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/b
uild-mipsel-oe-linux/resolv:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/crypt:/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/nptl -o /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/libc.so -T /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/shlib.lds /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/csu/abi-note.o /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf/soinit.os /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/libc_pic.os /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf/sofini.os /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf/interp.os /mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/elf/ld.so -lgcc 
/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/libc_pic.os: In function `_mcount':
(.debug_macinfo+0x5ccf524): relocation truncated to fit: R_MIPS_HI16 against `_gp_disp'
collect2: ld returned 1 exit status
make[1]: *** [/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/build-mipsel-oe-linux/libc.so] Error 1
make[1]: Leaving directory `/mnt/oe/tmp/work/mipsel-oe-linux/eglibc-2.11-r11.6+svnr10690/eglibc-2_11/libc'
make: *** [all] Error 2
FATAL: oe_runmake failed


Full log.do_compile here: http://pastebin.com/k4D9etWP

-Graham


