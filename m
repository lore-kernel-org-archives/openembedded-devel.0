Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4A2817FBC1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2019 10:02:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4733s43K66z8V;
	Wed, 30 Oct 2019 11:02:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572429721;
	bh=QPgs1dUpf5cqOtH2YwhIYDxHfxChq+YjgKbtCW8YksY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VWT8S40wOWJqhmCsU+UNyNP+op/Sdd48rhw4iQHnB9i8M3nBkG9GPMZEPh3yM8Ngn
	Py1skZnlkTMJrfw0D39QNBPYb71mM9jwuTAiTVrZQ7y37FtCv+sR/L/SlWEQmpbbgV
	9Jq9za6mgeLPkIQ8SRJwgrHOxqTv4ewWb0UApJMfT6n9+1otMYVCs+kx1SzqQytkc/
	lFFcl58rerLEm5FbpPdmDzsQXht0QXmhZg6ZHKy2kYF7meMAkEf6yTUbJL6Jk7a6C5
	DOcfvDWuGYZEOzaaHA3+/NcxbaV/w3dIcvu/lfJjL3I7PyLff8FDLQfY9j432U5Hqo
	wuxqBhfhCj4v9JBnA/4bG2bD+u88P3JNvU0+UFIECJHwqrDchpzdXzBxd+ETb+9H2A
	4/2HZN7LekOr28Ws7nBvKanJP+TWs1PYs5xKnG2ZXXJF7em0Vk4WcVlj+L5xI8Yh6P
	KdXR96Z0rIpHukP4i4MsBe2svm4TRNDzKQ1gjhW5QltrzFXUqpef0Q6R2SQKjFE0Lu
	nomKnTE10cLd5cvmtaxQMkfTDNaEj3qRW3LtxZhfdHe3fEnzQ+BKrEP6iMynaYkcVJ
	WFbPft/+/Osf7K6JF2c8YZ/yl736A+GvhGKK/NzxWRX2U0lzm5bZf47Ys1MVHTN8U3
	MovMzkU4RTQl8X/ec+/Uh3ws=
Date: Wed, 30 Oct 2019 12:01:58 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191030100158.GC27883@localhost>
References: <20191029090657.30771-3-bunk@stusta.de>
	<CAMKF1sqRRmqEaLMcYDrO-Ae8XcuDNqVJKVnutG4K4rfUp57GuA@mail.gmail.com>
	<20191029214201.GA5048@localhost>
	<CAMKF1spEtDo_P+KdBfJJs11qi5Sj9-q2Dt4z0rwO566P2mj6xg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spEtDo_P+KdBfJJs11qi5Sj9-q2Dt4z0rwO566P2mj6xg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] mdns: Mark as incompatible with musl
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
X-List-Received-Date: Wed, 30 Oct 2019 10:02:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 29, 2019 at 10:47:21PM +0100, Khem Raj wrote:
> On Tue, Oct 29, 2019 at 10:42 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, Oct 29, 2019 at 10:23:46PM +0100, Khem Raj wrote:
> > >
> > > this is fine but please adjust
> > > meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
> > > accordingly as well.
> >
> > I already considered this, but when I tried building this packagegroup
> > for musl it failed on some netkit recipes even without my change.
> >
> 
> thats fine but please do remove these recipes via _remove-libc-musl regardless
>...

Patch sent for both mdns and all the existing cases.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


