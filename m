Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chase.maupin@ti.com>) id 1Otg1R-0002in-2D
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Sep 2010 14:14:36 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id o89CDnXn023100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 07:13:49 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89CDnrb015746
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 07:13:49 -0500 (CDT)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id o89CDnAa013332
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Sep 2010 07:13:49 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Thu, 9 Sep 2010 07:13:48 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Sep 2010 07:13:47 -0500
Thread-Topic: [oe] [PATCH] base.bbclass: fix soc-family test
Thread-Index: ActP7mpdEP3ZkX3QTsK1iMT5KJmcPAAKZKPw
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F080310BFAA11@dlee06.ent.ti.com>
References: <1283453522-8408-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
In-Reply-To: <AANLkTinC5biQ7FcBD86SUssEytzhjyiK5hEzdLdaM_6P@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 198.47.26.152
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
X-List-Received-Date: Thu, 09 Sep 2010 12:14:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Frans Meulenbroeks
> Sent: Thursday, September 09, 2010 2:11 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] base.bbclass: fix soc-family test
>=20
> 2010/9/2 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> > see http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-
> September/023680.html
> >
> > Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> > ---
> > =A0classes/base.bbclass | =A0 =A02 +-
> > =A01 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/classes/base.bbclass b/classes/base.bbclass
> > index 299e875..2c9ad89 100644
> > --- a/classes/base.bbclass
> > +++ b/classes/base.bbclass
> > @@ -337,7 +337,7 @@ python () {
> > =A0 =A0 =A0 =A0 =A0 =A0 this_machine =3D bb.data.getVar('MACHINE', d, 1=
)
> > =A0 =A0 =A0 =A0 =A0 =A0 if this_machine and not re.match(need_machine,
> this_machine):
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this_soc_family =3D bb.data.getVar('SOC=
_FAMILY', d, 1)
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if this_soc_family and not re.match(ne=
ed_machine,
> this_soc_family):
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (this_soc_family and not re.match(n=
eed_machine,
> this_soc_family)) or not this_soc_family:
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 raise bb.parse.SkipPackage("inc=
ompatible with
> machine %s" % this_machine)
> >
> > =A0 =A0 =A0 =A0 need_target =3D bb.data.getVar('COMPATIBLE_TARGET_SYS',=
 d, 1)
> > --
> > 1.6.4.2
> >
>=20
> Bump.
>=20
> This is out for a week now without any feedback, although the patch is
> quite trivial.

Frans,

I'm pretty sure I already gave my feedback on this fix.  If not then I thin=
k it looks fine to me and thank you for finding and fixing this issue.

>=20
> Actually I am quite disappointed by the developers who created and
> pushed the SOC_FAMILY patch.
> They were very eager to push this change in a day, without waiting for
> the discussion on it to conclude, but they seem to be not-so-willing
> to review a fix for a problem they caused (let alone resolve the
> problem). What is even somewhat irritating is that one of the people
> involved is often in the front seat when it comes to criticizing
> others if they make a mistake.
>=20
> Frans.
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


