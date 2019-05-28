Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D62BB7C5FC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 18:09:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45D21R2XRqz3l;
	Tue, 28 May 2019 20:09:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559066987;
	bh=BuzhmSXvfW1Wik6mjur5wj9S6IknNXSNLreJ3+bOiNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3qdN1QeVpDD0aAx4MUMCG4bqOruwM3JLNji/WfaLgLxMdg64hHm/ReL9O5OGbWbC
	kJgFt9GEP3C4iPsOc7eF6jR6TOFb4DjG2J/r8qjmCPTcd9OEARg/BPBaeId0fHT7Sb
	76e5qEqrrVQBoG13vPkbvRA4ZEGpZVG2EoH/VD4UI2ZmaxMV6CcPSZ6Jcqq7F4lC60
	8JyK5X7PrZXphB3pDUNYTou2HGTo7jkqJgHvNWkqydlVa7O0eW8Lln9jRqYYFA0udn
	1bCwW3lazM8rxO2EMWnPVdCF4BNeHMmBBG3fpu1YgqToYqxHKtUhNGikQkDeUgn+nq
	9ynS4b5LmO/7PxqEsiFPe2htjb49Mqth2M1G5G44r05Wvp1NZjsztTHERtclfoyfQ8
	E+Bo1X7UG1IMzFT2/xU4NalxLOw/h5nTTlNoi7u0FIbCp9LehnXtDvOasBsoeKRVvS
	naIDqONAJOtwTNXhOz9P+4qfeO/t35e/UVa/b+3T+B2rxcjfBadTbg646gAV381aGY
	gIHiyoHiWS4aZQ/52/zwAqEalGC0izoh4iwBnuYSy2D4qsR6mpQuLQopup7yzjXpAe
	jEIEVhZtbgsP7ztePt4X7hMt+sb0EaOcdihCA90tc8Tdn+F+4JPa+AfeO+XceQLIj7
	2MgIFoRtIAvmtyueXazHNORs=
Date: Tue, 28 May 2019 21:09:45 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190528180945.GB14708@localhost>
References: <20190528165200.10764-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190528165200.10764-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-oe] libp11: update to 0.4.10
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
X-List-Received-Date: Tue, 28 May 2019 18:09:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 28, 2019 at 06:52:00PM +0200, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb}                | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-support/libp11/{libp11_0.4.7.bb => libp11_0.4.10.bb} (92%)
> 
> diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> similarity index 92%
> rename from meta-oe/recipes-support/libp11/libp11_0.4.7.bb
> rename to meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> index 87d99c1a6..2911e37c7 100644
> --- a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
> +++ b/meta-oe/recipes-support/libp11/libp11_0.4.10.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
>  DEPENDS = "libtool openssl"
>  
>  SRC_URI = "git://github.com/OpenSC/libp11.git"
> -SRCREV = "64569a391897bd29c5060b19fa4613e619e59277"
> +SRCREV = "libp11-0.4.10"
>...

This is not a good idea - upstream might move the label,
and a man-in-the-middle attack on someone building this
recipe might also be possible.

Please use a commit hash instead.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


