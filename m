Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3657E08B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 14:15:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46zTmC2RRZz3P;
	Thu, 24 Oct 2019 16:15:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1571926523;
	bh=PQ/Cn20DuL9vPHscZ4txO2B2G0bWmBhvWxym2iXtlRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hv6Gs8ve4oka8Z9tTYZDSgJu779Tfe3lGZxCDZJ4j78Ih43rvPzE0ghhLcIlZPLpn
	5HBogMM9zGgkNfyRv9wAWQTlSx1n3cUAgOlL4KC4ClYXWit+ZerJRnghqypKNN8xh/
	0ojefZXXwZm0hb3uqiKhQeB0m0PsfEarp9p4Ln/WkSHZDrVpqY1ic3Fyd5mM7IInTc
	BDghjXuWgGM/n+EmN+X00kJBV/wl6rBdHzE0lOKbkqdzpymYM318iQ5FDyXZxKFmFk
	SDSkv7rNeSKUzxfpqujZ729b+zKOwXpb7W7+Tx24v2AqJgxS5JHZ210RQcg+Ct+fnu
	C6WeRo6eIFOKsNhI4NPSNz1HaYSZy/QoM8azkoUoWjW7vOKvhsYdWsnYnIHLNBJoXY
	In7ospQfRZQQ4pJUypMLuU7PP2d2N4FIWxwcYgwnn14RJ2kWgMGKjXKDUejBFXC3P1
	dBjLYVkjy+iX9jGK3lLc/TRseWjMEjy7SFQP9GAudbUPDf1pkYatMW/tL5+X08EjIk
	sOQg4VCkmk9r/iQJ75/6uYkA9iQOwZVhtzQ5VNy7S2Sp1PbcSVH36wwLP7t47Masnq
	EjwaAQBsU9pB2moZHekFQor0inD2ZOBMfsGaBlXf5mnVtxzvjxgkI6T8pyY2mgcPZD
	GEHq6pQjcx3M1/OkAXOBAkJk=
Date: Thu, 24 Oct 2019 17:15:16 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191024141516.GA8247@localhost>
References: <20191024075355.2136934-1-raj.khem@gmail.com>
	<20191024075355.2136934-4-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191024075355.2136934-4-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/6] libiio: Inherit distutils-base for packaging python files
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
X-List-Received-Date: Thu, 24 Oct 2019 14:15:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 24, 2019 at 12:53:53AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-support/libiio/libiio_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
> index 4e57d5b77b..489cb1a9e0 100644
> --- a/meta-oe/recipes-support/libiio/libiio_git.bb
> +++ b/meta-oe/recipes-support/libiio/libiio_git.bb
> @@ -12,7 +12,7 @@ SRC_URI = "git://github.com/analogdevicesinc/libiio.git;protocol=https"
>  
>  S = "${WORKDIR}/git"
>  
> -inherit cmake python3native systemd
> +inherit cmake python3native systemd distutils-base
>...

This pulls in pythonnative, which ends up "fixing" the issue
by installing the python-native Python2 binary that gets used
instead of the Python3 binary from python3-native.

Installing the python module fails silently during install,
with libiio-python ending up empty.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


