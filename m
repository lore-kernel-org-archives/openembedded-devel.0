Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1PAloT-0004iM-K3
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 17:51:51 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9QFp6oA026021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 10:51:06 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9QFp6wJ020244
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 10:51:06 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9QFp65g005716
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Oct 2010 10:51:06 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Tue, 26 Oct 2010 10:51:05 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Oct 2010 10:51:04 -0500
Thread-Topic: [oe] Use of == in shell scripts
Thread-Index: Act1Iwjj4Saa47wmS/qpkOFDYvw2DQAAgZkw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B3CFC@dlee06.ent.ti.com>
References: <4CC6F440.10509@opendreambox.org>
In-Reply-To: <4CC6F440.10509@opendreambox.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Use of == in shell scripts
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
X-List-Received-Date: Tue, 26 Oct 2010 15:51:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Andreas Oberritter
> Sent: Tuesday, October 26, 2010 10:31 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] Use of =3D=3D in shell scripts
>=20
> Dear all,
>=20
> I noticed a common mistake in various OE recipes, classes and contrib
> scripts: Instead of =3D, =3D=3D is used as equality operator, in at least=
 91
> places in 64 files (without recipes/obsolete: 83 in 60 files). This
> isn't a problem with bash, but it isn't the standard syntax and at least
> dash does not support it.

Isn't bash the supported shell?  If I remember correctly in bash "=3D=3D" w=
ill also work with numbers whereas "=3D" is only for strings.

>=20
> I used the following command line to find the occurences:
>=20
> git grep 'if\s*\[.*=3D=3D.*\]'
>=20
> This command fixes all occurences:
>=20
> for i in `git grep -l 'if\s*\[.*=3D=3D.*\]'`; do
> 	sed -i $i -e 's,\(if\s*\[.*\)=3D=3D\(.*\]\),\1=3D\2,';
> done
>=20
> One of the matches is a false positive:
> recipes/uclibc/uclibc-0.9.29/uClibc-0.9.29-nonposix_bashisms.patch
>=20
> How do I submit such a patch? 60 patches may be too much for such a
> relatively simple change, but, on the other hand, everything in a single
> patch may be unhandy as well.
>=20
> How about splitting it into 5 patches?
>=20
> - classes (7 files)
> - contrib (4 files)
> - recipes/*/*.bb (24 files)
> - recipes/*/*.inc (14 files)
> - other files in recipes except recipes/obsolete (11 files)
>=20
> Any opinions?
>=20
> Regards,
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


