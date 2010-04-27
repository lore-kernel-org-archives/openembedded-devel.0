Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O6pTZ-0006ZJ-5s
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 20:25:42 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O6pQ0-0007DS-4a from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Apr 2010 11:22:00 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 27 Apr 2010 11:21:59 -0700
Received: from 172.30.80.244 ([172.30.80.244]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue, 27 Apr 2010 18:21:59 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	27 Apr 2010 11:21:51 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hr6deb$dc1$1@dough.gmane.org>
References: <hr6deb$dc1$1@dough.gmane.org>
Organization: Mentor Graphics Corporation
Date: Tue, 27 Apr 2010 11:21:51 -0700
Message-ID: <1272392511.3865.574.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 27 Apr 2010 18:21:59.0596 (UTC)
	FILETIME=[86B2AEC0:01CAE636]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] scsi headers, in glibc-dev or linux-libc-headers-dev?
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
X-List-Received-Date: Tue, 27 Apr 2010 18:25:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-04-27 at 12:14 +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> Currently conflicting headers are both in glibc-dev and
> linux-libc-headers-dev, which isn't a good thing. According to the
> interwebs we should use the linux-libc-headers version.
>=20
> Anyone opposed to removing the scsi headers from glibc? It would
> basically involve reverting
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Db8bb2a62b=
3916470c752bd79d31322b4358fc676
> and
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D83f41716a=
b6a2a9d83d4ff044dcef00595ecfeb2

So, I did both of those after checking the interwebs and poking some
kernel folks (see comments in
http://bugs.openembedded.org/show_bug.cgi?id=3D4262 ).  The question is,
did the kernel folks change their mind again and we need to either drop
older linux-libc-headers (which I'll just assume is a no-go) or go back
to removing them in new enough linux-libc-headers.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


