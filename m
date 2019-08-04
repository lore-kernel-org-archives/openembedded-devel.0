Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 908C17F31A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2019 09:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 461Zk24873z4R;
	Sun,  4 Aug 2019 11:05:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564909531;
	bh=ZIZD/hSVW2jh9URgM2hOU7HCnWBTr7TCqRpxfYYctk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JfeFWPNLuMN0QIP+aZgA7FtSJFfIlWN+YJvpc4EusTpkQ5vTjI+TjE1fVBH3pDzjU
	i6DqvxFv1vRspQr7CiIbtHNGDRuSI5eEc1l80kYIrmuCAfH/vrzY/Kr4wIUWV5oN31
	3EezXbZaIv7uZAChct6Bikc2H1RBLF+9Wzlk76o3uKzO1LjBfFfweZnwjKagBLdX5b
	p6pQdQQpm8r9VBE6aGdY17pWglQg87MauHZJYjiSZinC9dUiP2VhviDSVhpMDYMwUN
	Qj3UMTJAr4BN7n/loizAOBW9Br7+vUayMxYD02ageEAmJeN9qFqHh5Yd69zPr5bEzn
	ZPBRZVsVp9u3WFsU4oZhJ+Fmqwx0DpcRu5Wm5yGMvEkpm0Gx+nKHrCdHsc6Yq1U6OB
	OnWGzZOu49JplqnXidZmcddr/xYVIRwUYwVstCFqBtgh2UiDomMKx6XLNCqirUbvd8
	bpWsFjf5eqp3QxQW/qazHmN1LKZB3xwEO3jsPk9Rvq3Y3L83oLJQMoCQ0SLidzzcWN
	QsLyr2cJlIrIGWzFPXQLcALdgt4aLu8goJmsreyE1XcY1IzW0lAjzkCWJNz+XfJtwe
	Lyn0QmAl1G8JZyFQnqvGqOUH/4YBwrQGrC+OtWGkI+/BuV4MwCNG99RglL4BKyVp1j
	M6VwFyPG25fvJe/nOchx8IwE=
Date: Sun, 4 Aug 2019 12:05:28 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190804090528.GA18199@localhost>
References: <20190731064819.134342-1-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20190731064819.134342-1-kai.kang@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] poppler: toggle gobject-introspection support
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
X-List-Received-Date: Sun, 04 Aug 2019 09:05:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Khem, did you miss this patch due to openembedded-devel@ only being in
the Cc or other reasons?

Thanks
Adrian


On Wed, Jul 31, 2019 at 02:48:19AM -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It doesn't provide a way to enable or disable gobject-introspection
> support for poppler. Toggle it respect to variable GI_DATA_ENABLED.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-oe/recipes-support/poppler/poppler_0.79.0.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> index 068433475..b285eecd2 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
> @@ -34,6 +34,7 @@ EXTRA_OECMAKE += " \
>      -DBUILD_GTK_TESTS=OFF \
>      -DENABLE_ZLIB=ON \
>      -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
> +    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_GOBJECT_INTROSPECTION=ON', '-DENABLE_GOBJECT_INTROSPECTION=OFF', d)} \
>  "
>  
>  do_configure_append() {
> -- 
> 2.20.0
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


