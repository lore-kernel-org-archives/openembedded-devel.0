Return-Path: <Randy.MacLeod@windriver.com>
X-Greylist: delayed 475 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 01 Feb 2020 17:23:14 UTC
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2808E60BDE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2020 17:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 011HEher005792
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sat, 1 Feb 2020 09:14:53 -0800
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sat, 1 Feb 2020 09:14:33 -0800
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20200201163703.4264-1-schnitzeltony@gmail.com>
	<20200201163703.4264-3-schnitzeltony@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <11ab5995-8055-2b57-caa9-93cabab79be7@windriver.com>
Date: Sat, 1 Feb 2020 12:14:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200201163703.4264-3-schnitzeltony@gmail.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
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
X-List-Received-Date: Sat, 01 Feb 2020 17:23:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA

Typo:

Re: [oe] [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.84.0
should be:
Re: [oe] [PATCH 2/4] poppler: upgrade 0.84.0 -> 0.85.0

Thanks,
../Randy


On 2/1/20 11:37 AM, Andreas Müller wrote:
> Release 0.85.0:
> core:
>   * Fix case unsensitive search for Deseret and Osage. Issue #853
>   * Fix crash in unicodeToAscii7
>   * CairoOutputDev: make initialisation thread-safe
>   * Fix crash on broken files. Issues #869, #870
>   * Internal code improvements
>
> qt5:
>   * Fix FormField::name encoding
>   * Accept UTF-16 uiNames for form fields
>   * Fix search for "complex" characters
>   * Allow to load document from QIODevice
>
> utils:
>   * pdftoppm/pdftocairo: Fix -e/-o printing the wrong pages. Issue #873
>   * pdftohtml: Fix issue with the font size sometimes being huge
>
> glib:
>   * make the frontend initialization thread safe.
>
> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
> ---
>   .../poppler/{poppler_0.84.0.bb => poppler_0.85.0.bb}          | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-oe/recipes-support/poppler/{poppler_0.84.0.bb => poppler_0.85.0.bb} (93%)
>
> diff --git a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> similarity index 93%
> rename from meta-oe/recipes-support/poppler/poppler_0.84.0.bb
> rename to meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> index 5153868b6..857b67ff9 100644
> --- a/meta-oe/recipes-support/poppler/poppler_0.84.0.bb
> +++ b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
> @@ -7,8 +7,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
>              file://0001-Do-not-overwrite-all-our-build-flags.patch \
>              file://basename-include.patch \
>              "
> -SRC_URI[md5sum] = "e14a8aca8809908ad4364c32c17bcb92"
> -SRC_URI[sha256sum] = "c7a130da743b38a548f7a21fe5940506fb1949f4ebdd3209f0e5b302fa139731"
> +SRC_URI[md5sum] = "5315084523a4d73e9514f51eef78a332"
> +SRC_URI[sha256sum] = "2bc875eb323002ae6b287e09980473518e2b2ed6b5b7d2e1089e36a6cd00d94b"
>   
>   DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
>   


-- 
# Randy MacLeod
# Wind River Linux


