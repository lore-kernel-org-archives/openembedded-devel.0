Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA6078066
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 19:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9A67031E0F0D;
	Wed, 21 Feb 2018 20:33:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id ei1XbjYjeqiG; Wed, 21 Feb 2018 20:33:54 +0100 (CET)
Received: from t460p (p57A611C8.dip0.t-ipconnect.de [87.166.17.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 06DF731E0925;
	Wed, 21 Feb 2018 20:33:53 +0100 (CET)
Date: Wed, 21 Feb 2018 20:33:52 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20180221203352.55cd9a96@t460p>
In-Reply-To: <1519225097.6698.8.camel@intel.com>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
	<CAJTo0LYe1koEr7kJg7RfXLDbZLVa0qQyWiig5Sng_hpRTr_3dw@mail.gmail.com>
	<1519225097.6698.8.camel@intel.com>
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 19:33:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 21 Feb 2018 15:58:17 +0100
Patrick Ohly <patrick.ohly@intel.com> wrote:

> On Wed, 2018-02-21 at 14:14 +0000, Burton, Ross wrote:
> > > But that kind of mechanism seems highly prone to breakage and
> > > likely to
> > > be highly contentious even if it was shown to be reliable, so it
> > > may not
> > > get beyond a "that'd be nice" thing for me.
> > >=20
> > > Unless someone else has already implemented it and I'm just not
> > > aware of
> > > how to use it?=C2=A0 :-)
> > >  =20
> >=20
> > meta-freescale (iirc) does this, conditionally adds
> > sub-layers to BBLAYERS based on what other layers are already
> > enabled. =20
>=20
> The approach used by meta-freescale works with older releases.
> BBFILES_DYNAMIC [1] (supported by bitbake 1.36/Yocto 2.4) is a bit more
> robust.
>=20
> [1] https://patchwork.openembedded.org/patch/140532/
>=20

That's interesting. Is it possible to express dependencies on more than one
layer for a group of recipes with this mechanism?

Regards,
Andreas

