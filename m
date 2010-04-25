Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O681H-0003TY-KB
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 22:01:38 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O67xf-0003Fb-5Q from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Sun, 25 Apr 2010 12:57:51 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Sun, 25 Apr 2010 12:57:50 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Sun, 25 Apr 2010 19:57:50 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	25 Apr 2010 12:57:44 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hr254d$kkn$1@dough.gmane.org>
References: <1272217739.3865.546.camel@trini-m4400>
	<hr254d$kkn$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Sun, 25 Apr 2010 12:57:44 -0700
Message-ID: <1272225464.3865.549.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 25 Apr 2010 19:57:50.0729 (UTC)
	FILETIME=[95D06F90:01CAE4B1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: The coreutils-native race...
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
X-List-Received-Date: Sun, 25 Apr 2010 20:01:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2010-04-25 at 21:28 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 25-04-10 19:48, Tom Rini wrote:
> > Hey all.  I thought I would try and explain what Chris has been up to
> > with at least some of the base.bbclass changes (the ones related to
> > md5sum and cp).
> >=20
> > Right now, with a big enough BB_NUM_THREADS we can get into a race wher=
e
> > coreutils-native is installing programs and elsewhere we are in a
> > do_fetch and either trying to use 'cp' or 'md5sum', and blam, we try an=
d
> > invoke the program while it's being installed (and see things like
> > sh: /path/to/staging/i686-linux/usr/bin/cp: Textfile is busy).
> >=20
> > There's a few ways out of this:
> > 1) Don't rely on 'cp' and 'md5sum' anymore but use python for it.
> > 2) Make an oe_cp and oe_md5sum to go with oe_sha256sum
> > 3) IIRC, the big part of coreutils-native was a fully functional,
> > always, 'install'.  We could just copy the install we build or provide
> > an install wrapper (oe_install) or so
> > 4) ???
>=20
> Even thought I loathe python, option 1 sounds like a nice way to go
> since it doesn't involve butchering recipes.

I think we're OK, except in the case of when we can't rely on a built-in
md5sum (and then the race comes back) and just need to figure out if the
libpam-base-files recipe does things (a) optimally and (b) if that's a
common thing.

Currently, with a quick glance at the recipe, I don't see any
distro-specific overrides, so I'd be inclined to call it lazy recipe
writing, until someone points out history of why that's a good thing..

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


