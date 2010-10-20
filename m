Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P8fs3-0007lT-TB
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 23:06:54 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9KL6BKN028310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:06:11 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9KL6B8x016824
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:06:11 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9KL6BYR004834
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:06:11 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Wed, 20 Oct 2010 16:06:11 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Oct 2010 16:06:10 -0500
Thread-Topic: [oe] LICENSE field format
Thread-Index: ActwlvrsB88aLBCCR/uZLlJWOEzpKgAAvzQQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F0803110B3441@dlee06.ent.ti.com>
References: <20101020203828.GU11514@denix.org>
In-Reply-To: <20101020203828.GU11514@denix.org>
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
Subject: Re: LICENSE field format
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
X-List-Received-Date: Wed, 20 Oct 2010 21:06:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Wednesday, October 20, 2010 3:38 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] LICENSE field format
>=20
> All,
>=20
> We've had a number of discussions on the license matter recently. Trying
> to
> unify those brings us to the question of the LICENSE field format in
> recipes.
> As some projects are dual/triple licensed or use multiple licenses at the
> same
> time, it becomes hard to specify it all in the LICENSE field, especially
> when
> there are no rules defined. We do have several different formats used to
> separate multiple licenses, which is quite confusing and doesn't make it
> clear
> whether licenses are AND-ed or OR-ed (I know those are not legal terms,
> but
> for the purpose of this discussion that's fine :)) Here are some examples=
:
>=20
> LICENSE =3D "License1 License2"
> LICENSE =3D "License1|License2"
> LICENSE =3D "License1, License2"
> LICENSE =3D "License1+License2"
> LICENSE =3D "License1/License2"
>=20
> LICENSE =3D "Very Long License Name"
> LICENSE =3D "License with some exceptions"

I would vote for something along the following lines:

LICENSE =3D "License1|License2"=20
	- This means the code is licensed under the terms of both licenses

LICENSE =3D "License1,License2"
	- This means the code can use either license exclusively

in the src_distribute class spaces should be replaced with "-"s.  Of course=
, this could lead to licenses like "GPLv3+-with-GCC-RLE".

We should avoid separating licenses with "/" because that will mess up the =
directory structure or "+" because that would be confusing when + is also u=
sed to mean "or later" for some licenses like the GPL.

>=20
> To make matters worse, src_distribute.bbclass splits the field at spaces
> and
> creates directories for each token. So, for the last two examples above,
> we
> end up with 4 directories for every license - each word is a separate
> directory...
>=20
> I'd like to raise this issue and start a discussion on unifying the
> LICENSE
> field format (and fixing src_distribute.bbclass accordingly). Would be
> nice to
> collect some ideas here on the maillist and/or discuss it further during
> OEDEM
> next week. Please feel free to comment.
>=20
> --
> Denys
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


