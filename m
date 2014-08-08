Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id AA485609B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 10:01:36 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so741010wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Aug 2014 03:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SuuU0Y5w9HamIpPdbqUAFeWhOkQotedahgUhD0QyTi4=;
	b=0mIhQDm2CMIxUeDkrUHopC9DMEVce/eYfyrUD2FTwJ3hwxC00xhhx7SR8QHpFjMbah
	Quq+81ogb9nvdWeFNvNKEdX80RU8dmJKI3PDB8qP6Msp86PBxYLVqlXDB0txP3laufUB
	OpTxG9OPtXc+vjYM55iX1Ul4g/mH9NPaVcvwP+dEu13BoKAI+G8Bwn5M7ZF7n9RIGzze
	bQAqzdRCFn9ngeGNFvIsEpp2mIS9z4iUin3CadNGjq/qDgju5nhSIcMgW0tZvpcM+cA8
	UyTmg6TFAGZLX7bl3QOzJXR9T3GuQeoVdz1kB7/k3kGbHxt/J1ZdE4Ej8jVrFReLTdda
	yFjg==
X-Received: by 10.180.92.134 with SMTP id cm6mr3091228wib.72.1407492097695;
	Fri, 08 Aug 2014 03:01:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fc7sm16206087wjc.37.2014.08.08.03.01.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Aug 2014 03:01:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Aug 2014 12:02:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140808100208.GC14848@jama>
References: <20140806192249.GP14848@jama>
	<1407418315-15620-1-git-send-email-paul.eggleton@linux.intel.com>
	<20140808004507.GZ14848@jama>
MIME-Version: 1.0
In-Reply-To: <20140808004507.GZ14848@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2] mariadb: update to 5.5.38
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
X-List-Received-Date: Fri, 08 Aug 2014 10:01:42 -0000
X-Groupsio-MsgNum: 51496
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ozkSYTWEkbLDijvq"
Content-Disposition: inline

--ozkSYTWEkbLDijvq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 08, 2014 at 02:45:07AM +0200, Martin Jansa wrote:
> On Thu, Aug 07, 2014 at 02:31:55PM +0100, Paul Eggleton wrote:
> > * Upstream switched from autotools to cmake
> > * Separate build dir and parallel make now work
> > * Library versioning no longer used for plugins; other libtool cruft
> >   gone
> > * Proper upstream initscript
> > * Plugins moved from client library package to mariadb-server package
> >   (matches how Fedora packages these)
> >=20
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >=20
> > Changes since v1:
> > * Add readline and libaio to DEPENDS
> > * Disable usage of boost
>=20
> Thanks for update, I've found few more differences between failing (after=
 building world) and
> working (with minimal deps) build:
>=20
> 646c646
> < -- Looking for include files valgrind/memcheck.h, valgrind/valgrind.h -=
 found
> ---
> > -- Looking for include files valgrind/memcheck.h, valgrind/valgrind.h -=
 not found
> 733c733
> < -- Looking for include file security/pam_appl.h - found
> ---
> > -- Looking for include file security/pam_appl.h - not found
> 759c759
> < -- Looking for event.h - found
> ---
> > -- Looking for event.h - not found
>=20
> There is also floating systemtap-native dependency which enables DTRACE s=
upport
> in mariadb (see mariadb-5.5.38/cmake/dtrace.cmake).
>=20
>=20
> And groff-native is the cause for following error:
> | Scanning dependencies of target ps
> | make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | make -f dbug/CMakeFiles/ps.dir/build.make dbug/CMakeFiles/ps.dir/build
> | make[2]: Entering directory `/work/i586-oe-linux/mariadb/5.5.38-r0/buil=
d'
> | /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report /work/i58=
6-oe-linux/mariadb/5.5.38-r0/build/CMakeFiles
> | [ 84%] Generating example3.r
> | cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && sed -e 's!\\!\\\=
\!g' </work/i586-oe-linux/mariadb/5.5.38-r0/mariadb-5.5.38/dbug/example3.c =
>example3.r
> | /sysroots/x86_64-linux/usr/bin/cmake -E cmake_progress_report /work/i58=
6-oe-linux/mariadb/5.5.38-r0/build/CMakeFiles
> | [ 84%] Generating output1.r, output2.r, output3.r, output4.r, output5.r
> | cd /work/i586-oe-linux/mariadb/5.5.38-r0/build/dbug && ./factorial 1 2 =
3 4 5 > output1.r
> | ./factorial: /lib/i386-linux-gnu/libc.so.6: version `GLIBC_2.17' not fo=
und (required by ./factorial)
> | make[2]: *** [dbug/output1.r] Error 1
> | make[2]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | make[1]: *** [dbug/CMakeFiles/ps.dir/all] Error 2
> | make[1]: Leaving directory `/work/i586-oe-linux/mariadb/5.5.38-r0/build'
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
>=20
> Adding -DGROFF=3DFalse -DNROFF=3DFalse to EXTRA_OECMAKE allowed me to bui=
ld it after world, but please check other floating deps as well.

And now it failed on jenkins builder (maybe because this one is using
gold)

| cd /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnuea=
bi/mariadb/5.5.38-r0/build/storage/myisam && /home/jenkins/oe/world/shr-cor=
e/tmp-eglibc/sysroots/x86_64-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linu=
x-gnueabi-gcc  -DHAVE_CONFIG_H -Wall  -march=3Darmv5te -marm -mthumb-interw=
ork  --sysroot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuar=
m  -O2 -pipe -g -feliminate-unused-debug-types -fPIC -O2 -g -DNDEBUG -DDBUG=
_OFF -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnu=
eabi/mariadb/5.5.38-r0/build/include -I/home/jenkins/oe/world/shr-core/tmp-=
eglibc/work/armv5te-oe-linux-gnueabi/mariadb/5.5.38-r0/mariadb-5.5.38/inclu=
de -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnuea=
bi/mariadb/5.5.38-r0/mariadb-5.5.38/sql -I/home/jenkins/oe/world/shr-core/t=
mp-eglibc/work/armv5te-oe-linux-gnueabi/mariadb/5.5.38-r0/mariadb-5.5.38/re=
gex -I/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm/usr/inclu=
de     -fvisibility=3Dhidden -o CMakeFiles/myisam.dir/mi_create.c.o   -c /h=
ome/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/mari=
adb/5.5.38-r0/mariadb-5.5.38/storage/myisam/mi_create.c
| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libe=
xec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.1/ld: error: /home/je=
nkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/mariadb/5.=
5.38-r0/build/libmysql/libmysql_versions.ld:155:9: invalid use of VERSION i=
n input file
| collect2: error: ld returned 1 exit status
| make[2]: *** [libmysql/libmysqlclient.so.18..0] Error 1
| make[2]: Leaving directory `/home/jenkins/oe/world/shr-core/tmp-eglibc/wo=
rk/armv5te-oe-linux-gnueabi/mariadb/5.5.38-r0/build'
| make[1]: *** [libmysql/CMakeFiles/libmysql.dir/all] Error 2

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ozkSYTWEkbLDijvq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPkoCAACgkQN1Ujt2V2gBxV9wCeK9DurfUjhZpk7DtjkWVtkaDi
qaMAnj0S16d/OiOGyqQ9FQly6UOrx3rv
=flLY
-----END PGP SIGNATURE-----

--ozkSYTWEkbLDijvq--
