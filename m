Received: from mrqout3.tiscali.it ([195.130.225.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <l.bolognini@tiscali.it>) id 1PsXHX-0003qK-3Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 10:14:43 +0100
Received: from [10.39.115.25] by mrq-3 with esmtp (Exim)
	id 1PsXGC-0001J5-41; Thu, 24 Feb 2011 10:13:20 +0100
Received: from ps-wm23 (10.39.75.223) by mail-5-it.mail.tiscali.sys (8.5.134)
	id 4D3EB05B00C4C968 for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 10:13:15 +0100
Message-ID: <14023238.1098331298538795729.JavaMail.defaultUser@defaultHost>
Date: Thu, 24 Feb 2011 10:13:15 +0100 (CET)
From: Luca Bolognini <l.bolognini@tiscali.it>
To: <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
xOriginalSenderIP: 78.6.111.196
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
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
X-List-Received-Date: Thu, 24 Feb 2011 09:14:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,thank you to Denys and Khem for their replies.I would be glad to wri=
te a short wiki on "setting an external toolchain" topic but I think the ro=
ute I followed is not the straightest one.In fact, as Denys underlined, I w=
as wrong in modifying angstrom-2008.1.conf instead of local.conf, where I c=
ould have handled much less variables.I think it's quite better to put Deny=
s reply in a FAQ, where everyone can access this info in the quickest way.A=
s you have understood I engaged in putting an external toolchainin OE to ge=
t apache2 and modphp (still them!) in my Arago FS. I don't know if you have=
 read my previous posts on the topic (I think it's extremely hard if it's a=
ll in one row, what a poor email client, sorry! :-( ), maybe you could help=
 me?
Thank you,bye
Luca




----Messaggio originale----
Da: denis@denix.org
Data: 24/02/2011 5.07
A: <openembedded-devel@lists.openembedded.org>
Ogg: Re: [oe] External toolchain

On Wed, Feb 23, 2011 at 11:28:51AM -0800, Khem Raj wrote:
> On Wed, Feb 23, 2011 at 3:49 AM, Luca Bolognini <l.bolognini@tiscali.it> =
wrote:
> > Hi,thank you Ahsan for you reply.I solved my issue and I succeed in usi=
ng external toolchain CodeSourcery2009q1 to cross-compile some packages in =
my OE 2010.12 release.However I didn't create any symlink of arm-angstrom-l=
inux-gnueabi-gcc to arm-none-linux-gnueabi-gcc.I added an instantiation of =
TARGET_SYS variable to the hints of Denys and Tom (se reference link in my =
previous email).It's important to do so in order not to have errors in the =
do_install task of external-toolchain-csl.bb recipe.Then, as a resume, my o=
penembedded/conf/distro/angstrom-2008.1.conf file changed in this way:
> > # Set the toolchain type (internal, external) and brand (generic, csl e=
tc.)# LUCATARGET_VENDOR =3D "-none"TOOLCHAIN_TYPE ?=3D "external"TOOLCHAIN_=
BRAND ?=3D "csl"TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"TARGET_SYS =3D "ar=
m-none-linux-gnueabi"TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linu=
x-gnueabi"PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"require conf/distro/incl=
ude/toolchain-external.inc
> > instead of
> > # Set the toolchain type (internal, external) and brand (generic, csl e=
tc.)TOOLCHAIN_TYPE ?=3D "internal"TOOLCHAIN_BRAND ?=3D ""
> > Then it worked.Bye,Luca
> >

Luca,

Your MUA ate all the newlines and made your message into one long line, whi=
ch=20
is quite hard to read... :)

Anyway, you don't need to set TARGET_SYS manually, as it is composed from=
=20
TARGET_ARCH, TARGET_VENDOR and TARGET_OS in bitbake.conf. Also, don't worry=
=20
about TOOLCHAIN_SYSPATH - the default is also set there and is fine.

The reason you are having the issue you've mentioned, is because instead of=
=20
adding those variables to your local.conf file, you are modifying=20
angstrom-2008.1.conf, where placement is important - before or after the=20
toolchain variables are handled.

Plus, more importantly, to overwrite distro's TARGET_VENDOR properly, you n=
eed=20
to set TOOLCHAIN_VENDOR variable.

So, here's the minimum set of variables you need to set in your local.conf:

----------------------------------------------------
TOOLCHAIN_VENDOR =3D "-none"
TOOLCHAIN_TYPE =3D "external"
TOOLCHAIN_BRAND =3D "csl"

TOOLCHAIN_PATH =3D "/opt/arm-2009q1"
# If you don't have toolchain in system PATH, then:
PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
----------------------------------------------------

Since you also mentioned Arago, you could have looked at how I set CSL in=
=20
there by default (in arago.conf and toolchain-csl.conf files)...


> good it worked for you. Would you please document the steps you took
> from the beginning to get it working ?
> and send it as reply to this email ? We would like to add this into
> the wiki or FAQs

Tom and I have explained it many times already. I guess it's still hard to=
=20
collect all the relevant info from separate posts on the mailing list.
Probably I should bite the bullet and create the necessary Wiki entry... :)

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
> > gnueabi-gcc to arm-none-linux-gnueabi-gcc. OE assumes that the compiler=
 name is arm-angstrom-linux-gnueabi-gcc. You can see the "CC" variable valu=
e by take environment of libtool-cross (using -e options) that how OE is cr=
eating the name of compiler.
> >
> > Regards,
> > Noor
> >
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:openemb=
edded-devel-bounces@lists.openembedded.org] On Behalf Of Luca Bolognini
> > Sent: Tuesday, February 22, 2011 2:16 PM
> > To: Open Embedded Mailing List
> > Subject: [oe] External toolchain
> >
> > Hi,
> > I would like to use an external toolchain (CodeSourcery2009q1) to
> > cross-compile some packages for my beagleboard (more or less the same
> > that happens in Arago) and then I expect not to download glibc package
> > and cross-compile again libc, libpthread and so on. I would like to use
> > the libraries inside my external CodeSourcery SDK.
> > I followed some
> > hints by Denys and Tom ( http://lists.linuxtogo.
> > org/pipermail/openembedded-devel/2010-April/019521.html ) and I put
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
> > compiler provided by CodeSoucery is arm-none-linux-gnueabi-gcc but I
> > get the following error with libtool-cross_2.2.6b.bb:
> > Build
> > Configuration:
> > BB_VERSION        =3D "1.8.19"
> > METADATA_BRANCH   =3D
> > "release-2010.12"
> > METADATA_REVISION =3D "dec3967"
> > TARGET_ARCH       =3D
> > "arm"
> > TARGET_OS         =3D "linux-gnueabi"
> > MACHINE           =3D
> > "beagleboard"
> > DISTRO            =3D "angstrom"
> > DISTRO_VERSION    =3D
> > "2010.7-test-20110221"
> > TARGET_FPU        =3D "hard"
> > [...]
> > | checking for
> > arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-gcc -
> > march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -m=
thumb-
> > interwork -mno-thumb
> > | checking whether the C compiler works... no
> > |
> > configure: error: in `/home/bolognini/diskp2/diskp2.4/pure-
> > oe/build/tmp/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.2.6b-
> > r27.1/libtool-2.2.6b':
> > | configure: error: C compiler cannot create
> > executables
> >
> > Obviously OE doesn't have to find arm-angstrom-linux-
> > gnueabi-gcc, but why does it search for arm-angstrom-linux-gnueabi-gcc
> > instead of arm-none-linux-gnueabi-gcc ?
> > What's wrong inside angstrom-
> > 2008.1.conf or what am I missing?
> >
> > Thank you for your support
> > Luca
> >
> >
> > Supera i limiti: raddoppia la velocit?? da 10 a 20 Mega!   Risparmia co=
n Tutto Incluso: telefono + adsl 20 mega a soli 29,95 ??? al mese per due a=
nni!  SCONTO DI 240 EURO!  http://abbonati.tiscali.it/telefono-adsl/prodott=
i/tc/tuttoincluso/?WT.mc_id=3D01fw
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> >
> >
> >
> > Supera i limiti: raddoppia la velocit?? da 10 a 20 Mega!
> > Risparmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 ??? a=
l mese per due anni!
> > SCONTO DI 240 EURO!
> > http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso/?WT.m=
c_id=3D01fw
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel





Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!=20
Risparmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC=
 al mese per due anni!
SCONTO DI 240 EURO!
http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso/?WT.mc_id=
=3D01fw


