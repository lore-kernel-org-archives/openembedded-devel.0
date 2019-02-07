Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id BB1817C3EA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 21:03:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z5so1352447wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 13:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=4qhiRMhPGUTylcZuNVUl/YMUpH5RkhfQxCPDr0Np74w=;
	b=SwLGK+E00Yf2ua6+FTostLdCneOnXaQZn+olH8BcHda+bC0nnDkXr29UnjzDGpGetO
	SLanNb5NIg1l0/qQ+PiLPy1sMUQA4ZDQH08apdAQGXLp9qQcTL+DD03GmNbSSY+TJ1nV
	8CrkyjOQ+/76zOuZhkWkB5dOis15EFp8+BNXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=4qhiRMhPGUTylcZuNVUl/YMUpH5RkhfQxCPDr0Np74w=;
	b=bv+R3lV6HLT+MgyHBcYW/QTvU2XAhXdZk6tOcVALF6ihj6A3DgR5A6QijAShlHJEzR
	A7yfIIS1Yr9ljNcZ29Gy+VAlEzcMGDb+R72smBTW210+A8aFMDFrv7dYVd0twZCW7qXM
	LvyG9xpPUi8u8kmAI8uOeqM5GiV+21iwTDALzg8Pilm/8PwrDGelCdlYrUtVQYD9SuHB
	/QH1M6nf9WMbajIkVYz+YeRIp7uYPkezUD1KB4oZt6Qyj7qo30aKNQGIj+PrLx4SmhYN
	e51HZXBXsWa+w66UpHft1mXTMCIeC6qjkQ6efZ1ECZWu46oVd26XnM/Yw1vprtKxvz7Y
	hCuQ==
X-Gm-Message-State: AHQUAuYig9mURprQVEckePstbF2jw8ZEOeXmYKYizu3wfR6BJaPpQEYk
	XR6IxMecCI8D3v4SjAF7z7OnVA==
X-Google-Smtp-Source: AHgI3IYNtr7iw3MQ7QNowrxmf9dxaSPOT1I+3qsoCNpSxS1FTxui6Sv7RIIzIitIFk19+E/wwMrKYA==
X-Received: by 2002:a1c:2856:: with SMTP id o83mr9540443wmo.45.1549573387222; 
	Thu, 07 Feb 2019 13:03:07 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id x3sm74704wrd.19.2019.02.07.13.03.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 07 Feb 2019 13:03:06 -0800 (PST)
Message-ID: <5c5103b3390bbebc7f352ae6c82d33adea812847.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ruslan Bilovol <rbilovol@cisco.com>, 
	Michael Halstead <mhalstead@linuxfoundation.org>
Date: Thu, 07 Feb 2019 21:03:05 +0000
In-Reply-To: <CAMKF1soVDFdftCQCJmU6TvwUJibQmSCLC1kTwCNBs5QLD=qtYA@mail.gmail.com>
References: <1549537201-4781-1-git-send-email-rbilovol@cisco.com>
	<9c35bb5b-c262-c482-8cb8-08bd76df1c43@cisco.com>
	<CAMKF1soVDFdftCQCJmU6TvwUJibQmSCLC1kTwCNBs5QLD=qtYA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [meta-oe] [PATCH] rapidjson: fix cmake artifacts installation for non-default BASELIB case
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 21:03:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-07 at 09:59 -0800, Khem Raj wrote:
> On Thu, Feb 7, 2019 at 9:31 AM Ruslan Bilovol <rbilovol@cisco.com>
> wrote:
> > I see you picked up this patch to master-next, but the patch's
> > author
> > is incorrect:
> > https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=cf54629463841242ce1faa90f6ad4a2383df3b2c
> > 
> > Could you please fix it?
> > 
> 
> sure
> 
> 
> > This is the same issue we faced with oe-core mailing list, I
> > remember
> > Richard Purdie had some scripts to fix it automatically
> > 
> 
> I wonder why is this happening? May be Michael can help us
> understand,
> why patchwork would feed a worng author or is it
> some email client error somewhere?

Its an email client problem. Roughly speaking the email was sent from
an IP address which according to DMARC shouldn't be sending email. The
list servers therefore rewrite it to a valid address to stop it being
stopped as spam.

Cheers,

Richard




