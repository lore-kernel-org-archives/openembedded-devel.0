Received: from [63.210.253.238] (helo=ext-cn0ut-8.online-age.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1KEQPd-0001Hp-40
	for openembedded-devel@openembedded.org; Thu, 03 Jul 2008 17:08:07 +0200
Received: from int-cn0ut-6.online-age.net (int-cn0ut-6.online-age.net
	[3.159.252.75])
	by ext-cn0ut-8.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id m63F4X2u019115
	for <openembedded-devel@openembedded.org>;
	Thu, 3 Jul 2008 11:04:31 -0400
Received: from cinmlef06.e2k.ad.ge.com (int-cn0ut-6.online-age.net
	[3.159.252.75])
	by int-cn0ut-6.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id m63F4UOU019209 for <openembedded-devel@openembedded.org>;
	Thu, 3 Jul 2008 11:04:31 -0400
Received: from LONMLVEM08.e2k.ad.ge.com ([3.159.240.73]) by
	cinmlef06.e2k.ad.ge.com with Microsoft SMTPSVC(6.0.3790.2499); 
	Thu, 3 Jul 2008 11:04:30 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 3 Jul 2008 16:03:53 +0100
Message-ID: <1CADFA951940554D86FBD8B24BBFF3A0018FA35F@LONMLVEM08.e2k.ad.ge.com>
In-Reply-To: <f9a7555e0807020036g11261addn37530155264123b8@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Building a rootfs, without building a kernel
Thread-Index: AcjcFtBk+cebUcFfSmqn+d+yUoI7jwBBsP9Q
References: <4861533F.7020906@balister.org><440abda90806291608g2b4bdfbp71ed039b167e9aa9@mail.gmail.com><486A73F5.2010906@balister.org>
	<f9a7555e0807020036g11261addn37530155264123b8@mail.gmail.com>
From: "Welch, Martyn (GE EntSol,
	Intelligent Platforms)" <martyn.welch@gefanuc.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 03 Jul 2008 15:04:30.0605 (UTC)
	FILETIME=[1845E3D0:01C8DD1E]
Subject: Re: Building a rootfs, without building a kernel
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
X-List-Received-Date: Thu, 03 Jul 2008 15:09:46 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Ben Lau wrote:
>> Possibly, we should create a dummy kernel bb file since this may be
>> the best solution for the general case of people building images
>> without a working kernel bb file.=20
>>=20
>> Philip
>>=20
>=20
> I am not quite understand why OpenEmbedded force to generate kernel
> and the dependence would force it to be installed in the user land. As
> the kernel is usually installed on another partition. It should not be
> a part of the file system image.
>=20

But any drivers, etc. built as modules would need to be included in the
system's image and that at least would be a dependence.

Martyn

----
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


