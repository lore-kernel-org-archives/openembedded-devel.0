Return-Path: <gerharddeclercq@outlook.com>
Received: from DUB004-OMC4S21.hotmail.com (dub004-omc4s21.hotmail.com
	[157.55.2.96])
	by mail.openembedded.org (Postfix) with ESMTP id C5F07601F6
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Dec 2015 12:03:18 +0000 (UTC)
Received: from DUB127-W26 ([157.55.2.72]) by DUB004-OMC4S21.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Sun, 6 Dec 2015 04:03:18 -0800
X-TMN: [LMb++mbR3a6hGFecl1bFVv8Mxglv8EKhwjKGZ1iTM0A=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <DUB127-W26C8D4D9E44CDA573098F9B80A0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 6 Dec 2015 12:03:17 +0000
Importance: Normal
In-Reply-To: <DUB127-W584639A0CC25511482AC28B80A0@phx.gbl>
References: <DUB127-W584639A0CC25511482AC28B80A0@phx.gbl>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Dec 2015 12:03:18.0549 (UTC)
	FILETIME=[184FCC50:01D1301E]
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
X-List-Received-Date: Sun, 06 Dec 2015 12:03:19 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have found that adding "inherit populate_sdk_qt5" to my image recipe migh=
t be what I need. The problem is that it also fails with building some stra=
nge modules. I have found though that this can avoided by removing "natives=
dk-packagegroup-qt5-toolchain-host" from that recipe. What seems to have th=
e same effect is to add only "TOOLCHAIN_HOST_TASK +=3D "nativesdk-packagegr=
oup-qt5-toolchain-host" to my image recipe. This works fine and compiles. I=
t even adds the qt files to the toolchain but for some reason it seems to b=
reak the toolchain installer which then crashes with "Setting it up...ls: c=
annot access /usr/local/simonsdk/environment-setup-*: No such file or direc=
tory".  This leaves me with a partially installed and useless toolchain. I =
have looked and looked but I cannot seem to figure out how the qt recipes c=
an be causing this=2C any ideas?

> From: gerharddeclercq@outlook.com
> To: openembedded-devel@lists.openembedded.org
> Date: Sun=2C 6 Dec 2015 10:07:26 +0000
> Subject: [oe] [meta-qt5] Getting Qt support inside an image toolchain
>=20
> I have read that the Qt toolchain components should these days be include=
d in the toolchain of an image when -c populate_sdk is run for an image tha=
t contains Qt modules. I can confirm that Qt is in fact built with my image=
 and works on my board. I can also confirm that the toolchain files like qm=
ake are built and reside in the Yocto build directories. The problem is tha=
t they do not seem to be included in the toolchain installer. I know one ca=
n use meta-toolchain-qt5 but that appears to want to build every single mod=
ule there is? Besides wasting a lot of time and space=2C that is not really=
 an option for me because the building of some modules fails because I have=
 a very troublesome bsp that I have to work with and I do not want to try t=
o fix up those unneeded packages just to get a toolchain... I know that I h=
ave previously been able to get an sdk built with only the qt modules inclu=
ded in my image and I could have sworn it was with populate_sdk but that do=
es not seem to work
>   now. Is there something that I need to configure before this will work =
or is there some other way that it should be built?
>  		 	   		 =20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
 		 	   		  =

