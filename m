Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pv7Eo-0002Xs-Rx
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Mar 2011 13:02:35 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7A97349127F;
	Thu,  3 Mar 2011 13:01:05 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 3 Mar 2011 13:01:05 +0100
Message-ID: <4D6F8301.2030605@dresearch.de>
Date: Thu, 03 Mar 2011 13:01:05 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.14) Gecko/20110221 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D6B9C9D.7080107@dresearch.de>
In-Reply-To: <4D6B9C9D.7080107@dresearch.de>
X-OriginalArrivalTime: 03 Mar 2011 12:01:05.0700 (UTC)
	FILETIME=[ACC56640:01CBD99A]
Subject: Re: udev, udev-compat and old kernel
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
X-List-Received-Date: Thu, 03 Mar 2011 12:02:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 28.02.2011 14:01, schrieb Steffen Sledz:
> In our local development branch we've set
>=20
>  PREFERRED_VERSION_udev =3D "141"
>=20
> in angstrom-2008-preferred-versions.inc to force udev-141 for our old k=
ernel (2.6.24) at hipox machine. But i'm nearly sure that's not the corre=
ct way to do this. ;-)
>=20
> So what's the right way to handle this?
>=20
> Looking around i found the udev-compat141_141.bb recipe. In my understa=
nding this package adds some rules to newer udev packages (e.g. udev-151)=
 to be able to work with older kernels, so that it is possible to use new=
er udev versions. Right?
>=20
> In this case it should be enough to add some lines to conf/machine/hipo=
x.conf, recipes/udev/udev.inc, recipes/udev/udev_{151,154,162,165}.bb sim=
ilar to poodle machine. Right?

Ping!

It would be helpful if someone could help here to clarify things. The doc=
umentation on that is not very clear.

Thx,
Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



