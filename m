Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Pu2kS-000711-9L
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 14:02:48 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 5A642491278;
	Mon, 28 Feb 2011 14:01:23 +0100 (CET)
Received: from [10.32.10.2] ([10.32.10.2]) by exchange.intern.dresearch.de
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 28 Feb 2011 14:01:23 +0100
Message-ID: <4D6B9C9D.7080107@dresearch.de>
Date: Mon, 28 Feb 2011 14:01:17 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 28 Feb 2011 13:01:23.0323 (UTC)
	FILETIME=[99CD9CB0:01CBD747]
Cc: Koen Kooi <koen@openembedded.org>
Subject: udev, udev-compat and old kernel
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
X-List-Received-Date: Mon, 28 Feb 2011 13:02:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In our local development branch we've set

 PREFERRED_VERSION_udev =3D "141"

in angstrom-2008-preferred-versions.inc to force udev-141 for our old ker=
nel (2.6.24) at hipox machine. But i'm nearly sure that's not the correct=
 way to do this. ;-)

So what's the right way to handle this?

Looking around i found the udev-compat141_141.bb recipe. In my understand=
ing this package adds some rules to newer udev packages (e.g. udev-151) t=
o be able to work with older kernels, so that it is possible to use newer=
 udev versions. Right?

In this case it should be enough to add some lines to conf/machine/hipox.=
conf, recipes/udev/udev.inc, recipes/udev/udev_{151,154,162,165}.bb simil=
ar to poodle machine. Right?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


