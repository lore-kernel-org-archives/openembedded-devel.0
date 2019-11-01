Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 488A17C4DB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2019 16:53:16 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w12so11559774iol.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Nov 2019 09:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HY4NtagZfa3YCXaAzVVThdSX3sQ2+vU5bOyj62c8uE0=;
	b=Hbdy/dudibonTbFxN0hkv9VdwbDsmDDVYsE65mLqbfGAGLQcs7grgTyMnWmNx5e6pn
	zTEg6ahgNZm2K3PbP5q5Wuzr2xVCgHTorpCMNrzjXjCAEyoDihYMbHJrQsFFwm8Aj+DS
	px/YxlepBKjSkvZJMuRSPILHRDDQT6E7WBPvrPmq9xDYnnswogZyHTnMA+Lwz4/b5lMT
	BGinJd0BBghZYQle8mVrQlEtkANpTam3PdK0eTC2LfTW+3RmU3XbvwlS8vC//F/ybtO1
	zogf5BoGTgvm3tlm3QKj27OHIVyrIvybacD7Um8kGFdmGXUHS4x5MbYRJ4VvvkXFMcKT
	KHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HY4NtagZfa3YCXaAzVVThdSX3sQ2+vU5bOyj62c8uE0=;
	b=QJlzU0MB/d2opaDXW5V9yJ1m9W5rXKLPSEOsfwtLpjt/QFnhZWMJBQ72UfV5G+jYfi
	qTvjpNGJmiqhZ2VMkrtm5cicoxWBlLMalkKwiWKyc0lftD3aS6FYOPG259XwNmegAeny
	H2HtoBDcMoIzjJeZUTo1ahd/uYjlQ4LpjiV8XWrcfYl6qpOcTQ88au+BxbBiGVA6qFqK
	qjwSedkdOV0Q44DPIInrvNrsl+08ISm5VBs1AZZv/ktXDL6JmJlp+ds5U2IuEjkGhCCz
	Go2yqD1kQz0jn463U6yF9x+Z1JVjguP7hD2ssjBe13IlG/HlvWxx1FtexXd19AAFzgqL
	o/PQ==
X-Gm-Message-State: APjAAAW+f9rwyhPT1vHDGuLnulu11Z7vkgZttw16DE3foOd2d/pl8cU9
	A/vNAc6WwWDes2bFsCAhZozbm2eqtNYSHw/h7/8=
X-Google-Smtp-Source: APXvYqzbRzQK6a5LXzVxHfjfWRnpkpRvRpbQrEJKk5Rp8ILDLV23CpcD3r+XBG8CA4Y0ViQ/iGDRpK9GeT/XGCTRXxo=
X-Received: by 2002:a5e:d502:: with SMTP id e2mr11895190iom.224.1572627197213; 
	Fri, 01 Nov 2019 09:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191029010253.5784-1-schnitzeltony@gmail.com>
	<20191029010253.5784-4-schnitzeltony@gmail.com>
	<CAMKF1srqmOG5k8mfAZ04YH0DUUROSLUCVLwMGUrRQ-=Y2yeFsg@mail.gmail.com>
In-Reply-To: <CAMKF1srqmOG5k8mfAZ04YH0DUUROSLUCVLwMGUrRQ-=Y2yeFsg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 1 Nov 2019 17:53:05 +0100
Message-ID: <CALbNGRQn151mjXniXnS+Edi79VMomdaUiP9-hbzzMo30dAwCog@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2 4/4] ibus: initial add 1.5.21
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
X-List-Received-Date: Fri, 01 Nov 2019 16:53:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 1, 2019 at 5:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Andreas
>
> I see this fail on ubuntu 18.04 host
> https://errors.yoctoproject.org/Errors/Details/275175/
See what I can do - is it a server 'only' installation?

Andreas

