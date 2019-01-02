Return-Path: <andre.draszik@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 63D416B513
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jan 2019 20:25:29 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id x30so27272817edx.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2019 12:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=3LxpMFc5Y7ZgKedqOqqVfTAbSTUw1QZqVPI9cTIOzFc=;
	b=QOcDBfEoOa/a7UwyvnbGY/w4gUkEZtVM5RMj1Q+X/gGq0wwYXT9hdOZjTuXEV80MPe
	ATqu5R/YW20H7O3M7U51nvdPl5B4qCOqCTsJUZVC6QRtkdXLlrWi3opYewTdB4SkcZpe
	Ko3AR7BJia+Er3W6ZRjQxbhQNfrhzaqgl9mLPEnrelGCcAmNNWZWdnd0cjKnp85ey3La
	jyQPncfCx/P7lVCvwWMM48mr6cbUM6rn02x+WHcirsJnD7HHXm/EdB3a/DgwmS0ZfQrv
	2gEJ8SyR1qite/mna7+o2CANso1pnrEblNLB7JAP2UBeJEdVRWFwCKwrgU13lczKdt1h
	sH/Q==
X-Gm-Message-State: AA+aEWYUzbULfSxCVLprvaTr+DRU8bd42arR/Of2OLokvzS1RDS7uF+E
	IoJLfFSH6rFp1dAQevi3SRqiE9eK
X-Google-Smtp-Source: AFSGD/UdkqJmxEV6g36X8aFQzPbH66jLATZwNJuqQiO6P29OG+2ZNNayT2GEFXy700qsd7yodUamNg==
X-Received: by 2002:a50:9106:: with SMTP id e6mr38603123eda.148.1546460729764; 
	Wed, 02 Jan 2019 12:25:29 -0800 (PST)
Received: from tfsielt31850.fritz.box (188-141-55-36.dynamic.upc.ie.
	[188.141.55.36]) by smtp.gmail.com with ESMTPSA id
	n11sm22974643edn.14.2019.01.02.12.25.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 Jan 2019 12:25:29 -0800 (PST)
Message-ID: <dbc36d56ff873c948e2d676adb945d98fe67b2b9.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 02 Jan 2019 20:25:27 +0000
In-Reply-To: <ae008457-e85f-59b8-07cd-fbe13eb55cdf@skidata.com>
References: <CAAsqSTcN2Bkk_k_MLEWSTesEFEJURrXvHdyY2TzuA_fEh4iJUw@mail.gmail.com>
	<6c8e0af4-bb46-ba48-eafb-a91a60bc837d@skidata.com>
	<CAAsqSTdT-+0y=m_Oo2+8JEAmcGfVWLktUgXLG5LZ5qSmkHfVSw@mail.gmail.com>
	<ae008457-e85f-59b8-07cd-fbe13eb55cdf@skidata.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: [meta-java] OpenJDK 181b13 update in patchwork (was: Re: [meta-java][PATCH 2/2] openjdk-8: better interface invocations)
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
X-List-Received-Date: Wed, 02 Jan 2019 20:25:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

I don't seem to have this patch in my mailbox for whatever reason...

but from a quick glance https://patchwork.openembedded.org/patch/156314/

just bumps the version of the the aarch32 and aarch64 ports to 181b13
without actually updating them - if I'm not mistaken.

It should be updated to not do that before merging, or ideally even update
the two aarch ports as well. 

Not sure if there are other issues...

Cheers,
Andre'


On Mon, 2018-12-17 at 15:47 +0100, Richard Leitner wrote:
> Hi,
> 
> On 17.12.18 15:07, Attie Grande wrote:
> > Hi Richard,
> > 
> > It looks like gmail has helpfully wrapped some of the lines...
> > Also, my patch was intended to go on top of the sumo branch - apologies.
> 
> No problem, please just put [sumo] in the subject then.
> 
> > It looks like you've bumped to 172b11 on master-next already.
> > I'll try this and report back - possibly in the new year...
> 
> Ok. Just fyi: We will likely update to 8u181b13 soon
> (see https://patchwork.openembedded.org/patch/156314/)
> 
> > Some crashes are available here:
> >   - https://pastebin.com/raw/f1PB4uJm
> >   - https://pastebin.com/raw/iXTz8v9z
> 
> Thanks, i will take a look at them.
> 
> > Attie
> 
> regards;Richard.L


