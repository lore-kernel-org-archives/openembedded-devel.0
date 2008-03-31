Received: from [66.249.82.226] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <e.robertson.svg@gmail.com>) id 1JgKgQ-0001EE-Fk
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Mar 2008 16:08:22 +0200
Received: by wx-out-0506.google.com with SMTP id h27so1872092wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2008 07:08:19 -0700 (PDT)
Received: by 10.100.105.15 with SMTP id d15mr16073602anc.32.1206972496645;
	Mon, 31 Mar 2008 07:08:16 -0700 (PDT)
Received: from debian ( [74.254.162.162])
	by mx.google.com with ESMTPS id 6sm7336070agd.23.2008.03.31.07.08.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Mar 2008 07:08:15 -0700 (PDT)
From: E Robertson <e.robertson.svg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2008 09:07:48 -0500
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200803310907.56781.e.robertson.svg@gmail.com>
Subject: New OE user question
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
X-List-Received-Date: Mon, 31 Mar 2008 14:08:22 -0000
X-Groupsio-MsgNum: 4849
Content-Type: multipart/signed; boundary="nextPart1564851.AzNPKlLlpV";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--nextPart1564851.AzNPKlLlpV
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi All,

I'm brand new to OE and I've been following the documentation steps along t=
he=20
way. I notice the documentation is either missing sections or not clear and=
=20
as I learn how to use this tool, I would like to update the documentation=20
sections. It's probably the least I could do as I figure out how this works=
=2E=20
I'm referirng to the user manual wiki. Both configuring and building sectio=
ns=20
are missing clarity.
Who is responsible for the manual and how do I submit info to the sections?

I got the tools built and running bitbake 1.8.10 and pulled=20
org.openembedded.dev branch. I tried to build both nano and helloworld and=
=20
couldn't get pass the following error. I have chosen the generic-uclibc=20
DISTRO for starters.

bitbake helloworld

NOTE: Psyco JIT Compiler (http://psyco.sf.net) not available. Install it to=
=20
increase performance.
NOTE: Handling BitBake files: \ (5334/5334) [100 %]
NOTE: Parsing finished. 5070 cached, 0 parsed, 264 skipped, 0 masked.
NOTE: build 200803310852: started

OE Build Configuration:
BB_VERSION     =3D "1.8.10"
OE_REVISION    =3D "53456ed8edb2c9fe305ce7764182d17d7c84e129"
TARGET_ARCH    =3D "arm"
TARGET_OS      =3D "linux-uclibc"
MACHINE        =3D "at91sam9263ek"
DISTRO         =3D "generic-uclibc"
DISTRO_VERSION =3D ".dev-snapshot-20080331"
TARGET_FPU     =3D "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 127 of 178 (ID:=20
58, /OpenEmbedded_Stuff/org.openembedded.dev/packages/uclibc/uclibc_0.9.28.=
bb,=20
do_compile)
NOTE: package uclibc-0.9.28: started
NOTE: package uclibc-0.9.28-r11: task do_compile: started
ERROR: function do_compile failed
ERROR: log data follows=20
(/OpenEmbedded_Stuff/oetmp/work/armv5te-linux-uclibc/uclibc-0.9.28-r11/temp=
/log.do_compile.3578)
| NOTE: make STRIPTOOL=3Dtrue LD=3Darm-linux-uclibc-ld=20
LOCALE_DATA_FILENAME=3DuClibc-locale-030818.arm.tgz CC=3Dccache=20
arm-linux-uclibc-gcc -march=3Darmv5te -mtune=3Darm926ej-s
|=20
+ ./extra/scripts/fix_includes.sh -k /OpenEmbedded_Stuff/oetmp/staging/arm-=
linux-uclibc//usr -t=20
arm
| Unable to determine version for kernel headers
|       provided in=20
directory /OpenEmbedded_Stuff/oetmp/staging/arm-linux-uclibc//usr
| make: *** [headers] Error 1
| FATAL: oe_runmake failed
NOTE: Task=20
failed: /OpenEmbedded_Stuff/oetmp/work/armv5te-linux-uclibc/uclibc-0.9.28-r=
11/temp/log.do_compile.3578
NOTE: package uclibc-0.9.28-r11: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package uclibc-0.9.28: failed
ERROR: Build=20
of /OpenEmbedded_Stuff/org.openembedded.dev/packages/uclibc/uclibc_0.9.28.b=
b=20
do_compile failed
ERROR: Task 58=20
(/OpenEmbedded_Stuff/org.openembedded.dev/packages/uclibc/uclibc_0.9.28.bb,=
=20
do_compile) failed
NOTE: Tasks Summary: Attempted 126 tasks of which 126 didn't need to be rer=
un=20
and 1 failed.
ERROR: '/OpenEmbedded_Stuff/org.openembedded.dev/packages/uclibc/uclibc_0.9=
=2E28.bb'=20
failed

--nextPart1564851.AzNPKlLlpV
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBH8PA82sS31XKVICURAofXAJ4mtbDaio18DMil9FcWZN5FummiyACeJA/8
J+a4EPLhQ+omW1VAQy9Ljy4=
=RCNw
-----END PGP SIGNATURE-----

--nextPart1564851.AzNPKlLlpV--
