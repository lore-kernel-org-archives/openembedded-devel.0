Return-Path: <gerharddeclercq@outlook.com>
Received: from DUB004-OMC4S1.hotmail.com (dub004-omc4s1.hotmail.com
	[157.55.2.76])
	by mail.openembedded.org (Postfix) with ESMTP id 04E436012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 06:31:19 +0000 (UTC)
Received: from DUB127-W88 ([157.55.2.72]) by DUB004-OMC4S1.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Sun, 6 Dec 2015 22:31:19 -0800
X-TMN: [CuTWP53oPKpQucR2QQZ04Fq4eRXtRZZz]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <DUB127-W885712E2B8CBC794904563B8090@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Dec 2015 06:31:19 +0000
Importance: Normal
In-Reply-To: <DUB127-W26C8D4D9E44CDA573098F9B80A0@phx.gbl>
References: <DUB127-W584639A0CC25511482AC28B80A0@phx.gbl>,
	<DUB127-W26C8D4D9E44CDA573098F9B80A0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 07 Dec 2015 06:31:19.0651 (UTC)
	FILETIME=[E222EB30:01D130B8]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Getting Qt support inside an image toolchain
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Dec 2015 06:31:20 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok I have solved managed to get this working by adding "inherit populate_sd=
k populate_sdk_qt5" to the top of my image recipe. I just modified the Qt r=
ecipe to drop "TOOLCHAIN_TARGET_TASK +=3D "packagegroup-qt5-toolchain-targe=
t". It seems that one needs to inherit "populate_sdk" before "populate_sdk_=
qt5" in order not to invalidate the default TOOLCHAIN_HOST_TASK assignment =
and thereby loose the default SDK components.

I have two questions that arrive though. Firstly=2C would it be a problem t=
o let the Qt recipe inherit from the base one in order to prevent a problem=
 like this or could that cause some problems? Also=2C is it really necessar=
y to have "TOOLCHAIN_TARGET_TASK +=3D "packagegroup-qt5-toolchain-target" i=
n the recipe? I mean do most users really want to compile every single Qt m=
odule just to get an SDK?

> From: gerharddeclercq@outlook.com
> To: openembedded-devel@lists.openembedded.org
> Date: Sun=2C 6 Dec 2015 12:03:17 +0000
> Subject: Re: [oe] [meta-qt5] Getting Qt support inside an image toolchain
>=20
> I have found that adding "inherit populate_sdk_qt5" to my image recipe mi=
ght be what I need. The problem is that it also fails with building some st=
range modules. I have found though that this can avoided by removing "nativ=
esdk-packagegroup-qt5-toolchain-host" from that recipe. What seems to have =
the same effect is to add only "TOOLCHAIN_HOST_TASK +=3D "nativesdk-package=
group-qt5-toolchain-host" to my image recipe. This works fine and compiles.=
 It even adds the qt files to the toolchain but for some reason it seems to=
 break the toolchain installer which then crashes with "Setting it up...ls:=
 cannot access /usr/local/simonsdk/environment-setup-*: No such file or dir=
ectory".  This leaves me with a partially installed and useless toolchain. =
I have looked and looked but I cannot seem to figure out how the qt recipes=
 can be causing this=2C any ideas?
>=20
> > From: gerharddeclercq@outlook.com
> > To: openembedded-devel@lists.openembedded.org
> > Date: Sun=2C 6 Dec 2015 10:07:26 +0000
> > Subject: [oe] [meta-qt5] Getting Qt support inside an image toolchain
> >=20
> > I have read that the Qt toolchain components should these days be inclu=
ded in the toolchain of an image when -c populate_sdk is run for an image t=
hat contains Qt modules. I can confirm that Qt is in fact built with my ima=
ge and works on my board. I can also confirm that the toolchain files like =
qmake are built and reside in the Yocto build directories. The problem is t=
hat they do not seem to be included in the toolchain installer. I know one =
can use meta-toolchain-qt5 but that appears to want to build every single m=
odule there is? Besides wasting a lot of time and space=2C that is not real=
ly an option for me because the building of some modules fails because I ha=
ve a very troublesome bsp that I have to work with and I do not want to try=
 to fix up those unneeded packages just to get a toolchain... I know that I=
 have previously been able to get an sdk built with only the qt modules inc=
luded in my image and I could have sworn it was with populate_sdk but that =
does not seem to wo
>  rk
> >   now. Is there something that I need to configure before this will wor=
k or is there some other way that it should be built?
> >  		 	   		 =20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>  		 	   		 =20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
 		 	   		  =

