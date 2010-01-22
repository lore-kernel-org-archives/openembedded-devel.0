Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NYF3l-0006xm-CE
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 09:40:10 +0100
Received: (qmail 22698 invoked by uid 813007); 22 Jan 2010 08:37:49 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 22 Jan 2010 08:37:49 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jan 2010 09:37:43 +0100
User-Agent: KMail/1.12.4 (Linux/2.6.33-rc2-00268-g45d28b0; KDE/4.3.4; x86_64; ;
	)
References: <op.u6w8vggrmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <op.u6w8vggrmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
Message-Id: <201001220937.43964.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why PREFERRED_PROVIDER_virtual/kernel in conf/machine/sun4cdm.conf does not work
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
X-List-Received-Date: Fri, 22 Jan 2010 08:40:10 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Dnia pi=C4=85tek, 22 stycznia 2010 o 07:41:30 Guo Hongruan napisa=C5=82(a):
> Hi guys,
>    I tried to build an openembedded project with the following setting:
> MACHINE=3Dsun4cdm  DISTRO=3Dmicro LIBC=3Deglibc
> But I noticed the following warning message after parsing the bb files:
>=20
> NOTE: multiple providers are available for virtual/kernel (linux-palmpre,
> linux-rt, gumstix-kernel, linux);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/kernel

> My question is:
> In the conf/machine/sun4cdm.conf, there is the defination of
> PREFFERRED_PROVIDER_virtual/kernel, see the following line:
> REFERRED_PROVIDER_virtual/kernel =3D "linux-sun4cdm"
> Why did it not work at all?
>=20
> Anyone can give me some hints?

edit recipes/linux/linux-sun4cdm_2.6.8.1.bb and remove COMPATIBLE_HOST line=
=2E=20
Due to changes it is no longer sparc-linux when you do build for sparc arch=
=2E=20
This line can be exchanged with (more proper one):

COMPATIBLE_MACHINE =3D "sun4cdm"

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




