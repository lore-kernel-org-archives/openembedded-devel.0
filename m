Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8473C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 16:29:53 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web11.13116.1661358585942341114
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=K8thT9ul;
 spf=pass (domain: gherzan.com, ip: 66.111.4.29, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 484E35C009E;
	Wed, 24 Aug 2022 12:29:45 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 24 Aug 2022 12:29:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661358585; x=1661444985; bh=Q1o6UMP0WL
	F0aAK0ia6g0341dVIdFMUAasdEgsm3WGw=; b=K8thT9ulhSUO1MqmJ1TEI/Ljok
	ICO2q5eX3c5Gov6xssflLAJ0AnXQzn+69YunqwrHrqCazOwJdWkDnw6+6DRynQbd
	f5mmbNSakDDoAi0o8zqkXk6iB++3LZDi84x3wAeqYoJxEgEk648mJnXyufW8hsUt
	Qa4pJjbw4mPdaRJ2Ca/tI6nA2HFFlmXSI+QD25Q+tXIjMBGJzviLrMaRhYuIupbZ
	SEgjyjnhQSNIJSJACsMFS5zmzMd8HTPKFQnC/piS1PJgZ7HoLMUTKhX0Y0BURuq2
	AmkCqmNUGG1GYu1XCRYl7qMSxF6pnhEdPCDMQSfJcKHl1EeN6xv3zZTQ5jtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661358585; x=1661444985; bh=Q1o6UMP0WLF0aAK0ia6g0341dVId
	FMUAasdEgsm3WGw=; b=p/GC61xEG9gxl4Lx3goIaFYOpYo/Ttpdo97YkUgF/22a
	Xyu2y5OhSe01iFJOFPKtD1XiFIx0tkASmJF8airXyG9hNnWspvd0ZBq1stibVvwo
	IkQcTjH9pF4xueDbujBWK0k6OHcSGPh/c4iVPepF9OdVKXy5gKoRS33za59Yq78Q
	rXasKCBW+vTa1x6PA+uMzpB8dy2cOC6l0v1yvkXnoDks0ve3K9RbLHD2IEGoUwyA
	1vn4dZgrEhm62zOEvb8XE3OvlTagfyrtGPZ+7SZmDh1QXB/ftCN2GGXtgYJfF8Nr
	RmuiLGPJIEL/VHGZLfKhntCN8y1EQvJN68RYTaOgKQ==
X-ME-Sender: <xms:-FEGY6bx7-ONwcTFr1ONsfDvU-LOHRhhroRg7XXSHLiBOiLrrrlKXw>
    <xme:-FEGY9YjQ6FPyKfwap4DaELMczHDsQblowpW9dFcjOCGiF43K84EX8Nu-qDwbylF_
    oBsNdAY6oJ8ByJzVkI>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddguddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelhfeljeetuedvuefhjeffiefgudeilefgudeuffeutefh
    geegtedvveffffeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:-FEGY0_ecJB0iLSBnx6Kax0qj4BxIquwmCQ8OMgGFrWRZTQ_PKwnnQ>
    <xmx:-FEGY8oNgZ9P2nAHgfsYtEENafhqeYCcznI85uWQ5-3uXFv1nLY2TA>
    <xmx:-FEGY1of0vptQZCFT8Y1BTvMf6f-BUL0vsdFXaP9c-LbaKu90iTO5Q>
    <xmx:-VEGY3G7mwRnWFgN1_vptBc-1BvNERnJve0KkD64ljGsNe3i70x3_Q>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D5D57234007B; Wed, 24 Aug 2022 12:29:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <5b7a7520-f4c7-49c8-b71c-2bb0cb7b01b8@www.fastmail.com>
In-Reply-To: <YwRYL6yEEusxD0gn@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
 <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
 <YwM7IAvEulD79BzG@skidata.com>
 <894c6ed7-e7cb-4434-b132-861ba83a913d@www.fastmail.com>
 <YwRYL6yEEusxD0gn@skidata.com>
Date: Wed, 24 Aug 2022 17:29:24 +0100
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
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Aug 2022 16:29:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98421

On Tue, 23 Aug 2022, at 05:31, Richard Leitner wrote:
> On Mon, Aug 22, 2022 at 10:28:34AM +0100, Andrei Gherzan wrote:
>> On Mon, 22 Aug 2022, at 09:15, Richard Leitner wrote:
>> >
>> > Unfortunately the testing infrastructure is not public available :(
>> 
>> Got it. That's fine. I'll just keep an eye on the repo.
>> 
>> >
>> > But ideas/offers where to host a public test runner are highly
>> > appreciated ;-)
>> 
>> What is the current testing plan for the layer?
>
> It's basically running the image tests for arm, armv7, arm64, x86,
> x86_64 and ppc with the mejate and mejate-musl distribution.
>
> I can prepare and share a repository containing those kas and gitlab-ci
> configurations if that's interesting to you?

Sure. Send them over when you get a chance.

BTW, did the testing finish? Are we able to push the changes?

Andrei

