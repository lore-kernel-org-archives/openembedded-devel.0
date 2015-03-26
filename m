Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Mar 2015 18:54:50 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id 99E626013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 18:54:50 +0000 (UTC)
Received: from samweis.auenland.lan ([139.181.7.34]) by mail.gmx.com
	(mrgmx101) with ESMTPSA (Nemesis) id 0MC8iq-1Yk2YK1jd2-008uOs;
	Thu, 26 Mar 2015 19:49:44 +0100
From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Mar 2015 19:48:52 +0100
Message-ID: <3303347.WRWmiSbDbc@samweis.auenland.lan>
User-Agent: KMail/4.14.6 (Linux/4.0.0-rc3-jsm1; KDE/4.14.6; x86_64; ; )
MIME-Version: 1.0
X-Provags-ID: V03:K0:ZTDE1YfgGelof/R3ulVu3HMOuHM1y4Pb9vIH/jpUEGx4c6WxDmR
	OCjhqJwtPs0OyuRRV69GGJobllsmCxVs8LoDAzq5te3I1QRq93Xn6eBi83yXsOxoax1KxaL
	AIqmKn78vxDVD7sX1egtg4uOYkB+6sqq+sDygixb7OfVyWqwFzkUf7OmwlEVL/xCoSZV7JC
	T+Euwljqk2lfDyX1WhESA==
X-UI-Out-Filterresults: notjunk:1;
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Bug in cooker - networked PR_SERV
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
X-List-Received-Date: Thu, 26 Mar 2015 18:54:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi !

I found a bug in cooker that shows up when I try to enable the networke=
d=20
PRSERV. bitbake will crash (and still run at 100% after CTRL-C) until k=
ill -9.

I tracked it down to bitbake/lib/bb/cooker.py line 169:
        if self.state !=3D state.initial:
            raise Exception("Illegal state for feature set change")

self.state seems to be 6 at this stage and state.initial is 0 .

Hack: If I comment out this check, it seems to continue, but I see no s=
ize-
increase in the prserv sqlite and also nothing printed for loglevel=3DD=
EBUG in=20
the log.=20


Here are the details:

My setup is:
Build Configuration:
BB_VERSION        =3D "1.24.0"
BUILD_SYS         =3D "x86_64-linux"
NATIVELSBSTRING   =3D "openSUSE-project-13.2"
TARGET_SYS        =3D "i586-poky-linux"
MACHINE           =3D "qemux86"
DISTRO            =3D "poky"
DISTRO_VERSION    =3D "1.7.1"
TUNE_FEATURES     =3D "m32 i586"
TARGET_FPU        =3D ""
meta             =20
meta-yocto       =20
meta-yocto-bsp    =3D "<unknown>:<unknown>"

####### Only changes to conf/local.conf:
PRSERV_HOST=3D"127.0.0.1:5555"
(an a prserv started in a separate terminal)

####### Crash=20

x86> bitbake core-image-minimal
Traceback (most recent call last):
  File "/home/dl9pf/test1/script/4.1/poky-dizzy-12.0.1/bitbake/bin/bitb=
ake",=20
line 382, in <module>
    ret =3D main()
  File "/home/dl9pf/test1/script/4.1/poky-dizzy-12.0.1/bitbake/bin/bitb=
ake",=20
line 347, in main
    server_connection =3D server.establishConnection(featureset)
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/server/process.py", line 247, in=20
establishConnection
    raise BaseException(error)
BaseException: Traceback (most recent call last):
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/command.py", line 71, in runCommand
    result =3D command_method(self, commandline)
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/command.py", line 268, in setFeatures
    command.cooker.setFeatures(features)
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/cooker.py", line 169, in setFeatures
    raise Exception("Illegal state for feature set change")
Exception: Illegal state for feature set change

ERROR: Unable to set the cooker to the correct featureset: Traceback (m=
ost=20
recent call last):
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/command.py", line 71, in runCommand
    result =3D command_method(self, commandline)
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/command.py", line 268, in setFeatures
    command.cooker.setFeatures(features)
  File "/home/dl9pf/test1/script/4.1/poky-
dizzy-12.0.1/bitbake/lib/bb/cooker.py", line 169, in setFeatures
    raise Exception("Illegal state for feature set change")
Exception: Illegal state for feature set change



Best,
---=20

Dipl.-Ing.
Jan-Simon M=F6ller

jansimon.moeller@gmx.de

