Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <jdk@ti.com>)
	id 1REMAZ-0000hG-VQ for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 16:22:00 +0200
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9DEGFK2031885
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 09:16:15 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9DEGENW024007
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 09:16:14 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9DEGEGW002644
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2011 09:16:14 -0500 (CDT)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Thu, 13 Oct 2011 09:16:15 -0500
From: "Kridner, Jason" <jdk@ti.com>
To: "<openembedded-devel@lists.openembedded.org>"
	<openembedded-devel@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Can't build libcgroup
Thread-Index: AQHMia2S8f0nyrfpmU+L/5ine2QIjZV6UflO
Date: Thu, 13 Oct 2011 14:16:14 +0000
Message-ID: <6E64F0B8-773E-4558-B470-37BA010F419D@ti.com>
References: <4E96E9FE.1060005@mlbassoc.com>
In-Reply-To: <4E96E9FE.1060005@mlbassoc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: Can't build libcgroup
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
X-List-Received-Date: Thu, 13 Oct 2011 14:22:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Oct 13, 2011, at 8:39 AM, "Gary Thomas" <gary@mlbassoc.com> wrote:

> Trying to follow the Angstrom instructions directly.
>=20
> OE Build Configuration:
> BB_VERSION        =3D "1.13.3"
> TARGET_ARCH       =3D "arm"
> TARGET_OS         =3D "linux-gnueabi"
> MACHINE           =3D "beagleboard"
> DISTRO            =3D "angstrom"
> DISTRO_VERSION    =3D "v2011.10-core"
> TUNE_FEATURES     =3D "armv7a vfp neon cortexa8"
> TARGET_FPU        =3D "vfp-neon"
> meta-angstrom     =3D "master:66263650f8548d6b0b5f593ab728f536d5e05a9f"
> meta-oe
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce         =3D "master:1e5d73ec4f44200104de085838f04e31a49435da"
> meta-ti           =3D "master:3530f1025efc3792334b897a4e70c6d5822ef56d"
> meta              =3D "master:5ad1ca59dea6d5045f252ed7b786ad193faced64"
>=20
> Fails with this error:
> | ccache arm-angstrom-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-vecto=
rize      -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcort=
ex-a8 -mthumb-interwork -mno-thumb --sysroot=3D/local/new-angstrom/build/tm=
p-angstrom_2010_x-eglibc/sysroots/beagleboard -DHAVE_CONFIG_H -I. -I.. -I..=
/include    -O2 -pipe -g -feliminate-unused-debug-types -Wall -c walk_test.=
c
> | libcg_ba.cpp:18:18: fatal error: string: No such file or directory
> | compilation terminated.
> | make[2]: *** [libcg_ba.o] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | make[2]: Leaving directory `/home/local/new-angstrom/build/tmp-angstrom=
_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/libcgroup-0.37.1-r0/libcg=
roup-0.37.1/tests'
>=20
> Full compile log at http://www.mlbassoc.com/oe/libcgroup-log.do_compile

I have the same issue on a 64-bit Ubuntu machine.=20

>=20
> --=20
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


