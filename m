Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NxPH5-0000Th-PS
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 20:37:56 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NxPDt-0001Xm-NB from Tom_Rini@mentor.com ;
	Thu, 01 Apr 2010 11:34:33 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Thu, 1 Apr 2010 11:34:33 -0700
Received: from 172.30.80.170 ([172.30.80.170]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Thu,  1 Apr 2010 18:33:53 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	01 Apr 2010 11:33:50 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1270145385.4993.155.camel@rex>
References: <1270135981.4993.128.camel@rex>
	<1270136509.6277.97.camel@trini-m4400>
	<1270136609.6277.98.camel@trini-m4400> <1270138027.4993.139.camel@rex>
	<1270140349.6277.110.camel@trini-m4400> <1270145385.4993.155.camel@rex>
Organization: Mentor Graphics Corporation
Date: Thu, 01 Apr 2010 11:33:50 -0700
Message-ID: <1270146830.6277.127.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 01 Apr 2010 18:34:33.0381 (UTC)
	FILETIME=[F93FA550:01CAD1C9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Thu, 01 Apr 2010 18:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2010-04-01 at 19:09 +0100, Richard Purdie wrote:
> On Thu, 2010-04-01 at 09:45 -0700, Tom Rini wrote:
> > There's two uglies here.  Ugly one, above.  Quoting isn't nice to read
> > and gdb/gcc/binutils are special.  It does however, work from the
> > get-go.  And the only cases it doesn't get right, right off the bat are
> > some perl (and possibly python) module cases where we aren't giving the
> > right relative path there, but we can always figure it out and fix that
> > up per recipe.  Ugly two, the chrpath way.  Depends on having a big
> > enough RPATH in the initial binary to patch over.  Doesn't work if the
> > RPATH isn't long enough as you say, which is why you can't do it on
> > -cross. =20
>=20
> I've done the maths and it will always work within the sysroots/staging
> directory as there is always enough length available. Since we want rid
> of /cross/ for various reasons anyway I don't think this is a reason
> against this approach.

What do you want to do on nativesdk ?  That's where this gets real
important as well.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


