Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5217F266
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2020 22:44:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 005MiG1d000150
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Sun, 5 Jan 2020 14:44:16 -0800 (PST)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 5 Jan 2020 14:44:15 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
	<CAMKF1sr69SX-KN9GBXoaU8vdh1McmDTm7jL+RbjxqrhdXEfr+A@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e16e2987-9eaf-ac1b-caa2-f58ce58112db@windriver.com>
Date: Sun, 5 Jan 2020 17:44:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1sr69SX-KN9GBXoaU8vdh1McmDTm7jL+RbjxqrhdXEfr+A@mail.gmail.com>
X-Originating-IP: [172.25.44.8]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/3] imagemagick: update from 7.8.47 to 7.9.16
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
X-List-Received-Date: Sun, 05 Jan 2020 22:44:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-CA

On 1/5/20 3:33 PM, Khem Raj wrote:
> On Sun, Jan 5, 2020 at 8:43 AM Randy MacLeod
> <Randy.MacLeod@windriver.com> wrote:
>> Only the copyright date for the LICENSE file changed.
>> Add PACKAGECONFIG to enable use of tcmalloc.
>>
> packageconfig disables it now by default, which is fine but I would
> like to know what
> is the defaults in general since this might be a change in behavior

Good question.

The default is the system malloc, with flags to use other

alloc systems, from configure --help:
   --with-jemalloc         enable jemalloc memory allocation library support
   --with-tcmalloc         enable tcmalloc memory allocation library support
   --with-umem             enable umem memory allocation library support

And running configure reports:

Memory allocation library:
   JEMalloc          --with-jemalloc=no        no
   TCMalloc          --with-tcmalloc=no        no
   UMem              --with-umem=no        no

so there isn't a change in the default behaviour.

../Randy

>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   .../{imagemagick_7.0.8.bb => imagemagick_7.0.9.bb}         | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>   rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.8.bb => imagemagick_7.0.9.bb} (95%)
>>
>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
>> similarity index 95%
>> rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
>> rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
>> index 4ee06d77f..3f7d06e26 100644
>> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
>> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
>> @@ -4,14 +4,14 @@ HOMEPAGE = "https://www.imagemagick.org/"
>>   DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
>>   editing raster and vector image files. It can read and write over 200 image file formats."
>>   LICENSE = "ImageMagick"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=05ff94b3ff59fe6fa7489fa26e3d9142"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a"
>>   # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
>>   DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
>>
>>   BASE_PV := "${PV}"
>> -PV .= "_47"
>> +PV .= "_13"
>>   SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
>> -SRCREV = "b672df7a44b0ab0219b1fa78b3673c2810ddd374"
>> +SRCREV = "15b935d64f613b5a0fc9d3fead5c6ec1b0e3908f"
>>
>>   S = "${WORKDIR}/git"
>>
>> @@ -29,6 +29,7 @@ PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
>>   PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
>>   PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
>>   PACKAGECONFIG[rsvg] = "--with-rsvg,--without-rsvg,librsvg"
>> +PACKAGECONFIG[tcmalloc] = "--with-tcmalloc=yes,--with-tcmalloc=no,gperftools"
>>   PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
>>   PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
>>   PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
>> --
>> 2.22.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
# Randy MacLeod
# Wind River Linux


