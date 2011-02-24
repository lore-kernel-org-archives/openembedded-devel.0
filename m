Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PsSW9-0002b2-BK
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 05:09:29 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH300H62ST94VN0@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	23 Feb 2011 22:07:59 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B536314AF6D; Wed,
	23 Feb 2011 23:07:57 -0500 (EST)
Date: Wed, 23 Feb 2011 23:07:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <AANLkTim9Bni0kDpFZRbb1XNeerRRFc6vYuLtRkTeDvc5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110224040757.GB17536@denix.org>
MIME-version: 1.0
References: <27863997.429871298461794177.JavaMail.defaultUser@defaultHost>
	<AANLkTim9Bni0kDpFZRbb1XNeerRRFc6vYuLtRkTeDvc5@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: External toolchain
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
X-List-Received-Date: Thu, 24 Feb 2011 04:09:29 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Wed, Feb 23, 2011 at 11:28:51AM -0800, Khem Raj wrote:
> On Wed, Feb 23, 2011 at 3:49 AM, Luca Bolognini <l.bolognini@tiscal=
i.it> wrote:
> > Hi,thank you Ahsan for you reply.I solved my issue and I succeed =
in using external toolchain CodeSourcery2009q1 to cross-compile some =
packages in my OE 2010.12 release.However I didn't create any symlink=
 of arm-angstrom-linux-gnueabi-gcc to arm-none-linux-gnueabi-gcc.I ad=
ded an instantiation of TARGET_SYS variable to the hints of Denys and=
 Tom (se reference link in my previous email).It's important to do so=
 in order not to have errors in the do_install task of external-toolc=
hain-csl.bb recipe.Then, as a resume, my openembedded/conf/distro/ang=
strom-2008.1.conf file changed in this way:
> > # Set the toolchain type (internal, external) and brand (generic,=
 csl etc.)# LUCATARGET_VENDOR =3D "-none"TOOLCHAIN_TYPE ?=3D "externa=
l"TOOLCHAIN_BRAND ?=3D "csl"TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"=
TARGET_SYS =3D "arm-none-linux-gnueabi"TOOLCHAIN_SYSPATH =3D "${TOOLC=
HAIN_PATH}/arm-none-linux-gnueabi"PATH_prepend =3D "${TOOLCHAIN_PATH}=
/bin:"require conf/distro/include/toolchain-external.inc
> > instead of
> > # Set the toolchain type (internal, external) and brand (generic,=
 csl etc.)TOOLCHAIN_TYPE ?=3D "internal"TOOLCHAIN_BRAND ?=3D ""
> > Then it worked.Bye,Luca
> >

Luca,

Your MUA ate all the newlines and made your message into one long lin=
e, which=20
is quite hard to read... :)

Anyway, you don't need to set TARGET_SYS manually, as it is composed =
=66rom=20
TARGET_ARCH, TARGET_VENDOR and TARGET_OS in bitbake.conf. Also, don't=
 worry=20
about TOOLCHAIN_SYSPATH - the default is also set there and is fine.

The reason you are having the issue you've mentioned, is because inst=
ead of=20
adding those variables to your local.conf file, you are modifying=
=20
angstrom-2008.1.conf, where placement is important - before or after =
the=20
toolchain variables are handled.

Plus, more importantly, to overwrite distro's TARGET_VENDOR properly,=
 you need=20
to set TOOLCHAIN_VENDOR variable.

So, here's the minimum set of variables you need to set in your local=
.conf:

----------------------------------------------------
TOOLCHAIN_VENDOR =3D "-none"
TOOLCHAIN_TYPE =3D "external"
TOOLCHAIN_BRAND =3D "csl"

TOOLCHAIN_PATH =3D "/opt/arm-2009q1"
# If you don't have toolchain in system PATH, then:
PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
----------------------------------------------------

Since you also mentioned Arago, you could have looked at how I set CS=
L in=20
there by default (in arago.conf and toolchain-csl.conf files)...


> good it worked for you. Would you please document the steps you too=
k
> from the beginning to get it working ?
> and send it as reply to this email ? We would like to add this into
> the wiki or FAQs

Tom and I have explained it many times already. I guess it's still ha=
rd to=20
collect all the relevant info from separate posts on the mailing list=
.
Probably I should bite the bullet and create the necessary Wiki entry=
... :)

--=20
Denys



> > ----Messaggio originale----
> > Da: Noor_Ahsan@mentor.com
> > Data: 22/02/2011 10.47
> > A: <openembedded-devel@lists.openembedded.org>
> > Ogg: Re: [oe] External toolchain
> >
> > Hello Luca,
> >
> > Probably you need to create symbolic links of arm-angstrom-linux-
> > gnueabi-gcc to arm-none-linux-gnueabi-gcc. OE assumes that the co=
mpiler name is arm-angstrom-linux-gnueabi-gcc. You can see the "CC" v=
ariable value by take environment of libtool-cross (using -e options)=
 that how OE is creating the name of compiler.
> >
> > Regards,
> > Noor
> >
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:o=
penembedded-devel-bounces@lists.openembedded.org] On Behalf Of Luca B=
olognini
> > Sent: Tuesday, February 22, 2011 2:16 PM
> > To: Open Embedded Mailing List
> > Subject: [oe] External toolchain
> >
> > Hi,
> > I would like to use an external toolchain (CodeSourcery2009q1) to
> > cross-compile some packages for my beagleboard (more or less the =
same
> > that happens in Arago) and then I expect not to download glibc pa=
ckage
> > and cross-compile again libc, libpthread and so on. I would like =
to use
> > the libraries inside my external CodeSourcery SDK.
> > I followed some
> > hints by Denys and Tom ( http://lists.linuxtogo.
> > org/pipermail/openembedded-devel/2010-April/019521.html ) and I p=
ut
> >
> > #
> > LUCA
> > TARGET_VENDOR =3D "-none"
> > TOOLCHAIN_TYPE ?=3D "external"
> >
> > TOOLCHAIN_BRAND ?=3D "csl"
> > TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"
> >
> > TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
> >
> > PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
> > require
> > conf/distro/include/toolchain-external.inc
> >
> > inside my
> > openembedded/conf/distro/angstrom-2008.1.conf
> >
> > As you know, cross-
> > compiler provided by CodeSoucery is arm-none-linux-gnueabi-gcc bu=
t I
> > get the following error with libtool-cross_2.2.6b.bb:
> > Build
> > Configuration:
> > BB_VERSION =A0 =A0 =A0 =A0=3D "1.8.19"
> > METADATA_BRANCH =A0 =3D
> > "release-2010.12"
> > METADATA_REVISION =3D "dec3967"
> > TARGET_ARCH =A0 =A0 =A0 =3D
> > "arm"
> > TARGET_OS =A0 =A0 =A0 =A0 =3D "linux-gnueabi"
> > MACHINE =A0 =A0 =A0 =A0 =A0 =3D
> > "beagleboard"
> > DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D "angstrom"
> > DISTRO_VERSION =A0 =A0=3D
> > "2010.7-test-20110221"
> > TARGET_FPU =A0 =A0 =A0 =A0=3D "hard"
> > [...]
> > | checking for
> > arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-gcc =
-
> > march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsof=
tfp -mthumb-
> > interwork -mno-thumb
> > | checking whether the C compiler works... no
> > |
> > configure: error: in `/home/bolognini/diskp2/diskp2.4/pure-
> > oe/build/tmp/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.2=
.6b-
> > r27.1/libtool-2.2.6b':
> > | configure: error: C compiler cannot create
> > executables
> >
> > Obviously OE doesn't have to find arm-angstrom-linux-
> > gnueabi-gcc, but why does it search for arm-angstrom-linux-gnueab=
i-gcc
> > instead of arm-none-linux-gnueabi-gcc ?
> > What's wrong inside angstrom-
> > 2008.1.conf or what am I missing?
> >
> > Thank you for your support
> > Luca
> >
> >
> > Supera i limiti: raddoppia la velocit?? da 10 a 20 Mega! =A0 Risp=
armia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 ??? al =
mese per due anni! =A0SCONTO DI 240 EURO! =A0http://abbonati.tiscali.=
it/telefono-adsl/prodotti/tc/tuttoincluso/?WT.mc_id=3D01fw
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
> >
> >
> >
> >
> > Supera i limiti: raddoppia la velocit?? da 10 a 20 Mega!
> > Risparmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95=
 ??? al mese per due anni!
> > SCONTO DI 240 EURO!
> > http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso=
/?WT.mc_id=3D01fw
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-=
devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel



