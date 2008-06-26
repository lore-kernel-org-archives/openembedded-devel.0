Received: from [64.14.54.239] (helo=ext-nj2ut-9.online-age.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1KBqF1-0004gq-Ci
	for openembedded-devel@openembedded.org; Thu, 26 Jun 2008 14:06:19 +0200
Received: from int-nj2ut-4.online-age.net (int-nj2ut-4.online-age.net
	[3.159.237.73])
	by ext-nj2ut-9.online-age.net (8.13.6/8.13.6/20051114-SVVS-TLS-DNSBL)
	with ESMTP id m5QC42dT027202
	for <openembedded-devel@openembedded.org>;
	Thu, 26 Jun 2008 08:04:02 -0400
Received: from cinmlef06.e2k.ad.ge.com (int-nj2ut-4.online-age.net
	[3.159.237.73])
	by int-nj2ut-4.online-age.net (8.13.6/8.13.6/20050510-SVVS) with ESMTP
	id m5QC40jp020118 for <openembedded-devel@openembedded.org>;
	Thu, 26 Jun 2008 08:04:01 -0400
Received: from LONMLVEM08.e2k.ad.ge.com ([3.159.240.73]) by
	cinmlef06.e2k.ad.ge.com with Microsoft SMTPSVC(6.0.3790.2499); 
	Thu, 26 Jun 2008 08:04:00 -0400
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 26 Jun 2008 13:03:14 +0100
Message-ID: <1CADFA951940554D86FBD8B24BBFF3A0018346B6@LONMLVEM08.e2k.ad.ge.com>
In-Reply-To: <4861533F.7020906@balister.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Building a rootfs, without building a kernel
Thread-Index: AcjWNj9CF3+a7Tu5Saqn3gFGg21BiQBTfHCA
References: <4861533F.7020906@balister.org>
From: "Welch, Martyn (GE EntSol,
	Intelligent Platforms)" <martyn.welch@gefanuc.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 26 Jun 2008 12:04:00.0398 (UTC)
	FILETIME=[B81332E0:01C8D784]
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
X-List-Received-Date: Thu, 26 Jun 2008 12:06:19 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

Philip Balister wrote:
> I am trying to build a powerpc root file system for a xilinx ml403
> board. Since we do not have a working kernel build for this machine, I
> tried commenting out the PREFERRED_PROVIDER for virtual/linux. The
> build=20
> then tries to build linux-rt. I tried ASSUME_PROVIDED for the kernel
> when the preferred provider is not commented out and it still tries to
> build the kernel.
>=20
> Looking at the dependency graphs seems to suggest the requirement
> comes=20
> from the do_rootfs task.
>=20
> Does anyone know how to build an image, without building a kernel for
> a=20
> machine?
>=20

How about just including a kernel recipe for a similar device?

That's what I tend to do just to get a root filesystem which I can use
for development.

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


