Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B327C32772
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 09:29:04 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.16283.1661160538612317826
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 02:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=k6pQCVkX;
 spf=pass (domain: gherzan.com, ip: 64.147.123.20,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id BCD5132000EB;
	Mon, 22 Aug 2022 05:28:55 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 22 Aug 2022 05:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661160535; x=1661246935; bh=mJ213WTZMo
	hRCC9s0N9C8mc7L7jJ88wXhiF9ORmGXDE=; b=k6pQCVkXI9T6xIHkGFFTHH5SMF
	2292uWgAXjat/KBzIXz96IrSsEmCIdYVnCgiDETneSU3UHQ6s+GZ8fkEu0ddgbe0
	I/viSgQ2qPt4BfJ+wnCZJfnZ8M0/9LW+cgQchdqxf+Xn+nirRsA5t5fDnUzsfUx8
	p8aIihP9FZ1m4bRjSXl8uC8NFXtBn3dolsl2R4HXxpYmuYX1CWNX8rBxGsf+jTbV
	MASvbOt3M7rWJx3A2A/Si196IcWoBlVCL5pxbyKvEeL/IwjBn8bROgXLH4+ILW98
	ejv40u2IZovyK43nRAsCXHkL4BYjYIv29Qtxk2cfeb1QckVwKyjlxvqjH5Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661160535; x=1661246935; bh=mJ213WTZMohRCC9s0N9C8mc7L7jJ
	88wXhiF9ORmGXDE=; b=lnWnB2uHaZXY9ySwMQ8ZiSwFIOOK2/lbL+5X3Ce2wVC7
	XWKoC2pQTWjWcR49fYVaCDSeZO7E4D/VSL87o+pSa21/7qAc0MYDhPKyyyU9iGOh
	x/+f5++vRgsMg+bITmj1nqkZzRp+6e8HFYhDwvsSzxPgLan8H9rfGEwwbKUrQBic
	gBlFfkRzLq3aI0nq4b9xZGg870Khe6gZBF8IblcgjSAb4LKqxERMnHaNFRU+EXnk
	BVmBJptmPxml3dS6kYcqHPFzqLNyIOqkN4mGy5sa5/TvyZRh3ChpfFvlnO4DuMNg
	/egVazcVUOindkWOej5LfpS30G7Ll4nD/ipXe6pY8w==
X-ME-Sender: <xms:VkwDY-SJHJE2LlGUgmPa_AvpjFMFQMn_Zjoo5YHznr9li3ApVoWB1w>
    <xme:VkwDYzyqL4uCUx2W1FYFzHvwTRwBSHdUGHL4fS_h5QL1rjU8O_JOCWZVOX-DToCA-
    p_-_GK7jFmu7L8EMI4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeijedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnheplefhudehiedugeejjefguedugeevffduuefhvdfgtefhgedv
    geeujeelgeeikedunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:VkwDY7277QSb8Znij4G2YWz5MrPAfVKD4PhKU3ofUnVhUOtPa8G-uw>
    <xmx:VkwDY6ApBO3T4ycaRDI2BdllqMMaJCKd2gn1bT6k7JFTuAsxKhqHnw>
    <xmx:VkwDY3g97wOAvcNIGwEYnO9PsEFWYdVb7WWa0JzxvE5kpjluehIMaA>
    <xmx:V0wDY5doUNpQmihiUomZNE0Se3FcdQjEACcYp-ttMy8Im9WOJvKXdw>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B3ECD2340077; Mon, 22 Aug 2022 05:28:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
In-Reply-To: <YwM7IAvEulD79BzG@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
 <YwM7IAvEulD79BzG@skidata.com>
Date: Mon, 22 Aug 2022 10:28:34 +0100
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 09:29:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98362

On Mon, 22 Aug 2022, at 09:15, Richard Leitner wrote:
> On Mon, Aug 22, 2022 at 08:46:45AM +0100, Andrei Gherzan via 
> lists.openembedded.org wrote:
>> On Mon, 22 Aug 2022, at 08:38, Richard Leitner wrote:
>> > On Wed, Aug 17, 2022 at 01:43:06PM +0200, Andrei Gherzan via 
>> > lists.openembedded.org wrote:
>> >> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> >
>> > Hi Andrei,
>> >
>> > thanks for the series. I've just applied them to master-next. As soon as
>> > some testing happened I will merge them to master.
>> >
>> > If you have any question please just drop me a line.
>> 
>> Thanks, Richard. I've also sent the series against kirkstone. It'd be awesome if we could do the same there. Is the testing something automated that I can check out logs on?
>
> As currently master and kirkstone are the same I will simply merge
> kirkstone with master as soon as the changes were merged to master if
> that's OK with you?

Sounds good.

>
> Unfortunately the testing infrastructure is not public available :(

Got it. That's fine. I'll just keep an eye on the repo.

>
> But ideas/offers where to host a public test runner are highly
> appreciated ;-)

What is the current testing plan for the layer?

Andrei

