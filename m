Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8B6646BCDC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 04:50:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4670dB2hFmz3P;
	Tue, 13 Aug 2019 06:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1565671806;
	bh=uKOdIsqHlw5b5Eoa76asGGU6+2aU93HDjKf/vFkkh50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shKqFbVd2+B5pZgLFfyGruTEtm7j0RBIfzB23Sr5M1QqcpxrSU5fa4fUJPuerNdXA
	RugqibWDEhG2XjM0cZVwA4EBOlLyKo5P3etk3f7jdmcv/xeVw+2JOcqIt1+9YqDPMK
	yPkd2M/0gz+zHXOgk6VEl+pZSOXe8LcL7CSbejjJd5XKZ593/IhGJHS6LMuTWQdPuX
	qTIlFHQ9C/aHG+5QT0EySf2Upgt6QOb4vEWxOG9nAa7tJn4EnLt+epSTQccQ0Gyytm
	MIjDlVkvTmvH3qObfP+oEBS6LehMXXOX6BcDLOGWXUHbiMTwQztQDYQS4q4MHN6Twb
	/0SULySA/7/llMWF6bGKdAH3WPKS4DqyYy3JcJyl2O7MKQqxkKS5E/vUV6ewD0bqmZ
	7q0MSQ6Y2ZFtyziWk3HL1cWE4avi23+XC9XEhEJ9tSJV5RYYgmW7gz9YaR1dpR+Sqh
	rQNtTNy74zWEKnm1RI9r6TAvorLFyaVxYNQ6RST5E9lPLSS5zG19VmCMmCn/XOh1cN
	75UnAzEvLVpawyR9aiJ7WSLXe4bm5VhgFbu2ulGKtF1xzILCMRh7sfNIak7Oqc5zam
	gWls4bmabrnJ19bSKHt25onyNDxaz2Wd2RPBlgedtCWHhXGt/iA+qljhPwoBhbxh2K
	nI5f28MaEsaqB5WNZZWaB2WE=
Date: Tue, 13 Aug 2019 07:50:03 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Joe Slater <joe.slater@windriver.com>
Message-ID: <20190813045003.GA5396@localhost>
References: <20190812192220.238334-1-joe.slater@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190812192220.238334-1-joe.slater@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/1] php: zlib and zip support
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
X-List-Received-Date: Tue, 13 Aug 2019 04:50:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Aug 12, 2019 at 12:22:20PM -0700, Joe Slater wrote:
> Add back zlib support.  Define zip support but do not enable it.
>...
> +# For zip, select one or none.  oldzip uses a bundled library and is deprecated.
> +#
> +PACKAGECONFIG[newzip] = "--enable-zip --with-libzip=${STAGING_EXECPREFIXDIR},,libzip"
> +PACKAGECONFIG[oldzip] = "--enable-zip --without-libzip,"
>...

Any reason why this can't be PACKAGECONFIG[zip] for the external libzip only
without any option for the bundled library?

Bundled libraries are usually behind on security fixes,
and php is a software where this tends to matter.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


