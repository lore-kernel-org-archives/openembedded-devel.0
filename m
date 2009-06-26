Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MK6NM-0003t3-7X
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Jun 2009 10:01:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 8C77C1409724
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2009 09:51:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UhhEPWDXgC7y
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2009 09:51:49 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 626AE1416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2009 09:51:49 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4A43D4E4.90409@balister.org>
References: <1245871136.5939.3.camel@utx.utx.cz>
	<h1u7s2$b8l$1@ger.gmane.org>  <4A43D4E4.90409@balister.org>
Date: Fri, 26 Jun 2009 09:50:13 +0200
Message-Id: <1246002613.3974.12.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Fri, 26 Jun 2009 08:01:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Philip Balister wrote:
=EF=BB=BF
>Until mainstream=20
>distros go libusb1 + libusb-compat, there is not much motivation to=20
>resolve the issue in gnuradio.

openSUSE 11.2 will probably do it.

> I think there are only a small handful of apps that do not use the=20
> public libusb interface.
>=20
> Do you have a specific package you are having issues with? Take a look=20
> at the gnuradio.inc file to see how we solved the problem there.

I did never touch gnuradio, but I seen mails in the list.

There were problems in past with libusb-compat and:

gphoto, f-spot: Problems were fixed before libusb-compat-0.1.0.

gpsbabel + Garmin GPS =3D depended on undocumented libusb0 USB endpoint
direction sanitization. Fixed in libusb-compat-0.1.1.

gphoto + no USB subsystem: Crash after initialization failure. Fixed
in =EF=BB=BFlibusb-compat-0.1.2.

There are no known issues with =EF=BB=BF=EF=BB=BFlibusb-compat-0.1.2 yet.


To resume my plan:

Introduce virtual/libusb0 for now and set is as default to
libusb-compat.

When all problems of libusb-compat will be fixed, drop libusb-0
completely and optionally replace virtual/libusb0 by libusb-compat.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



