Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1NpOtH-0001l6-EQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 17:36:12 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1NpOqO-0005Xz-OP from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 08:33:12 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 10 Mar 2010 08:33:12 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Wed, 10 Mar 2010 16:32:13 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	10 Mar 2010 09:32:11 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B97C419.2070606@ge.com>
References: <20100310135425.31263.61632.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<1268234994.16526.170.camel@trini-m4400> <4B97C0BB.2060104@ge.com>
	<4B97C419.2070606@ge.com>
Organization: Mentor Graphics Corporation
Date: Wed, 10 Mar 2010 09:32:11 -0700
Message-ID: <1268238731.16526.199.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 10 Mar 2010 16:33:12.0572 (UTC)
	FILETIME=[6075DBC0:01CAC06F]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add Freescale P2020DS Demo Board
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
X-List-Received-Date: Wed, 10 Mar 2010 16:36:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-10 at 16:08 +0000, Martyn Welch wrote:
> Martyn Welch wrote:
> > Tom Rini wrote:
> >  =20
> >> On Wed, 2010-03-10 at 13:54 +0000, Martyn Welch wrote:
> >>> +
> >>> +KERNEL_IMAGETYPE =3D "uImage"
> >>> +UBOOT_ENTRYPOINT =3D "0"
> >>> +
> >>> +UBOOT_MACHINE =3D "P2020DS_config"
> >>> +
> >>> +# Need to create jffs2 images with the correct endianess
> >>> +EXTRA_IMAGECMD_jffs2 =3D " --big-endian -e 0x40000"
> >>>   =20
> >>>      =20
> >> A guess, --no-cleanmarkers as well?
> >>  =20
> >>    =20
> > Huh, didn't know about them, so I guess so.
> >  =20
> Actually, reading up on this, isn't that option just for NAND?
>=20
> This board has both NAND and NOR, but we tend to use the NOR for the OS.

I don't have one sitting in front of me, so I won't argue about wanting
to use NAND for this too or not.  After poking someone else real quick,
this only popped into my head, presumably anyhow, from a short while
when we did JFFS2 on NAND.  So you can disregard that comment.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


