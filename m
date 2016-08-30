Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A36260125
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:13:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7U6DiPN022721
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Aug 2016 23:13:44 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Aug 2016 23:13:43 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20160830014454.1383-1-liezhi.yang@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <3fc5e8cf-7070-178d-422c-c150b6d0efc8@windriver.com>
Date: Tue, 30 Aug 2016 14:13:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160830014454.1383-1-liezhi.yang@windriver.com>
Subject: Re: [meta-oe] [PATCH] imagemagick: update patchset
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
X-List-Received-Date: Tue, 30 Aug 2016 06:13:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry, please drop this one, I just noticed that Khem had sent another one.

// Robert

On 08/30/2016 09:44 AM, Robert Yang wrote:
> Fixed:
> ERROR: imagemagick-7.0.2-r0 do_fetch: Fetcher failure:
> --2016-08-28 04:07:12--  http://www.imagemagick.org/download/releases/ImageMagick-7.0.2-7.tar.xz
> Resolving www.imagemagick.org... 198.72.81.86
> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2016-08-28 04:07:12 ERROR 404: Not Found.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> index 472e42d..5937062 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
> @@ -8,11 +8,12 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
>  # Important note: tarballs for all patchsets within a version are deleted when
>  # a new pachset is created. To avoid multiple patches for each patchset, try to
>  # update to the last pachset of a version
> -PATCHSET = "7"
> +PATCHSET = "9"
>  SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
>  "
> -SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
> -SRC_URI[sha256sum] = "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
> +
> +SRC_URI[md5sum] = "2720ab8c480019f79e717b0237570311"
> +SRC_URI[sha256sum] = "22df4f197985f36f77b7b0d44de92ff44415885045f0191b3319540bdc82ff53"
>
>  S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>
>

