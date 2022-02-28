Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE525C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 22:59:22 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web09.1904.1646089161311207802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 14:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=WS7y1yDG;
 spf=pass (domain: cold-front.org, ip: 66.111.4.28,
 mailfrom: jsbronder@cold-front.org)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 9DC555C02B3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 17:59:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 28 Feb 2022 17:59:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=mesmtp; bh=xSdFGWs8pjhudMWGoFopUGM1eI/1+Z1W/0+
	yxsq1ds8=; b=WS7y1yDGi83BBR3g8WKCZPxieskjAIhqgkWKkVifXRhUzHA+KC4
	IT0U1w9zacUambWQVz2J9yE05QXuULmkNNDAuc69cmu0Cb5UPgCjOF2mM2BLL6Nv
	uDWwACdPk9MEW3YwOEdLvHn4eaNs2w1a3/AgC5r9El0qQBDADLMz55OI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xSdFGWs8pjhudMWGo
	FopUGM1eI/1+Z1W/0+yxsq1ds8=; b=kmBk6kNILIGlBhqocR3kBdgzUejcWj4JC
	5Fuz7gjNaSpFyV7E959YMQUqQ4+pSRSdpTJFw5/+boilpPIqd0fSxW4SYd8C03v0
	iuwNVEJYgwwv/O1BytqC2bwbqror+QC+lD/6ogz0LoZQ0LrxrLuQoPGMvI2+kogl
	zb2PUoxCPKHmk7qGEZCC3Fa7NcpsM08MI3cz3PLNyc7SNfXclQ2YLONIg3crOuSk
	XmF6hYOoTvV+5bC69Uxdcf2tOMe6jkN3RNM1XZpxFb8ZVyGXm3FDi9AgHvAYvpZU
	Lcxv/MjQcVxY9mc19ApbmWdz6cQ94ZvYZdDdu17osC6pjwdDtmrDw==
X-ME-Sender: <xms:yFMdYiDixu4jkm9YEw2kvQ4APWNpdwH8LB9SRECnDIOAmotcccCxgw>
    <xme:yFMdYsgjTddpRbQBQqm2ZODtXRwivtCSxgiC5KLoVPueAMsuSM4pXTJCbh5_CwdhL
    tgUwW0Wa_DwO9cUjQ>
X-ME-Received: 
 <xmr:yFMdYllEvl0yV6oeXJBl1l7YWQy3D7z5FRNv0NhmYm5rVJFOafdB0Qx1k4j2WaxWARCQ7p0kN_kM4qU3Vs57vwyp>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddruddtuddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefluhhsthhi
    nhcuuehrohhnuggvrhcuoehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgh
    eqnecuggftrfgrthhtvghrnhepfeehudfhhfffffeukedvhfetleffkeeuheeutefhfeel
    vddthffgffetveeujeelnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrgh
    dpghhithhhuhgsrdgtohhmpdhophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrse
    gtohhlugdqfhhrohhnthdrohhrgh
X-ME-Proxy: <xmx:yFMdYgx8WlAeKSXyLSiv0ocYN0ws_rJFMxQbvB6IB5mKH2A0gSsG5g>
    <xmx:yFMdYnRdTYH71m1hC6H2P2xLfigzrgykjkn4eE_r1SB6LM63h6Nj2Q>
    <xmx:yFMdYraevc_aCO7bhMNpdiWubEjjxyQTETNCTGMJ2uexyhiyDGtgTw>
    <xmx:yFMdYqMH1318Gm5d1gpVO1cUqTszit0rL530g79tBdBDKjEq5RPa4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 28 Feb 2022 17:59:20 -0500 (EST)
Date: Mon, 28 Feb 2022 17:59:20 -0500
From: Justin Bronder <jsbronder@cold-front.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: python3-configobj: drop recipe
Message-ID: <Yh1TyAUZz6bCAIba@ravine.members.linode.com>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220228222206.25716-1-jsbronder@cold-front.org>
 <CAMKF1sppTUJmQQ0QgfE0j3i7ZqRAATPLA+2o3sKy1_Cd_3d51g@mail.gmail.com>
 <CAMKF1sq5Z5Vwx60Kym1wV8uN5taFeZ0dOxZ4EW4eY_6bkzCasQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMKF1sq5Z5Vwx60Kym1wV8uN5taFeZ0dOxZ4EW4eY_6bkzCasQ@mail.gmail.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 22:59:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95608

On 28/02/22 14:38 -0800, Khem Raj wrote:
> oh well Tim already fixed it, I would suggest you use master-next for
> this work since it has latest collaborations from everyone.
> 
> https://patchwork.yoctoproject.org/project/oe/patch/20220227234254.1089695-1-tim.orling@konsulko.com/

Ah, will do.  I was just searching subject lines for patches posted to this list
and missed the typo in the subject line ;)

> 
> On Mon, Feb 28, 2022 at 2:32 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Thanks for looking into this, Armin added this recipe in 2020, I would
> > like to hear from him as well on what this recipe's future plans are.
> >
> > On Mon, Feb 28, 2022 at 2:22 PM Justin Bronder <jsbronder@cold-front.org> wrote:
> > >
> > > The last official release, 5.0.6 is from 2014 and does not build with
> > > bdist_wheel.  The upstream repository does appear active but it's
> > > unclear if anyone has the ability/motivation to tag a new release or
> > > upload it to PyPI.  If you depend upon this recipe, please work with
> > > upstream to tag a PEP-517 compliant release.
> > >
> > > https://github.com/DiffSK/configobj/issues/160
> > > https://github.com/DiffSK/configobj/issues/197
> > > https://github.com/DiffSK/configobj/issues/204
> > >
> > > Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> > > ---
> > >  .../packagegroups/packagegroup-meta-python.bb            | 1 -
> > >  .../recipes-devtools/python/python3-configobj_5.0.6.bb   | 9 ---------
> > >  2 files changed, 10 deletions(-)
> > >  delete mode 100644 meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> > >
> > > diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > > index dbfa991ebe..6b10913657 100644
> > > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > > @@ -81,7 +81,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
> > >      python3-colorlog \
> > >      python3-colorzero \
> > >      python3-configargparse \
> > > -    python3-configobj \
> > >      python3-configparser \
> > >      python3-configshell-fb \
> > >      python3-constantly \
> > > diff --git a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb b/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> > > deleted file mode 100644
> > > index 1b85368105..0000000000
> > > --- a/meta-python/recipes-devtools/python/python3-configobj_5.0.6.bb
> > > +++ /dev/null
> > > @@ -1,9 +0,0 @@
> > > -SUMMARY = "Config file reading, writing and validation."
> > > -SECTION = "devel/python"
> > > -LICENSE = "BSD-3-Clause"
> > > -LIC_FILES_CHKSUM = "file://configobj.py;md5=a7c3968dd866dfd23e91e125b669ab21"
> > > -
> > > -PYPI_PACKAGE = "configobj"
> > > -SRC_URI[sha256sum] = "a2f5650770e1c87fb335af19a9b7eb73fc05ccf22144eb68db7d00cd2bcb0902"
> > > -
> > > -inherit pypi setuptools3
> > > --
> > > 2.35.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#95601): https://lists.openembedded.org/g/openembedded-devel/message/95601
> > > Mute This Topic: https://lists.openembedded.org/mt/89462996/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >

-- 
Justin Bronder

