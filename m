Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1Pi6uW-00025S-05
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 16:03:53 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p0QF33j4019249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 09:03:03 -0600
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep34.itg.ti.com (8.13.7/8.13.7) with ESMTP id p0QF33dW006418
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 09:03:03 -0600 (CST)
Received: from dlee73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p0QF33mf016115
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 09:03:03 -0600 (CST)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dlee73.ent.ti.com
	([157.170.170.88]) with mapi; Wed, 26 Jan 2011 09:03:03 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Wed, 26 Jan 2011 09:03:02 -0600
Thread-Topic: [oe] bitbake does not fail when QA issues encountered
Thread-Index: Acu9ZTMo0/aV5VBkTPmQBKyCcYUYEgABI8jg
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08032A16A5BE@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>
	<AANLkTinyeFc_8ai783_mu0deYyFUvebhVq4sVgzbCh0v@mail.gmail.com>
	<AANLkTinc6eLwC5ZTu_uO=Ki00x1VQJc6vs_pFwz1f5oX@mail.gmail.com>
	<4D3FF859.2050509@ge.com>
In-Reply-To: <4D3FF859.2050509@ge.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Wed, 26 Jan 2011 15:03:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martyn Welch
> Sent: Wednesday, January 26, 2011 4:33 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] bitbake does not fail when QA issues encountered
>=20
> On 25/01/11 21:36, Khem Raj wrote:
> > On Tue, Jan 25, 2011 at 12:58 PM, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> >> 2011/1/25 Maupin, Chase <chase.maupin@ti.com>:
> >>> All,
> >>>
> >>> I have noticed that when building packages such as perl that while my
> build will report success and no errors, the return status from the
> bitbake command was "1".  I was able to produce this by doing:
> >>>
> >>> MACHINE=3Dam37x-evm bitbake perl
> >>>
> >>> After bitbake completed I saw:
> >>>
> >>> NOTE: Tasks Summary: Attempted 851 tasks of which 0 didn't need to be
> rerun and 0 failed.
> >>>
> >>> but checking $? yields a return status of "1".
> >>>
> >>> I looked into the log and noticed a lot of messages like:
> >>>
> >>> ERROR: QA Issue with db: package db contains bad RPATH
> >>>
> >>> My understanding is that recent fixes to libtool 2.4 prevent these
> errors but I am using an older version of Angstrom which pins to libtool
> 2.2.  I also have found this issue with the Arago distribution which
> likewise uses libtool 2.2.
> >>>
> >>> So my question here is whether bitbake should be failing when it
> encounters these QA issues with a bad RPATH and exiting?
> >>>
> >>> If not then should the return status be "1"?  This causes issues when
> using a script that issues builds and then checks the return status for
> success or failure.  If the QA issues are deemed acceptable (or should be
> warnings) then I would expect the return status to not indicate a failure=
.
> >>>
> >>> I have attached a log of my build for reference
> >>>
> >>> As another interesting side note which I don't know is related or not=
,
> when building Arago with bitbake 1.10.2 the return status is "1".  When
> building the same Arago metadata with bitbake 1.8.19 the return status is
> "0".  What is strange here is that since Arago uses a slightly older
> version of the OE metadata it is not seeing the RPATH errors reported
> above (the check isn't in the insane.bbclass for Arago yet).  So for some
> reason bitbake 1.8.19 says everything went fine and bitbake 1.10.2 report=
s
> a status of "1" even though there is no reported error.  I'm not sure if
> this is related to the above in any way or if this is a separate issue.
> >>>
> >>> Sincerely,
> >>> Chase Maupin
> >>>
> >>
> >> I've seen this on other places as well.
> >> I'd say if a package has a QA issue the build of that package should
> >> fail, because the resulting output is defnitely not OK.
> >>
> >
> > yes it should fail. However some may raise questions "it used to build
> > and not it doesnt"
> > so someone has to fix the problems quickly
> >
>=20
> ...and if it is considered a failure and returns 1, the summary shouldn't
> be
> reporting "0 failed", or at least there should be something reported at
> the
> end of the build to state that the build has been deemed a failure for
> those
> not running in a script and who don't read through the entire log of the
> build!

Agreed.  Just need some consistency here.

I'm still curious about why using bitbake version 1.8.19 works and 1.10.2 d=
oesn't but that may be more of an Arago issue than OE since OE requires ver=
sion 1.10.2 now.  What is strange is that in that test case I don't see the=
 QA errors but bitbake 1.10.2 still reports a return status of "1" for some=
 reason with the log not showing any errors or warnings.

>=20
> Martyn
>=20
> >> Frans
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> --
> Martyn Welch (Principal Software Engineer) | Registered in England and
> GE Intelligent Platforms                   | Wales (3828642) at 100
> T +44(0)127322748                          | Barbirolli Square, Mancheste=
r,
> E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


