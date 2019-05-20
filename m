Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D3C9A6D6C4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 06:07:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 456pNG4220z2s;
	Mon, 20 May 2019 08:07:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558332478;
	bh=YeugTowJoZ36KnQPrXUGWvYhFly13HZZiIl7icazYY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=adxzAUeb6rbvH3hUmeE/P5dXSZTsMYZJn3Pv3AAvJD2npC9Jc09+7k8TI8grSbT2t
	ec6fYBqq6XUE+sJS6iLijse1lHWJTVylPNcTuaM9c3vzRXURrlivGawwEr77lUN2cv
	CObqED4605xdccKB/lsP4aVelaD2U4PHOeSSaUdfCEsff+vS6lYyc5/cg6TXtY+xDz
	AtoAguX/uSjiwHsu7zL7JA2PafOYR2NDzPKtsAxEymewMPiZDhgSROvUfAX82RE5l7
	Fx5rl+TU/TS+OGorBo/XVUDVKD7Y8x/MWokg6JXkqcUZRJaLTqVs5q4ZPagO00Eio5
	dV4q3YNn6JZ9CHWNAlGjPaHijDWuhl3BARNGV17cy5uqzOJCUz0c5+JUfGwPZVdY0z
	lS+/z0/bTmT+dJ04gIX+wTZe1BdXb9GNRsr0mU3oatNrStexmsHDgDMN9Y7w0sAPXy
	Y6cVELajnK1y5ldePWfJAx9C6lbZVufI6Q5LxADrjVWUisR/RKPTOfLKo8kLkvAKhp
	1djnCRMtU25tEl+b7j8wc/WU9ZZ4PTYbPXlWXsu0YlSv1zq00o/TgzHdkSwISdBkjm
	2heHh1TxjwpSbGP8T2KSg2St0TOUKJS32L/+NSjgLptvGMKePk269fzwi0zSK/H/6O
	UkEg6MMw5DyajZu3LX7sDBLk=
Date: Mon, 20 May 2019 09:07:56 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190520054114.GA3848@localhost>
References: <20190519202753.2575-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190519202753.2575-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] rp-pppoe: update to 3.13
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
X-List-Received-Date: Mon, 20 May 2019 06:07:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 19, 2019 at 10:27:53PM +0200, Oleksandr Kravchuk wrote:
> Removed patch was upstreamed.
>...

The patch file is not removed:

>  .../0001-ppoe-Dont-include-linux-if_ether.h.patch          | 0
>  .../0002-Enable-support-for-the-kernel-module.patch        | 0
>  .../configure.in-Error-fix.patch                           | 0
>  .../rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/configure.patch   | 0
>  .../{rp-pppoe-3.12 => rp-pppoe}/configure_in_cross.patch   | 0
>  .../discard-use-of-dnl-in-Makefile.am.patch                | 0
>  .../{rp-pppoe-3.12 => rp-pppoe}/dont-swallow-errors.patch  | 0
>  .../{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.default       | 0
>  .../rp-pppoe/{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.init | 0
>  .../{rp-pppoe-3.12 => rp-pppoe}/pppoe-server.service       | 0
>  .../pppoe-src-restrictions.patch                           | 0
>  .../{rp-pppoe-3.12 => rp-pppoe}/top-autoconf.patch         | 0
>  .../{rp-pppoe-3.12 => rp-pppoe}/update-config.patch        | 0
>  .../rp-pppoe/{rp-pppoe_3.12.bb => rp-pppoe_3.13.bb}        | 7 +++----
>  14 files changed, 3 insertions(+), 4 deletions(-)
>...

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


