Received: from [213.36.80.91] (helo=mail.libertysurf.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1JysSi-0002iV-A8
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 May 2008 19:50:52 +0200
Received: from blini.bolloretelecom.eu (62.210.194.121) by
	mail.libertysurf.net (7.3.118.8)
	id 482DD26E001E8FBE for openembedded-devel@lists.openembedded.org;
	Wed, 21 May 2008 20:56:52 +0200
Received: from [192.168.95.64] (unknown [192.168.95.64])
	by blini.bolloretelecom.eu (Postfix) with ESMTP id 39F1F23E38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 May 2008 19:48:16 +0200 (CEST)
Message-ID: <48346060.1030101@bolloretelecom.eu>
Date: Wed, 21 May 2008 19:48:16 +0200
From: =?ISO-8859-1?Q?Jeremy_Lain=E9?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.0.14eol) Gecko/20080509 Thunderbird/1.5.0.14eol
	Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.94.2.0
Subject: oestats: build statistics for OpenEmbedded
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 21 May 2008 17:50:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: Quoted-Printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all!

I happy to announce the availability of "oestats", a web application
for collecting and viewing OpenEmbedded build reports. In keeping with
OE / bitbake it is written in Python and uses the Django web framework.

A live demo is available at:

http://oestats.jerryweb.org/

If you want to add your build stats, make sure your copy of OE is up
to date and add the following to your build/conf/local.conf:

|INHERITS +=3D "oestats-client"
OESTATS_SERVER =3D "oestats.jerryweb.org"
OESTATS_BUILDER =3D "your_nickname"|

Fair warning: this is a test server, no promises on availability
though I'll do my best :)

Source code and setup notes for the server are available at:

http://opensource.bolloretelecom.eu/projects/oestats/

Your feedback and improvements are most welcome!

Cheers,

- --
Jeremy LAINE
Bollor=E9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFINGBfCL1n3lVB9EYRAgN4AJ0aU1hluvgh76/WyMwR9u7XrneHDgCguVys
1e0yZ08ryOf0f48HOGFUmVU=3D
=3DkCuy
-----END PGP SIGNATURE-----



