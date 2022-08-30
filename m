Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD6C9ECAAA1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 09:31:33 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web09.9549.1661851890704826468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 02:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=Ol6K1Pn1;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E1F385C00BD;
	Tue, 30 Aug 2022 05:31:29 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Tue, 30 Aug 2022 05:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661851889; x=1661938289; bh=nh3hT0CyBV
	+n8iHEt7etqT482GvIcTWRjVaC5Uy9iTI=; b=Ol6K1Pn1UtCkTDLeLNrnwHqqim
	BpL9NK+GYN7eFgDOZn1rKErPOgJ0Vp0cjlT2fWGkeMbVGTUXGyQA+mCDnTexzQ8y
	I3+YtiWPfP7Ru4103txnq22z06+sxzL1r6Rn66+XdwUt81bB7Ix+/EcqjWnMDwG0
	NkROtkyGar6kFG05VxVG0XLZ2BIm9yU8wuwaZdaDA8anrCOwWxwsInbf1d3TPOcJ
	Wqbb7YY4J3s2znVDA1O9RWWJ3qKYgRAc3ejRTyGgLpCCV+WMLcM4TdA3ttS7dhqp
	uyV2YVjM7tehcdAYXn4ybJBH+itkMM9m0JfqLTQaSYt/tzWT7CjhiCiY3mjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661851889; x=1661938289; bh=nh3hT0CyBV+n8iHEt7etqT482GvI
	cTWRjVaC5Uy9iTI=; b=jT4F6zIkS5Flze9E5teLTEJszskzirfmZ/9ua3MK3g+Y
	yrEzUm0napQ+3RKS5B2PraCgZU49BG2+V9NvbbOfwIqmSgTazlIDbfcUfJfozXIT
	wYtBgnhAgVeQabxqD0NMDZwsW65ue+HpRt9Pzl7dCEcUU1SE/H6ged7wr64Azdn/
	wP2AD9x/u7dD+TXk2rLLPLLlZhC4MKW9woF14yx5STfbXt7nd4SDnO0cGKpLnOqr
	JbhXJiBDNnKVM0JJ7hkb2M9yyIZvMXHeLeK9tEkZD/Zx+0AjIFSI6JwqBNDPzZw2
	UJU7SDNDJsXtmx7mwsJ8Gj+6wn2dpUiHb+i3I8c1Og==
X-ME-Sender: <xms:8dgNY_dhNgnCUKZBNMU1wXkctZ-TE7ycvR9Vu3sRT2yidfHt5umqZw>
    <xme:8dgNY1O81ZFs-H6uPsskPlWV_LubkTTle1v90b2t7V72qI6EoVEHJWpyNTetebneU
    Q_2WjCiQXtDFMapjiw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdekfedgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhleejteeuvdeuhfejffeigfduieelgfduueffueethfeg
    geetvdevffffueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:8dgNY4gZGK3huID54KKrRjVobED9r0FjF896B6g8-8CuJ8t5r_eCBg>
    <xmx:8dgNYw97dhjvcxQf5RL9hd-DVD3NWoQy9N6xNQ8JwsAg8zIprfPFpA>
    <xmx:8dgNY7ujGY1jywmrxVA2yZtU7KdH9tYP3xuSnnZ7pSCWTrj5gjudbA>
    <xmx:8dgNY44GSMG1zkv1UbbHgz8sLE0eEoSv-PPVD0gKc_VpCArNAnat2w>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1E80E2340077; Tue, 30 Aug 2022 05:31:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <20b725e0-e666-4252-b00b-b8551d9d803c@www.fastmail.com>
In-Reply-To: <5b7a7520-f4c7-49c8-b71c-2bb0cb7b01b8@www.fastmail.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
 <YwM7IAvEulD79BzG@skidata.com>
 <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
 <YwRYL6yEEusxD0gn@skidata.com>
 <5b7a7520-f4c7-49c8-b71c-2bb0cb7b01b8@www.fastmail.com>
Date: Tue, 30 Aug 2022 10:31:04 +0100
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
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 09:31:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98560

On Wed, 24 Aug 2022, at 17:29, Andrei Gherzan wrote:
> On Tue, 23 Aug 2022, at 05:31, Richard Leitner wrote:
>> On Mon, Aug 22, 2022 at 10:28:34AM +0100, Andrei Gherzan wrote:
>>> On Mon, 22 Aug 2022, at 09:15, Richard Leitner wrote:
>>> >
>>> > Unfortunately the testing infrastructure is not public available :(
>>> 
>>> Got it. That's fine. I'll just keep an eye on the repo.
>>> 
>>> >
>>> > But ideas/offers where to host a public test runner are highly
>>> > appreciated ;-)
>>> 
>>> What is the current testing plan for the layer?
>>
>> It's basically running the image tests for arm, armv7, arm64, x86,
>> x86_64 and ppc with the mejate and mejate-musl distribution.
>>
>> I can prepare and share a repository containing those kas and gitlab-ci
>> configurations if that's interesting to you?
>
> Sure. Send them over when you get a chance.
>
> BTW, did the testing finish? Are we able to push the changes?

Hi Richard,

Do we have any updates on this patch set? It would be great if we could get it in kirkstone soon.

Thanks,
Andrei

