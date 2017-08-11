Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56CF378277
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Aug 2017 15:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7BFM18h007086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Aug 2017 08:22:01 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 11 Aug 2017 08:21:58 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1502313179-15602-1-git-send-email-Randy.MacLeod@windriver.com>
	<CA+chaQd5FxfZrpukAAsgxVsHjH6a-P6_sQ==gwJ3K8B6TO-5CQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <79785ae0-d478-da2c-7175-542608d1fff4@windriver.com>
Date: Fri, 11 Aug 2017 11:21:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQd5FxfZrpukAAsgxVsHjH6a-P6_sQ==gwJ3K8B6TO-5CQ@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] imagemagick: upgrade from 7.0.6p4 to 7.0.6p5
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
X-List-Received-Date: Fri, 11 Aug 2017 15:22:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-11 10:41 AM, Martin Jansa wrote:
> I've squashed this into previous imagemagick upgrade, but it's gone 
> already again:
> http://errors.yoctoproject.org/Errors/Details/150328/
> 
> There is only 7.0.6-6 now.

Sigh...

Please drop the 7.0.6* upgrades.
Let's stay with 7.0.5 until 7.0.6 stabilizes.

I'll check with upstream to see if 7.0.6 is intended only for
developers/testers. If it is not, I'll explain how we'd
like to support the latest version but their archiving policy
coupled with GitHub's flaky tarball checksum bug makes it
impractical.

Thanks for your patience,

../Randy

> 
> On Wed, Aug 9, 2017 at 11:12 PM, Randy MacLeod 
> <Randy.MacLeod@windriver.com <mailto:Randy.MacLeod@windriver.com>> wrote:
> 
>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>     <mailto:Randy.MacLeod@windriver.com>>
>     ---
>       meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
>     <http://imagemagick_7.0.6.bb> | 6 +++---
>       1 file changed, 3 insertions(+), 3 deletions(-)
> 
>     diff --git
>     a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
>     <http://imagemagick_7.0.6.bb>
>     b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
>     <http://imagemagick_7.0.6.bb>
>     index 6f967c3..810df03 100644
>     --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
>     <http://imagemagick_7.0.6.bb>
>     +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
>     <http://imagemagick_7.0.6.bb>
>     @@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff
>     zlib fftw freetype"
>       # Important note: tarballs for all patchsets within a version are
>     deleted when
>       # a new pachset is created. To avoid multiple patches for each
>     patchset, try to
>       # update to the last pachset of a version
>     -PATCHSET = "4"
>     +PATCHSET = "5"
>       SRC_URI =
>     "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz
>     <http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz>
>     \
>       "
>     -SRC_URI[md5sum] = "079a857268536862148b00efcf3ad75a"
>     -SRC_URI[sha256sum] =
>     "5fe1ce7d78befb5c8aa7f8ae69710d0f78063d2e3a35c656521a3ce468ea733b"
>     +SRC_URI[md5sum] = "15aad6a92d62770f476fcb97c7ad0d0c"
>     +SRC_URI[sha256sum] =
>     "5dbcd45b67514fe1981703759d008f9aa2c6b6201917679dfd35776c904e51b2"
> 
>       S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
> 
>     --
>     2.7.4
> 
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

