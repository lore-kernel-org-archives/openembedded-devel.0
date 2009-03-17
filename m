Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1Ljf5G-0007ai-0w
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 20:36:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id B90E6502762D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 16:40:43 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBuqE+pEjO4J
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 16:40:39 -0300 (BRT)
Received: from [192.168.15.103] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 1DE43502762C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2009 16:40:37 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1237314240.6587.84.camel@northpole>
References: <1237314240.6587.84.camel@northpole>
Organization: 2MI Tecnologia
Date: Tue, 17 Mar 2009 16:35:21 -0300
Message-Id: <1237318521.6587.89.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml2-native including system zlib
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
X-List-Received-Date: Tue, 17 Mar 2009 19:36:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em Ter, 2009-03-17 =C3=A0s 15:24 -0300, Jader H. Silva escreveu:
> Hello again.
> I'm trying to build an i586 x11-image, but I cannot pass libxml2-native
> do_compile task, it seems it includes the host libz.h.
>=20
> Error:
>=20
> | i686-linux-libtool: link: ccache gcc
> -isystem/home/jader/oe/build/conf/tmp/staging/i686-linux/usr/include -O=
2
> -pedantic -W -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch
> -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts -Wuninitialized
> -Wparentheses -Wshadow -Wpointer-arith -Wcast-align -Wwrite-strings
> -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes
> -Wnested-externs -Winline -Wredundant-decls -Wl,-rpath-link
> -Wl,/home/jader/oe/build/conf/tmp/staging/i686-linux/usr/lib -Wl,-rpath
> -Wl,/home/jader/oe/build/conf/tmp/staging/i686-linux/usr/lib -Wl,-O1
> -o .libs/xmllint xmllint.o
> -L/home/jader/oe/build/conf/tmp/staging/i686-linux/usr/lib ./.libs/libx=
ml2.so -ldl /home/jader/oe/build/conf/tmp/staging/i686-linux/usr/lib/libz=
.so -lm -Wl,-rpath -Wl,/home/jader/oe/build/conf/tmp/staging/i686-linux/u=
sr/lib
> |
> | ./.libs/libxml2.so: undefined reference to `gzopen64'
> | collect2: ld returned 1 exit status
> | make[2]: *** [xmllint] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | mv -f .deps/testapi.Tpo .deps/testapi.Po
> | make[2]: Leaving directory
> `/home/jader/oe/build/conf/tmp/work/i686-linux/libxml2-native-2.7.2-r0/=
libxml2-2.7.2'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/jader/oe/build/conf/tmp/work/i686-linux/libxml2-native-2.7.2-r0/=
libxml2-2.7.2'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
>=20
>=20
>=20
>=20
>=20
> Found gzopen in libxmlIO.c. gzopen is defined as gzopen64
> in /usr/include/zlib.h, also, if i run make CFLAGS+=3D--verbose, I get
> (stripped):
>=20
> ccache gcc -DHAVE_CONFIG_H -I. -I./include -I./include  -D_REENTRANT
> -isystem/home/jader/oe/build/conf/tmp/staging/i686-linux/usr/include
> -isystem/home/j
> ader/oe/build/conf/tmp/staging/i686-linux/usr/include -O2 -pedantic -W
> -Wformat -Wunused -Wimplicit -Wreturn-type -Wswitch -Wcomment
> -Wtrigraphs -Wformat -Wc
> har-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arith
> -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes
> -Wmissing-prototype
> s -Wnested-externs -Winline -Wredundant-decls -MT xmlIO.o -MD -MP
> -MF .deps/xmlIO.Tpo -c -o xmlIO.o xmlIO.c
>=20
>=20
> [...]
> gcc version 4.2.4 (Ubuntu 4.2.4-1ubuntu3)
>  /usr/lib/gcc/i486-linux-gnu/4.2.4/cc1 -E -quiet -v -I. -I./include
> -I./include -MD xmlIO.d -MF .deps/xmlIO.Tpo -MP -MT xmlIO.o
> -isystem /usr/include -DHAVE_CONFIG_H -D_REENTRANT
> -isystem/home/jader/oe/build/conf/tmp/staging/i686-linux/usr/include
> xmlIO.c -mtune=3Dgeneric
> [...]
> #include "..." search starts here:
> #include <...> search starts here:
>  .
>  ./include
>  /usr/include
>  /home/jader/oe/build/conf/tmp/staging/i686-linux/usr/include
>  /usr/local/include
>  /usr/lib/gcc/i486-linux-gnu/4.2.4/include
> End of search list.
> Reading specs from /usr/lib/gcc/i486-linux-gnu/4.2.4/specs
> Target: i486-linux-gnu
>=20
>=20
>=20
>=20
>=20
>=20
> -isystem /usr/include is set on cc1, so it invalidate include
> path /home/jader/oe/build/conf/tmp/staging/i686-linux/usr/include (wher=
e
> zlib.h is).
>=20
>=20
>=20
> Is it correct for Makefile to use my system GCC ?
> Can anybody help me to compile it correctly?
>=20
>=20
> Thanks in advance

Nevermind, set --with-zlib=3D${STAGING_INCDIR}/zlib.h in packages/libxml/=
libxml2-native.inc and it compiled
successfully.

Att.


Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia








