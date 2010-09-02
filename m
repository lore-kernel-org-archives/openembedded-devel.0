Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Or90J-0006Yr-Et
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 14:34:58 +0200
Received: from dlep35.itg.ti.com ([157.170.170.118])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id o82CYJvU006992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 07:34:19 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep35.itg.ti.com (8.13.7/8.13.7) with ESMTP id o82CYJke004852
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 07:34:19 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o82CYJT6019741
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Sep 2010 07:34:19 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 2 Sep 2010 07:34:19 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Sep 2010 07:34:18 -0500
Thread-Topic: [oe] SOC_FAMILY broken
Thread-Index: ActKG/E7BLeeepcbQKe5USbKzO8IWQAfOJdg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310754539@dlee06.ent.ti.com>
References: <AANLkTikp1c5AcYFDU74kn4oiioqW4L+ZQaofB7rp0iE7@mail.gmail.com>
	<AANLkTimNWTc1-qGCcZoOfSX96RZvy0OUKk4bTOU_c4pe@mail.gmail.com>
In-Reply-To: <AANLkTimNWTc1-qGCcZoOfSX96RZvy0OUKk4bTOU_c4pe@mail.gmail.com>
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
X-List-Received-Date: Thu, 02 Sep 2010 12:34:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Leon Woestenberg
> Sent: Wednesday, September 01, 2010 4:23 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] SOC_FAMILY broken
>=20
> Hello,
>=20
> On Wed, Sep 1, 2010 at 11:14 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Root cause: if SOC_FAMILY is not set (awhich is the case for most
> > MACHINEs =A0and all distro's except angstrom) the test in base.bbclass
> >
>=20
> Good point, but I never understood SOC_FAMILY. From an old email:
>=20
> "SOC_FAMILY is defining a family of processors and the features that
> processor
> has.  Whereas MACHINE_CLASS is defining a type of device and its features
> which
> can use different processors."
>=20
> I think the first sentence is contradicting itself.
>=20
> A "family of processors" vs. "features that processor had". This can
> be fully orthogonal (worst case),
> so the definition of the variable is crap. I wonder, has it proven
> more useful than cumbersome?

What this is saying is the SOC_FAMILY defines a family of processors that a=
ll share common features, i.e. the OMAP3 family.  These processors will agr=
ee on many things such as kernel recipes, bootloaders, etc.  However, they =
will also have some differences such as whether they support wireless, etc.=
  Thus they have separate machine types but share an SOC_FAMILY type.  This=
 way we do not need to specify overrides for every omap3 machine type of wh=
ich a rough count shows there to be 19.

My understanding of MACHINE_CLASS on the other hand is that this is to grou=
p devices by the type of end product being made.  i.e. a cell phone vs a ha=
nd-held media player.  In this case you could have very different processor=
s for these devices, but they all agree on the features that the device has=
 in common.  There was a discussion about this previously in which Graeme s=
aid:

"As the person who originally added MACHINE_CLASS to openmoko and the OE,
then removed it from OE I can say it has different meaning that
SOC_FAMILY. MACHINE_CLASS was to identify a range of machines that were
90% the same but had a few differences. It was used in a few recipes
which were MACHINE_ARCH to make them use the same ARCH in these recipes
to stop them being rebuilt when switching machines."

I hope this answers your questions.  I didn't add the SOC_FAMILY but I can =
tell you that I use it quite a lot.

It looks to me that the micro, shr, and minimal distros still have MACHINE_=
CLASS in their overrides, and that the htc-msm7, motorola-ezx-base, and htc=
-qsd8 devices actually define a machine type.

The htc-msm7 and htc-qsd9 machine classes do not appear to be used in the O=
E mainline (but perhaps in someone's overlay)

The motorola-ezx machine class is used in pulseaudio to set the default pre=
ference to -1.


Again, thanks for finding and fixing this issue.

>=20
> If it truly has a clear function in OpenEmbedded that can apply to all
> processors, can someone explain what the variable should be set to?
>=20
>=20
> Regards,
> --
> Leon
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


