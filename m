Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <m.schuknecht@DResearch.de>) id 1Ppj8A-0004fe-4e
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 16:17:26 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 02693491282
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 16:16:17 +0100 (CET)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 16 Feb 2011 16:16:16 +0100
Message-ID: <DB561678F08F554EB0D9F21B70E268A5056575@exchange.intern.dresearch.de>
In-Reply-To: <1297867932.3729.3.camel@mattotaupa>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Re: [oe] [PATCH] u-boot-2009.03: Fix sector table direction for
	AMIC (hipox machine only)
Thread-Index: AcvN6ac3MA54qibjSBuK0hTfsLVrCQAAOjWw
From: "Schuknecht, Mario" <m.schuknecht@DResearch.de>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-2009.03: Fix sector table direction for AMIC (hipox machine only)
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
X-List-Received-Date: Wed, 16 Feb 2011 15:17:26 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Paul,

>=20
> Dear Mario,
>=20
>=20
> thank you for your patch.
>=20
> Am Mittwoch, den 16.02.2011, 14:26 +0100 schrieb Mario Schuknecht:
>=20
> Just curious. What were the symptoms of this problem?
The symptom is that the uBoot command "saveenv" dont work.

>=20
> > Signed-off-by: Mario Schuknecht <m.schuknecht@dresearch.de>
> > ---
> >  .../u-boot-2009.03/hipox/11-cfi-amic-fixup.patch   |   11=20
> +++++++++++
> >  recipes/u-boot/u-boot_2009.03.bb                   |    1 +
> >  2 files changed, 12 insertions(+), 0 deletions(-)
> >  create mode 100644=20
> recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
> >=20
> > diff --git=20
> a/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch=20
> b/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
> > new file mode 100644
> > index 0000000..a7432a5
> > --- /dev/null
> > +++ b/recipes/u-boot/u-boot-2009.03/hipox/11-cfi-amic-fixup.patch
> > @@ -0,0 +1,11 @@
> > +diff -Nurd u-boot-2009.03.orig//drivers/mtd/cfi_flash.c=20
> u-boot-2009.03/drivers/mtd/cfi_flash.c
> > +--- u-boot-2009.03.orig//drivers/mtd/cfi_flash.c=09
> 2011-02-11 15:18:38.000000000 +0100
> > ++++ u-boot-2009.03/drivers/mtd/cfi_flash.c	2011-02-11=20
> 15:19:06.000000000 +0100
> > +@@ -1883,6 +1883,7 @@
> > + 		/* Do manufacturer-specific fixups */
> > + 		switch (info->manufacturer_id) {
> > + 		case 0x0001:
> > ++		case 0x0037: // AMIC
> > + 		case 0x00da: // Winbond
> > + 			flash_fixup_amd(info, &qry);
> > + 			break;
>=20
> Has this fix been applied upstream yet? What uBoot versions are
> affected?

Yes, the fix has been applied
<http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/94465>.
In my opinion all uBoot versions are affected. There are special fixes
for AMD flashes. And the AMIC flash is an AMD clone.=20

Mario
>=20
> [...]
>=20
>=20
> Thanks,
>=20
> Paul
>=20


