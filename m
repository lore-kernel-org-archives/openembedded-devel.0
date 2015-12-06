Return-Path: <gerharddeclercq@outlook.com>
Received: from DUB004-OMC4S35.hotmail.com (dub004-omc4s35.hotmail.com
	[157.55.2.110])
	by mail.openembedded.org (Postfix) with ESMTP id 32FD9601A5
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 Dec 2015 10:07:26 +0000 (UTC)
Received: from DUB127-W58 ([157.55.2.72]) by DUB004-OMC4S35.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008); 
	Sun, 6 Dec 2015 02:07:26 -0800
X-TMN: [jGCh0NDHTOcYiEAlRZCJ/Hx/nVO3Urnmv014BdSXc3I=]
X-Originating-Email: [gerharddeclercq@outlook.com]
Message-ID: <DUB127-W584639A0CC25511482AC28B80A0@phx.gbl>
From: Gerhard de Clercq <gerharddeclercq@outlook.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 6 Dec 2015 10:07:26 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Dec 2015 10:07:26.0571 (UTC)
	FILETIME=[E89C23B0:01D1300D]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Getting Qt support inside an image toolchain
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
X-List-Received-Date: Sun, 06 Dec 2015 10:07:30 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have read that the Qt toolchain components should these days be included =
in the toolchain of an image when -c populate_sdk is run for an image that =
contains Qt modules. I can confirm that Qt is in fact built with my image a=
nd works on my board. I can also confirm that the toolchain files like qmak=
e are built and reside in the Yocto build directories. The problem is that =
they do not seem to be included in the toolchain installer. I know one can =
use meta-toolchain-qt5 but that appears to want to build every single modul=
e there is? Besides wasting a lot of time and space=2C that is not really a=
n option for me because the building of some modules fails because I have a=
 very troublesome bsp that I have to work with and I do not want to try to =
fix up those unneeded packages just to get a toolchain... I know that I hav=
e previously been able to get an sdk built with only the qt modules include=
d in my image and I could have sworn it was with populate_sdk but that does=
 not seem to work now. Is there something that I need to configure before t=
his will work or is there some other way that it should be built?
 		 	   		  =

