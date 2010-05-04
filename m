Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1O9KTG-0003iS-8s
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 17:55:49 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1O9KPa-0000xJ-Fj from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 08:51:54 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 4 May 2010 08:51:54 -0700
Received: from 172.30.80.24 ([172.30.80.24]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  4 May 2010 15:51:53 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	04 May 2010 08:51:52 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
References: <p2rde65d1f11005040816q3d4b1201y9eac356634db14fa@mail.gmail.com>
Organization: Mentor Graphics Corporation
Date: Tue, 04 May 2010 08:51:52 -0700
Message-ID: <1272988312.2533.7.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 04 May 2010 15:51:54.0268 (UTC)
	FILETIME=[B7FEEDC0:01CAEBA1]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Build uncompressed kernel
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
X-List-Received-Date: Tue, 04 May 2010 15:55:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-05-04 at 21:16 +0600, Dmitry Vinokurov wrote:
> Hello,
>=20
> Is there any way to cancel compression stage of kernel build and get
> uncompressed uImage using OE? I've measured uncompressing time (using
> stopwatch actually, so it could be +-0.1-0.2 seconds or even more) -- it'=
s
> about 0.8-0.9 seconds, and boot time is much more critical for my system
> than image size, so even 0.5 seconds is really important. Bootloader is
> Uboot, board is ARM9 Phytec lpc3250.
>=20
> Also I've read http://elinux.org/About_Compression and it states about
> decompress time about 50ms, so looks like either I should measure boot ti=
me
> using more precise tools (like from inside of Uboot) or my board is not s=
o
> fast as those which used by authors. Perhaps anybody could share their
> experience in this issue, is it worth at all to try to build uncompressed
> kernel?

Since we don't use the kernel's uImage rule, do_uboot_mkimage in
kernel.bbclass could be extended easily enough to check for a
NO_KERNEL_COMPRESSION variable or whatever and do or not do the gzip
(and pass the right arg to mkimage).

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


