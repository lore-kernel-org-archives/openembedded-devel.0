Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDC0C00140
	for <webhook@archiver.kernel.org>; Sun, 21 Aug 2022 08:15:37 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.4836.1661069734208295458
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 01:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=YUzxH1yX;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 915ED5C00CC
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 04:15:33 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Sun, 21 Aug 2022 04:15:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661069733; x=1661156133; bh=yr1XFX8DGN
	XEzfAVdosgqojclk1fZbfjMlYtSiSHh54=; b=YUzxH1yXuuDGSO55smrKg9hxUJ
	Zls5kacSg2hlZvHHDBxTwG1cAG27TTyfPX5a9BgTHgtsnYHIQpFILZ4dqkulz+s9
	sYNZ43gUk+8dCFjjBmKBXCSg0i6c6nfBy0Vo3VsfuSPJsUieV/nOENFEdGIl/RN7
	1sQ4Dpd+HjOdSFhVWfvUqxnpmOrWTqamiR2al9treUnFC9gtTlDcoJ/jixTpG3ur
	d8E1sFWg1HjZ5VyJnBUKuhAIztBH/CjHE0ckqx040FWfWQLFR0l7FU5QzSFuUL7o
	5jljUii32ZjRV/eVetv4510y6y5ToY5uK2/0+iNChsGFvbjk5IfsF6Cm70Yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661069733; x=1661156133; bh=yr1XFX8DGNXEzfAVdosgqojclk1f
	ZbfjMlYtSiSHh54=; b=YIcaF9C6Qgyx6GUjw6c/7iDoMdzdIMHPSTpDbW9yb6mD
	b0rs1ZbFvWCncA+105PtE7CogWFoceW3Ua0ojpieaqjx/LRBgIKrWwTLHUtdr1Iy
	37wx90EA+aMf5nm/XikkLlxVA/ZY5UXUFKp46SOzl4qL9+U80qJSW8dznWzW+Ju8
	/BXXKF+BAOi2Vr1LgB5NN54h7f2n13DjkehFRgi986mMqR85vbTl14B0A3AT+OV1
	HkOo/Mp+BhY3AIV/USlZgnppM3bUeBk1fnIyBcd3nrsUPmPTGiTf63Q1gzmzl4u1
	d35Iywj1st00Qh0z6jn6jjVOFBxTKKVzzRT0cynf0Q==
X-ME-Sender: <xms:pekBY6IQqtCYi79PegU_vvbVUmi5tLDCAMvD53ZwegIjiDFhaSckkA>
    <xme:pekBYyK9qLwjqqUx45cvA-VuOQIsRAzBa6ENypYzDnABgOc-4szz9e9e1Yrg7y3gm
    8EHUy-gGliWy1eT6pg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeihedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepgfehgeettdfgtdeife
    ehkeekffeftddvgfegtddvfeefleegvdegueefuedtvdefnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvghisehghhgvrhiirghnrd
    gtohhm
X-ME-Proxy: <xmx:pekBY6trfbwYNwumqE8jR8rQCqXr7l47xBcNAFVfU-hweJgLeGBWVg>
    <xmx:pekBY_blqcC7ga7ENAeXv-nmYdfXDGAyQkkuLjtjY-sBBaVY87-Onw>
    <xmx:pekBYxay_TtPDARPduedSEW0b_LxZ362VVkQIOvk11PknzFwTobGCw>
    <xmx:pekBY6kt-xfOJ_taFQB5k6pVO8bSsJLpQG52GH0JDjml4rDyRuO0dg>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 535D02340077; Sun, 21 Aug 2022 04:15:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <c4f59553-15e0-4757-b2a6-181be45304bd@www.fastmail.com>
In-Reply-To: <20220817114406.348705-1-andrei@gherzan.com>
References: <20220817114406.348705-1-andrei@gherzan.com>
Date: Sun, 21 Aug 2022 09:15:14 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][kirkstone][PATCH 1/3] classpath: Use an include file
 for x11
 feature check
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Aug 2022 08:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98342

On Wed, 17 Aug 2022, at 12:44, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> This will make it easier to maintain reflecting the same distro check on
> packages depending on classpath (in the dependency chain).
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-core/classpath/classpath-features-check.inc | 6 ++++++
>  recipes-core/classpath/classpath_0.99.bb            | 4 +---
>  2 files changed, 7 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-core/classpath/classpath-features-check.inc
>
> diff --git a/recipes-core/classpath/classpath-features-check.inc 
> b/recipes-core/classpath/classpath-features-check.inc
> new file mode 100644
> index 0000000..c238fc3
> --- /dev/null
> +++ b/recipes-core/classpath/classpath-features-check.inc
> @@ -0,0 +1,6 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: Apache-2.0
> +
> +inherit features_check
> +REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/recipes-core/classpath/classpath_0.99.bb 
> b/recipes-core/classpath/classpath_0.99.bb
> index 5b9d904..f18ad1d 100644
> --- a/recipes-core/classpath/classpath_0.99.bb
> +++ b/recipes-core/classpath/classpath_0.99.bb
> @@ -1,8 +1,6 @@
>  require classpath.inc
> 
> -inherit features_check
> -
> -REQUIRED_DISTRO_FEATURES = "x11"
> +include classpath-features-check.inc
> 
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=92acc79f1f429143f4624d07b253702a"
> 
> -- 
> 2.25.1

Friendly reminder on this set.

Andrei

