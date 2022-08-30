Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74691ECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 16:05:15 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.13706.1661875512458233743
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=YyIwg2Ub;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id C2BC25C023C;
	Tue, 30 Aug 2022 12:05:11 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 30 Aug 2022 12:05:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661875511; x=1661961911; bh=9y0ZkPpnuf
	OcRhB4UzMwZ9CkOFt+BIo+QqgIz44ZDU8=; b=YyIwg2UbklaMy2JvVMpRgJ8PdU
	pYvYAhZcy5EFTMemdYo7zsubZMdFpXo+qOSLdaNYC9HZhGnfC7SkXKZJyasiUPWK
	54sdx1hsh4jbQXAfKXlMJ4tp8ONGsaiyZrQMiN9aB6C462mR6XeWyjCHgD/5vrwM
	6a4OUMQtFsqZan09EOpDtQ7qBFAfJn5sfeoeLfB6lYWMN2QmHAOVZgabexQ2X9Ai
	Ee2uwRy+DOR4W+lYlGLua+QWNgJQrhbp0rDiThKzh7MkLAqgsMORGKIqu7NDyWdh
	dI596jmQAQBr5KYAoLUpVKttgw1nFcA2Bc1FNCHZUxdrdUeR96Sxl3tnsxJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661875511; x=1661961911; bh=9y0ZkPpnufOcRhB4UzMwZ9CkOFt+
	BIo+QqgIz44ZDU8=; b=OYITYfQPke50D/OLyclCqU7dOS1FgmDBHzIK/V2hXRHF
	+/WWGBqKFiBc8RoF8zgiy2g41J1VYJU4c59ZBLp+JeY69uEGZt6uc+NdeANIrfa8
	giPI6RW6TT5Qewc4H4tRnvx/cTrPVkJ5BglM1yeWANNes7EUGob5niFiZKefrttq
	6buveERLNd+DZOoGJwkgAJoppN/z+vhqJZPZchLOfOD502S+a/XfsLJjbcOCXJtM
	wlcLK4xqckA2Emn+uF4eqpjJQqvk39ruUFArqGFOu/leiJT/LLmtkwQIKujR+InC
	h25H5wZRnsNIA28BDXkDTMZKrdEYbdlOcbNkLywKmA==
X-ME-Sender: <xms:NzUOY57_D3_yRgWnDXA9Wq3KHcnzvw2lEZ2diN-PAeD78xXxgNDWog>
    <xme:NzUOY27mFWu8JcAqA7-Zg3NhudcTaxQ4bA2lGn3BeZDwHNolgkU8Xt2y1VUOBJLrN
    ITHrjD7K7YldfGV-MY>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:NzUOYwdJIg64irVYqm5uzlAM7efEH39g_A_DnO5yGMQ0dIINiJv8qg>
    <xmx:NzUOYyLOjHuSUayVpEvTCCoPvE31FAlvsHrlO9RjwPtZJJnZxcZuRw>
    <xmx:NzUOY9IUwtv09CpXZMiOnU6TAc6axKJAJBLivge55CY1xI1Ew55zKA>
    <xmx:NzUOYwk5m3e_TU41CnIEmr5TChp1IZQtXcbfQrnRkjHhWDZ9gi9bCA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 51E762340077; Tue, 30 Aug 2022 12:05:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <89f8dd50-6aee-482a-adb9-bc18fdb1c1d3@www.fastmail.com>
In-Reply-To: <Yw4oUE5IPP5Ph0Ky@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
 <YwM7IAvEulD79BzG@skidata.com>
 <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
 <YwRYL6yEEusxD0gn@skidata.com>
 <5b7a7520-f4c7-49c8-b71c-2bb0cb7b01b8@www.fastmail.com>
 <20b725e0-e666-4252-b00b-b8551d9d803c@www.fastmail.com>
 <Yw4oUE5IPP5Ph0Ky@skidata.com>
Date: Tue, 30 Aug 2022 17:04:23 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Richard Leitner" <richard.leitner@skidata.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 1/3] classpath: Use an include file for
 x11 feature
 check
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 16:05:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98563

On Tue, 30 Aug 2022, at 16:10, Richard Leitner wrote:
> On Tue, Aug 30, 2022 at 10:31:04AM +0100, Andrei Gherzan wrote:
>
> ...
>
>> Do we have any updates on this patch set? It would be great if we could get it in kirkstone soon.
>
> I'm currently facing problems with some of the tests/builds for arm64. I
> hope to get them sorted out today or tomorrow.
>
> I'll give you a ping as soon as those tests are finished successfully.

Thanks for the update. One small thing that I have realised - the patches I've pushed have the SPDX headers with an Apache license. Could you change that to MIT? I can also send a v2 series if that is easier for you.

Andrei

