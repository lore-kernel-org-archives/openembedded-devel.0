Return-Path: <leo.yan@linaro.org>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 75E1061177
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 09:45:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id j9so12225036pfa.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 01:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=HYRhacsG8+TIKnw46yOEoOafW1OaaBiMUFFaXBYXrsw=;
	b=BaD7N3QBwYuuHyK/Qtjlo5Q3XI5sQHs/DwQqo83W5PeTxrWptkfNsXxOlRH3mlFBfb
	WZ3g5DxLnYfZ5Bts1tQ7KNeJkyo8Ba9CO4pFlI2RrRWts099PDSH2lbhvTLVzsWSv/2T
	pv/SCOCAORAkQmlWmX/gi8w2MxApt4bNR90lSMc7sgI2ob4UAFpKyCVxkbu5ZLGQIn6z
	K/HiJvmb4JAJCdSslTqLvMQugp6F8C5qZjp+8Xygesg+HiBofNtSl5lSMvtZQ1HqVdlw
	gplnCEafMKw8aOuQRlHk4AuxsaxxnBbaLWyO4mds330Q8fBWXa8JdVf3PUZ9/3HjH5Rs
	9pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HYRhacsG8+TIKnw46yOEoOafW1OaaBiMUFFaXBYXrsw=;
	b=qkElPk/I/B+rm5vN+oq6YBir4QcBYwsnDSC2k/3mfLnOGEUGIyo8eJvRv/9eMTVw+g
	VDZnl51iqKn7ZYceXo79xm9v5HkE/GVrZOH3l+jfF1niXC2KqgJQcjZ9ZKsPU4cpCSvw
	7zn27fw47kfcE5vXKgl0zMKEqasew02dDV12Ah8WSAuiHlaCqPTSVzdltLHenL0GTH81
	4uxHPrB6hPYIGkNXnlqvkax7Bk3DAQL4VB86fuWhEGjhiaBlJPx+4sJ5SzF6G9qpZpJL
	+veqt9v42tYIShUTQLKQsFW/A4HHXAjoJqgnFtORUqeujUmVvpYqH27IroKFaiFVZ41E
	fsyg==
X-Gm-Message-State: APjAAAWXfiHaEXxS3zsNcVJOfJv+6IEgdA2wmJdei2S0ceUFIuDsUU/J
	b6bLn23xRKLRQMiqdljLiJ5Fmw==
X-Google-Smtp-Source: APXvYqxIHLYaCQHJpubynGDp7yMzFLsj8clcO0M0O6y1hC0XHp9XNm2sk8K1OTYOVohBW39rm3iIJA==
X-Received: by 2002:a63:990a:: with SMTP id d10mr28010216pge.63.1582105503433; 
	Wed, 19 Feb 2020 01:45:03 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8904::f03c:91ff:fe8a:bbb8])
	by smtp.gmail.com with ESMTPSA id
	u126sm2061517pfu.182.2020.02.19.01.44.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 19 Feb 2020 01:45:02 -0800 (PST)
Date: Wed, 19 Feb 2020 17:44:52 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200219094452.GA11073@leoy-ThinkPad-X240s>
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-4-leo.yan@linaro.org>
	<CAMKF1spwQ+Y3D3MpdnV1OcNSVL=7=fENq8amqpBMq0d6WHuwiQ@mail.gmail.com>
	<20200218072726.GB9945@leoy-ThinkPad-X240s>
MIME-Version: 1.0
In-Reply-To: <20200218072726.GB9945@leoy-ThinkPad-X240s>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v1 3/4] BCC: Add build recipe
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
X-List-Received-Date: Wed, 19 Feb 2020 09:45:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Tue, Feb 18, 2020 at 03:27:26PM +0800, Leo Yan wrote:
> Hi Khem,
> 
> On Mon, Feb 17, 2020 at 10:30:46PM -0800, Khem Raj wrote:
> 
> [...]
> 
> > > +DEPENDS += "bison-native \
> > > +            ninja-native \
> > > +            elfutils-native \
> > > +            flex-native \
> > > +            ${MLPREFIX}elfutils \
> > > +            ${MLPREFIX}binutils \
> > > +            ${MLPREFIX}flex \
> > > +            luajit \
> > > +            clang \
> > > +            "
> > > +
> > 
> > this will add meta-clang dependency directly into meta-oe, which is not desired
> > is it possible to make it optional or perhaps marked when meta-clang
> > is not in BBLAYERS
> 
> Thanks a lot for reviewing.  clang is mandotory for BCC to compile
> eBPF programs, so I think we cannot build clang as optional for BCC.
> 
> For marking the recipe when meta-clang is not in BBLAYERS, I searched
> with google but seems 'LAYERDEPENDS' and 'BBMASK' both are not suitable
> for this case.  Could you give more detailed info for how to do this?

Just want to ask a following question.

Since BCC and bpftrace both are heavily relying on LLVM/Clang for their
tracing, do you think it's a good idea to merge BCC and bpftrace into
meta-clang layer, e.g. place into /meta-clang/recipes-devtools/?
If so, we can easily resolve the dependency issue and avoid to introduce
mess between meta-oe and meta-clang.

For the tool ply, it's simple and doesn't depend on Clang.  So should
keep it into meta-oe/recipes-devtools/ folder?  Also welcome any
suggestion for this.

Thanks,
Leo Yan

