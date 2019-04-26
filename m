Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B9A5E6B43D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 05:20:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44r2T70Ftpz1n;
	Fri, 26 Apr 2019 07:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1556256059;
	bh=qDZyGlg/c/hoJfn9P6VqJGeQuHoG+DeMDhBNa1YkyLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDE9DDBXV/PoeTAMBSZeGFeoK3LykSf9QH5Fci0SQde6pgQykVYK8BDTJfTS6AhcE
	DXaEW7seJPmLmXrJ49+eh7YE+i4VLeZamyHzrAlWujEXQy3YcU4IrluZYQ+cTK1zrQ
	dxw6QxAUyJmTUVB1r2q20gBuE566thLgQFspSfSEPQslxqEHMe0lhl6l0EimOclWPe
	1mC7wOy9XoW710qYijL70pqGty5XvBHLJFbLDCFoU4a1r6tcX31IQqwtWalYkoxw7H
	YMEQsajsKIPQVXj++RT1vUxsopFreMhOOVIZNJAUTeo2kPGexBNgD1Va+0lHpM8s86
	P1c8rJ84nb8OgGZJay6XN3aMit5TXkeXBXw2mzWHM6h8ICWwobgJwj8ona/aD+SFbh
	UwyvAycGQXKajVebqZxaoPgG9LakBQ/2wdEY2N3WeONzW2OUyddaCu1LYZ3liTfDOr
	4iiBYoTKu5vm5zMX+qBgYsSuW7HHsR4zH2OSoROFO7JTjv+orNI797dpOIOBEEmW28
	KuBMvnYltYap4+lM/b+P10OFPq0zgqX2vLh1LrB5ceOL7BB8M0NXSiTq26a9lGJdf3
	emg38P75jXRCOFycqndWqTQQ1bdEvek5no7Zx/9LFlV+nfN+QhpYMqkZhg4H06ZOc1
	W+Pak8TSEUCI7/S6q9mcPTsM=
Date: Fri, 26 Apr 2019 08:20:56 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190426052056.GB26023@localhost>
References: <20190424190038.19593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190424190038.19593-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ne10: set NE10_TARGET_ARCH with an override instead of anonymous python
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
X-List-Received-Date: Fri, 26 Apr 2019 05:20:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Apr 24, 2019 at 07:00:38PM +0000, Martin Jansa wrote:
> * set COMPATIBLE_MACHINE to (^$) to prevent building it for any other
>   architectures than armv7a and aarch64
> * with new arm tune files it's easy to have armv7a in OVERRIDES even
>   when there isn't armv7a in TUNE_FEATURES:
>   meta/conf/machine/include/tune-cortexa9.inc:7
>      "${@bb.utils.contains('TUNE_FEATURES', 'cortexa9', 'armv7a:', '',d)}"
>   in cases like this COMPATIBLE_MACHINE was satisfied thanks to the
>   armv7a OVERRIDE, but then the anonymous python was failing with:
>   ne10 was skipped: Incompatible with archs other than armv7 and aarch64
>...

How does this handle Cortex A9 SoCs without NEON support?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


