Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NhWvh-0001O5-U0
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 00:34:13 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NhWt7-0002AE-6D from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 15:31:29 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 16 Feb 2010 15:31:28 -0800
Received: from 172.30.80.33 ([172.30.80.33]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 16 Feb 2010 23:30:57 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	16 Feb 2010 16:30:56 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
References: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>
	<hldk2b$5tt$2@ger.gmane.org>
	<ac9c93b11002160039j717d1611wbdd1d2fac220dd55@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 16 Feb 2010 16:30:56 -0700
Message-ID: <1266363056.31865.68.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 16 Feb 2010 23:31:28.0459 (UTC)
	FILETIME=[29AFD1B0:01CAAF60]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Cleanup / janitors
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
X-List-Received-Date: Tue, 16 Feb 2010 23:34:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-02-16 at 09:39 +0100, Frans Meulenbroeks wrote:
> 2010/2/16 Koen Kooi <k.kooi@student.utwente.nl>:
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > On 16-02-10 00:38, Chris Larson wrote:
> >> Greetings all,
> >>
> >> Per discussion in the TSC meeting this month, I'm sending out this ema=
il as
> >> a probe.  Would anyone on the list benefit from a "janitors" type proj=
ect,
> >> to outline and document specific cleanup tasks and how they should be =
done?
> >> There are many tasks that need doing which involve editing of large am=
ounts
> >> of files in relatively simple ways, and I suspect, but am not yet cert=
ain,
> >> that there are a group of individuals who wish to contribute to the pr=
oject,
> >> but are new enough that they don't feel confident diving into anything
> >> invasive.  This sort of a task could be a starting point for that sort=
 of
> >> individual.  Thoughts?  Anyone out there in that camp currently that w=
ould
> >> benefit from something like this?
> >
> > The first project that comes to mind is converting simple recipes (e.g.
> > not perl) to new style staging. It's a fairly simple job that has a hug=
e
> > impact.
>=20
> Problem is to do that reliable.

Isn't that a document it right, for Janitors problem?  ie:
1. Build recipe foo, with packaged-staging, your resuling pstage file
is ..../foo_VERSION...ipk.  Copy this somewhere safe.
2. Modify recipe foo to use new style
3. -c clean foo, build again.
4. Examine contents of old and new pstaging file.  If the contents are
the same (and say, diff rather than just checking names, so that any
munging is caught), good to go!  If not ...

The idea behind janitors is that there's tasks that can be explained and
people can pick up and do, but there's some manual intervention and
checking.  So, if someone fleshed out the above a little more, that
should be enough for a legacy staging task.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


