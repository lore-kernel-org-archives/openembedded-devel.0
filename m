Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id ACC9C6C99C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:09:56 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kl14so3865611pab.25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=XEiTCbG7HtAJ0pH+oGyF3UATlSPEX96kRRZxLZtW4K8=;
	b=YBGf5imFQwNiGxzQw6L/bxKkozhGuN67rIPLP+Dd+kuoTeqJ3dZIG1nrlX1cg1cCtd
	tgP46r91je8AdmrW6MxZIABsxJWwuxE3XOqCE8mYoZfng8nm5j2BWHrG2Zx0gA8yal4j
	tjz0zSHC7e3iyP0k5R4HQ9wph1HX136ieuColzvCHohx03Uo+lUvt5ockpN1NUzaQKXT
	kMnboGzPOo8Zdzl8Wfp4Z4nKhvZBYTI+/+OZlIDI19s+N7/0fCRC/hhXx5znA/ErmL4/
	cBjWZiqbRf/irTGzOfKVY+sTvclUDvYY3tsGWShl/mRPwheTxHGf6IjI2ihb/BZj+Yam
	Zg2w==
X-Received: by 10.66.250.138 with SMTP id zc10mr29322178pac.72.1380038998226; 
	Tue, 24 Sep 2013 09:09:58 -0700 (PDT)
Received: from [172.23.9.234] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	yg3sm46683400pab.16.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Sep 2013 09:09:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1380031928-29350-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Date: Tue, 24 Sep 2013 09:09:56 -0700
Message-Id: <054B3A27-3D25-4794-A81B-9C78A920FDC1@gmail.com>
References: <1380031928-29350-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1380031928-29350-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1510)
Subject: Re: [meta-oe][PATCH 2/2] opencv: adding libeigen dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2013 16:09:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Lukas

Thanks for patch. while you are at it. Can you convert this to be a =
PACKAGECONFIG as well ?


On Sep 24, 2013, at 7:12 AM, Lukas Bulwahn =
<lukas.bulwahn@oss.bmw-carit.de> wrote:

> In the opencv's CMakeLists.txt under Optional 3rd party components,
> the option "WITH_EIGEN" is by default ON. Hence, this commit adds
> the libeigen dependency to opencv.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
> meta-oe/recipes-support/opencv/opencv_2.4.3.bb |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb =
b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> index 39b608a..21a4f06 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.3.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://include/opencv2/opencv.hpp;endline=3D41;md5=3D6d690d8488a
>=20
> ARM_INSTRUCTION_SET =3D "arm"
>=20
> -DEPENDS =3D "python-numpy v4l-utils libav gtk+ libtool swig =
swig-native python jpeg bzip2 zlib libpng tiff glib-2.0"
> +DEPENDS =3D "python-numpy v4l-utils libav gtk+ libtool swig =
swig-native python jpeg bzip2 zlib libpng tiff glib-2.0 libeigen"




>=20
> SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/opencvlibrary/opencv-unix/${PV}/OpenCV-${PV}.tar.bz=
2 \
>            file://opencv-fix-pkgconfig-generation.patch \
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


