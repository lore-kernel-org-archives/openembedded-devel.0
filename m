Received: from [64.14.54.239] (helo=ext-nj2ut-9.online-age.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1KOY6T-0000m9-4W
	for openembedded-devel@openembedded.org; Thu, 31 Jul 2008 15:22:01 +0200
Received: from int-nj2ut-6.online-age.net (int-nj2ut-6.online-age.net
	[3.159.237.75])
	by ext-nj2ut-9.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id m6VDKCV5016941
	for <openembedded-devel@openembedded.org>;
	Thu, 31 Jul 2008 09:20:12 -0400
Received: from cinmlef12.e2k.ad.ge.com (int-nj2ut-6.online-age.net
	[3.159.237.75])
	by int-nj2ut-6.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id m6VDKBet022616 for <openembedded-devel@openembedded.org>;
	Thu, 31 Jul 2008 09:20:12 -0400
Received: from LONMLVEM08.e2k.ad.ge.com ([3.159.240.73]) by
	cinmlef12.e2k.ad.ge.com with Microsoft SMTPSVC(6.0.3790.2499); 
	Thu, 31 Jul 2008 09:20:12 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 31 Jul 2008 14:20:52 +0100
Message-ID: <1CADFA951940554D86FBD8B24BBFF3A001C21445@LONMLVEM08.e2k.ad.ge.com>
In-Reply-To: <d2b9ea600807310225n34987648w95899d9c75276f9e@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] gcc-4.1.2 compile breaking in OE stable for powerpc
Thread-Index: Acjy78nI+O4k2xAJRjGc8tVK1TwhSAAID2Kw
References: <1CADFA951940554D86FBD8B24BBFF3A001C20F91@LONMLVEM08.e2k.ad.ge.com>
	<d2b9ea600807310225n34987648w95899d9c75276f9e@mail.gmail.com>
From: "Welch, Martyn (GE EntSol,
	Intelligent Platforms)" <martyn.welch@gefanuc.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 31 Jul 2008 13:20:12.0090 (UTC)
	FILETIME=[297949A0:01C8F310]
Subject: Re: gcc-4.1.2 compile breaking in OE stable for powerpc
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
X-List-Received-Date: Thu, 31 Jul 2008 13:22:01 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Jul 2008 11:25:56 +0200
"Esben Haabendal" <esbenhaabendal@gmail.com> wrote:
> Hi

Hi Esben, thanks for the reply.

>=20
> I am using org.openembedded.stable for a powerpc target.
> I am using a custom distro, using gcc-4.2.2 (although
> gcc-cross-initial is 4.1.2),
> and it works nicely without any patches to toolchain recipes.
>=20

Hmm, gcc-4.2.1 and gcc-4.2.2 fail with a different error for me:

cc1: error: unrecognized command line option "-fno-toplevel-reorder"

This happens whilst compiling crtbegin.o, I can even see this option in
the Makefile.

The manpage for gcc 4.1.2 doesn't shed any light on this option and
google is being rather quite as well, any ideas?

Martyn

--=20
Martyn Welch MEng MPhil MIET
Principal Software Engineer

GE Fanuc Intelligent Platforms
Tove Valley Business Park, Towcester,
Northants, NN12 6PF, United Kingdom

Telephone: +44 (0) 1327 359444
Direct Dial: +44 (0) 1327 322748
Fax: +44 (0) 1327 322800
email: martyn.welch@gefanuc.com
web: www.gefanuc.com

GE Fanuc Intelligent Platforms Ltd, registered in England and Wales
(3828642) at 100 Barbirolli Square, Manchester, M2 3AB, VAT GB 729 849
476

GE Fanuc Intelligent Platforms Confidential and Proprietary. If you
have received this message in error please notify us immediately and
permanently remove it from your system and destroy any printed
hardcopies. =20


