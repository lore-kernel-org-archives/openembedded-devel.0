Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 732BC613DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 17:17:07 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b7so814908qkl.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 09:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N15sPOK2vK1FHyxZdojTqfZ1Y0A8rWU59Y4g31CEJLQ=;
	b=peIlI9fPwZFM8u33EA2UBMbSwpapTaq9ybcLlIszdI0Igf/1yg+5jC7J0d3l3YVzok
	Uit/oJ3OtbIByFzRWPZS8PQ8mtHjC4344fZIrBdOzhlPtLxaPawSvl93Hq0VWFIpZTHe
	T2lNwdgynUtmn1kk+lwxmz7k4qSuNZ2iYwi1l10qeO9IYoTiMQNzYg7/u5XO3ADp0BKw
	NeTW/9w4usS3jmIX0wvY3wSnt1rQ59pvY05NEClZT4By9hMnh5249rbI5mYrlH3QAbYE
	wZUAVLxncFgXpCAORPR8ZzVPfrT6G1v7z/PaWGXOJPvMOA324ZbDzgUQa/Ukr2VO9wAw
	kZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N15sPOK2vK1FHyxZdojTqfZ1Y0A8rWU59Y4g31CEJLQ=;
	b=TDuQNK5AEBVGcFsW2rdO2mlxdRsasvxiEnfoj/rOUJ1E0UWUNMTAe5ZftkbVudSs47
	QyGTm77oFZNcIt8o+gr5trdmYVMRnpjzgKdSHYiWxwEMfONohUt2pooaP34fhlUsJoRE
	VfaipSMS8TB9PlK8IymIR6RUE6FqXPEuw0hj0HVZIy4cmGa9/wzbWZJxrJfIe4ov8AXw
	Hls9WYDCUG0NZOYwpJGA0IjN6zc4tcQG/BBqA0lxUonUQpbwiSdzyM247CQbmO8piyVi
	sV/K+9Mk+gJL3SJOLS23n0Fdi2w1Q0bScs1P4UDC/UxotEXmoK4dkJLYXMNS6COPyYWZ
	tmRQ==
X-Gm-Message-State: APjAAAXOpbq7HkRkyQekUkwCa4lM91hZ+ZwnMoiI+X6jmuDaCPfs6VcL
	vUDD5XKq6bqU17cljMHQ4ZwhrRTmUSm50hdObzs=
X-Google-Smtp-Source: APXvYqzjor5Sm8DsLr/hHKx2qRu3pZ8q+87m3HBbrlSYsYKdGCO69ro8vBSmYKXp60Jp1erln+iG3Szco2b1li0IXjE=
X-Received: by 2002:a37:9e41:: with SMTP id h62mr25192902qke.215.1582132627889;
	Wed, 19 Feb 2020 09:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20200218052544.9467-1-leo.yan@linaro.org>
	<20200218052544.9467-4-leo.yan@linaro.org>
	<CAMKF1spwQ+Y3D3MpdnV1OcNSVL=7=fENq8amqpBMq0d6WHuwiQ@mail.gmail.com>
	<20200218072726.GB9945@leoy-ThinkPad-X240s>
	<20200219094452.GA11073@leoy-ThinkPad-X240s>
In-Reply-To: <20200219094452.GA11073@leoy-ThinkPad-X240s>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Feb 2020 09:16:41 -0800
Message-ID: <CAMKF1spJMiAh73snmPG19c0DhqdfVS8cZ4=4cZWxSt1-yTH+Eg@mail.gmail.com>
To: Leo Yan <leo.yan@linaro.org>
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
X-List-Received-Date: Wed, 19 Feb 2020 17:17:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 19, 2020 at 1:45 AM Leo Yan <leo.yan@linaro.org> wrote:
>
> Hi Khem,
>
> On Tue, Feb 18, 2020 at 03:27:26PM +0800, Leo Yan wrote:
> > Hi Khem,
> >
> > On Mon, Feb 17, 2020 at 10:30:46PM -0800, Khem Raj wrote:
> >
> > [...]
> >
> > > > +DEPENDS += "bison-native \
> > > > +            ninja-native \
> > > > +            elfutils-native \
> > > > +            flex-native \
> > > > +            ${MLPREFIX}elfutils \
> > > > +            ${MLPREFIX}binutils \
> > > > +            ${MLPREFIX}flex \
> > > > +            luajit \
> > > > +            clang \
> > > > +            "
> > > > +
> > >
> > > this will add meta-clang dependency directly into meta-oe, which is not desired
> > > is it possible to make it optional or perhaps marked when meta-clang
> > > is not in BBLAYERS
> >
> > Thanks a lot for reviewing.  clang is mandotory for BCC to compile
> > eBPF programs, so I think we cannot build clang as optional for BCC.
> >
> > For marking the recipe when meta-clang is not in BBLAYERS, I searched
> > with google but seems 'LAYERDEPENDS' and 'BBMASK' both are not suitable
> > for this case.  Could you give more detailed info for how to do this?
>
> Just want to ask a following question.
>
> Since BCC and bpftrace both are heavily relying on LLVM/Clang for their
> tracing, do you think it's a good idea to merge BCC and bpftrace into
> meta-clang layer, e.g. place into /meta-clang/recipes-devtools/?
> If so, we can easily resolve the dependency issue and avoid to introduce
> mess between meta-oe and meta-clang.
>
> For the tool ply, it's simple and doesn't depend on Clang.  So should
> keep it into meta-oe/recipes-devtools/ folder?  Also welcome any
> suggestion for this.

Yeah I think thats a fine suggestion. meta-clang is good for it.

>
> Thanks,
> Leo Yan

