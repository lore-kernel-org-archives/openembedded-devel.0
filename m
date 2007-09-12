Received: from [129.46.51.58] (helo=numenor.qualcomm.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mdevico@qualcomm.com>) id 1IVU9v-0005tn-MF
	for openembedded-devel@openembedded.org; Wed, 12 Sep 2007 17:29:45 +0200
Received: from totoro.qualcomm.com (totoro.qualcomm.com [129.46.61.158])
	by numenor.qualcomm.com (8.13.6/8.12.5/1.0) with ESMTP id
	l8CFQVlE006449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 08:26:32 -0700
Received: from SANEXCAS02.na.qualcomm.com (sanexcas02.qualcomm.com
	[172.30.36.176])
	by totoro.qualcomm.com (8.13.6/8.13.6/1.0) with ESMTP id l8CFQUG4003014
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Sep 2007 08:26:31 -0700 (PDT)
Received: from NAEX16.na.qualcomm.com ([10.47.6.158]) by
	SANEXCAS02.na.qualcomm.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 12 Sep 2007 08:26:30 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 12 Sep 2007 08:26:29 -0700
Message-ID: <9870FB9891C7AD4B910E20B14776DF8501041935@NAEX16.na.qualcomm.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHMEOAMDAA.skoroneos@digital-opsis.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] bootstrap-image boot error: Inconsistency detected
	byld.so:dynamic_link.h...
Thread-Index: Acf1BrOvk5hjryhBQPKHIxwTqj9lqgASTY4w
References: <9870FB9891C7AD4B910E20B14776DF850104187B@NAEX16.na.qualcomm.com>
	<HOECLKEKOHLAMMGDLLBHMEOAMDAA.skoroneos@digital-opsis.com>
From: "DeVico, Michael" <mdevico@qualcomm.com>
To: <openembedded-devel@openembedded.org>
X-OriginalArrivalTime: 12 Sep 2007 15:26:30.0632 (UTC)
	FILETIME=[4B35C680:01C7F551]
Subject: Re: bootstrap-image boot error: Inconsistency detected byld.so:dynamic_link.h...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2007 15:29:45 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm using the angstrom-2007.1 distro, and it looks like busybox=20
1.2.1-r13 is the version being used.

Thanks!
--Mike



-----Original Message-----
From: openembedded-devel-bounces@openembedded.org
[mailto:openembedded-devel-bounces@openembedded.org] On Behalf Of
Stelios Koroneos
Sent: Tuesday, September 11, 2007 11:10 PM
To: openembedded-devel@openembedded.org
Subject: Re: [oe] bootstrap-image boot error: Inconsistency detected
byld.so:dynamic_link.h...

Mike,
Looks like a busybox problem
What distro and busybox version are you using ?

Stelios S. Koroneos

Digital OPSiS - Embedded Intelligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org=20
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of=20
> DeVico, Michael
> Sent: Tuesday, September 11, 2007 10:36 PM
> To: openembedded-devel@openembedded.org
> Subject: [oe] bootstrap-image boot error: Inconsistency detected=20
> by ld.so:dynamic_link.h...
>=20
>=20
> Hello,
>=20
> =20
>=20
> This is more than likely a configuration/environment setup issue
rather
> that a bug, so I'm posting it here
>=20
> rather than filing a bug for now...
>=20
> =20
>=20
> I built the bootstrap-image using the angstrom-2007.1 distro and the
> i686-generic machine definition.
>=20
> My build host is running Fedora FC7 and the processor is an Intel Core
2
> Duo.
>=20
> =20
>=20
> However, when I try to boot, the kernel progresses through the device
> hw/driver initialization and=20
>=20
> successfully mounts  the rootfs, but then fails with the following
error
> message:
>=20
> =20
>=20
> Inconsistency detected by ld.so: dynamic_link.h: 179
> elf_get_dynamic_info: Assertion 'Info[15] =3D=3D ((void*)0)' failed!
>=20
> =20
>=20
> If I point it to a partition containing the helloworld root fs, it
> prints "Hello World" as expected, so it would
>=20
> appear to be a problem with the bootstrap image rootfs rather than the
> kernel itself, but this is my first=20
>=20
> experience building a linux system from the ground up so I could
> definitely use some help here.
>=20
> =20
>=20
> Any ideas?
>=20
> =20
>=20
> Thanks in advance!
>=20
> --Mike
>=20
> =20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


