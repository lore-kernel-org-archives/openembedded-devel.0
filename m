Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Qouwk-0003yK-OE for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 12:14:34 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p74AAG0O022203
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Aug 2011 12:10:17 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 4 Aug 2011 12:10:12 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 4 Aug 2011 12:10:12 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE51C7@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5D9A@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: 2011.03-maintenance: eglibc-binary-localedata packages missing
	on image
Thread-Index: AcxQLdbj0xBF8M90R7GQsHc7Qq9t5QCXmcUg
References: <0C757E680E33864AB113392C7E83F910BE5D9A@GSX300A.mxchg.m.corp>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 04 Aug 2011 10:10:12.0172 (UTC)
	FILETIME=[B29318C0:01CC528E]
Subject: Re: 2011.03-maintenance: eglibc-binary-localedata packages missing on image
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
X-List-Received-Date: Thu, 04 Aug 2011 10:14:35 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ping ...

Has someone an idea how to solve this problem ?

If we examine the angstrom glibc "locale-base-*" packages they have an =
dependency on the  "glibc-binary-localedata-*" but no provides entry for =
this package.

Regards
Wolfgang Hauser

-----Urspr=FCngliche Nachricht-----
Von: Hauser, Wolfgang (external)=20
Gesendet: Montag, 1. August 2011 11:32
An: openembedded-devel@lists.openembedded.org
Betreff: 2011.03-maintenance: eglibc-binary-localedata packages missing =
on image

Hello,

we want to install our generated locales on our image offline, therefor =
we use following settings:

local.conf:

ENABLE_BINARY_LOCALE_GENERATION =3D "1"
LOCALE_GENERATION_WITH_CROSS-LOCALEDEF =3D "1"
GLIBC_INTERNAL_USE_BINARY_LOCALE =3D "compile"
GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8 =
de_CH.UTF-8 es_ES.
UTF-8 fr_FR.UTF-8 fr_CH.UTF-8 it_IT.UTF-8 it_CH.UTF-8"

xx-image.bb:

IMAGE_LINGUAS =3D "en-us en-gb de-de de-ch es-es fr-fr fr-ch it-it =
it-ch"

ROOTFS_POSTPROCESS_COMMAND +=3D "install_linguas;"

The packages locale-base-* are installed properly, but the =
eglibc-binary-localedata are not installed in the image, so the needed =
data for the locale support are missing.

If we examine the locale-base- packages with dpkg, there is an entry =
"eglibc-binary-localedata-..." in "provides" this seem to be wrong.
(should that not be a dependency only?)

dpkg-deb -I locale-base-de-de_2.12-r21.8+svnr12323.9_armv7a.ipk
 new debian package, version 2.0.
 size 906 bytes: control archive=3D 608 bytes.
     808 bytes,    14 lines      control             =20
 Package: locale-base-de-de
 Version: 2.12-r21.8+svnr12323.9
 Description: Embedded GNU C Library
 Section: libs
 Priority: required
 Maintainer: Angstrom Developers <angstrom-distro-devel@linuxtogo.org>
 License: LGPL
 Architecture: armv7a
 OE: eglibc
 Homepage: http://www.eglibc.org/home
 Build: <unknown>/9426
 Depends: eglibc-binary-localedata-de.de
 Provides: virtual-locale-de-de, virtual-locale-de, =
eglibc-binary-localedata-de.de
 Source: svn://svn.eglibc.org/branches;module=3Deglibc-2_12;proto=3Dsvn =
file://eglibc-svn-arm-lowlevellock-include-tls.patch =
file://IO-acquire-lock-fix.patch file://shorten-build-commands.patch =
file://sh4_set_fpscr_2.12.patch file://sh4_local-fpscr_values.patch =
file://eglibc-dont-cache-slibdir.patch =
file://armv4-eabi-compile-fix.patch file://etc/ld.so.conf =
file://generate-supported.mk=20

What is going wrong here ?


