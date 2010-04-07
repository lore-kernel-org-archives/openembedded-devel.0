Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NzLS1-0006Ze-EC
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Apr 2010 04:57:10 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NzLOk-0000Bi-LK from Tom_Rini@mentor.com ;
	Tue, 06 Apr 2010 19:53:46 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 6 Apr 2010 19:53:46 -0700
Received: from 172.30.80.147 ([172.30.80.147]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  7 Apr 2010 02:52:49 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	06 Apr 2010 19:52:48 -0700
From: Tom Rini <tom_rini@mentor.com>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4BBB3162.80907@mlbassoc.com>
References: <4BB35552.9070508@mlbassoc.com>
	<v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>
	<4BB382AA.3040901@mlbassoc.com> <1270056997.6277.89.camel@trini-m4400>
	<4BB75E89.6030708@mlbassoc.com> <1270312858.3653.44.camel@trini-m4400>
	<4BB7795D.6050600@mlbassoc.com> <1270336288.3653.45.camel@trini-m4400>
	<4BB7EEE2.9060408@mlbassoc.com>  <4BBB3162.80907@mlbassoc.com>
Organization: Mentor Graphics Corporation
Date: Tue, 06 Apr 2010 19:52:48 -0700
Message-ID: <1270608768.4765.39.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 07 Apr 2010 02:53:46.0284 (UTC)
	FILETIME=[8AA2AEC0:01CAD5FD]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Wed, 07 Apr 2010 02:57:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-04-06 at 07:04 -0600, Gary Thomas wrote:
> On 04/03/2010 07:44 PM, Gary Thomas wrote:
> > On 04/03/2010 05:11 PM, Tom Rini wrote:
> >> On Sat, 2010-04-03 at 11:22 -0600, Gary Thomas wrote:
> >>> On 04/03/2010 10:40 AM, Tom Rini wrote:
> >>>> On Sat, 2010-04-03 at 09:28 -0600, Gary Thomas wrote:
> >>>>
> >>>>> That said, this seems to be a [Make] parallelism problem, not clear
> >>>>> why/how.
> >>>>> If I just rerun 'bitbake firefox' which restarts the compile step,
> >>>>> it will
> >>>>> run to completion. I do normally use -j4, but disabling this did
> >>>>> not seem
> >>>>> to make any difference.
> >>>>>
> >>>>> Note: the previous version I built (3.5.2) did not exhibit this
> >>>>> behaviour.
> >>>>
> >>>> Well that's depressing since we just added the best we can tell corr=
ect
> >>>> magic to build firefox with make -jN. If you put PARALLEL_MAKE =3D "=
" in
> >>>> the .bb, does it complete this time?
> >>>>
> >>>
> >>> No change, I'm afraid.
> >>
> >> Interesting. From log.do_compile, was make -jN taken out? I kinda fear
> >> not...
> >>
> >
> > I see only -j1 in the logs
> >
>=20
> I'm not getting anywhere with this.  True, it builds, but only
> after a second attempt (the first always fails as reported).
>=20
> Perhaps you'd like to try?  Just build firefox (3.6.2 is what
> I'm using) for a PowerPC target (I use MACHINE=3Defika, DISTRO=3D"angstro=
m-2008.1")
> You'll need the attached patches to work around some of the va_list bugs.

So, funny thing.  Locally on an older snapshot of OE, 3.6.0 built, for
e500v2 machines, unpatched.  I'll try more combinations (doing
MACHINE=3Dcalamari on current now) as time and CPU cycles permit.

>=20
> Thanks
>=20


--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


