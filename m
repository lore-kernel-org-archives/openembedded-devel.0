Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id CFA28778FE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 18:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B26B320BA7;
	Tue, 14 Mar 2017 18:43:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fBUXvgCMmu6R; Tue, 14 Mar 2017 18:43:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8FC43209A4;
	Tue, 14 Mar 2017 18:43:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 223D01623E8; Tue, 14 Mar 2017 14:43:56 -0400 (EDT)
Date: Tue, 14 Mar 2017 14:43:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: kai.kang@windriver.com
Message-ID: <20170314184356.GK15664@denix.org>
References: <20170313032921.8669-1-kai.kang@windriver.com>
	<20170313032921.8669-3-kai.kang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20170313032921.8669-3-kai.kang@windriver.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/5] curlpp: update HOMEPAGE and SRC_URI
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
X-List-Received-Date: Tue, 14 Mar 2017 18:43:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 13, 2017 at 11:29:18AM +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> The page of curlpp hosted on googlecode doesn' work now. So update
> SRC_URI to use repo hosted on github. Update HOMEPAGE as well.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> index c3a242a..24f2ef8 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.7.3.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "C++ library for client-side URL transfers"
> -HOMEPAGE = "http://code.google.com/p/curlpp/"
> +HOMEPAGE = "http://www.curlpp.org/"
>  SECTION = "libdevel"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> @@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>  DEPENDS = "curl boost"
>  DEPENDS_class-native = "curl-native"
>  
> -SRC_URI = "http://curlpp.googlecode.com/files/curlpp-${PV}.tar.gz \
> +SRC_URI = "https://github.com/jpbarrette/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \

So, you are trying to use the same name for the tarball, which has different 
checksums. Will be a problem for anyone with an old tarball cached on a 
mirror...

-- 
Denys


>      file://example21.cpp-remove-deprecated-code.patch \
>  "
>  
> -SRC_URI[md5sum] = "ccc3d30d4b3b5d2cdbed635898c29485"
> -SRC_URI[sha256sum] = "e3f9427b27c5bddf898d383d45c0d3d5397e2056ff935d9a5cdaef6a9a653bd5"
> +SRC_URI[md5sum] = "ee05f248bf3bbf7f381d65cf2d0ee50f"
> +SRC_URI[sha256sum] = "b72093f221a9e2d0f7ce0bd0f846587835e01607a7bb0f106ff4317a8c30a81c"
>  
>  inherit autotools-brokensep pkgconfig binconfig
>  
> -- 
> 2.10.1
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

