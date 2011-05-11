Received: from exch01.praxiseng.com ([71.16.158.232])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dpsmith@praxiseng.com>) id 1QK7xN-0000EI-0R
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 May 2011 13:51:57 +0200
Received: from exch02.praxislan01.com ([192.168.200.77]) by
	exch01.praxiseng.com with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 11 May 2011 07:49:04 -0400
Received: from exch02.praxislan01.com ([127.0.0.1]) by exch02 ([127.0.0.1])
	with mapi id 14.01.0270.001; Wed, 11 May 2011 07:49:04 -0400
From: "Daniel P. Smith" <dpsmith@praxiseng.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Puzzled over Angstrom generated kernel on a new board
Thread-Index: AcwPOdq8iN+rJmT4TLOg4+SvaqByOgAJGLAAABw5XiA=
Date: Wed, 11 May 2011 11:49:04 +0000
Message-ID: <25BE6376FCDB1A44A12A866DA4936762528895@exch02>
References: <25BE6376FCDB1A44A12A866DA493676252871F@exch02>
	<iqbung$ak0$1@dough.gmane.org>
In-Reply-To: <iqbung$ak0$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.201.28]
MIME-Version: 1.0
X-OriginalArrivalTime: 11 May 2011 11:49:04.0673 (UTC)
	FILETIME=[6D822910:01CC0FD1]
Subject: Re: Puzzled over Angstrom generated kernel on a new board
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
X-List-Received-Date: Wed, 11 May 2011 11:51:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Tuesday, May 10, 2011 2:05 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Puzzled over Angstrom generated kernel on a new board
>=20
>=20
> Try defining
>=20
> UBOOT_ENTRYPOINT =3D "0x80008000"
> UBOOT_LOADADDRESS =3D "0x80008000"
>=20
> You probably need to change the values to match your hw, though

Haha, my apologies and thanks as I was looking through the bitbake logs for=
 the kernel and found that the recipe recreates the uImage file setting the=
 entry and load addr's to 0x20008000, where as the CNS3xxx is expecting 0x0=
0008000. But this brings up the question for me is why does the kernel reci=
pes recreate the uImage? The make uImage command will/should pull the zrela=
ddr from the sub-arch's Makefile.boot. I would assume it is so OE can provi=
de the flexibility, but I don't like to make assumptions.


On a side note, has anyone considered cataloging the variety of variables t=
hat can be set by a recipe author? I would have never known about the two K=
oen pointed out had I not asked here or spent hours poring over the interna=
ls to find out where 0x20008000 was coming from.


V/r,
Daniel P. Smith



