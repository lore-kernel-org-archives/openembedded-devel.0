Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5D0B27F217
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 18:04:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HKf46LZ7z29;
	Mon, 26 Aug 2019 20:04:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566842685;
	bh=Y6dmZJFYMxNldjaB40jYNmtJkdCRb9l47k6F0mLtxaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kGu1HzzsqQRaVZSc1Mr4ACp8uJ81nOaO+kxMqNR0XDs2MuDgXM2fm4NwmPnV6RatL
	lwhunmn4Uo5Y2FAiq15Lnx8luW2pI6/WfmHmIbwBC8vvYIdbdmTZDumwtDVoOh1vC4
	1eVHOFphAoYpiBb/+Fa1m8qVewAYUoENS7VOboa/v5rRsPZn/SBEAv5OiSYkg939HC
	lZrMJY6A30i+Mcif7Lb0eOwH9Fhqgk9PTmbIOzmR+T9Q87qk5mc8dovKXWlJT8EznF
	nLsd5c1+sDTTjLB+EPfmiVToZe19QbdbOKip9F3CXovoBDKpOrUmni6ROv8O8B9JY4
	HPGrywTFLj/4rSoIxcHGSmU7wh1dYfRyk5dNVSxV419mkg7cVCcH6A+hb/JFd/y7IP
	ZwsYCnN0NU5annJIMEG2iJqTJ0T4OLIxUOhHSmkLoyced4qHJWoATw+OgaI1vcg0Z0
	EUTfVfGybdjFFEOLOowSnQQegtmvlr+xqbiJjshKzhLL2pfs5qSZ4UT0E3lFyxdaXg
	Xr6A7UitoFgHUL8ICK/c9WeH5q3HQSbzLSo4ItdBgHuNF/FN0WtoKHAw3rHLVIBic6
	4hynm64d+22iLaT9REnmNEuuUK8z7BuHai+FgaMzLUO58GEz+MZCYaiNfrdqlJqAI3
	7YrCRikM4EaIJIiHo8KmeU0E=
Date: Mon, 26 Aug 2019 21:04:37 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Aaltonen Eero <eero.aaltonen@vaisala.com>
Message-ID: <20190826180437.GA18874@localhost>
References: <20190823105345.12430-1-eero.aaltonen@vaisala.com>
MIME-Version: 1.0
In-Reply-To: <20190823105345.12430-1-eero.aaltonen@vaisala.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Recipe for docopt.cpp option parsing library
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
X-List-Received-Date: Mon, 26 Aug 2019 18:04:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Aug 23, 2019 at 10:54:46AM +0000, Aaltonen Eero wrote:
>...
> +SRC_URI = "\
> +    git://git@github.com/docopt/docopt.cpp.git;protocol=ssh \
>...

  The authenticity of host 'github.com (140.82.118.3)' can't be established.
  RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
  Are you sure you want to continue connecting (yes/no)?

Please use a protocol=https URI, similar to other github URIs.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


