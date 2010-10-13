Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1P68uQ-0003lC-Fc
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 23:30:57 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id o9DLUICb014017
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 16:30:18 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9DLUIqO028944
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 16:30:18 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o9DLUINk009877
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 16:30:18 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Wed, 13 Oct 2010 16:30:18 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Oct 2010 16:30:17 -0500
Thread-Topic: [oe] Question about OVERRIDES precedence
Thread-Index: ActrHNo2fI5ruu/mTyOvF91SXIHK3QAABUyA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>
	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
In-Reply-To: <AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>
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
X-List-Received-Date: Wed, 13 Oct 2010 21:30:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Chris Larson
> Sent: Wednesday, October 13, 2010 4:22 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] Question about OVERRIDES precedence
>=20
> On Wed, Oct 13, 2010 at 1:29 PM, Maupin, Chase <chase.maupin@ti.com>
> wrote:
>=20
> > I have been looking into the OVERRIDES setting and it appears to me tha=
t
> > the OVERRIDES are being handled in least specific to most specific orde=
r.
> >  Meaning that if I have an override for a particular machine set that i=
t
> has
> > a lower priority than the override for a distro.
> >
> > My OVERRIDES variable is actually set to evaluate:
> > #
> > OVERRIDES=3Dlocal:${MACHINE}:${DISTRO}:${TARGET_OS}:${TARGET_ARCH}:buil=
d-
> ${BUILD_OS}:fail-fast:pn-${PN}:${FEED_ARCH}:${SOC_FAMILY}:libc-
> glibc${OVERRIDE_THUMB}${OVERRIDE_INTERWORK}
> >
> > Which translates in my build to:
> >
> > OVERRIDES=3D"local:am37x-evm:angstrom:linux-gnueabi:arm:build-linux:fai=
l-
> fast:pn-task-arago-toolchain-tisdk-multimedia-host:armv7a:omap3:libc-
> glibc:thumb-interwork"
> >
> > I would expect that if I set an override for am37x-evm that this MACHIN=
E
> > specific override should trump the DISTRO specific override or the
> > SOC_FAMILY override.
> >
> > Likewise I would expect that the local override would have the highest
> > precedence because I am trying to override something specifically for m=
y
> > local copy and that the "thumb-interwork" override would have the lowes=
t
> > precedence.
> >
> > Is my expectation incorrect?
> >
>=20
> Yes, your expectation is correct.  OVERRIDES is intended to essentially
> give
> us a layering mechanism for the metadata, ensuring that the most specific
> available information is always used.  So machine should always have
> higher
> priority than target architecture, for example, and local is highest of
> all.
>=20
> I assume in your testing you've found that this is not behaving the way i=
t
> should?
>=20
>  If so then can we just reverse the list of overrides in the update_data
> > method of <bitbake>/lib/bb/data.py, around line 500 in my version.  My
> > bitbake is on version 1.10.  In the master this would be in the finaliz=
e
> > function of the DataSmart class.
> >
>=20
> I think you're correct, yes, from a quick re-read of the code -- it seems
> to
> be evaluating them from highest to lowest priority, so the latter may
> override the former, unless I'm missing something.  This seems like it
> would
> have been an obvious thing -- if overrides aren't working as intended, I'=
d
> have expected it to have been caught before now :\  This code hasn't
> changed
> since the original implementation, it seems -- see
> d8b28d544cd7ba8e9c303e72f8ce2ed04ee71b3a.

Chris,

That was my thought as well but I can consistently cause this issue.  I hav=
e tested a quick change that seems to fix the issue by reversing the list b=
efore it is used in the for loop.  My change was:

diff --git a/lib/bb/data.py b/lib/bb/data.py
index f424ac7..b3bd8b9 100644
--- a/lib/bb/data.py
+++ b/lib/bb/data.py
@@ -480,7 +480,7 @@ def update_data(d):
     #print "Append/Prepend %s" % d._special_values
     #print "Overrides      %s" % d._seen_overrides
=20
-    overrides =3D (getVar('OVERRIDES', d, 1) or "").split(':') or []
+    overrides =3D (getVar('OVERRIDES', d, 1) or "").split(':')[::-1] or []
=20
     #
     # Well let us see what breaks here. We used to iterate

If you agree with this change I'll submit a patch.  Should I submit it to t=
his list or another one?

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


