Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 46F306A95B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 07:03:48 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1385109eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2brxgz8cF11UutvgkJvQPKvyQOjGhPVmrEurVfhHKBk=;
	b=FMYvlIogJ+p305Z3NoDoax86Tnh0dav8Tk2SJTN98WHvn15qgCCzXv1oLKu2ZCmQgF
	0n0ivEFubCK0AjjpXaLBo3vEru05dcUx+7LdNLYngzyCzNbyGJEYjxUVk3/zufk2nPvo
	o7JBUp0h1pEB9/siCRcpWC/KqbH1QAC294LF5nSH3QEJznWy38J1MvfQFD6yphwrPzMa
	+o9pvsNrhEJnBut04aZxbc6C1kPqTccNPReBYmap75tmm6s8yl65fXpqOw1mfusVzNVh
	CsfhiuoyLCMocmr5HHA93uUI/kyWTj9Tp8PHLWqZsPvyrVPoDzV03BZ+h7LmHDxGs39a
	knCw==
X-Received: by 10.15.63.14 with SMTP id l14mr18592870eex.13.1377500628115;
	Mon, 26 Aug 2013 00:03:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b45sm19112341eef.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 00:03:47 -0700 (PDT)
Date: Mon, 26 Aug 2013 09:04:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Naresh Bhat <naresh.bhat@linaro.org>
Message-ID: <20130826070457.GK3544@jama>
References: <20130823215050.GE3544@jama>
	<CAFoFrHahfobkP_i-y0+nQpiB-YWoO2C8OXaviKuHbQTNjdgQ-A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFoFrHahfobkP_i-y0+nQpiB-YWoO2C8OXaviKuHbQTNjdgQ-A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: acpica failing to build
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
X-List-Received-Date: Mon, 26 Aug 2013 07:03:49 -0000
X-Groupsio-MsgNum: 45838
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline

--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 11:53:39AM +0530, Naresh Bhat wrote:
> Are you able to see the "prparser.y.h" under acpica source and recipe
> is unable to locate it ?

I can check later when it fails again on jenkins, but workspace is gone
already.

> On 24 August 2013 03:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Can you please check why it's sometimes failing like this:
> >
> > | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/armv5te-oe-linux-gnueabi/acpica/20130626-r1/acpica-unix2=
-20130626/generate/unix/acpidump'
> > | 64-bit version of acpidump:
> > | -rwxr-xr-x 1 jenkins jenkins 121136 Aug 23 17:54 ../bin/acpidump
> > |
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtpars=
erlex.o obj/dtparserlex.c
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbstats.o=
 ../../../source/components/debugger/dbstats.c
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtpars=
erparse.o obj/dtparserparse.c
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/prpars=
erlex.o obj/prparserlex.c
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_NAMES_APP -I../../../source/tools/acpinames -Wall -o obj/excreat=
e.o ../../../source/components/executer/excreate.c
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbutils.o=
 ../../../source/components/debugger/dbutils.c
> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --=
sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/q=
emuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_SOUR=
CE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/incl=
ude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbxface.o=
 ../../../source/components/debugger/dbxface.c
> > | ../../../source/compiler/prparser.l:46:24: fatal error: prparser.y.h:=
 No such file or directory
> > |  #include "prparser.y.h"
> > |                         ^
> > | compilation terminated.
> > | make[1]: *** [obj/prparserlex.o] Error 1
> > | make[1]: *** Waiting for unfinished jobs....
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIa/hkACgkQN1Ujt2V2gBzQEACghu3J8gZBh0ArG6gl8lxI8RkV
hPQAn0hbKAHaSgYkZ1tZQJWHoGg6mVqM
=IAsz
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
