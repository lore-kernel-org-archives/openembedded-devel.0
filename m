Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3EDBC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:47:13 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.15494.1661154426525714469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm2
 header.b=DtA6MSMg;
 spf=pass (domain: gherzan.com, ip: 64.147.123.24,
 mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 7BFD93200949;
	Mon, 22 Aug 2022 03:47:05 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Mon, 22 Aug 2022 03:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661154425; x=1661240825; bh=h1pyrp1UoE
	tg5f+MIpbZlZQIpAmgV+fS3mdFAKur6nI=; b=DtA6MSMg4BZjk1r9nydrJIbGb4
	D53zIPu7APFVM21e94rbNlXp7d1cv9DiobUX8XbNWjyWaSizTxyDkIboQXHyLyqT
	JhX/E0/XLTFJiXW8yBRDK/R93bfkbmEQcalN0Q13kLOq2qAg7+tRiE+YjKf9saVk
	A+wLXwz+2VwEtO+mK52NMPHEoDZpuBSB7CBbuiAkHF3c1P23xcG4b/uEsfJhVb+O
	5KDWyjq3SvnPyRKZNEDcS4Fs7r1Qb3XFWe+aO3Vtt4ReolUxHgkANgBQNEl3zP/g
	cgnjD50eIuQz0q/o36tgTJk1qdkYIdmv3EWUvuPVGIro5BSclUZYt1xmHa8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661154425; x=1661240825; bh=h1pyrp1UoEtg5f+MIpbZlZQIpAmg
	V+fS3mdFAKur6nI=; b=AYgcmz35leZJ5Fw6eR8vMQiTs4Vr8kcVbwIWW1elOwto
	5KADHKU4uzsPDOEAFhB3jjB5iDkX3OF+IfYDOJ636sNDxpv5zIFwZXFy9Y2wI6sT
	l+nFTK5zQUWX6aXb/oqtYnmRg6XFq+QdzwDgeJ4Dz153c7ag+vOyTojN6yve4/Zs
	++yKzZLPRWpk3oTe0YHOkct43dGk2eIrcNR2uzgWFGRQwsp7Pz+zle8Aaep8HHWr
	kLIhjVtbdinNm/WK8vvuoCsCQ4gZ409ThVUrOvOtIEMvXB0+KFezyRhJP1ipGOH2
	SgkB/nTwWbLZgYoWFHtcCIdE1uwKrxb/BCCllo229w==
X-ME-Sender: <xms:eDQDYwDD4cn1D3Jzd59IeYNAk8bRqXghlTTRgA5KuO3hEiQibUelsg>
    <xme:eDQDYygjSNaxOHvkM_fRtKg4_RjubHT3ctKCY6YRTebkjDn8142MXZVnRa3ty6puT
    2IAeDaM8bTMSWAbeb4>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrvdeiiedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqe
    enucggtffrrghtthgvrhhnpeelhfduheeiudegjeejgfeuudegveffudeuhfdvgfethfeg
    vdegueejleegieekudenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
    vghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:eDQDYzlAjRyXmjNbj2LwNG4_EBEwgBHvJvuXhqV6JmBx1z9zeRaNRw>
    <xmx:eDQDY2z6RvfJcuS0vcGEzaNA6cy5LiIxi191HybYcKdDIwclfTZj-w>
    <xmx:eDQDY1RsCc4HuXzM_aV7lfhycDT2gm7L8urT9NrVJZ3QJck_x8VyiQ>
    <xmx:eTQDY27LokDG3SXDv50o920DpmzRZt2GOJce6fqotINKAIHINZHe4g>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BA7DC2340077; Mon, 22 Aug 2022 03:47:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-841-g7899e99a45-fm-20220811.002-g7899e99a
Mime-Version: 1.0
Message-Id: <e7fb7e92-9040-4137-9e02-d83d57b0d581@www.fastmail.com>
In-Reply-To: <YwMyZdfwL6KGQ3Bv@skidata.com>
References: <20220817114308.347965-1-andrei@gherzan.com>
 <YwMyZdfwL6KGQ3Bv@skidata.com>
Date: Mon, 22 Aug 2022 08:46:45 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Richard Leitner" <richard.leitner@skidata.com>
Cc: openembedded <openembedded-devel@lists.openembedded.org>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [oe] [meta-java][PATCH 1/3] classpath: Use an include file for
 x11 feature
 check
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 07:47:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98354

On Mon, 22 Aug 2022, at 08:38, Richard Leitner wrote:
> On Wed, Aug 17, 2022 at 01:43:06PM +0200, Andrei Gherzan via 
> lists.openembedded.org wrote:
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Hi Andrei,
>
> thanks for the series. I've just applied them to master-next. As soon as
> some testing happened I will merge them to master.
>
> If you have any question please just drop me a line.

Thanks, Richard. I've also sent the series against kirkstone. It'd be awesome if we could do the same there. Is the testing something automated that I can check out logs on?

Andrei

