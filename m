Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C0D4D71A79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 07:21:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9L7LXae009105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Oct 2016 00:21:33 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 21 Oct 2016 00:21:32 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20161021064625.19052-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <9233e84f-355c-6ce1-a3c0-0f339953e928@windriver.com>
Date: Fri, 21 Oct 2016 15:21:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161021064625.19052-1-kai.kang@windriver.com>
Subject: Re: [meta-networking][PATCH] c-ares: 1.11.0 -> 1.12.0
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
X-List-Received-Date: Fri, 21 Oct 2016 07:21:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年10月21日 14:46, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade c-ares from 1.11.0 to 1.12.0.
>
> * update LIC_FILES_CHKSUM that a stand-alone license file is added

Didn't see André Draszik's patch to upgrade c-ares. So please ignore it.

--Kai

> * CVE-2016-5180 is fixed in 1.12.0
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb}   | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-networking/recipes-support/c-ares/{c-ares_1.11.0.bb => c-ares_1.12.0.bb} (60%)
>
> diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> similarity index 60%
> rename from meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> rename to meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> index c98be7d..da8e096 100644
> --- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
> +++ b/meta-networking/recipes-support/c-ares/c-ares_1.12.0.bb
> @@ -4,12 +4,12 @@ DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
>   HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
>   SECTION = "libs"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37cf1ddd1ef8f8eccce0"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f4b026880834eb01c035c5e5cb47ccac"
>   
>   SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
>              file://0001-configure.ac-don-t-override-passed-cflags.patch \
>   "
> -SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
> -SRC_URI[sha256sum] = "b3612e6617d9682928a1d50c1040de4db6519f977f0b25d40cf1b632900b3efd"
> +SRC_URI[md5sum] = "2ca44be1715cd2c5666a165d35788424"
> +SRC_URI[sha256sum] = "8692f9403cdcdf936130e045c84021665118ee9bfea905d1a76f04d4e6f365fb"
>   
>   inherit autotools pkgconfig


-- 
Regards,
Neil | Kai Kang


