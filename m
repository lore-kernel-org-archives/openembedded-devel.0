Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 364B97FB1F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Oct 2019 05:56:31 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l3so2478065qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 22:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hfFn6brNK076De0W2D9UsNaesM5UcB9s6OqakrJz60g=;
	b=mTcgpnKRSTguiXX4lsK8DlV7oVH31g9uic6s47a+PxxMeGUNWMsH7W3ADasWmMGXIq
	BtDGStVaJVomFO8wttyXv9pi7lzB0ZsdkEVPVUL3LId/bUwL19A3P99DSWsnZ/7SqPC6
	nY4L6oqMjYZ3Z6+MoXH2YNGWRvZVtv3hQFMp1w+qUulMd3yEXArc4o08v3rh/93WfoGc
	JieLiMRxg6JgBxZNrtnMdbsZNPeclrbNEFgyDSoMXLzuW/LtaJ/VgUjIBMKNniXKW1XR
	aQnsrAhWhPVmund7mW0Nc5TAg/5yFGxEG2wX4zQMmoHG5ZwffalfKWtenyZG32ZMKeQv
	qwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hfFn6brNK076De0W2D9UsNaesM5UcB9s6OqakrJz60g=;
	b=ZyiPgHnnd3jYLQlFMXfN2itBJdc0pqqeLSSdcDf0JeXlQruilobYgnsGcn7xV3V7Ub
	FCa0DqQamBbFdM8IKQfSyb+clRUoXzpb67C0k5OxX1jnLDGnE6fYLaVHrOfIcqEUqy2N
	rXJ5JAVLysHO42o5/qnJlZDWe+XGSOfY3xMc81/bynmBstt6Y5LX1+fUNp1unKh8Ey2i
	Cm06VjHMSLW8rqnMjSgxlOYDan8Q9cLiJ/LMZBQiBlKLvnfvi8AXOs36d5YH5mkACAsU
	rTV5DUMIRgyL6JpaZzjTGwhg/uqWebsFe5rbXB0sJuFdz+/8erW+ZG4BQ6EKsdQnzfK4
	Cv3A==
X-Gm-Message-State: APjAAAUKM2NPdc8coNVfIk0QSwvpwUdyom2bY4bkwqTtL31ae9a5F3Ml
	mIFrKkb7Nn+mavBLx3U8kQOXhpYl6CEF/3v4ZW/nw4wltaQ=
X-Google-Smtp-Source: APXvYqwAv+yqs0KL6Wn+x71l+g8w8lYbJjwNfXOcsmSDnZYGATzm0+E4DgNZQMSB25UniMbUv5O5n3wFNtr9Jl7hl+4=
X-Received: by 2002:a0c:e5c1:: with SMTP id u1mr15542478qvm.206.1572242191747; 
	Sun, 27 Oct 2019 22:56:31 -0700 (PDT)
MIME-Version: 1.0
References: <1572261789-121779-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<9eeabeb7-0884-eab9-55a4-18a219615bd7@windriver.com>
In-Reply-To: <9eeabeb7-0884-eab9-55a4-18a219615bd7@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Oct 2019 06:56:05 +0100
Message-ID: <CAMKF1sp5SCXPWHSd4PsGBwOZsxnteyhQNpLuSY65NgOGOWettQ@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] daq: upgrade 2.0.6 -> 2.2.2
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
X-List-Received-Date: Mon, 28 Oct 2019 05:56:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 28, 2019 at 6:15 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> Hi Ruoqin,
>
>
> Please don't update this recipe because the day 2.0.x is needed by snort
> 2.x.
>
>

is there any way forward for snort.

> //Yi
>
>
> On 10/28/19 7:23 PM, Zheng Ruoqin wrote:
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >   .../recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb}           | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >   rename meta-networking/recipes-connectivity/daq/{daq_2.0.6.bb => daq_2.2.2.bb} (88%)
> >
> > diff --git a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> > similarity index 88%
> > rename from meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> > rename to meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> > index 42ffb17..29ac5c7 100644
> > --- a/meta-networking/recipes-connectivity/daq/daq_2.0.6.bb
> > +++ b/meta-networking/recipes-connectivity/daq/daq_2.2.2.bb
> > @@ -25,8 +25,8 @@ EXTRA_OECONF = "--disable-nfq-module --disable-ipq-module --includedir=${include
> >   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> >   PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> >
> > -SRC_URI[md5sum] = "2cd6da422a72c129c685fc4bb848c24c"
> > -SRC_URI[sha256sum] = "b40e1d1273e08aaeaa86e69d4f28d535b7e53bdb3898adf539266b63137be7cb"
> > +SRC_URI[md5sum] = "c61f60674a5f951f0c50faf33a611fee"
> > +SRC_URI[sha256sum] = "7cd818cabb1ad35360e83076e54775f07165ee71407dc672d147e27d3cd37f7b"
> >
> >   inherit autotools
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

