Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F970607F8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Aug 2017 17:21:26 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r77so7961038wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Aug 2017 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=MzmveToMQTo3mqtJjKB88BYulUnOBLZIBn3B2emZJYE=;
	b=bW3jrI1d4OA1hnSYd3SoclKKtnFo5/RHbmrK+MHNpJzwVCkj5fZRmmyKCjA2fIDDoL
	ccKDKZ1wW6XIz34r8GTHlVlzCvYE6WtbjAZ2dyqRb5tCo/aKzncXMN6KOQvfT03y5CXB
	jBjTBV+he0WHdH0sNIr/8sFjf102/WNWhJTZf/xVEI+kp4bGfNt3fd7CZfNeR812jBuI
	ZJcWztTPQkMIlIsp+cq/WgX4u4tnx2hd5adygnxTMBfzSJV/ej2WD91dmmj8Ia/W9JJy
	OtDbaFUa2Ys470BY+K/ceti0wfLvo5zR7VeIYM82AcQp+BqN7wix3PfFd+Zi50nYavjF
	x2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=MzmveToMQTo3mqtJjKB88BYulUnOBLZIBn3B2emZJYE=;
	b=qjwMeQDRx2SwleQxKcfPZyV2OByaSsCn6g5vDqg1sLfrlXf81a4yjhpXOVpHruJLzJ
	Fw1sD3PvzmxOu39MNg6yalvovVSWQ5g6brCHZrh9uGCHFyVFbOrjIlmwR0FfokMt+fVs
	fTX+2m5q5GDw5OXIZICq7aT4l+SVWU3wLKqFwxaHHlfpuJ68Jz3h7qRxttWqXXhWYnyh
	3nmU57JFwitGsuaECmbbE6A28+UJLFu5J0hX+m8/+z+7+TCXloZhlXSwgiBKvOcvvHok
	JOlKmcJ8/fFzGlfyydKbeFkAwLSVoWaGpt5LOk6CKwod2V1o53xd3aMFm4/TYIws+QF7
	Npug==
X-Gm-Message-State: AIVw112+X9jyYVH+g+XTrL4vUqQ7OoJDBUUwb6/GVF4ZmPSQ0j1LsZVM
	/hn/BNu51PVKYNMQ
X-Received: by 10.80.209.195 with SMTP id i3mr21857351edg.70.1501694488021;
	Wed, 02 Aug 2017 10:21:28 -0700 (PDT)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id
	v5sm15936031ede.75.2017.08.02.10.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Aug 2017 10:21:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 11.0 \(3441.0.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
Date: Wed, 2 Aug 2017 19:21:23 +0200
Message-Id: <BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Mailer: Apple Mail (2.3441.0.1)
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 02 Aug 2017 17:21:27 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable



> Op 2 aug. 2017, om 17:29 heeft Randy MacLeod =
<randy.macleod@windriver.com> het volgende geschreven:
>=20
> On 2017-08-01 03:52 PM, Koen Kooi wrote:
>> Op 01-08-17 om 19:01 schreef Randy MacLeod:
>>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> Does python-wand work with this version?
>=20
>=20
> Well, that's in meta-linaro but I took a look anyway... ;-)

Oops, I could=E2=80=99ve sworn I have submitted it to meta-oe :/ Thanks =
for looking into this!

>=20
> It's not working for me on qemux86 since python-wand
> is looking for:
>   libMagickWand-6.Q16HDRI and
>   libMagickWand-7.Q16HDRI is the current version.
> If I soft link to work-around that problem, there's another issue:
>   ImportError: MagickWand shared library not found.
>=20
> python-wand hasn't released a version newer than 0.4.4.
> I'm not really interested in trying the git repo.

I=E2=80=99ll have a look at trying the git repo with your patch to =
update imagemagick and hopefully get it working well enough to get it =
into oe-core :)


>=20
> More unstructured logs below largely for me to reference
> should I come back to testing this package.
>=20
> ../Randy
>=20
>=20
> First there are a bunch of dependencies missing from the wand recipe,
> which I started fixing like this:
>=20
> -DEPENDS +=3D " imagemagick-native"
> +DEPENDS +=3D " imagemagick-native python-ctypes"
>=20
> but then ditched to doing:
>=20
> $ grep wand conf/local.conf
> IMAGE_INSTALL_append =3D " \
>   python-ctypes python-numbers python-contextlib \
>   python-io python-subprocess python-wand imagemagick"
>=20
>=20
>=20
> qemux86 login: root
> root@qemux86:~# python
> Python 2.7.13 (default, Aug  1 2017, 17:41:39)
> [GCC 7.1.0] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
>>>> from wand.image import Image
> Traceback (most recent call last):
>  File "<stdin>", line 1, in <module>
>  File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in =
<module>
>    from .api import MagickPixelPacket, libc, libmagick, library
>  File "/usr/lib/python2.7/site-packages/wand/api.py", line 206, in =
<module>
>    'Try to install:\n  ' + msg)
> ImportError: MagickWand shared library not found.
> You probably had not installed ImageMagick library.
> Try to install:
>  http://docs.wand-py.org/en/latest/guide/install.html
>>>>=20
>=20
>=20
>=20
> root@qemux86:~# find /usr -name "*agick*so*"
> /usr/lib/libMagickWand-7.Q16HDRI.so.3
> /usr/lib/libMagickCore-7.Q16HDRI.so.3
> /usr/lib/libMagickWand-7.Q16HDRI.so.3.0.0
> /usr/lib/libMagick++-7.Q16HDRI.so.3
> /usr/lib/libMagick++-7.Q16HDRI.so.3.0.0
> /usr/lib/libMagickCore-7.Q16HDRI.so.3.0.0
> root@qemux86:~# QEMU 2.8.1.1 monitor - type 'help' for more =
information
> (qemu) q
> Cleanup
> rmacleod@ala-lpggp2$find =
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/ =
-name "*MagickWand*" | grep so
> =
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/image=
magick-dbg/usr/lib/.debug/libMagickWand-7.Q16HDRI.so.3.0.0
> =
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/image=
magick-dev/usr/lib/libMagickWand-7.Q16HDRI.so
> =
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/image=
magick-doc/usr/share/doc/ImageMagick-7/www/api/MagickWand/MagickWand_8h-so=
urce.html
> =
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/image=
magick/usr/lib/libMagickWand-7.Q16HDRI.so.3.0.0
> =
tmp-glibc/work/core2-64-oe-linux/imagemagick/7.0.6-r0/packages-split/image=
magick/usr/lib/libMagickWand-7.Q16HDRI.so.3
>=20
>=20
> root@qemux86:~# cd /usr/lib/
> root@qemux86:/usr/lib# ln -s libMagickWand-7.Q16HDRI.so.3 =
libMagickWand-6.Q16HDRI.so.3
> root@qemux86:/usr/lib# ln -s libMagickWand-7.Q16HDRI.so.3.0.0 =
libMagickWand-6.Q16HDRI.so.3.0.0
> root@qemux86:/usr/lib# python
> Python 2.7.13 (default, Aug  1 2017, 17:41:39)
> [GCC 7.1.0] on linux2
> Type "help", "copyright", "credits" or "license" for more information.
> >>> from wand.image import Image
> Traceback (most recent call last):
>  File "<stdin>", line 1, in <module>
>  File "/usr/lib/python2.7/site-packages/wand/image.py", line 20, in =
<module>
>    from .api import MagickPixelPacket, libc, libmagick, library
>  File "/usr/lib/python2.7/site-packages/wand/api.py", line 206, in =
<module>
>    'Try to install:\n  ' + msg)
> ImportError: MagickWand shared library not found.
> You probably had not installed ImageMagick library.
> Try to install:
>  http://docs.wand-py.org/en/latest/guide/install.html
>=20
>=20
>>> --- .../imagemagick/{imagemagick_7.0.5.bb =3D> imagemagick_7.0.6.bb} =
     | 6 +++--- 1 file changed, 3 insertions(+), 3 deletions(-) rename
>>> meta-oe/recipes-support/imagemagick/{imagemagick_7.0.5.bb =3D> =
imagemagick_7.0.6.bb} (96%)
>>>=20
>>> diff --git =
a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb =
b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb similarity =
index 96% rename from
>>> meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb rename to =
meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb index =
b8ee6e7be..6f967c3a1 100644 ---
>>> a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb +++ =
b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb @@ -8,11 =
+8,11 @@ DEPENDS =3D "lcms bzip2 jpeg libpng
>>> librsvg tiff zlib fftw freetype" # Important note: tarballs for all =
patchsets within a version are deleted when # a new pachset is created. =
To avoid multiple patches for each
>>> patchset, try to # update to the last pachset of a version -PATCHSET =
=3D "6" +PATCHSET =3D "4" SRC_URI =3D
>>> =
"http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET=
}.tar.xz \ " -SRC_URI[md5sum] =3D "dfaa2bd61f65d67ea8d5307ed6cd197f" =
-SRC_URI[sha256sum] =3D
>>> "f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab" =
+SRC_URI[md5sum] =3D "079a857268536862148b00efcf3ad75a" =
+SRC_URI[sha256sum] =3D
>>> "5fe1ce7d78befb5c8aa7f8ae69710d0f78063d2e3a35c656521a3ce468ea733b"
>>>=20
>>> S =3D "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
>>>=20
>>>=20
>=20
>=20
> --=20
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, =
Canada, K2K 2W5


