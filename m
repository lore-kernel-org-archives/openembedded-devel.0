Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1047A6060B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 09:13:42 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so1452575eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qGc8d61yaa94oyodAJZX8a3zGpGRFGpE6bubVma+mE8=;
	b=f+ia1NWqB+Z5Jr789vENg7HCWH7cN8ZyA+fNoDacMVvHhnnKfemkLBAJFbARLPHAV2
	NKt3dcNqcOtd9sfPr5N7yBs4JktutEl5BiE4lV5r4zSJ4NMw6mCJKq6FA/Z3GAuwfwab
	6gj7UIusP+odBjKgqIg0SdjaR5xQSJvkphuGYzKbCQH4nKRpla5SLG8TLvW6xkjUuIiX
	9oywj0rPfYGHDI1OxzT83PQP3ZAngsSYc6flGRcf1qrLOP9SsEUZKvCuETp8Y1VM9yTe
	w0dt73RUyHRwyoqTaFMQnPepzu/Gtujdw+htpn9HwFQ9oI0jCE/VTZXCDvKP6I89gtpf
	7m0A==
X-Received: by 10.14.22.68 with SMTP id s44mr889403ees.74.1377508422339;
	Mon, 26 Aug 2013 02:13:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm19798824eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 02:13:41 -0700 (PDT)
Date: Mon, 26 Aug 2013 11:14:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20130826091451.GO3544@jama>
References: <20130823215050.GE3544@jama>
	<CAFoFrHahfobkP_i-y0+nQpiB-YWoO2C8OXaviKuHbQTNjdgQ-A@mail.gmail.com>
	<20130826070457.GK3544@jama>
	<CAGNsrLD5nJT64J_Z=z4nmjK0UmXb6DkxF2FBworonLtSWTxtQA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGNsrLD5nJT64J_Z=z4nmjK0UmXb6DkxF2FBworonLtSWTxtQA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Naresh Bhat <naresh.bhat@linaro.org>,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Mon, 26 Aug 2013 09:13:43 -0000
X-Groupsio-MsgNum: 45844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline

--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2013 at 11:18:43AM +0300, Fathi Boudra wrote:
> Hi,
>=20
> On 26 August 2013 10:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Mon, Aug 26, 2013 at 11:53:39AM +0530, Naresh Bhat wrote:
> >> Are you able to see the "prparser.y.h" under acpica source and recipe
> >> is unable to locate it ?
> >
> > I can check later when it fails again on jenkins, but workspace is gone
> > already.
> >
> >> On 24 August 2013 03:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > Can you please check why it's sometimes failing like this:
> >> >
> >> > | make[1]: Leaving directory `/home/jenkins/oe/shr-core-branches/shr=
-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/acpica/20130626-r1/acpica-un=
ix2-20130626/generate/unix/acpidump'
> >> > | 64-bit version of acpidump:
> >> > | -rwxr-xr-x 1 jenkins jenkins 121136 Aug 23 17:54 ../bin/acpidump
> >> > |
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtp=
arserlex.o obj/dtparserlex.c
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbstat=
s.o ../../../source/components/debugger/dbstats.c
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/dtp=
arserparse.o obj/dtparserparse.c
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -oobj/prp=
arserlex.o obj/prparserlex.c
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_NAMES_APP -I../../../source/tools/acpinames -Wall -o obj/excr=
eate.o ../../../source/components/executer/excreate.c
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbutil=
s.o ../../../source/components/debugger/dbutils.c
> >> > | arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork=
 --sysroot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroot=
s/qemuarm -c -O2 -pipe -g -feliminate-unused-debug-types -D_CYGWIN -D_GNU_S=
OURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/i=
nclude -DACPI_EXEC_APP -I../../../source/tools/acpiexec -Wall -o obj/dbxfac=
e.o ../../../source/components/debugger/dbxface.c
> >> > | ../../../source/compiler/prparser.l:46:24: fatal error: prparser.y=
=2Eh: No such file or directory
> >> > |  #include "prparser.y.h"
> >> > |                         ^
> >> > | compilation terminated.
> >> > | make[1]: *** [obj/prparserlex.o] Error 1
> >> > | make[1]: *** Waiting for unfinished jobs....
>=20
> we have a patch to fix parallel builds:
> https://git.linaro.org/gitweb?p=3Dopenembedded/meta-linaro.git;a=3Dcommit=
;h=3Dc4eeb9d314440962c8d732468dfac2f9360918b1
>=20
> There's a discussion to get the patch merged upstream:
> https://lists.acpica.org/pipermail/devel/2013-August/000549.html
>=20
> but upstream is going to propose a better approach.
>=20
> Do you want to add our patch in the meantime?

Yes please.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIbHIsACgkQN1Ujt2V2gBz6IgCgrQSMd6e31KADI7LHxY2dCz6Q
v9MAoKRhgv78I8jjxVK3eJJkORbyuxG8
=xoQb
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--
