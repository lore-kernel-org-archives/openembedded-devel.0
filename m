Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxNaC-00078j-Va
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:49:30 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxNX1-0003Pa-39 from Tom_Rini@mentor.com ;
	Thu, 01 Apr 2010 09:46:11 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 09:46:10 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 16:45:52 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 09:45:49 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270138027.4993.139.camel@rex>
References: <1270135981.4993.128.camel@rex>
	<1270136509.6277.97.camel@trini-m4400>
	<1270136609.6277.98.camel@trini-m4400> <1270138027.4993.139.camel@rex>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 09:45:49 -0700
Message-ID: <1270140349.6277.110.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 16:46:10.0126 (UTC)
	FILETIME=[D501AEE0:01CAD1BA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "Lock, Joshua" <joshua.lock@intel.com>
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 16:49:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 17:07 +0100, Richard Purdie wrote:
> On Thu, 2010-04-01 at 08:43 -0700, Tom Rini wrote:
> > On Thu, 2010-04-01 at 08:41 -0700, Tom Rini wrote:
> > > On Thu, 2010-04-01 at 16:33 +0100, Richard Purdie wrote:
> > >=20
> > > > * Added relocatable binary processing from Poky for -native binarie=
s=20
> > > >   using chrpath. This isn't enabled for -cross packages due to the=20
> > > >   relative path length problems.
> > >=20
> > > Is there a reason to not use $ORIGIN here instead?  The patch Chris
> > > Larson posted ages ago does get this right (the hard part is
> > > gcc/gdb/binutils due to the multi configure running).  And any path
> > > length issues you hit with -cross you should be able to hit with
> > > -native, no?
> >=20
> > For reference it's just doing:
> > export RELATIVERPATH =3D "${@base_path_relative(d.getVar('bindir', 1),
> > d.getVar('STAGING_LIBDIR_NATIVE', 1))}"
> > export BUILD_LDFLAGS =3D "-L${STAGING_LIBDIR_NATIVE} \
> >                         -Wl,-rpath,\\\$\$ORIGIN/${RELATIVERPATH} -Wl,-O=
1
> > \
> >                         -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-O1 \
> >                         "
> >=20
> > In bitbake.conf (extra variable for dealing with the hard packages
> > later).
>=20
> I really much prefer the post processing approach as it "just works" and
> doesn't need exceptions for hard packages, nor does it have horrible
> quoting.

There's two uglies here.  Ugly one, above.  Quoting isn't nice to read
and gdb/gcc/binutils are special.  It does however, work from the
get-go.  And the only cases it doesn't get right, right off the bat are
some perl (and possibly python) module cases where we aren't giving the
right relative path there, but we can always figure it out and fix that
up per recipe.  Ugly two, the chrpath way.  Depends on having a big
enough RPATH in the initial binary to patch over.  Doesn't work if the
RPATH isn't long enough as you say, which is why you can't do it on
-cross.  $ORIGIN linking works on everything every time.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


