Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web08.132.1614102470768946498
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 09:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm1 header.b=p5Jk++rw;
 spf=pass (domain: gherzan.com, ip: 66.111.4.25, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id CDEF85C00C9;
	Tue, 23 Feb 2021 12:47:49 -0500 (EST)
Received: from imap4 ([10.202.2.54])
  by compute3.internal (MEProxy); Tue, 23 Feb 2021 12:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm1; bh=UBa4+8EdqtdQwF9RmfhFVG+FWylrXhX
	DrgJWT169utA=; b=p5Jk++rw8Ph31+RKwVghdJHlg1RXlmWD1saYdGYJZ7EjWzs
	oy1RDnTu4VGSYC/YKjjflZ8Oawq2nq7WWaZ9TrFTjecrs69OOtZ7xxDmKhVkpbId
	5xwufWncziBUUb7hlUfvTjmNvTXiEn58fcCF7MdGT/z+2GZZ7KgE6qSDyqKZTMP6
	YvSZfekSo1Pjq9aCQNnCWa9NF6z0UoQPClj+T+2IQzlAQVDm60kTzJ0V9Yv1KhKV
	Nrc+N9ZoqD4ZEoY9u1q5JOQf3BeupY7kchE4/+lpL1n9U2oE1/r4vQIj8hmSbV9l
	2Xgv9jiR+PNWYwrB3puhCER83IQE2EYvAlnhfeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=UBa4+8
	EdqtdQwF9RmfhFVG+FWylrXhXDrgJWT169utA=; b=NmlJjvxEN50hOTSSm2/lfn
	lrEjd2DiarTok2xS2VCXrSNRnqhSAu0mWTB8o3JTo4q46EKL8PnLDG0hMWZYI8zP
	tN7DltVRLjR3KY9jvWssBBUFS/6Sk7zdV1oIs1RZHFaaQ+/i3ASPr8slyBprKEuL
	sjo7WOQo5Z6Ih216p3Xh+aUwtkbYiKeBoxbWh8AyWeyrmCu0Hx4+atHKFM7ywtje
	74vfa01IWOvtbL9m6Qkxac2755p2intvrjLqkiYEbsKmY1O7x3ECQVBOoTWzIjI5
	u1hFg/l1ZBcPaP2oV+7T8cnXs5TWP6mGm74f6UgkN5zIOavkN8mu3zE3sw54dZ8Q
	==
X-ME-Sender: <xms:xT81YIFKHx8y3JvY7UM9sF7idszlZn8ZDX_SEw5wNi34SUWC3hzXTQ>
    <xme:xT81YBW7JDIU9pmBE1gnAmg7wuUk_r0IJFmtJmBaSmNAxEfHDwBaHRXCi7dzIF4ta
    ij4iH9qHIU9VWVSRGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrkeehgddutdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeelgfffvddtjeeivdehleefleejfffgleeffeeguefhvdevkeef
    ueeuleefveeutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:xT81YCLedP4J-LrFcAuaPxdCv1YuUdVTm973EDPQ8y2qb2nkiuW9RQ>
    <xmx:xT81YKGMkN9kwoDr-yVshikqQdWy6B9w6u5WFcklIvwUUPD9R6lnTw>
    <xmx:xT81YOVKlI0qkXZVXlgx2nFih_SoJfABE1TL8k7nypXtaKB5FslRIA>
    <xmx:xT81YHfdPsQu40Hdjf4JR-vf_fMrO_QMtiAZq1wt42BjtxCRVFn56w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 88B2016051E; Tue, 23 Feb 2021 12:47:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <7a1bf385-91e5-4076-bbee-b5d14b7c1e54@www.fastmail.com>
In-Reply-To: <20210223173002.aydz4xm65ylvgy4k@jama>
References: <20210223162705.2595483-1-andrei@gherzan.com>
 <20210223171242.csn2hwn6imsn4ega@jama>
 <CAMKF1spNM_nxwEMFN3DXCG5O4rxK22VMMe6yZKm7zjmUWg4LSQ@mail.gmail.com>
 <7536ac24-0016-45e2-9cfe-209b50633c8a@www.fastmail.com>
 <20210223173002.aydz4xm65ylvgy4k@jama>
Date: Tue, 23 Feb 2021 17:47:30 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Martin Jansa" <martin.jansa@gmail.com>
Cc: "Khem Raj" <raj.khem@gmail.com>,
 openembedded <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] nss: Disable Werror across all recipe types
Content-Type: text/plain

On Tue, 23 Feb 2021, at 17:30, Martin Jansa wrote:
> On Tue, Feb 23, 2021 at 05:19:16PM +0000, Andrei Gherzan wrote:
> > On Tue, 23 Feb 2021, at 17:15, Khem Raj wrote:
> > > On Tue, Feb 23, 2021 at 9:12 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> > > >
> > > > On Tue, Feb 23, 2021 at 04:27:05PM +0000, Andrei Gherzan wrote:
> > > > > From: Khem Raj <raj.khem@gmail.com>
> > > > >
> > > > > We are seeing warnigs with gcc-10 even on target builds e.g.
> > > >
> > > > Do you use gcc-10 in dunfell builds?
> > > >
> > > > dunfell has 9.3.0 gcc, so either you're using gcc-10 through some
> > > > backports or the warning is reproducible also with gcc-9, but I'm not
> > > > seeing nss failures in my dunfell builds.
> > > 
> > > I think its the native one he is running into issues. Perhaps he has
> > > newer build host OS which has gcc 10
> > 
> > That is indeed the case. I'm running 10.2.0 on my host as of now.
> 
> _on your host_, but why is it needed for target builds which should use
> gcc-cross-* 9.3.0?

Good point. Let me take a deeper look into it and come back to you.

Andrei
