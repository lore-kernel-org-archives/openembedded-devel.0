Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BF0047ED8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 19:17:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jsXh0SVpz56;
	Tue,  9 Jul 2019 21:17:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562699876;
	bh=bCx5F3sBlhI4kmq5PIMMFE3XAtNFDdCSAiEjYKJX6zE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gx0o7j/WJqICq3L5FgKk8+gqvSMbVEFtoMEUtDbMwhfZeX0srnpJw1tThmW7qNYjo
	BmBpakPzSjLn4ahjc3DtWqnK8aFD73E4IVZFyaltcHgHYqjBAVAh90N4MWuHdGMBlW
	EAri/4quYiy0JWBfJMLKNMMBFo2RT9oV9nLipRHfEd1Z3+4n/Ols8R9acU/CZpF57w
	wAinGCYEnmGQ/uoJCTDLc/YaCs6fN6JaUGJmwP9mdGEGKeV/Rrb8i0lfuMBtnkvL06
	piGWmkUtq91jcHVO8b4cI82aE/HMuQcd0myK7ljkVFh1T30QfW8LYWCC6Tmtd3ysc8
	EgNaB0rOjCqD75WCCCzydLLth6HzpBa/dW5wf3lzUOahxeqdCyuf23Bu2KzxFoR6Oz
	ri8H9h9OptPn5nNLd3xMdTZOuv9AM2IypOvnDTMuIKxjL/Dic7KxQEN10AGjv0FW8b
	lAOEKmQtas8c/PIsoJIae/jfyg08kCzPdZclf8mBbvVodnk3yEUd2nSbjnH+D0j4AL
	ul9jl/vA/L4XWqrZgIl6pcHzPcHJcul9MzdQV4BNmGZPqsKGOLwz/tyA782Awq/OHU
	NoENyTKQpEuJr0k3YmjiMt1LhxIi0lzPxIpvLn8E1yu+/p5JJo4Bd7O1AREFbvKenD
	YhoYy5EMvNssKWdrx6Rq6FAM=
Date: Tue, 9 Jul 2019 22:17:54 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190709191754.GB19705@localhost>
References: <20190709172623.26073-1-bunk@stusta.de>
	<CAMKF1sp_S44k9HRapQiOLps3ZCbR6c6xPsjW3vOdhniU5nZ6DA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp_S44k9HRapQiOLps3ZCbR6c6xPsjW3vOdhniU5nZ6DA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gpsd: Don't build without optimization
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
X-List-Received-Date: Tue, 09 Jul 2019 19:17:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 09, 2019 at 11:54:19AM -0700, Khem Raj wrote:
> On Tue, Jul 9, 2019 at 10:26 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > The upstream build system adds -O0 when debug is enabled.
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > index 6716f402a..43bf25a93 100644
> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.18.1.bb
> > @@ -36,8 +36,8 @@ PACKAGECONFIG[qt] = "qt='yes' qt_versioned=5,qt='no',qtbase"
> >  EXTRA_OESCONS = " \
> >      sysroot=${STAGING_DIR_TARGET} \
> >      libQgpsmm='false' \
> > -    debug='true' \
> > -    strip='false' \
> > +    debug='false' \
> > +    nostrip='true' \
> 
> I think this change is improvement over what we have, however it will
> be nicer if it was knobbed with
> DEBUG_BUILD flag, then we can get proper debug info when doing a debug
> build as user will expect.
>...

Sorry for being terse in the description.

For gpsd "debug" means adding -g here, and this is already additionally 
inserted through the normal OE CFLAGS.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


