Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 106067F3D8
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Aug 2019 15:27:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4617FV59DXz2Y;
	Sat,  3 Aug 2019 17:27:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564846063;
	bh=wySM0G/T539TVRAFZHb/uCB6AhawB/GdIj8nQ2BIofc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmnpkvAJd4B3X2iUj+zndx9Nz6c5FJTHVoyTYLPqZgcT9lPFGGgkTDizz6qDuDXGK
	owNrqUj7gPPe1vqDsWfqXHpaYNs56kH2eX0Vdj6G6xpfYkM2wAeFBZGfW5xfk5i0mm
	XmYZVp0Lh52c/7VAYqP1FdbMqDZsHuJHvXgSwnzPkADe1vsDTxbpLc+y33gxz012pA
	/g1HBAnMXZgZkJk60zlEcvfl4eMiREi5eYIO5hlFxl90A5clp3Ik9/o0xZVhurVMb0
	EjeINnok2UP6jtFcvTDQXBQWrdkoIpJcHcM2hVudavtQAFV8nsZXu4etZsp1SJbcPZ
	3T/8kiB3m5T4l2pwzlbaRwARlhWxJTTDCu51Q4mjv33fsNgca3yeHQ/1t4PDr6m5C2
	g3Lw75+aX4NQclzV8W0uEfFrLGYC6OfXipfta4rP+IvJOeH4vbHwpChmreUWyAFHb7
	YfW993fz/QVVY4vYmClSJxvyz3A2fNQULomvL+Tw+PV5do+0ayCco7TA5IsaAS345c
	2NraexKeKoT5eiglRZp17AB+odYc4Jmcm/gLND80DJXSW1p6sfer8xQ0TytbozzKlo
	wwOfEY8kG5no5gRWLjKtTeLI0iwHJk9/IL6Oo02S47PdjvlqXJerdSuk0+RaFRQJm2
	+wy7NQdZ5k8BQnPpYZSKUHkE=
Date: Sat, 3 Aug 2019 18:27:38 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190803152738.GA10277@localhost>
References: <20190803011037.41864-1-raj.khem@gmail.com>
	<CA+chaQfYoTzL3EBN9HP4=8ZY7ooR2jZDWzquS7uQond4Tg6dTw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfYoTzL3EBN9HP4=8ZY7ooR2jZDWzquS7uQond4Tg6dTw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH 1/2] libsub-exporter-progressive-perl: Replace DEPENDS_PN with DEPENDS
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
X-List-Received-Date: Sat, 03 Aug 2019 15:27:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Aug 03, 2019 at 12:11:32PM +0200, Martin Jansa wrote:
> Shouldn't this one be rather RDEPENDS_${PN}?
> 
> It was building without this build time dependency before and it's not
> -native, so I guess it was rather typo in runtime dependency?

This also sounds wrong to me.

As expected it uses Test::More only when running tests,
so forcing a runtime dependency is unnecessary.

RDEPENDS_${PN}-ptest would be correct if there was a ptest package.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


