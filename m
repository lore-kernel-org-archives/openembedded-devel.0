Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4CA7260557
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 06:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44pDWg6TWHzB7;
	Tue, 23 Apr 2019 08:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556002016;
	bh=UrKI1EFVADEFxSnJnFczUUCBIMNf4BN9ucFYbGmONQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1cDabKzh6yMc3dyF1LbZCvIjZz8qfXkTBpsOu8LOEbM9b4UaKop2V+h9Vm/KrKxO
	Zc2uVUqcrW3JJV5Ws9icrdVEMWHzFfMy7DEE09avWzZR1uVSiIE/acx1nbT2CL+HyR
	0eGFrqfy6Hu2F9AYB56wf35thlkhH6S2uoWD2f0IcNLM8Zh2nCOU6TkipBufpR3GPK
	FbhRsfWKNgKG9pR8ZXiJ4HDTmo+J6BLNNguzATkVPnFXsci3PCQC3PTxjJpxcKIeaG
	vH5P/hktYuhcxGh2xF7gsM7aV7Qeghgd6soe9OA/u5X/2BvaXm129qnOGchGJwigdv
	ST/p4/nLt2fGlUf7y2UyQxBor0/1DSoCFA+whlBb31ffEEcWegrLbJVXeT+H0+5Vay
	InpnFXGDwBtdKyW98En4Hmq+TxbSyexjBXnXWX3CENtLaSagsRAlRGGUGN+njFjOXO
	4mGE0Won41UFYvv2d/8eK12lbwXZ5fR7SBJucbIioKC911s4CAHJiDmGbM9vXOwRgu
	rKxxo78ruUHBGEcECZijkIwTzYAsnGOU2V6Vth9OgDFm7IyIOAH9wBTogy4yNE0kvp
	9Piyx5JoyqCFIAj4WMOMPWfKSkFOdhg6w8MT9M0cV8AgQFxGlIibwzDkP4DPzevHeO
	dhTpE+MKH7Jwll9XioQGaey8=
Date: Tue, 23 Apr 2019 09:46:53 +0300
From: Adrian Bunk <bunk@stusta.de>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <20190423064653.GA31039@localhost>
References: <20190422072218.94167-1-mingli.yu@windriver.com>
	<20190423061134.GE18826@localhost> <5CBEB280.1090104@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5CBEB280.1090104@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] hwdata: Upgrade to 0.322
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
X-List-Received-Date: Tue, 23 Apr 2019 06:46:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 23, 2019 at 02:36:48PM +0800, Yu, Mingli wrote:
> 
> 
> On 2019年04月23日 14:11, Adrian Bunk wrote:
> > On Mon, Apr 22, 2019 at 12:22:18AM -0700, mingli.yu@windriver.com wrote:
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > > 
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >   meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
> > > index 8e8dbf5c8..f04e5c8d4 100644
> > > --- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
> > > +++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
> > > @@ -5,8 +5,8 @@ SECTION = "System/Base"
> > >   LICENSE = "GPL-2.0+"
> > >   LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
> > > 
> > > -PV = "0.316+git${SRCPV}"
> > > -SRCREV = "803819aef862ded2ce0737cd3cf642c633b68c35"
> > > +PV = "0.322+git${SRCPV}"
> > > +SRCREV = "a65d28807d8f2446faa4734c758d1607f0a56ded"
> > >   SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
> > > ...
> > 
> > PV shouldn't contain +git when SRCREV is exactly the release.
> > That's already present in the old version, but should be fixed.
> 
> Thanks Adrian's comments!
> 
> BTW I don't quite understand what do you mean, so could you help to show the
> right behavior to specify the PV?

PV = "0.322"

> Thanks,

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


