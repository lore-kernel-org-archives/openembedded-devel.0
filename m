Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NohNO-0002fp-Lq
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 19:08:24 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NohKX-0001Z2-Dv from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 10:05:25 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Mon, 8 Mar 2010 10:05:25 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Mon,  8 Mar 2010 18:05:14 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	08 Mar 2010 11:05:14 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B94AA93.4070709@dresearch.de>
References: <4B8E618C.2080604@dresearch.de>  <4B94AA93.4070709@dresearch.de>
Organization: Mentor Graphics Corporation
Date: Mon, 08 Mar 2010 11:05:14 -0700
Message-ID: <1268071514.16526.6.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 08 Mar 2010 18:05:25.0121 (UTC)
	FILETIME=[ED4A5710:01CABEE9]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot ready initrds
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
X-List-Received-Date: Mon, 08 Mar 2010 18:08:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2010-03-08 at 08:43 +0100, Steffen Sledz wrote:
> Steffen Sledz wrote:
> > Initrds need to be prepared with mkimage to be usable from u-boot.
> > The following patch introduces an additional IMAGE_FSTYPE .cpio.gz.u-bo=
ot
> > for this (at the moment just for hipox machine).
> >=20
> > Is this the way it should be done?
> >=20
> > Should this better become part of conf/bitbake.conf?
>=20
> Ping

I don't know why patchwork didn't see this.  That said, mkimage -A arm
is bad.  UBOOT_ARCH is right, and comes from kernel-arch.bbclass.  So, I
think a full patch would need to add in changes to image.bbclass to
inherit kernel-arch so that UBOOT_ARCH will be evaluated.

And yes, this I think should be in bitbake.conf with the rest of the
image magics

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


