Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NrxPX-0006CD-L7
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 18:52:04 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NrxMZ-0005Hh-35 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Mar 2010 10:48:59 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 17 Mar 2010 10:48:58 -0700
Received: from 172.30.80.111 ([172.30.80.111]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 17 Mar 2010 17:48:02 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	17 Mar 2010 10:48:00 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1268847547.3211.11.camel@andromeda>
References: <1268742232-11291-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1268845536.29482.4.camel@trini-m4400>
	<1268847547.3211.11.camel@andromeda>
Organization: Mentor Graphics Corporation
Date: Wed, 17 Mar 2010 10:48:00 -0700
Message-ID: <1268848080.29482.10.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 17 Mar 2010 17:48:58.0527 (UTC)
	FILETIME=[1EF3CAF0:01CAC5FA]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] packaged-staging.bbclass: use 'os.unlink()' instead of spawning 'rm'
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
X-List-Received-Date: Wed, 17 Mar 2010 17:52:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-17 at 18:39 +0100, Michael 'Mickey' Lauer wrote:
> > > +def _package_unlink (f):
> > > +    import os
> > > +    try:
> > > +	os.unlink(f)
> > > +	return True
> > > +    except:
> > > +	return False
> > > +
>=20
> While it won't hurt in this particular case, a catch-all 'except'
> usually is frowned upon. Better catch specific errors and let other
> errors be handled by the upper layers. I'd recommend catching IOError
> only here.

We need to catch OSError too as this continues to leave behind
directories.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


