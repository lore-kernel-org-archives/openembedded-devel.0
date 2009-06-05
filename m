Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MCYoa-0002Kp-KY
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Jun 2009 14:46:32 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 5 Jun 2009 14:37:21 +0200
Received: from FBCMCL01B02.fbc.local ([192.168.69.83]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 5 Jun 2009 14:37:20 +0200
Received: from [192.168.1.166] ([80.117.37.182]) by FBCMCL01B02.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 5 Jun 2009 14:37:20 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
Date: Fri, 05 Jun 2009 14:37:14 +0200
Message-Id: <1244205439.6643.24.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 05 Jun 2009 12:37:20.0598 (UTC)
	FILETIME=[5E637F60:01C9E5DA]
Subject: Re: How to convert OE hardware platform from ARM into X86
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
X-List-Received-Date: Fri, 05 Jun 2009 12:46:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-06-05 at 10:12 +0800, =E5=88=98=E8=8A=B3=E5=8D=8E wrote:
> The hardware target of OE in my system is ARM.And it was configured
> and changed by ourselves for some purpose.Now we need to convert the
> hardware target into X86 on the base of current environment. I didn't
> know the exactly step,just tried by myself.But while I go back to the
> ARM hardware target environment,
hi, why don't you use 2 different local.conf with 2 different local
directories?(note that you can't rename or move a temp directory so
chose carefully its name at the beginning) and use a script to switch
between them with simlinks?
for instance for the openmoko I use:
$ cat openmoko.sh=20
cd build/conf/
unlink local.conf=20
ln -s openmoko.conf local.conf
cd ${HOME}/
unlink oetmp
ln -s oetmp_openmoko oetmp

and here's my local.conf:
$ cat build/conf/local.conf | sed 's/#.*//' | sed '/^$/d'
DL_DIR =3D "${HOME}/sources"
BBFILES=3D"${HOME}/oe/local_recipes/recipes/*/*.bb
${HOME}/oe/org.openembedded.dev/recipes/*/*.bb"
BBFILE_COLLECTIONS =3D "local upstream"
BBFILE_PATTERN_upstream =3D "^${HOME}/oe/org.openembedded.dev/recipes/"
BBFILE_PATTERN_local =3D "^${HOME}/oe/local_recipes/recipes/"
BBFILE_PRIORITY_upstream =3D "1"
BBFILE_PRIORITY_local =3D "2"
BBMASK =3D ""
PREFERRED_PROVIDERS =3D "virtual/qte:qte virtual/libqpe:libqpe-opie"
PREFERRED_PROVIDERS +=3D " virtual/libsdl:libsdl-x11"
PREFERRED_PROVIDERS +=3D "
virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
PREFERRED_PROVIDERS +=3D "
virtual/${TARGET_PREFIX}gcc-intermediate:gcc-cross-intermediate"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}gcc:gcc-cross"
PREFERRED_PROVIDERS +=3D " virtual/${TARGET_PREFIX}g++:gcc-cross"
TMPDIR =3D ${HOME}/oetmp_openmoko
MACHINE =3D "om-gta02"
DISTRO =3D "openmoko"
IMAGE_FSTYPES =3D "tar"
BBINCLUDELOGS =3D "yes"
PREFERRED_VERSION_qemu-native =3D "0.10.3"
PREFERRED_VERSION_qemu =3D "0.10.3"
PREFERRED_VERSION_frozen-bubble =3D "2.2.0"
PREFERRED_VERSION_libsdl-mixer =3D "1.2.8"
PREFERRED_VERSION_boost =3D "1.38.0"
PREFERRED_VERSION_boost-jam-native =3D "3.1.17"
PREFERRED_VERSION_wesnoth =3D "1.6a"
PREFERRED_VERSION_gnash =3D "0.8.5"
PREFERRED_VERSION_libosip2 =3D "2.2.2"
PREFERRED_VERSION_openssh =3D "5.2p1"
OLDEST_KERNEL =3D "2.6.28"

note my tmpdir is not oetmp but oetmp_openmoko
the oetmp simlink is only for letting me find the good directory

Denis.



