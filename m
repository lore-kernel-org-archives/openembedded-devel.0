Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 83E1C73CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:16:41 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so78712004pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2015 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=APEIXD5k+yWeMXc2UckhVCWiTPfYVGbGhmxFUHl5u2M=;
	b=HA+Errn9W8jUrqQT80TesVWKRCAIumucZwSB5BHVQ7jjzo90vSBaz7FBAb3UafyCV6
	bEa4mTJRSHQu7q3YzaNLDKxGnAPAtV8NClubD8B9Q8rvy6C0vGkxz83m8OXKTz0sFdhO
	sZ9hIFznMX4qlG1PerWz3GnuFXm3MiPVC7+b725OZ6/RwZ1fd7IMG4C/VTdT1wEmUTdG
	YmnLrQ0Bh2lBTBrsz/j4DCHEP/JJY0rHJTzK1YFkbXLuj9FJroqkvr9fqTUFnjx8No4j
	P+l2Cg+rsst96qfb9hn2rXvvOOFZ40PuVL7F6T3xo9ooNzR4WNi5PEmdaqbdKpCIG0C7
	g0PA==
X-Received: by 10.66.131.10 with SMTP id oi10mr13467258pab.87.1444375002014;
	Fri, 09 Oct 2015 00:16:42 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:24ad:a72d:669c:5092?
	([2601:646:8601:4580:24ad:a72d:669c:5092])
	by smtp.gmail.com with ESMTPSA id a17sm379623pbu.55.2015.10.09.00.16.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Oct 2015 00:16:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1444291115-1950-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Fri, 9 Oct 2015 00:16:40 -0700
Message-Id: <E2647E29-B9F0-4C1B-A1EA-23C057EF5011@gmail.com>
References: <1444291115-1950-1-git-send-email-lixin.fnst@cn.fujitsu.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.1)
Subject: Re: [meta-oe][PATCH] iptraf: add new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 07:16:41 -0000
X-Groupsio-MsgNum: 57746
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BF56A2E0-D3EA-4649-9706-A2CE7D9C0BDC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BF56A2E0-D3EA-4649-9706-A2CE7D9C0BDC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 8, 2015, at 12:58 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
>=20
> From: Li Xin <lixin.fnst@cn.fujitsu.com>
>=20
> IPTraf is a console-based network statistics utility for Linux.
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
> .../0001-src-Fix-error-in-cross-compile.patch      | 138 =
+++++++++++++++++++++
> meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb    |  33 +++++
> 2 files changed, 171 insertions(+)
> create mode 100644 =
meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compile=
.patch
> create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
>=20
> diff --git =
a/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compi=
le.patch =
b/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compi=
le.patch
> new file mode 100644
> index 0000000..291ed31
> --- /dev/null
> +++ =
b/meta-oe/recipes-devtools/iptraf/iptraf/0001-src-Fix-error-in-cross-compi=
le.patch
> @@ -0,0 +1,138 @@
> +=46rom 27910ea19260b7f7a3f9c0465addd1dea80cf3bd Mon Sep 17 00:00:00 =
2001
> +From: Li Xin <lixin.fnst@cn.fujitsu.com>
> +Date: Thu, 8 Oct 2015 15:11:17 +0900
> +Subject: [PATCH] src: Fix error in cross-compile
> +
> +The errors are like this:
> +tcptable.h:26:25: fatal error: linux/if_tr.h: No such file or =
directory
> +ld: cannot find -ltextbox
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> +---
> + src/Makefile     | 2 +-
> + src/hostmon.c    | 2 +-
> + src/install.sh   | 4 ++--
> + src/othptab.c    | 2 +-
> + src/packet.c     | 2 +-
> + src/tcptable.h   | 2 +-
> + src/tr.c         | 2 +-
> + support/Makefile | 3 +--
> + 8 files changed, 9 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index 2043c2d..0f77bea 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -39,7 +39,7 @@ LDOPTS		=3D #-static
> + # you may want to change this to point to your ncurses include =
directory
> + # if the ncurses include files are not in the default location.
> +
> +-INCLUDEDIR	=3D -I/usr/include/ncurses -I../support
> ++INCLUDEDIR	=3D  -I../support
> +
> + # You can uncomment this one to disable the backspace key in input =
fields.
> + # This means you must use the Del key or Ctrl+H combination to erase =
the
> +diff --git a/src/hostmon.c b/src/hostmon.c
> +index 14df2c8..6571562 100644
> +--- a/src/hostmon.c
> ++++ b/src/hostmon.c
> +@@ -31,7 +31,7 @@ details.
> + #include <linux/if_packet.h>
> + #include <linux/if_ether.h>
> + #include <linux/if_fddi.h>
> +-#include <linux/if_tr.h>
> ++#include <netinet/if_tr.h>
> + #include <net/if_arp.h>
> + #include <stdlib.h>
> + #include <time.h>
> +diff --git a/src/install.sh b/src/install.sh
> +index d2fd360..36d3516 100755
> +--- a/src/install.sh
> ++++ b/src/install.sh
> +@@ -23,9 +23,9 @@ echo
> + echo "*** Installing executable programs and preparing work =
directories"
> + echo
> + echo ">>> Installing iptraf in $TARGET"
> +-$INSTALL -m 0700 -o root -g root -s iptraf $TARGET
> ++$INSTALL -m 0700 -o root -g root  iptraf $TARGET
> + echo ">>> Installing rvnamed in $TARGET"
> +-$INSTALL -m 0700 -o root -g root -s rvnamed $TARGET
> ++$INSTALL -m 0700 -o root -g root  rvnamed $TARGET
> +
> + if [ ! -d $WORKDIR ]; then
> +     echo ">>> Creating IPTraf work directory $WORKDIR"
> +diff --git a/src/othptab.c b/src/othptab.c
> +index 97771d1..a8bb536 100644
> +--- a/src/othptab.c
> ++++ b/src/othptab.c
> +@@ -18,7 +18,7 @@ details.
> +
> + #include <asm/types.h>
> + #include <linux/if_ether.h>
> +-#include <linux/if_tr.h>
> ++#include <netinet/if_tr.h>
> + #include <linux/if_fddi.h>
> + #include <winops.h>
> + #include "arphdr.h"
> +diff --git a/src/packet.c b/src/packet.c
> +index 33fdf2a..1e2b81b 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -36,7 +36,7 @@ details.
> + #include <linux/if_packet.h>
> + #include <linux/if_ether.h>
> + #include <linux/if_fddi.h>
> +-#include <linux/if_tr.h>
> ++#include <netinet/if_tr.h>
> + #include <linux/isdn.h>
> + #include <linux/sockios.h>
> + #include <msgboxes.h>
> +diff --git a/src/tcptable.h b/src/tcptable.h
> +index 3e17793..d1380b5 100644
> +--- a/src/tcptable.h
> ++++ b/src/tcptable.h
> +@@ -23,7 +23,7 @@
> + #include <linux/if_packet.h>
> + #include <linux/if_ether.h>
> + #include <linux/if_fddi.h>
> +-#include <linux/if_tr.h>
> ++#include <netinet/if_tr.h>
> + #include <net/if.h>
> + #include <netinet/ip.h>
> + #include <netinet/udp.h>
> +diff --git a/src/tr.c b/src/tr.c
> +index 40c9e63..11f8045 100644
> +--- a/src/tr.c
> ++++ b/src/tr.c
> +@@ -7,7 +7,7 @@
> +  */
> +
> + #include <asm/types.h>
> +-#include <linux/if_tr.h>
> ++#include <netinet/if_tr.h>
> + #include <netinet/in.h>
> +
> + unsigned int get_tr_ip_offset(unsigned char *pkt)
> +diff --git a/support/Makefile b/support/Makefile
> +index 114bfc3..c962c09 100644
> +--- a/support/Makefile
> ++++ b/support/Makefile
> +@@ -1,4 +1,3 @@
> +-INCLUDEDIR		=3D -I/usr/include/ncurses
> +
> + OBJS			=3D input.o menurt.o listbox.o winops.o =
labels.o \
> + 				msgboxes.o txbox.o
> +@@ -12,7 +11,7 @@ libtextbox.a: $(OBJS)
> + #	gcc -shared -o libtextbox.so $(OBJS)
> +
> + %.o: %.c *.h
> +-	gcc -O2 -g -Wall -fPIC $(INCLUDEDIR) -c -o $*.o $<
> ++	${CC} -O2 -g -Wall -fPIC  -c -o $*.o $<
> +
> + clean:
> + 	rm -rf *.o *~ libtextbox.a libtextbox.so
> +--
> +1.8.4.2
> +
> diff --git a/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb =
b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
> new file mode 100644
> index 0000000..7b8f0db
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/iptraf/iptraf_3.0.0.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION =3D "IPTraf is a console-based network statistics utility =
for Linux. \
> +It gathers a variety of figures such as TCP connection packet and =
byte counts, \
> +interface statistics and activity indicators, TCP/UDP traffic =
breakdowns, \
> +and LAN station packet and byte counts."
> +
> +HOMEPAGE =3D "http://iptraf.seul.org"
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Ddc0bdc29df738baf327368b1bbb15a45"
> +
> +DEPENDS =3D "ncurses"
> +
> +SRC_URI =3D " \
> +    ftp://iptraf.seul.org/pub/iptraf/iptraf-3.0.0.tar.gz \
> +    file://0001-src-Fix-error-in-cross-compile.patch"
> +SRC_URI[md5sum] =3D "377371c28ee3c21a76f7024920649ea8"
> +SRC_URI[sha256sum] =3D =
"9ee433d95573d612539da4b452e6cdcbca6ab6674a88bfbf6eaf12d4902b5163"
> +RDEPENDS_${PN} =3D "ncurses"
> +
> +do_compile() {
> +    oe_runmake -C src all
> +}
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    oe_runmake -C src install \
> +        TARGET=3D${D}${bindir} \
> +        WORKDIR=3D${D}${localstatedir}/local/iptraf \
> +        LOGDIR=3D${D}${localstatedir}/log/iptraf \
> +        LOCKDIR=3D${D}${localstatedir}/run/iptraf
> +}
> +
> +FILES_${PN} +=3D "${bindir} ${localstatedir} /run=E2=80=9D

you may not package /run since its dynamically created. Think of other =
ways to create the files it
needs in /run at runtime dynamically

> --
> 1.8.4.2
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_BF56A2E0-D3EA-4649-9706-A2CE7D9C0BDC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYXadgACgkQuwUzVZGdMxTBUQCdF7a6tsMqGTgaPpZeks3TFxvg
ozsAnjdhepjrO+waEzjQZgApyHf8Rtjp
=C9iM
-----END PGP SIGNATURE-----

--Apple-Mail=_BF56A2E0-D3EA-4649-9706-A2CE7D9C0BDC--
