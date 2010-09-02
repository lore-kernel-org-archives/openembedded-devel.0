Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Or8jm-0002An-NA
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 14:17:54 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o82CHEip028919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 07:17:14 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o82CHEE1028345
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 07:17:14 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o82CHEhO014336
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 07:17:14 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 2 Sep 2010 07:17:14 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Sep 2010 07:17:12 -0500
Thread-Topic: [oe] SOC_FAMILY broken
Thread-Index: ActKGtyqDLRb+q+fSBuzFk1ItjTDUwAfci/g
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310754538@dlee06.ent.ti.com>
References: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
In-Reply-To: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SOC_FAMILY broken
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
X-List-Received-Date: Thu, 02 Sep 2010 12:17:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Wednesday, September 01, 2010 4:15 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] SOC_FAMILY broken
>=20
> Patch
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D070763903=
58f
> 211bd96779bec2d6eb5eaa0ad699
> creates errors like:
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime
> entity 'virtual/arm-oe-linux-gnueabi-gcc-2.95' but it wasn't found in
> any PACKAGE or RPROVIDES variables
>=20
> Root cause: if SOC_FAMILY is not set (awhich is the case for most
> MACHINEs  and all distro's except angstrom) the test in base.bbclass
> to skip recipes for different machines never raises the SkipPackage
> exception.
>=20
> This is the current code (about line 387 in base.bbclass):
>         need_machine =3D bb.data.getVar('COMPATIBLE_MACHINE', d, 1)
>         if need_machine:
>             import re
>             this_machine =3D bb.data.getVar('MACHINE', d, 1)
>             if this_machine and not re.match(need_machine, this_machine):
>                 this_soc_family =3D bb.data.getVar('SOC_FAMILY', d, 1)
>                 if this_soc_family and not re.match(need_machine,
> this_soc_family):
>                     raise bb.parse.SkipPackage("incompatible with
> machine %s" % this_machine)
>=20
> I see two possible fixes.
> 1. Make sure SOC_FAMILY is always defined. E.g. in bitbake.conf say
> SOC_FAMILY ?=3D "Unknown"
> 2. improve the test to deal with an undefined soc_famile
> E.g rewrite the one but last line to:
>                     if (this_soc_family and not re.match(need_machine,
> this_soc_family)) or not this_soc_family:
>=20
> I tested the 2nd patch with distro minimal, target sheevaplug, which
> gave the error before. After rewriting the line as suggested skipping
> works and the problem is gone.
> I have this also as a formal patch, but there might be more desirable
> ways to do this.
>=20
> Please advise.

I like your second proposal.  Thanks for finding this issue and a solution =
to it.

>=20
> Frans.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


