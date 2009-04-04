Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LqCnj-0005U3-JT
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 Apr 2009 22:49:18 +0200
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id BA516E080FF;
	Sat,  4 Apr 2009 22:46:33 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp6-g21.free.fr (Postfix) with ESMTP id B93EAE0810A;
	Sat,  4 Apr 2009 22:46:30 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by sharky.jerryweb.org (Postfix) with ESMTP id EE22F1841EA;
	Sat,  4 Apr 2009 22:46:30 +0200 (CEST)
Message-ID: <49D7C726.5080803@bolloretelecom.eu>
Date: Sat, 04 Apr 2009 22:46:30 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.8.1.19) Gecko/20090103 Lightning/0.8 Thunderbird/2.0.0.19
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <gr7nfd$32a$1@ger.gmane.org>
In-Reply-To: <gr7nfd$32a$1@ger.gmane.org>
X-SA-Exim-Connect-IP: 212.27.42.6
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Sat, 04 Apr 2009 20:49:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

H







> conf/machine/beagleboard.conf:
> # Increase this everytime the kernel changes
> MACHINE_KERNEL_PR =3D "r39"
>=20
> classes/kernel.bbclass:
> # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> # rebuilds for kernel and external modules
> PR =3D "${MACHINE_KERNEL_PR}"
>=20
> class/module-base.bbclass:
> # A machine.conf or local.conf can increase MACHINE_KERNEL_PR to force
> # rebuilds for kernel and external modules
> PR =3D "${MACHINE_KERNEL_PR}"
>=20
> -----
>=20
> I don't really like this method, but I'm having a hard time coming up
> with a decent solution that:
>=20
> a) works
> b) requires less or equal manual work
> c) keeps PR in sync between different buildhosts
>=20
> regards,
>=20
> Koen
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris


