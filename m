Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmsUY-0006ZG-QR
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 18:36:18 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmsRl-0003uu-VP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 09:33:22 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 3 Mar 2010 09:33:20 -0800
Received: from 172.30.80.138 ([172.30.80.138]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed,  3 Mar 2010 17:33:08 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	03 Mar 2010 10:33:07 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hmm5pb$est$1@dough.gmane.org>
References: <1267633819.4739.343.camel@trini-m4400>
	<hmm5pb$est$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Wed, 03 Mar 2010 10:33:07 -0700
Message-ID: <1267637587.4739.345.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 Mar 2010 17:33:20.0198 (UTC)
	FILETIME=[9DE1A660:01CABAF7]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Make some big changes right after next stable
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
X-List-Received-Date: Wed, 03 Mar 2010 17:36:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-03 at 18:20 +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 03-03-10 17:30, Tom Rini wrote:
> > Hey all,
> >=20
> > I'd like to see some comments on the following idea.
> >=20
> > As many people know, there's a lot of "odd" internal things that OE
> > does, that if we had it to do over, we would do differently.  What I
> > would like to propose is that in time for the next stable branch we:
> > 1: Define a set of DISTROs/MACHINEs/build targets that need to stay
> > working
> > 2: In a separate branch (per big change), get one of these big, going t=
o
> > leave some stuff broken changes
> > 3: Define / document what needs to be done before these branches can be
> > merged back (something like #1 is working still, and if applicable a
> > guide to the common problems/how to fix people are going to run into).
> >=20
> > What I'm getting at is that this would let us do things like rework the
> > "this is where we place things that we build other recipes with" concep=
t
> > so that sysroot just works (and otherwise makes more sense again).  Or
> > "let us have more consistency in build with compared to what could end
> > up on device".  And so on.
> >=20
> > What do people think?  And what would people work on?
>=20
> I don't think we need to wait for a next stable to happen. I personally
> think a new stable branch can only happen after all legacy staging has
> been eradicated. And when people not using the stable branches stop
> spreading FUD about them.

Note that I'm not talking about "small" things like removing legacy
staging stuff (which is good!) I'm talking about things with the
potential to leave stuff non-building until stumbled upon.  Hence the
idea we do merge this into dev shortly after the next stable.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


