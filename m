Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6F8EB64DD
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 19:30:49 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.3689.1690227047343732967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jul 2023 12:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=mesmtp header.b=ia93HAra;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=C61wL3QE;
 spf=pass (domain: cold-front.org, ip: 66.111.4.26, mailfrom: jsbronder@cold-front.org)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 7C5855C01D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 15:30:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 24 Jul 2023 15:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=mesmtp; t=1690227046; x=1690313446;
	 bh=64XtpUC60lPhvWEGd7jvB0r9fIKNr6+bZMA1n2W5Whw=; b=ia93HAraFQYO
	PjHjI2b4QBHSSkhMBmaTieiA1+XXr3TignGFJIqV1vq1tUJLQbwORi2AGWseXcEb
	ldC3E8rmg6pnRFMLaXGUwoKLgltXMo4+cz9rg+TI1scCCmozp/P2s3wBEm8LOBz0
	lIlGwbKltpWV6ThdTv2I37fdvzgW08k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690227046; x=1690313446; bh=64XtpUC60lPhv
	WEGd7jvB0r9fIKNr6+bZMA1n2W5Whw=; b=C61wL3QEI18z5XMK7kvAdkbrAN7tT
	4V0mRn2lz0+5WolcQyyTSRMooelN7memioJZdE1XrA+csuyXaBmXkOaBfid2TSia
	969p/veZq7Yq3pA2WvJDCK+syDmELt0xK0Wixjc6qGhQsfQM1LjvpcxL8iu8VFYB
	lDY5ZMEWGSJOZZRguEuIa1W/1g6M4qBRzVCHxvvQEn0Gmu3T0j4VSIfkyJWZD3GN
	SlavhQi16E8KWoUflWbYRfBzgVVkUn57uy2ZX1NMJ8sJstzjk7KBmqt0SmsJwKvQ
	vTIlJcAX09ZNCl6NbVacfn/T2XfynDUcJEM+sXSktgzDyxGCuYODlvR3A==
X-ME-Sender: <xms:ZtG-ZEx-8d6diFqMBHBAD1ui_74LefuxXBjNczmRxoDEq245cSl1lA>
    <xme:ZtG-ZIQqUYJc6dg853yBNMO66LH1d8cZSLN6sZWXys1NMWStWMn0wVTlJw09CygEM
    zMR1KbKjLnASkrc0Q>
X-ME-Received: <xmr:ZtG-ZGUK0gn8aPf7zCjMywtcaOEXbg8vmjaPgcOqO-28G449l8DO5cBRLDhcQKDErCmCFqjt_g-715LBjnZVhOy6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheekgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomheplfhushhtihhnuceurhhonhguvghruceojhhssghrohhnuggv
    rhestgholhguqdhfrhhonhhtrdhorhhgqeenucggtffrrghtthgvrhhnpeekudetleefue
    evteeiveevfeektdevveevhfefveetvdeikefgvdegueehgfefvdenucffohhmrghinhep
    phihphhirdhorhhgpdhgihhthhhusgdrtghomhdpohhpvghnvghmsggvugguvggurdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhs
    sghrohhnuggvrhestgholhguqdhfrhhonhhtrdhorhhg
X-ME-Proxy: <xmx:ZtG-ZCiXxFPrIdSTEJcGx34K1hI5H27w-GD7TPHC4Cciv4gdlzgoFQ>
    <xmx:ZtG-ZGAQpo8NzHnPP5q43PUT1VQjxRmoJhLqZhec9zrj29sOB4bMzg>
    <xmx:ZtG-ZDLV0TX5kn6j53BfBkSblhNmZYpgjZIKzuLrHNYSzgtLM4GD9g>
    <xmx:ZtG-ZN-ptsYpBleWcE1lw04pX5BbpDVj5BIvFy8RZ4rWpnm0nDqxkg>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-devel@lists.openembedded.org>; Mon,
 24 Jul 2023 15:30:45 -0400 (EDT)
Date: Mon, 24 Jul 2023 15:30:45 -0400
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: python3-mypy, python3-mypy-extensions: remove
Message-ID: <ZL7RZRDe0Zpx7fQS@ravine.members.linode.com>
Mail-Followup-To: Justin Bronder <jsbronder@cold-front.org>,
	openembedded-devel@lists.openembedded.org
References: <20230724165848.3294-1-tgamblin@baylibre.com>
 <1774E3E404BBDB64.23395@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1774E3E404BBDB64.23395@lists.openembedded.org>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jul 2023 19:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104001

On 24/07/23 15:18 -0400, Justin Bronder wrote:
> On 24/07/23 12:58 -0400, Trevor Gamblin wrote:
> > While attempting to upgrade mypy and mypy-extensions, it was discovered
> > that it depends on new modules, some of which have no maintenance plan
> > in place, e.g.: https://pypi.org/project/types-typed-ast/
> 
> That dependency has been dropped upstream as part of removing support for python
> 3.7 [1].  If there's other other problematic recipes, I think it'd be beneficial
> to have a type checker for python available.
> 
> 1. https://github.com/python/mypy/commit/2edaf35ec1f91c139dfe1930b1b0d1e1cac59599

1.5 looks like it'll be released soon.  If there's interested in keeping mypy
around, I'll volunteer to try to package it then.

https://github.com/python/mypy/issues/15588

> 
> 
> > 
> > Since this is something we want to avoid adding to the ecosystem and
> > mypy isn't a dependency for anything else in meta-python, remove the
> > recipes.
> > 
> > Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> > ---
> > v2 removes the recipes from the packagegroup as well.
> > 
> >  .../packagegroups/packagegroup-meta-python.bb |  2 --
> >  .../python/python3-mypy-extensions_0.4.3.bb   | 12 ----------
> >  .../python/python3-mypy_0.971.bb              | 23 -------------------
> >  3 files changed, 37 deletions(-)
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
> >  delete mode 100644 meta-python/recipes-devtools/python/python3-mypy_0.971.bb
> > 
> > diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > index b23d24c6d4..c12d475047 100644
> > --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> > @@ -245,8 +245,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
> >      python3-msk \
> >      python3-msm \
> >      python3-multidict \
> > -    python3-mypy \
> > -    python3-mypy-extensions \
> >      python3-natsort \
> >      python3-netaddr \
> >      python3-netifaces \
> > diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
> > deleted file mode 100644
> > index 83ac5362d6..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.bb
> > +++ /dev/null
> > @@ -1,12 +0,0 @@
> > -SUMMARY = "Experimental type system extensions for programs checked with the mypy typechecker"
> > -HOMEPAGE = "https://github.com/python/mypy_extensions"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=0fe3219e2470a78c0d1837019b8b426e"
> > -
> > -PYPI_PACKAGE = "mypy_extensions"
> > -
> > -inherit pypi setuptools3
> > -
> > -SRC_URI[sha256sum] = "2d82818f5bb3e369420cb3c4060a7970edba416647068eb4c5343488a6c604a8"
> > -
> > -BBCLASSEXTEND = "native"
> > diff --git a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb b/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
> > deleted file mode 100644
> > index 31fcb06c9e..0000000000
> > --- a/meta-python/recipes-devtools/python/python3-mypy_0.971.bb
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
> > -HOMEPAGE = "https://github.com/python/mypy"
> > -LICENSE = "MIT & Python-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
> > -
> > -PYPI_PACKAGE = "mypy"
> > -
> > -inherit pypi python_setuptools_build_meta
> > -
> > -SRC_URI[sha256sum] = "40b0f21484238269ae6a57200c807d80debc6459d444c0489a102d7c6a75fa56"
> > -
> > -BBCLASSEXTEND = "native"
> > -
> > -RDEPENDS:${PN} += " \
> > -    ${PYTHON_PN}-mypy-extensions \
> > -    ${PYTHON_PN}-typed-ast \
> > -    ${PYTHON_PN}-typing-extensions \
> > -    ${PYTHON_PN}-json \
> > -    ${PYTHON_PN}-compression \
> > -    ${PYTHON_PN}-pprint \
> > -    ${PYTHON_PN}-difflib \
> > -    ${PYTHON_PN}-toml \
> > -"
> > -- 
> > 2.41.0
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Justin Bronder

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104000): https://lists.openembedded.org/g/openembedded-devel/message/104000
> Mute This Topic: https://lists.openembedded.org/mt/100336187/4454694
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [jsbronder@cold-front.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Justin Bronder

