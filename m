Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P9dCn-0001GR-6K
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 14:28:14 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 42C3D491278;
	Sat, 23 Oct 2010 14:27:36 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
Received: from 192.168.32.8 ([192.168.32.8]) by exchange.intern.dresearch.de
	([192.168.32.16]) with Microsoft Exchange Server HTTP-DAV ;
	Sat, 23 Oct 2010 12:27:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; U; Linux i686; de;
	rv:1.9.1.12) Gecko/20100914 SUSE/3.0.8 Lightning/1.0b1
	Thunderbird/3.0.8
Date: Sat, 23 Oct 2010 14:27:34 +0200
Message-ID: <DB561678F08F554EB0D9F21B70E268A505AF5C@exchange.intern.dresearch.de>
In-Reply-To: <4CC02E01.1020107@dresearch.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [PATCH 2/2] epiphany-2.30.2: unbreak do_configure by
	setting ca-file path
Thread-Index: Actyrayg0+XRFdo7QuGJgySgxmtZWg==
References: <4CBECD95.1050700@dresearch.de>	<1287573007-24350-2-git-send-email-sledz@dresearch.de>	<4CC00458.7050500@dresearch.de>	<4CC00DD9.1090606@freyther.de>
	<4CC02E01.1020107@dresearch.de>
From: "Sledz, Steffen" <sledz@dresearch.de>
To: <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: koen@openembedded.org
Subject: Re: [PATCH 2/2] epiphany-2.30.2: unbreak do_configure by setting ca-file path
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
X-List-Received-Date: Sat, 23 Oct 2010 12:28:14 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message

Am 21.10.2010 14:11, schrieb Steffen Sledz:
> Am 21.10.2010 11:54, schrieb Holger Freyther:
>> It doesn't look correct. Judging from the code epiphany
>> will now look into ${STAGING_DIR_HOST}/etc/ssl/ca-bundle.pem
>> at runtime.
>=20
> OK, you're right.
>=20
>> What about stripping away this and use the etcdir variable?
>=20
> Sorry, no idea how to do this. Do you have an example?

I've done some further investigations here.

The problem is that the configure script checks for the ca-file (tries =
some default locations, or uses the given path) *at build time at the =
build host* und uses the resulting path *at runtime at the target*.
I believe this is an error in the epiphany package itself.

I see two options here (i prefer the 1st):

1. Use the --with-ca-file option but disable the existance check in =
configure.ac

2. Use --without-ca-file.

Both would obsolete the related patch i suggested for ca-certificates =
recipe.

Any other options?

BTW: Why does this error comes up in my builds and not in others?
I think the cause are the default locations configure tries. These are =
/etc/pki/tls/certs/ca-bundle.crt and /etc/ssl/certs/ca-certificates.crt.
I use openSUSE-11.3 as build host which puts its own ca bundle at =
/etc/ssl/ca-bundle.pem. May be Fedore or Ubuntu use one of the locations =
mentioned above.

Steffen



