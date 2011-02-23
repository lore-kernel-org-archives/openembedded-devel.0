Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PsKX2-0000w4-56
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 20:37:52 +0100
Received: by fxm8 with SMTP id 8so3938484fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 11:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=pS4bYJcDgp96XMtVp76QcMbJ+UQgNs6+YxhQwN2uxmw=;
	b=Rl/kaCZ1kMNjdTT8CNpQnf+11MLHECGVoZ0ElswThhHfPKZ8HnXS7xrCbimDaBgP4y
	eCon7pc+nK9cU9ypUqY3yxIWxOynzbvllAB4lJDvCApv4x0yqxLt8H1Z0BskFep6551L
	MQLYHBl5wFHMOHGjPQlCzXNnWU0fLEYPumMEw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=atI22HSPbrGASLFqroQ+mf1pZ6p9Qo0vIQTdeyTJhXM9GZbWbtHHqAsshGvi2JESMw
	GQK9oWjPMV8fCOM/ZQEwm9rN+CcNs1aMYGhHnbU0bsOvTdDr+poRpGSoUkOIKctvFTx2
	fxpRxDLdM2/Kbzg/w/vy5KFp8iYf5RudXVQVo=
Received: by 10.223.79.14 with SMTP id n14mr5784108fak.19.1298489578512; Wed,
	23 Feb 2011 11:32:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Wed, 23 Feb 2011 11:28:51 -0800 (PST)
In-Reply-To: <27863997.429871298461794177.JavaMail.defaultUser@defaultHost>
References: <27863997.429871298461794177.JavaMail.defaultUser@defaultHost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 23 Feb 2011 11:28:51 -0800
Message-ID: <AANLkTim9Bni0kDpFZRbb1XNeerRRFc6vYuLtRkTeDvc5@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 23 Feb 2011 19:37:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2011 at 3:49 AM, Luca Bolognini <l.bolognini@tiscali.it> wr=
ote:
> Hi,thank you Ahsan for you reply.I solved my issue and I succeed in using=
 external toolchain CodeSourcery2009q1 to cross-compile some packages in my=
 OE 2010.12 release.However I didn't create any symlink of arm-angstrom-lin=
ux-gnueabi-gcc to arm-none-linux-gnueabi-gcc.I added an instantiation of TA=
RGET_SYS variable to the hints of Denys and Tom (se reference link in my pr=
evious email).It's important to do so in order not to have errors in the do=
_install task of external-toolchain-csl.bb recipe.Then, as a resume, my ope=
nembedded/conf/distro/angstrom-2008.1.conf file changed in this way:
> # Set the toolchain type (internal, external) and brand (generic, csl etc=
.)# LUCATARGET_VENDOR =3D "-none"TOOLCHAIN_TYPE ?=3D "external"TOOLCHAIN_BR=
AND ?=3D "csl"TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"TARGET_SYS =3D "arm-=
none-linux-gnueabi"TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-=
gnueabi"PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"require conf/distro/includ=
e/toolchain-external.inc
> instead of
> # Set the toolchain type (internal, external) and brand (generic, csl etc=
.)TOOLCHAIN_TYPE ?=3D "internal"TOOLCHAIN_BRAND ?=3D ""
> Then it worked.Bye,Luca
>

good it worked for you. Would you please document the steps you took
from the beginning to get it working ?
and send it as reply to this email ? We would like to add this into
the wiki or FAQs

Thanks for your help
-Khem

>
>
> ----Messaggio originale----
> Da: Noor_Ahsan@mentor.com
> Data: 22/02/2011 10.47
> A: <openembedded-devel@lists.openembedded.org>
> Ogg: Re: [oe] External toolchain
>
> Hello Luca,
>
> Probably you need to create symbolic links of arm-angstrom-linux-
> gnueabi-gcc to arm-none-linux-gnueabi-gcc. OE assumes that the compiler n=
ame is arm-angstrom-linux-gnueabi-gcc. You can see the "CC" variable value =
by take environment of libtool-cross (using -e options) that how OE is crea=
ting the name of compiler.
>
> Regards,
> Noor
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Luca Bolognini
> Sent: Tuesday, February 22, 2011 2:16 PM
> To: Open Embedded Mailing List
> Subject: [oe] External toolchain
>
> Hi,
> I would like to use an external toolchain (CodeSourcery2009q1) to
> cross-compile some packages for my beagleboard (more or less the same
> that happens in Arago) and then I expect not to download glibc package
> and cross-compile again libc, libpthread and so on. I would like to use
> the libraries inside my external CodeSourcery SDK.
> I followed some
> hints by Denys and Tom ( http://lists.linuxtogo.
> org/pipermail/openembedded-devel/2010-April/019521.html ) and I put
>
> #
> LUCA
> TARGET_VENDOR =3D "-none"
> TOOLCHAIN_TYPE ?=3D "external"
>
> TOOLCHAIN_BRAND ?=3D "csl"
> TOOLCHAIN_PATH =3D "/opt/ti/codesourcery"
>
> TOOLCHAIN_SYSPATH =3D "${TOOLCHAIN_PATH}/arm-none-linux-gnueabi"
>
> PATH_prepend =3D "${TOOLCHAIN_PATH}/bin:"
> require
> conf/distro/include/toolchain-external.inc
>
> inside my
> openembedded/conf/distro/angstrom-2008.1.conf
>
> As you know, cross-
> compiler provided by CodeSoucery is arm-none-linux-gnueabi-gcc but I
> get the following error with libtool-cross_2.2.6b.bb:
> Build
> Configuration:
> BB_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "1.8.19"
> METADATA_BRANCH =C2=A0 =3D
> "release-2010.12"
> METADATA_REVISION =3D "dec3967"
> TARGET_ARCH =C2=A0 =C2=A0 =C2=A0 =3D
> "arm"
> TARGET_OS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "linux-gnueabi"
> MACHINE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D
> "beagleboard"
> DISTRO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "angstrom"
> DISTRO_VERSION =C2=A0 =C2=A0=3D
> "2010.7-test-20110221"
> TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "hard"
> [...]
> | checking for
> arm-angstrom-linux-gnueabi-gcc... arm-angstrom-linux-gnueabi-gcc -
> march=3Darmv7-a -mtune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mth=
umb-
> interwork -mno-thumb
> | checking whether the C compiler works... no
> |
> configure: error: in `/home/bolognini/diskp2/diskp2.4/pure-
> oe/build/tmp/work/armv7a-angstrom-linux-gnueabi/libtool-cross-2.2.6b-
> r27.1/libtool-2.2.6b':
> | configure: error: C compiler cannot create
> executables
>
> Obviously OE doesn't have to find arm-angstrom-linux-
> gnueabi-gcc, but why does it search for arm-angstrom-linux-gnueabi-gcc
> instead of arm-none-linux-gnueabi-gcc ?
> What's wrong inside angstrom-
> 2008.1.conf or what am I missing?
>
> Thank you for your support
> Luca
>
>
> Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega! =C2=A0 Rispa=
rmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=AC al m=
ese per due anni! =C2=A0SCONTO DI 240 EURO! =C2=A0http://abbonati.tiscali.i=
t/telefono-adsl/prodotti/tc/tuttoincluso/?WT.mc_id=3D01fw
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
>
>
> Supera i limiti: raddoppia la velocit=C3=A0 da 10 a 20 Mega!
> Risparmia con Tutto Incluso: telefono + adsl 20 mega a soli 29,95 =E2=82=
=AC al mese per due anni!
> SCONTO DI 240 EURO!
> http://abbonati.tiscali.it/telefono-adsl/prodotti/tc/tuttoincluso/?WT.mc_=
id=3D01fw
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


