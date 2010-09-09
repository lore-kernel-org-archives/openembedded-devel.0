Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Otg7p-0003IS-TX
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 14:21:12 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o89CKQVH006744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 9 Sep 2010 07:20:26 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89CKQZL018383;
	Thu, 9 Sep 2010 07:20:26 -0500 (CDT)
Received: from dlee74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89CKQ1s015635;
	Thu, 9 Sep 2010 07:20:26 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee74.ent.ti.com
	([157.170.170.8]) with mapi; Thu, 9 Sep 2010 07:20:26 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "tsc@openembedded.org"
	<tsc@openembedded.org>
Date: Thu, 9 Sep 2010 07:20:25 -0500
Thread-Topic: [oe] [PATCH] base.bbclass: fix soc-family test
Thread-Index: ActQB34mtMIvuTZXQsKtWgQVGpv45gAEUQZA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAA13@dlee06.ent.ti.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
	<1284024609.28520.1446.camel@mill.internal.reciva.com>
	<AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
In-Reply-To: <AANLkTimLWtJhYn009OchBss+LJpNx9Pt+nDZ=GGyu=a7@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.94.94.41
X-SA-Exim-Mail-From: chase.maupin@ti.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: fix soc-family test
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
X-List-Received-Date: Thu, 09 Sep 2010 12:21:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Thursday, September 09, 2010 5:12 AM
> To: openembedded-devel@lists.openembedded.org; tsc@openembedded.org
> Subject: Re: [oe] [PATCH] base.bbclass: fix soc-family test
>=20
> 2010/9/9 Phil Blundell <philb@gnu.org>:
> > On Thu, 2010-09-09 at 09:11 +0200, Frans Meulenbroeks wrote:
> >> 2010/9/2 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> >> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if this_soc_family and not re.match=
(need_machine,
> this_soc_family):
> >> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (this_soc_family and not re.matc=
h(need_machine,
> this_soc_family)) or not this_soc_family:
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("=
incompatible with
> machine %s" % this_machine)
> >
> > I am still far from convinced that this hunk of SOC_FAMILY code is
> > desirable to have in the first place but, if it's going to stay there,
> > clearly it should be fixed so that it doesn't cause problems for
> > non-users.
> >
> > So, yes, your patch looks fine to me.
> >
> > p.
> >
> Phil, thanks for the feedback.
>=20
> I'm not too sure on the usefulness of it either, but there is some
> breakage so we should either revert the patch or fix it.
>=20
> Actually the SOC_FAMILY got pushed before the review was concluded.
> Technically it got the ack's but the discussion was still ongoing when
> this was pushed.
> What also makes it fishy is that all acks are from the same company
> (which is the same one as the person who submitted the patch):
>=20
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>
> Acked-by: Denys Dmytriyenko <denys@ti.com>
> Acked-by: Koen Kooi <k-kooi@ti.com>
> Signed-off-by: Koen Kooi <koen@openembedded.org>
>=20
> I would suggest modifying the commit policy disallowing these kind of
> things, saying the two Ack's must be from two developers not
> affiliated with the same company.
> (actually we might even want to take it further and saying that global
> changes that affect everyone would require ACK's from developers from
> more than one distro).
>=20
> Question to the TSC: should the SOC_FAMILY patch be reverted and put
> on hold until there is agreement whether or not we want this?

Frans,

As the person who submitted this change I'd like to ask that it not be reve=
rted.  I am using it currently so that when defining COMPATIBLE_MACHINE for=
 recipes targeted at OMAP3 devices I do not have to keep a rolling list of =
all the various OMAP3 devices.  This can quickly become:

COMPATIBLE_MACHINE =3D "dm37x-evm|am37x-evm|omap3evm|am3517-evm|beagleboard=
|......"

Instead by allowing SOC_FAMILY to be used as a COMPATIBLE_MACHINE this can =
be handled cleanly with:

COMPATIBLE_MACHINE =3D "omap3"

Please consider this use case.  I would much prefer if your fix was put int=
o the base.bbclass than if this were removed.

>=20
> Frans
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


