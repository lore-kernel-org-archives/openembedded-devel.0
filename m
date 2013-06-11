Return-Path: <sgh@sgh.dk>
Received: from mx03.stofanet.dk (mx03.stofanet.dk [212.10.10.13])
	by mail.openembedded.org (Postfix) with ESMTP id A68B56A9C7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 13:49:21 +0000 (UTC)
Received: from 5634f347.rev.stofanet.dk ([86.52.243.71] helo=asrock)
	by mx03.stofanet.dk (envelope-from <sgh@sgh.dk>)
	with esmtp id 1UmOwr-0002ZR-2b
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jun 2013 15:49:21 +0200
Received: from koontz.localnet (localhost [127.0.0.1])
	by asrock (Postfix) with ESMTPS id 9AFA57EC59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:49:21 +0200 (CEST)
From: =?ISO-8859-1?Q?S=F8ren?= Holm <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jun 2013 15:49:21 +0200
Message-ID: <7063136.DAg8vKBVKy@koontz>
User-Agent: KMail/4.10.3 (Linux/3.9.0-4-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <2472586.UfWZc5OvGZ@koontz>
References: <2472586.UfWZc5OvGZ@koontz>
MIME-Version: 1.0
Subject: Re: xf86-video-intel compilation failure
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
X-List-Received-Date: Tue, 11 Jun 2013 13:49:22 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"


Copying my local dri2.h into the sysroot like this makes the driver com=
pile.

 cp /usr/include/xorg/dri2.h  tmp-eglibc/sysroots/vmc16/usr/include/xor=
g/

Any hint on where that files is.

S=F8ren HolmTirsdag den 11. juni 2013 00:10:34 skrev :
> Hi
>=20
> When compiling xf86-video-intel I get the following compilation error=
. Do
> you have any ideas - I have looked everywhere for xorg/dri2.h
>=20
> | /home/sgh/git/openembedded/build/tmp-
>=20
> eglibc/sysroots/vmc16/usr/include/xorg/xf86.h:202:33: note: previous
> declaration of 'xf86CVTMode' was here
>=20
> | In file included from i830_3d.c:33:0:
> | intel.h:66:18: fatal error: dri2.h: No such file or directory
> | compilation terminated.
> | make[3]: *** [i830_3d.lo] Error 1
> | make[3]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
>=20
> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video=
-
> intel-2.21.6/src'
>=20
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
>=20
> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video=
-
> intel-2.21.6/src'
>=20
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory `/home/sgh/git/openembedded/build/tmp-
>=20
> eglibc/work/prescott-oe-linux/xf86-video-intel/2_2.21.6-r0/xf86-video=
-
> intel-2.21.6'
>=20
> | make: *** [all] Error 2
> | ERROR: oe_runmake failed
--=20
S=F8ren Holm

