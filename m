Received: from [217.146.189.75] (helo=web23305.mail.ird.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <claudiu_fw85@yahoo.it>) id 1LCyiQ-0007V3-P6
	for openembedded-devel@openembedded.org; Wed, 17 Dec 2008 16:53:38 +0100
Received: (qmail 96676 invoked by uid 60001); 17 Dec 2008 15:49:05 -0000
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.it;
	h=X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Message-ID;
	b=q6vOvcVQZAU8lcyj81uuF126AK4B/Au2aqhVvMfoeFX6NpdOvHVmZnTSBsCqvF154EM3IH0cTJBw6OTZOocMx8Xl8yrVup3qlaM1m5dUaLhW2dPjuv3SCwOwMXWPAA5YbCQahnzX/XNW/fRrz0Ve4MUQYDSZWoZ5v9QiA/mAGnQ=;
X-YMail-OSG: N_.H0aEVM1lES9vdGftOIkQ7wMKK6eHKW.LFGPsU0ASFFdidlPZ7Mmo0
Received: from [87.9.252.243] by web23305.mail.ird.yahoo.com via HTTP;
	Wed, 17 Dec 2008 15:49:04 GMT
X-Mailer: YahooMailRC/1155.45 YahooMailWebService/0.7.260.1
Date: Wed, 17 Dec 2008 15:49:04 +0000 (GMT)
From: Claudiu mdc <claudiu_fw85@yahoo.it>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Message-ID: <149566.95991.qm@web23305.mail.ird.yahoo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: C compiler cannot create executables
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
X-List-Received-Date: Wed, 17 Dec 2008 15:53:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

hi, I am trying to build bootstrap-image and I have this error when buildin=
g libtool-cross:
| checking for i686-linux-gcc... i686-linux-gcc-4.3.1 -mcpu=3Dpentiumpro
| checking for C compiler default output file name...
| configure: error: C compiler cannot create executables
| See `config.log' for more details.

I've built a custom toolchain which is in $PATH.
~/oe$ i686-linux<TAB><TAB> gives this output:
i686-linux-addr2line        i686-linux-gccbug                 i686-linux-r=
anlib
i686-linux-ar                   i686-linux-gcov                     i686-l=
inux-readelf
i686-linux-as                   i686-linux-gprof                    i686-l=
inux-real-ld
i686-linux-c++filt             i686-linux-i686-linux-gcc       i686-linux-=
size
i686-linux-cpp                 i686-linux-ld                          i686=
-linux-strings
i686-linux-g++                i686-linux-nm                        i686-li=
nux-strip
i686-linux-gcc                 i686-linux-objcopy        
i686-linux-gcc-4.3.1        i686-linux-objdump

I've also tested the toolchain with hello.c program:
# ----------------------
#include<stdio.h>

int main(void)
{
    printf("Hello World!\n");
    return 0;
}
# ----------------------
~/tmpHello$ i686-linux-gcc-4.3.1 hello.c -o hello
and it works.

so, I don't understand why compile task fails with this error.



Some bits abountmy configuration:
I use org.openembedded.stable branch

Some lines from my local.conf:
MACHINE =3D "i686-generic"
TARGET_OS =3D "linux"
DISTRO =3D "unmaintained/generic"

ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}gcc"
ASSUME_PROVIDED +=3D "virtual/${TARGET_PREFIX}g++"

PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-i=
nitial"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"

###### stuff I added

TARGET_LDFLAGS_prepend =3D ", -L/home/claudiu/oe/myToolchain/cross/lib \
-Wl,-rpath-link,/home/claudiu/oe/myToolchain/cross/lib -Wl,-rpath-link "

TARGET_CPPFLAGS_append =3D ", -I/home/claudiu/oe/myToolchain/cross/include=
 "

export CC=3D"${CCACHE}i686-linux-gcc-4.3.1 ${HOST_CC_ARCH}"
export CXX=3D"${CCACHE}i686-linux-g++ ${HOST_CC_ARCH}"
export CPP=3D"i686-linux-gcc-4.3.1 -E"
export LD=3D"i686-linux-ld"
export AR=3D"i686-linux-ar"
export AS=3D"i686-linux-as"
export RANLIB=3D"i686-linux-ranlib"
export STRIP=3D"i686-linux-strip"



Someone can help me?



  
From gcho-openembedded-devel@m.gmane.org Wed Dec 17 17:04:34 2008
Received: from [80.91.229.2] (helo
