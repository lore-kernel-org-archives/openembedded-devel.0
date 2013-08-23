Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f179.google.com (mail-ea0-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6B26B60609
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 21:49:43 +0000 (UTC)
Received: by mail-ea0-f179.google.com with SMTP id b10so524584eae.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=Zme4XWZAMqvQrC8i5xR/zG2Xk2JqXSWl78iCJz1Jnwc=;
	b=Qu0OPCyCfGAEtDUW8LC7iSIFdvUsdgCrFF2G/IqTa6LJIQP82Z10PBRcyAZOI31FcY
	dXoT4yhDt8RWf3SpwVvBZUrAeopmr9Y8l74IRjPFlzAfe/eRx8myoK7DU2z9Xz6FicT9
	9C+P0dWFfwWA8OSt9722MPY4Su8z082YACoKeYHYNklx5zzDNGkTdTGHFQUx7bHqb6fg
	Nv2wN2tI10/PbKjkkaSL8ptrqfyk0tl7aRBdrnOXW8GcHVCXo4nAfmE4DpuV5qRVQfqa
	tfwwfr9nRXahwcBBQlREc8B0kEug/nK86p1JhRR76wodne644Y2dZreScd2OgY18wBsk
	U14g==
X-Received: by 10.14.42.3 with SMTP id i3mr188848eeb.95.1377294583430;
	Fri, 23 Aug 2013 14:49:43 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm2395780eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 14:49:42 -0700 (PDT)
Date: Fri, 23 Aug 2013 23:50:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20130823215050.GE3544@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Naresh Bhat <naresh.bhat@linaro.org>
Subject: acpica failing to build
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
X-List-Received-Date: Fri, 23 Aug 2013 21:49:43 -0000
X-Groupsio-MsgNum: 45821
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Can you please check why it's sometimes failing like this:

| make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/acpica/20130626-r1/acpica-unix2-201=
30626/generate/unix/acpidump'
| 64-bit version of acpidump:
| -rwxr-xr-x 1 jenkins jenkins 121136 Aug 23 17:54 ../bin/acpidump
|=20
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtparserle=
x.o obj/dtparserlex.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbstats.o ../=
=2E./../source/components/debugger/dbstats.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtparserpa=
rse.o obj/dtparserparse.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/prparserle=
x.o obj/prparserlex.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_NAMES_APP -I../../../source/tools/acpinames -Wall -o obj/excreate.o =
=2E./../../source/components/executer/excreate.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbutils.o ../=
=2E./../source/components/debugger/dbutils.c
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOURCE -=
I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include =
-DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbxface.o ../=
=2E./../source/components/debugger/dbxface.c
| ../../../source/compiler/prparser.l:46:24: fatal error: prparser.y.h: No =
such file or directory
|  #include "prparser.y.h"
|                         ^
| compilation terminated.
| make[1]: *** [obj/prparserlex.o] Error 1
| make[1]: *** Waiting for unfinished jobs....

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIX2ToACgkQN1Ujt2V2gBxDqwCcCvV6P/y8yhhD0Dpa9QWWuN8b
ETQAnRYeivPpdT17nZqipaSNnAG0RAgU
=hzNv
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
