Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JROb0-0000td-PX
	for openembedded-devel@openembedded.org; Tue, 19 Feb 2008 10:17:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1J9GGsV022753
	for <openembedded-devel@openembedded.org>; Tue, 19 Feb 2008 09:16:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22469-07 for <openembedded-devel@openembedded.org>;
	Tue, 19 Feb 2008 09:16:12 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1J9G8F0022741
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 19 Feb 2008 09:16:08 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <47BA9022.6020105@bolloretelecom.eu>
References: <47BA9022.6020105@bolloretelecom.eu>
Date: Tue, 19 Feb 2008 09:16:08 +0000
Message-Id: <1203412568.21824.10.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	m1J9GGsV022753
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: conf/kernel.bbclass: staging for linux >= 2.6.24 on x86	needs fixing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Feb 2008 09:17:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 2008-02-19 at 09:15 +0100, Jeremy Lain=C3=A9 wrote:
> Up until linux 2.6.23, for x86 archs we put arch/i386/Makefile* into
> staging, but it looks as though from 2.6.24 onwards we should be
> staging arch/x86/Makefile* instead.
>=20
> The attached patch works for me, but I am not sure this is the proper
> way to fix this as it introduces some arch-specific code in an
> otherwise generic bbclass. Any ideas?
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- classes/kernel.bbclass      3aa638c9a8de8e90342e08b530a40c8c2f12049=
7
> +++ classes/kernel.bbclass      7b688b82d6be204068a4bdbb29bd16cfb63d7b2=
f
> @@ -128,6 +128,9 @@ kernel_do_stage() {
>         if [ -e arch/${ARCH}/Makefile ]; then
>                 install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}
>                 install -m 0644 arch/${ARCH}/Makefile* ${STAGING_KERNEL=
_DIR}/arch/${ARCH}
> +       elif [ "${ARCH}" =3D "i386" -a -e arch/x86/Makefile ]; then
> +               install -d ${STAGING_KERNEL_DIR}/arch/x86
> +               install -m 0644 arch/x86/Makefile* ${STAGING_KERNEL_DIR=
}/arch/x86
>         fi
>         cp -fR include/config* ${STAGING_KERNEL_DIR}/include/  =20
>         install -m 0644 ${KERNEL_OUTPUT} ${STAGING_KERNEL_DIR}/${KERNEL=
_IMAGETYPE}

That solution looks fine to me. As mentioned on irc we also need to deal
with ARCH =3D x86_64 and rather than a big complex if clause I think its
simply easiest to use x86 as a fallback so:

elif [ -e arch/x86/Makefile ]; then

shouldn't cause any problems.=20

Maybe just add a comment about this being to catch the ARCH =3D i386 and
x86_64 cases so we remember why we did this in a years time :).

Cheers,

Richard




