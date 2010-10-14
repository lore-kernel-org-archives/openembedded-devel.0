Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P6Pkh-0001Ae-JR
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 17:29:57 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9EFTM12015956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 10:29:22 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o9EFTMWS018988
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 10:29:22 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9EFTM1B017557
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 10:29:22 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 14 Oct 2010 10:29:21 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Oct 2010 10:29:20 -0500
Thread-Topic: [oe] Question about OVERRIDES precedence
Thread-Index: ActrHz2mNNRnnGCzQVyOzTDnBK9E2gAeEywQ
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA982@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
In-Reply-To: <AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.40
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 15:29:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Chris Larson
> Sent: Wednesday, October 13, 2010 4:39 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Question about OVERRIDES precedence
>=20
> On Wed, Oct 13, 2010 at 2:30 PM, Maupin, Chase <chase.maupin@ti.com>
> wrote:
>=20
> > That was my thought as well but I can consistently cause this issue.  I
> > have tested a quick change that seems to fix the issue by reversing the
> list
> > before it is used in the for loop.  My change was:
>=20
>=20
> From discussion on IRC, we think we should just reverse the definition of
> OVERRIDES in OE, this avoids compatibility issues associated with changin=
g
> the implementation.

Chris,

So are you saying that we are just going to change the order of how OVERRID=
ES is appended to in OE like Denys was suggesting?  That would still lead t=
o issues like local not being the highest priority unless we would also cha=
nge bitbake.conf to define OVERRIDES as "${TARGET_ARCH}:${TARGET_OS}:${MACH=
INE}:local".  That way we could prepend OVERRIDES in OE and still have loca=
l be the last one evaluated.

Or are you saying that we should build the whole OVERRIDES list and then re=
verse it in the OE configuration files?

If that is the case I tried adding a line like:

REVERSE_OVERRIDES=3D${@d.setVar("OVERRIDES", ':'.join(bb.data.getVar('OVERR=
IDES', d, 1).split(':')[::-1]))}

to the end of my local.conf file.  When I do a bitbake -e to dump my enviro=
nment I see that OVERRIDES is now defined to:

OVERRIDES=3D"thumb-interwork:libc-glibc:omap3:armv7a:pn-task-arago-toolchai=
n-tisdk-multimedia-host:fail-fast:build-linux:arm:linux-gnueabi:angstrom:am=
37x-evm:local"

But while that order looks right it seems like maybe that is being interpre=
ted to late because my variables that use overrides are not picking up the =
right values.  i.e. my MACHINE override is not taking precedence over my SO=
C_FAMILY override.

Any ideas why this does not work?


> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


