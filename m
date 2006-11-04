Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <acassis@gmail.com>) id 1GgPO4-0001hx-No
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Nov 2006 18:32:56 +0100
Received: by ug-out-1314.google.com with SMTP id e2so528319ugf
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Nov 2006 09:31:49 -0800 (PST)
Received: by 10.78.83.13 with SMTP id g13mr4472961hub.1162661508740;
	Sat, 04 Nov 2006 09:31:48 -0800 (PST)
Received: by 10.78.194.14 with HTTP; Sat, 4 Nov 2006 09:31:48 -0800 (PST)
Message-ID: <37367b3a0611040931y1820bd19y6e19e0b9890ed716@mail.gmail.com>
Date: Sat, 4 Nov 2006 11:31:48 -0600
From: "Alan Carvalho de Assis" <acassis@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Problems creating a bitbake package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Nov 2006 17:32:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,
I am new to bitbake package creation.

I am porting the Keith Packard's iPatience to GPE, to it I create this
ipatience.bb:
DESCRIPTION = "Patience game"
LICENSE = "GPL"
SECTION = "x11"
PRIORITY = "optional"
MAINTAINER = "Alan Carvalho de Assis <acassis@gmail.com>"
DEPENDS = "virtual/libx11 libxpm fltk"
PR = "r2"

SRC_URI = "http://augusta.ece.ufrgs.br/ipatience-0.1.tar.gz"

inherit gpe

My first problem:
"bitbake ipatience" command don't obey my SRC_URI tag, this tried
download ipatience-0.1.tar.gz from openembedded server and fault.

To "solve" this first problem I copied ipatience.tar.gz to my
oeworkspace/sources and create the md5 to it, then bitbake used it
correctly. Why bitbake don't obey the SRC_URI?

The original ipatience was using Imakefile, because it need xmkmf I
created a automake Makefile.am e configure.in. After a lot errors I
get it compiling.

But the libfltk from openembedded FLTK package has a problem:

/ipaq/openembedded/bitbake/tmp/staging/arm-linux/lib/libfltk.so:
undefined reference to `XUnsetICFocus'
/ipaq/openembedded/bitbake/tmp/staging/arm-linux/lib/libfltk.so:
undefined reference to `XGetIMValues'
/ipaq/openembedded/bitbake/tmp/staging/arm-linux/lib/libfltk.so:
undefined reference to `XSetICValues'
/ipaq/openembedded/bitbake/tmp/staging/arm-linux/lib/libfltk.so:
undefined reference to `Xutf8LookupString'
/ipaq/openembedded/bitbake/tmp/staging/arm-linux/lib/libfltk.so:
undefined reference to `XSetICFocus'
/ipaq/openembedded/bitbake/tmp/staging/arm-linux/lib/libfltk.so:
undefined reference to `XVaCreateNestedList'
| collect2: ld returned 1 exit status
| make: ** [ipatience] Erro 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/ipaq/openembedded/bitbake/tmp/work/arm-linux/ipatience-0.1-r2/temp/log.do_compile.16138
NOTE: package ipatience-0.1-r2: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package ipatience-0.1: failed
ERROR: Build of ipatience failed

The libX11 don't has this functions which libfltk use.

Please, can someone help me?
I spend a long time searching about so many problems which I got doing
it, for all problems I found one solution or work-around, but don't
found nothing to this last one.

Best regards,

Alan


