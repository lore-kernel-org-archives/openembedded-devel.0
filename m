Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NmV2X-0000nd-Gw
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Mar 2010 17:33:46 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NmUzl-0000LE-IP from Tom_Rini@mentor.com ;
	Tue, 02 Mar 2010 08:30:53 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 2 Mar 2010 08:30:53 -0800
Received: from 172.30.80.137 ([172.30.80.137]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  2 Mar 2010 16:29:56 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	02 Mar 2010 09:29:55 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1267525286.14566.774.camel@mill.internal.reciva.com>
References: <1267497275.4739.292.camel@trini-m4400>
	<1267525286.14566.774.camel@mill.internal.reciva.com>
Organization: Mentor Graphics Corporation
Date: Tue, 02 Mar 2010 09:29:55 -0700
Message-ID: <1267547395.4739.303.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 02 Mar 2010 16:30:53.0333 (UTC)
	FILETIME=[BA29AC50:01CABA25]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add eglibc-pic, resync eglibc-dev with glibc
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
X-List-Received-Date: Tue, 02 Mar 2010 16:33:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-02 at 10:21 +0000, Phil Blundell wrote:
> On Mon, 2010-03-01 at 19:34 -0700, Tom Rini wrote:
> > eglibc-package.bbclass: Add eglibc-pic, resync eglibc-dev with glibc
> >=20
> > Resync what goes into eglibc-dev based on what we have in glibc-dev.
> > This includes zoneinfo and picking up the reset of the static libraries
> > (many are missed otherwise and static linking in SDKs fails).  We add i=
n
> > a eglibc-pic package to catch all of the pic stuff (some of which would
> > otherwise be caught in -dev).
>=20
> It is a bit of a shame that eglibc doesn't reuse more of the glibc
> packaging logic, as opposed to having its own copies of everything.  I
> wonder if there is a way that this could be improved.

Khem said no as he plans for eglibc to look more uclibc-like, roughly.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


