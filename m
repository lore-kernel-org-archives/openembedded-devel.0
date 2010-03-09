Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Np3a1-0007H5-G9
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 18:50:56 +0100
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Np3X9-0007nC-I0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 09:47:55 -0800
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 9 Mar 2010 09:47:54 -0800
Received: from 172.30.33.172 ([172.30.33.172]) by NA1-MAIL.mgc.mentorg.com
	([147.34.98.181]) with Microsoft Exchange Server HTTP-DAV ; 
	Tue,  9 Mar 2010 17:47:45 +0000
Received: from trini-m4400 by na1-mail.mgc.mentorg.com;
	09 Mar 2010 10:47:43 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B965E0D.8050501@dresearch.de>
References: <4B8E618C.2080604@dresearch.de> <4B94AA93.4070709@dresearch.de>
	<1268071514.16526.6.camel@trini-m4400> <4B965E0D.8050501@dresearch.de>
Organization: Mentor Graphics Corporation
Date: Tue, 09 Mar 2010 10:47:43 -0700
Message-ID: <1268156863.16526.133.camel@trini-m4400>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 09 Mar 2010 17:47:54.0995 (UTC)
	FILETIME=[A5C79430:01CABFB0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=AWL,BAYES_00 autolearn=ham
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
X-List-Received-Date: Tue, 09 Mar 2010 17:50:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2010-03-09 at 15:41 +0100, Steffen Sledz wrote:
> Tom Rini wrote:
[snip]
> > That said, mkimage -A arm is bad.  UBOOT_ARCH is right,
>=20
> Good point. Total agreement.
>=20
> > and comes from kernel-arch.bbclass.  So, I
> > think a full patch would need to add in changes to image.bbclass to
> > inherit kernel-arch so that UBOOT_ARCH will be evaluated.
> >
> > And yes, this I think should be in bitbake.conf with the rest of the
> > image magics
>=20
> I've too much respect and to little knowledge to make changes
> inside these core components.
>=20
> Can someone take me by the hand and guide me. ;-)

It's easy.  Just add 'inherit kernel-arch' to image.bbclass, up near the
top, test your changes a bit and post :)

> PS: And another little question: is '.u-boot' a good extension for
> this? Or is the shorter '.u' better?

Since the recipe is u-boot (and u-boot-blah-native), .u-boot is fine
over .uboot.  .u is I think too short / nondescript.

--=20
Tom Rini <tom_rini@mentor.com>
Mentor Graphics Corporation


