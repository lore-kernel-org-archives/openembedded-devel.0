Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id D37DF72FED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 11:51:05 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n186so16814876qkb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 03:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bBpvqZuTgRwIMqHdBCiJNvM80/afLbOBERXjGuildaE=;
	b=NxI2oA8W/RT2KIw0sWl2SwCuRP3xd2opm/oayLKEidlVXXihWBbOHC41Xzi2HN0Txp
	exCxlHoutvtsgbby6de3kLb/idkAU8gVZUPNIk5dL9Pes61FFeG2K/KLVN4UdnuBWiz+
	FHADPkEowjiSF+ZnLu1r7GVJb0VJelneII5mCC3MVcTsycw7w24PYj0lIWBcQ1vaEZ3F
	K5971QJSn9QP8vJZSI5DclNi60UWKfiwSRAHKxpCilm84zMg20pNt3waoGeGycknT3Dp
	GTW/bjcSGzM+sbA4MWn1CElbPwh5n5LePpnHpezG96y4Tgr0sKJPGIna8kKmgeIufrSN
	OWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bBpvqZuTgRwIMqHdBCiJNvM80/afLbOBERXjGuildaE=;
	b=MGwfqyguPFrYXc4XMmTPxbq9ehZgvoAEMrB0FSZf6vjpbRQ71bNgv9H45+pe1nchgR
	zLULXK1iFC1dD4mRW7yqyI3hET4hR+loCcrrDGW/gXfVTscANEfCnCiDm7ZHAuasIF9a
	molD41Kf+rrNyOzTXALV6qi/xc9a4wPdGIqIt0HxZOIjNX3ESU+yZzglQ5PIGx6AtJWy
	bCF24gFEoCGir3tcWmc7dUilRUGDS1WAJVcMK1Nj2b8pOoTRCs3fOEWjb92JBfdzXMre
	MmfUaf+JcmXnTP9aH3OTYc0bIepCy2QfwqoKkwidOVHXBJfx1O4/XsXEoMouomZDkIrH
	zwjg==
X-Gm-Message-State: AMke39l//9apkC0krHbxWeNPo2zaklWjDoZFAyBPK90xxzhEjTK43pDXOj+A8UCC7H1KdseCVBFU8dLiQ6q1T2KV
X-Received: by 10.237.32.230 with SMTP id 93mr14899283qtb.144.1488196266674;
	Mon, 27 Feb 2017 03:51:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 27 Feb 2017 03:50:46 -0800 (PST)
In-Reply-To: <20170223222004.GA23285@jama>
References: <20170223222004.GA23285@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Feb 2017 11:50:46 +0000
Message-ID: <CAJTo0LZy--6KGkcfumi=_mkRpW9YryFFfAofK5T7jkuO3hik3Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2017-02-23
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
X-List-Received-Date: Mon, 27 Feb 2017 11:51:06 -0000
Content-Type: text/plain; charset=UTF-8

On 23 February 2017 at 22:20, Martin Jansa <martin.jansa@gmail.com> wrote:

> === common (2) ===
>     * openembedded-core/meta/recipes-extended/parted/parted_3.2.bb:
> do_compile_ptest_base
>     * openembedded-core/meta/recipes-support/apr/apr_1.5.2.
> bb:do_compile_ptest_base
>

FWIW neither me nor the yocto autobuilder sees these, so I suspect they're
ld-is-gold related.

Ross

