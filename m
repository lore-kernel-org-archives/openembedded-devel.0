Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1Ke6VK-00080U-Bd
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Sep 2008 13:07:58 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 9556816DEFE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2008 13:10:57 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id BA3892A4211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2008 13:12:07 +0200 (CEST)
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 12 Sep 2008 13:05:12 +0200
Message-ID: <69E6C70090A0A14498CC98FAE5E06B6E2B3B04@hiob.intern.dresearch.de>
In-Reply-To: <48CA48B8.4060708@gmx.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Some beginners problems
Thread-Index: AckUxZMQjsAOnQYhSs6AckBkLzBurwAAPteA
References: <69E6C70090A0A14498CC98FAE5E06B6E2B3B01@hiob.intern.dresearch.de>
	<48CA48B8.4060708@gmx.de>
From: "Sledz, Steffen" <sledz@DResearch.DE>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: Some beginners problems
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
X-List-Received-Date: Fri, 12 Sep 2008 11:07:58 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > I wan't to make an image (e.g. minimal-image) for atngw100=20
> > but with different linux kernel configuration (e.g.=20
> > CONFIG_EXT2_FS=3Dy). What's th right way to do this?
> >
> > * Just edit packages/linux/linux-2.6.24/atngw100/defconfig?
> =20
> Yes. But don't forget to increase the PR. Otherwise bitbake=20
> doesn't know that the recipe was changed and doesn't rebuild
> it.

The change is not a bug fix or something like this. It's just a variant =
and not mentioned to become committed. So if i increase PR and someone =
else fixes a bug and increases PR too and I pull this fixes from git I =
have a conflict.  :(

Regards,
Steffen


