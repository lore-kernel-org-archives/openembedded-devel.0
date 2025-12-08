Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E5FD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 11:44:51 +0000 (UTC)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6149.1765192808240976403
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 03:20:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@schnwalter.eu header.s=fm2 header.b=QxUKwOKU;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=A6HCK2rl;
 spf=pass (domain: schnwalter.eu, ip: 103.168.172.159, mailfrom: contact@schnwalter.eu)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 70DDC1400200;
	Mon,  8 Dec 2025 06:20:07 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-05.internal (MEProxy); Mon, 08 Dec 2025 06:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=schnwalter.eu;
	 h=cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1765192807;
	 x=1765279207; bh=T5omKkioQhDurxeXll7wIBOOc5oMiziXTcWIGeu3Z34=; b=
	QxUKwOKUT1lkKEBD8YrMbPbm8/4Qkn097+K6YY6ux+1ZZ7lPwEELj7JJILfo7oRU
	S4OWUbsio/TYBgN0VWdoTYRLcp0LrLrYYZpbJa+ZezsSXr1PcNrqnRNmWlVz0R50
	V19aH5tizhKA20wJjlbsqOSxiG9zu/yEYP42RE5QKErJjQeMS8SVyJBSuf8gY3Ob
	7YPAa2ka0igCTZt0MvPvRxRTC4icu5En9REfN6mWd/1PyQOEwNnYX3jk0kL3Gug3
	umlUqz1Py46Oo7gdY2x0tSCMyHJZW5fLS3v4aPBzvW8nKQTyM5QmUflxbokqItLv
	pg6O+evNsf6DOcLEAEmAwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1765192807; x=1765279207; bh=T
	5omKkioQhDurxeXll7wIBOOc5oMiziXTcWIGeu3Z34=; b=A6HCK2rlsl57zWDAc
	6CMpJdNxsaGbfat1c6rwL5KL1qkHoJnq38vCFPMlVf/ZGXNQ8kFQLFoQsXVfKwHv
	JizFVOWiMIcJhP7JwLwr3RBnEG8hbDL3dPJiNiAYSHZy9wo+Uk+l2h1QF8rNARBi
	yNEt8tFDZr+TVWZyVS3B97/Wwu8wONNsWo/m4EgYibWdrHgpMNURHGQHvXTse7jG
	eerfpweLhsLKA7oereqe/RrgXj5t19v1JuDt59Y9J6wGGsgT4QMIXF3/K89d5kOo
	OHNPM9rhNLTHdQYbbTjLVGjhJzZOAiXGK71tVIsRhRx8xFzE2jILPgzHnoGxXNPl
	OIOng==
X-ME-Sender: <xms:Z7Q2aVgPuQOZcunfx4XTkRE2X1kkmU9zQqfyAc0rxNNVw27xYVQwAA>
    <xme:Z7Q2aU1sQyryzcbB1u_OxYlUMtYTHXASFdoMatF-bWYEG9sLqeshGse8TZV6PG8Qj
    fS5o22DnADs1CWNPYk3vP57CzBg-WTehkkR_ft_I_qtsX8F65T4xQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfhggrlhhtvghr
    ucghvghrnhgvrhcuufevjffpgffkfffgtfdfuceotghonhhtrggtthesshgthhhnfigrlh
    htvghrrdgvuheqnecuggftrfgrthhtvghrnhepjefhvedtteeffffgteejuddtheehtedu
    hfevkefhgfduudduheeifffhtdekhfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheptghonhhtrggtthesshgthhhnfigrlhhtvghrrdgvuhdp
    nhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhivg
    hrrghnrdgsihhnghhhrghmsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthho
    pehophgvnhgvmhgsvgguuggvugdquggvvhgvlheslhhishhtshdrohhpvghnvghmsggvug
    guvggurdhorhhg
X-ME-Proxy: <xmx:Z7Q2aYP8RVO_ea0tiFGPF6RpOQWqov6f3CFWsd0uHTpav-c0SZYpaA>
    <xmx:Z7Q2ac5-SODpJ9eUxQVKCsTe-ZWhMn8F_BN_qMp4DZl_c8tqiytuzw>
    <xmx:Z7Q2aW2PeRS1eaoS49aXL1hQbczzP3yTG9VLGXV04Bm6cjgQSmJC9A>
    <xmx:Z7Q2adbqsUoOELq9A6sd8Ri1LSmcjhIhzBzt9AGsFDQHpTbcTWyWdw>
    <xmx:Z7Q2ae-Oq6EOfVBWnG00VJWc4H1FKP7AYcVh_jd_x2DUO0i1OpXHA-mQ>
Feedback-ID: i455149b6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1A56B1EA0066; Mon,  8 Dec 2025 06:20:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AsMMw28cgNEk
Date: Mon, 08 Dec 2025 13:19:40 +0200
From: "Walter Werner SCHNEIDER" <contact@schnwalter.eu>
To: "Kieran Bingham" <kieran.bingham@ideasonboard.com>,
 openembedded-devel@lists.openembedded.org
Message-Id: <8cec144c-ae01-4f7e-be63-8528cd72fe1b@app.fastmail.com>
In-Reply-To: 
 <176518539944.890597.16128317924143285350@ping.linuxembedded.co.uk>
References: <20251208-upgrade-libcamera-v1-1-2dca4e4c9e5c@schnwalter.eu>
 <176518539944.890597.16128317924143285350@ping.linuxembedded.co.uk>
Subject: Re: [PATCH] libcamera: upgrade 0.5.2 -> 0.6.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 11:44:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122376

> Is there a need to change this patch?
> (0001-libcamera-Do-not-assume-libc-with-clang.patch)

I didn't change the patch, it's "devtool upgrade" that made the changes, I can drop them if you want, but I'm thinking that on the next "devtool upgrade" we will see the same change done by devtool and it's better to just get it in. I've reverted the patch change and ran devtool multiple time, just to make sure that the change is consistent. As for the white-spaces, I believe the original patch had the white-space removed by an editor/IDE after it was generated by git.

