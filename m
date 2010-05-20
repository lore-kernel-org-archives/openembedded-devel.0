Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OFDiC-000898-Ff
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 May 2010 23:55:30 +0200
Received: by fxm8 with SMTP id 8so326978fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 14:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=3+FnhRRicY99EOuXH3rrlzuHyigeSUWZEg3gT3QeJ9A=;
	b=oWer+H5xNqsbWQ4fWtVFbWBKl87uoQohkj8PjZnULvS8WqhP3PplyxwrJlgX8ZLi9c
	8F+IukbsGB2feqr6rRh2wL4qheqeyIQdjAIz5fSyaiTDJ0EmS367SE0n4iJQNx8uN+gj
	urHMR7/kEkn9epOqDGdB+U9HQP81o6InklaL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=aMEHTWB66yyYVB1WWVjfFewDE5gjdoyWTtMX6d1npW8HP5Ba7X6pYyLm6cfFiGhlaP
	5C/SMxjR4N0yCjtBEFwus6O8O4oHvtnKHlD8p+qAff0zbOdvizhAjHWnn6qBEW2p84j+
	RNJK+DOKCRyVhsNfQ63ClSVQKwd8COLLPEgPU=
MIME-Version: 1.0
Received: by 10.103.85.26 with SMTP id n26mr1212919mul.5.1274392285680; Thu, 
	20 May 2010 14:51:25 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Thu, 20 May 2010 14:51:25 -0700 (PDT)
Date: Thu, 20 May 2010 23:51:25 +0200
Message-ID: <AANLkTilUZ3dToBwFw4QzKZkyrDUxT2Y2rO7T3CvYNjQ-@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Problem with building glibc
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
X-List-Received-Date: Thu, 20 May 2010 21:55:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

many thanks for the earlier help. I have change my /conf/distro/colibri.con=
f
file and building of busybox package went futher.

However, I have stopped on building glibc. I read lots of treads concerning
this problem but nothing helped at all.

I found this but I don't know how to apply it to my problem. I use Ubuntu
9.1, gcc 4.41.

http://sourceware.org/bugzilla/show_bug.cgi?id=3D5203

Could you please help me with this? I am very new to bitbake...


Kind Regards,
Grzegorz

A log file is attached at the bottom of this e-mail.
--------------------------------------------------------------

NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 297 of 374 (ID: 107,
/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.9.bb, do_compile)
ERROR: function do_compile failed
ERROR: log data follows
(/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
temp/log.do_compile.8144)
| NOTE: make rootsbindir=3D/sbin
| make -r PARALLELMFLAGS=3D"" CVSOPTS=3D"" -C
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/g=
libc-2.9
objdir=3D`pwd` all
| make[1]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9'
| make  subdir=3Dcsu -C csu ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/csu'
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/csu'
| make  subdir=3Diconv -C iconv ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/iconv'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/iconv'
| make  subdir=3Dlocale -C locale ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/locale'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/locale'
| make  subdir=3Dlocaledata -C localedata ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/localedata'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/localedata'
| make  subdir=3Diconvdata -C iconvdata ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/iconvdata'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/iconvdata'
| make  subdir=3Dassert -C assert ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/assert'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/assert'
| make  subdir=3Dctype -C ctype ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/ctype'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/ctype'
| make  subdir=3Dintl -C intl ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/intl'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/intl'
| make  subdir=3Dcatgets -C catgets ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/catgets'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/catgets'
| make  subdir=3Dmath -C math ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/math'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/math'
| make  subdir=3Dsetjmp -C setjmp ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/setjmp'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/setjmp'
| make  subdir=3Dsignal -C signal ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/signal'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/signal'
| make  subdir=3Dstdlib -C stdlib ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/stdlib'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/stdlib'
| make  subdir=3Dstdio-common -C stdio-common ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/stdio-common'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/stdio-common'
| make  subdir=3Dlibio -C libio ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/libio'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/libio'
| make  subdir=3Ddlfcn -C dlfcn ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/dlfcn'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/dlfcn'
| make  subdir=3Dmalloc -C malloc ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/malloc'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/malloc'
| make  subdir=3Dstring -C string ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/string'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/string'
| make  subdir=3Dwcsmbs -C wcsmbs ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/wcsmbs'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/wcsmbs'
| make  subdir=3Dtimezone -C timezone ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/timezone'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/timezone'
| make  subdir=3Dtime -C time ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/time'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/time'
| make  subdir=3Ddirent -C dirent ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/dirent'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/dirent'
| make  subdir=3Dgrp -C grp ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/grp'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/grp'
| make  subdir=3Dpwd -C pwd ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/pwd'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/pwd'
| make  subdir=3Dposix -C posix ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/posix'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/posix'
| make  subdir=3Dio -C io ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/io'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/io'
| make  subdir=3Dtermios -C termios ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/termios'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/termios'
| make  subdir=3Dresource -C resource ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/resource'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/resource'
| make  subdir=3Dmisc -C misc ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/misc'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/misc'
| make  subdir=3Dsocket -C socket ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/socket'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/socket'
| make  subdir=3Dsysvipc -C sysvipc ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/sysvipc'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/sysvipc'
| make  subdir=3Dgmon -C gmon ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/gmon'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/gmon'
| make  subdir=3Dgnulib -C gnulib ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/gnulib'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/gnulib'
| make  subdir=3Dwctype -C wctype ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/wctype'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/wctype'
| make  subdir=3Dmanual -C manual ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/manual'
| make[2]: `subdir_lib' is up to date.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/manual'
| make  subdir=3Dshadow -C shadow ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/shadow'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/shadow'
| make  subdir=3Dpo -C po ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/po'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/po'
| make  subdir=3Dargp -C argp ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/argp'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/argp'
| make  subdir=3Dcrypt -C crypt ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/crypt'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/crypt'
| make  subdir=3Dnptl -C nptl ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nptl'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nptl'
| make  subdir=3Dresolv -C resolv ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/resolv'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/resolv'
| make  subdir=3Dnss -C nss ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nss'
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nss'
| make  subdir=3Drt -C rt ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/rt'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/rt'
| make  subdir=3Dconform -C conform ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/conform'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/conform'
| make  subdir=3Ddebug -C debug ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/debug'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/debug'
| make  subdir=3Dlibidn -C libidn ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/libidn'
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/libidn'
| make  subdir=3Dnptl_db -C nptl_db ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nptl_db'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nptl_db'
| make  subdir=3Dinet -C inet ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/inet'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/inet'
| make  subdir=3Dhesiod -C hesiod ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/hesiod'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/hesiod'
| make  subdir=3Dsunrpc -C sunrpc ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/sunrpc'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/sunrpc'
| make  subdir=3Dnis -C nis ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nis'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nis'
| make  subdir=3Dnscd -C nscd ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nscd'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nscd'
| make  subdir=3Dstreams -C streams ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/streams'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/streams'
| make  subdir=3Dlogin -C login ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/login'
| make[2]: Nothing to be done for `subdir_lib'.
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/login'
| make  subdir=3Delf -C elf ..=3D../ subdir_lib
| make[2]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/elf'
| make -f
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/elf/
librtld.mk -f rtld-Rules
| make[3]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/elf'
| make subdir=3Dcsu -C ../csu ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-check_fds.os
rtld-errno.os rtld-divdi3.os rtld-sysdep.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/csu'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/csu'
| make subdir=3Dgmon -C ../gmon ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-profil.os
rtld-prof-freq.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/gmon'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/gmon'
| make subdir=3Dio -C ../io ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-xstat64.os
rtld-fxstat64.os rtld-open.os rtld-close.os rtld-read.os rtld-write.os
rtld-lseek.os rtld-access.os rtld-fcntl.os rtld-getcwd.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/io'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/io'
| make subdir=3Dmisc -C ../misc ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-getpagesize.=
os
rtld-mmap.os rtld-munmap.os rtld-mprotect.os rtld-makedev.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/misc'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/misc'
| make subdir=3Dnptl -C ../nptl ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all
rtld-modules=3D'rtld-libc-cancellation.os rtld-libc_multiple_threads.os
rtld-forward.os rtld-libc-lowlevellock.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nptl'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/nptl'
| make subdir=3Dposix -C ../posix ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-uname.os
rtld-_exit.os rtld-getpid.os rtld-environ.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/posix'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/posix'
| make subdir=3Dsetjmp -C ../setjmp ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-setjmp.os
rtld-__longjmp.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/setjmp'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/setjmp'
| make subdir=3Dsignal -C ../signal ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-sigaction.os
rtld-sigrestorer.os rtld-raise.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/signal'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/signal'
| make subdir=3Dstdlib -C ../stdlib ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-exit.os
rtld-cxa_atexit.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/stdlib'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/stdlib'
| make subdir=3Dstring -C ../string ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-strchr.os
rtld-strcmp.os rtld-strlen.os rtld-strnlen.os rtld-memchr.os rtld-memcmp.os
rtld-memmove.os rtld-memset.os rtld-mempcpy.os rtld-stpcpy.os rtld-memcpy.o=
s
rtld-wordcopy.os rtld-rawmemchr.os'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/string'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/string'
| make subdir=3Dtime -C ../time ..=3D../
objdir=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.=
9-r36.3/build-arm-colibri-linux-gnueabi
-f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'rtld-setitimer.os=
'
| make[4]: Entering directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/time'
| make[4]: Nothing to be done for `rtld-all'.
| make[4]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/time'
| make[3]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/elf'
| make[2]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9/elf'
| arm-colibri-linux-gnueabi-gcc -march=3Diwmmxt -mcpu=3Diwmmxt -mtune=3Diwm=
mxt
-shared -static-libgcc -Wl,-O1  -Wl,-z,defs
-Wl,-dynamic-linker=3D/lib/ld-linux.so.3
-B/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/csu/
-Wl,--version-script=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gn=
ueabi/glibc-2.9-r36.3/build-arm-colibri-linux-gnueabi/libc.map
-Wl,-soname=3Dlibc.so.6 -Wl,-z,combreloc -Wl,-z,relro -Wl,--hash-style=3Dbo=
th
-nostdlib -nostartfiles -e __libc_main
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/math
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/elf
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/dlfcn
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/nss
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/nis
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/rt
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/resolv
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/crypt
-L/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/nptl
-Wl,-rpath-link=3D/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi=
/glibc-2.9-r36.3/build-arm-colibri-linux-gnueabi:/home/grzesiek/tele/tmp/wo=
rk/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/build-arm-colibri-linux-gnu=
eabi/math:/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2=
.9-r36.3/build-arm-colibri-linux-gnueabi/elf:/home/grzesiek/tele/tmp/work/i=
wmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/build-arm-colibri-linux-gnueabi=
/dlfcn:/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-=
r36.3/build-arm-colibri-linux-gnueabi/nss:/home/grzesiek/tele/tmp/work/iwmm=
xt-colibri-linux-gnueabi/glibc-2.9-r36.3/build-arm-colibri-linux-gnueabi/ni=
s:/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3=
/build-arm-colibri-linux-gnueabi/rt:/home/grzesiek/tele/tmp/work/iwmmxt-col=
ibri-linux-gnueabi/glibc-2.9-r36.3/build-arm-colibri-linux-gnueabi/resolv:/=
home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/bu=
ild-arm-colibri-linux-gnueabi/crypt:/home/grzesiek/tele/tmp/work/iwmmxt-col=
ibri-linux-gnueabi/glibc-2.9-r36.3/build-arm-colibri-linux-gnueabi/nptl
-o
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/libc.so
-T
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/shlib.lds
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/csu/abi-note.o
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/elf/soinit.os
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/libc_pic.os
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/elf/sofini.os
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/elf/interp.os
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/elf/ld.so
-lgcc
|
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/b=
uild-arm-colibri-linux-gnueabi/libc_pic.os:
In function `faccessat':
| find_exidx.c:(.text+0x901c4): undefined reference to `fstatat64'
| collect2: ld returned 1 exit status
| make[1]: ***
[/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
build-arm-colibri-linux-gnueabi/libc.so]
Error 1
| make[1]: Leaving directory
`/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/=
glibc-2.9'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/grzesiek/tele/tmp/work/iwmmxt-colibri-linux-gnueabi/glibc-2.9-r36.3/t=
emp/log.do_compile.8144
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.9.bbdo_compile
failed
ERROR: Task 107 (/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.9.b=
b,
do_compile) failed
NOTE: Tasks Summary: Attempted 296 tasks of which 296 didn't need to be
rerun and 1 failed.
ERROR: '/home/grzesiek/tele/openembedded/recipes/glibc/glibc_2.9.bb' failed

