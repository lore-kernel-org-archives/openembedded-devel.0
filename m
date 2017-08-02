Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7144D60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 15:29:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v72FT6Qb023897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Aug 2017 08:29:07 -0700 (PDT)
Received: from [128.224.56.206] (128.224.56.206) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 2 Aug 2017 08:29:06 -0700
From: Randy MacLeod <randy.macleod@windriver.com>
To: Koen Kooi <koen@dominion.thruhere.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
Message-ID: <4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
Date: Wed, 2 Aug 2017 11:29:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <olqm6a$87a$1@blaine.gmane.org>
X-Originating-IP: [128.224.56.206]
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 02 Aug 2017 15:29:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-08-01 03:52 PM, Koen Kooi wrote:
> Op 01-08-17 om 19:01 schreef Randy MacLeod:
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> 
> Does python-wand work with this version?


Well, that's in meta-linaro but I took a look anyway... ;-)

It's not working for me on qemux86 since python-wand
is looking for:
    libMagickWand-6.Q16HDRI and
    libMagickWand-7.Q16HDRI is the current version.
If I soft link to work-around that problem, there's another issue:
    ImportError: MagickWand shared library not found.

python-wand hasn't released a version newer than 0.4.4.
I'm not really interested in trying the git repo.

More unstructured logs below largely for me to reference
should I come back to testing this package.

../Randy


First there are a bunch of dependencies missing from the wand recipe,
which I started fixing like this:

-DEPENDS += " imagemagick-native"
+DEPENDS += " imagemagick-native python-ctypes"

but then ditched to doing:

$ grep wand conf/local.conf
IMAGE_INSTALL_append = " \
    python-ctypes python-numbers python-contextlib \
    python-io python-subprocess python-wand imagemagick"



qemux86 login: root
root@qemux86:~# python
Python 2.7.13 (default, Aug  1 2017, 17:41:39)
[GCC 7.1.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> from wand.image import Image
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in 
<module>
     from .api import MagickPixelPacket, libc, libmagick, library
   File "/usr/lib/python2.7/site-packages/wand/api.py", line 206, in 
<module>
     'Try to install:\n  ' + msg)
ImportError: MagickWand shared library not found.
You probably had not installed ImageMagick library.
Try to install:
   http://docs.wand-py.org/en/latest/guide/install.html
>>>



root@qemux86:~# find /usr -name "*agick*so*"
/usr/lib/libMagickWand-7.Q16HDRI.so.3
/usr/lib/libMagickCore-7.Q16HDRI.so.3
/usr/lib/libMagickWand-7.Q16HDRI.so.3.0.0
/usr/lib/libMagick++-7.Q16HDRI.so.3
/usr/lib/libMagick++-7.Q16HDRI.so.3.0.0
/usr/lib/libMagickCore-7.Q16HDRI.so.3.0.0
root@qemux86:~# QEMU 2.8.1.1 monitor - type 'help' for more information
(qemu) q
Cleanup
rmacleod@ala-lpggp2$find 
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/ 
-name "*MagickWand*" | grep so
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/imagemagick-dbg/usr/lib/.debug/libMagickWand-7.Q16HDRI.so.3.0.0
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/imagemagick-dev/usr/lib/libMagickWand-7.Q16HDRI.so
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/imagemagick-doc/usr/share/doc/ImageMagick-7/www/api/MagickWand/MagickWand_8h-source.html
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/imagemagick/usr/lib/libMagickWand-7.Q16HDRI.so.3.0.0
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/imagemagick/usr/lib/libMagickWand-7.Q16HDRI.so.3


root@qemux86:~# cd /usr/lib/
root@qemux86:/usr/lib# ln -s libMagickWand-7.Q16HDRI.so.3 
libMagickWand-6.Q16HDRI.so.3
root@qemux86:/usr/lib# ln -s libMagickWand-7.Q16HDRI.so.3.0.0 
libMagickWand-6.Q16HDRI.so.3.0.0
root@qemux86:/usr/lib# python
Python 2.7.13 (default, Aug  1 2017, 17:41:39)
[GCC 7.1.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
 >>> from wand.image import Image
Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in 
<module>
     from .api import MagickPixelPacket, libc, libmagick, library
   File "/usr/lib/python2.7/site-packages/wand/api.py", line 206, in 
<module>
     'Try to install:\n  ' + msg)
ImportError: MagickWand shared library not found.
You probably had not installed ImageMagick library.
Try to install:
   http://docs.wand-py.org/en/latest/guide/install.html


> 
> 
>> --- .../imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb}      | 6 +++--- 1 file changed, 3 insertions(+), 3 deletions(-) rename
>> meta-oe/recipes-support/imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb} (96%)
>>
>> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb similarity index 96% rename from
>> meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb index b8ee6e7be..6f967c3a1 100644 ---
>> a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb @@ -8,11 +8,11 @@ DEPENDS = "lcms bzip2 jpeg libpng
>> librsvg tiff zlib fftw freetype" # Important note: tarballs for all patchsets within a version are deleted when # a new pachset is created. To avoid multiple patches for each
>> patchset, try to # update to the last pachset of a version -PATCHSET = "6" +PATCHSET = "4" SRC_URI =
>> "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \ " -SRC_URI[md5sum] = "dfaa2bd61f65d67ea8d5307ed6cd197f" -SRC_URI[sha256sum] =
>> "f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab" +SRC_URI[md5sum] = "079a857268536862148b00efcf3ad75a" +SRC_URI[sha256sum] =
>> "5fe1ce7d78befb5c8aa7f8ae69710d0f78063d2e3a35c656521a3ce468ea733b"
>>
>> S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>>
>>
> 
> 


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

