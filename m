Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 6B67A7F312
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Aug 2019 06:43:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 462lSz1gPTz65;
	Tue,  6 Aug 2019 08:43:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565073795;
	bh=W+MO/uzW8ZdB1x12X89soec6UZ5GmC/Rzj8qtyRMUco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ofGrv2t2NVkhJIQuSfbsHJFHkbxMyrv2Nb9G89ltgydxMPCSQtKMOY3afg0YSE1Gj
	E8MDLBjmJHKN1Ff7qBwJzOBC6QKMFmacpVBmEsSX8UKld4dKVREU2GXxjP6FKmxZw3
	VOJ+gB9gWV5aoLGGlQ3s50/ZVo7OM2GR1Y94Veowr3vHQvqfYC747J7kQpChB3UPH1
	pSC7UOVakpSuUEOHIvCshqXHXCUhEFu4NdOVO6NO9T+kbTB/ZATVo3T+ngCOe0apc4
	9kvNsXqivrnY5GLkK/8WqBnmBUvk6ImRbA0bbbuGjdK1h+P/1GqygNQeDEUL0Nk/Od
	+Rf31Vxr4vd/vE/T2nTxnA3uNql5rA5PkJbmuVs50j8ZrLR2WQDmJqxg6UNASj6gRB
	jKYNJGQ6pY7yy905eD7wzPdsy3pfODEPkNr+Km0yjWo/S9avuXr+BW2cYjam+01soU
	0ee6YJXEdhVVLisK2Qh3pGb6unAWIzity5Wod970fyz60y1s/p/Vtni7GiBuKIQ5hZ
	ODgNBCgQxhx0SNGDcYaCurs3ji6fK80CFHXq+G6Uy712M6ZfT8Nu/+c9pwI0L5tAbZ
	RkiVjXxOQ+CnfPbTs06bOOvh+X9FCS7h+/sxnUsYwd5U9f6yfjnJvaBk4+iARVK9KG
	Ux4wPPhc2cuK9m0j6gIbG9dE=
Date: Tue, 6 Aug 2019 09:43:12 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190806064312.GA12298@localhost>
References: <20190805182453.30420-1-bunk@stusta.de>
	<CAMKF1sqH_1E-2KpyMBYs3r3iSdmjKBv9dM=yT9PP+t0DOqos1Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqH_1E-2KpyMBYs3r3iSdmjKBv9dM=yT9PP+t0DOqos1Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] wireshark: Use an upstream URL that stays valid longer
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
X-List-Received-Date: Tue, 06 Aug 2019 06:43:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 05, 2019 at 12:13:14PM -0700, Khem Raj wrote:
> On Mon, Aug 5, 2019 at 11:25 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > index d442925ee..efcd5e42e 100644
> > --- a/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_3.0.3.bb
> > @@ -8,7 +8,7 @@ DEPENDS = "pcre expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bi
> >
> >  DEPENDS_append_class-target = " wireshark-native chrpath-replacement-native "
> >
> > -SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz"
> > +SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz"
> 
> perhaps use BP instead of wireshark-${PV}. Can you make that change as
> well while you are here.

I was aiming at a minimal change, since backporting to warrior is
where it is urgently needed (can't build wireshark there right now).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


