Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6B89277685
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 17:17:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id i88so12690501pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=O+mTTLEvCybl1f96E6E78BrhLme4VHG+UZTvBNI6Qec=;
	b=aNn6P5IOnfokRP22Qv8Nf0Yd0NXS/k1ID5a6jeEf/CSq3qmi0AHBWK1bDZwQ2wbqvj
	yOXLpq6Qkk94Wzym3Mg3UCaxcnCFYGj+onkDzUj6MlyQ0tKZ/ifSE+hLSrkysGGAYihk
	AFEKQGAJbG3bFp6Hgd/tMKuEHDfYOmGHE4ZuUnUTca3eI2P/CNXPWgfwyUsTqcfv1E8z
	4/oW92t/Gc3xxxnwNj5ytgXR+rSvxzwzLwayQ/4n1o4JWn21djEEVBEK8MwgEA5uAsrP
	XbD1dmZ2iSQnNI308AOnuA+xbaqLSOHHoNevg3LCamu9Jy0uezxgIe/7eM3rDDPVmtle
	YZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=O+mTTLEvCybl1f96E6E78BrhLme4VHG+UZTvBNI6Qec=;
	b=jepwguXu2xyeis4oGO0xBdUknK5HcvjiNmqIHNz1m1GfndwneXz8hJPm2rrvb8+K1Z
	QM83Ewuq8Nh0Uw/gzTLr3STvADUN48IlwDzK2PZTj1h9Ji7GN4e4cyxefoz5JcLCha/f
	i4vJA2vebGJYlFQn5+mg9Q4Lf7i16CoKztX/HDwrCM8SH/zcz6ZE7PD0oW+zfkkI3fvT
	C977cF1w8CD6jHGzHOLKhtBPuiWKO8D/FlrXKUY9tJeXTYurV8E0mzMOTzvBVnM+Lhv+
	63yZawzrXIT51KUvDOZWu31sBUqa2f6Cm24tyN+hN3HzpQ66IYOzmAdoza59Kca1kSai
	SP2g==
X-Gm-Message-State: AIkVDXJRdYhgSdPgh10QR+YPRMsQumBhbyzBafdbAA0VEqDLJ3OAEDlqon37i/8sGcQZ+Q==
X-Received: by 10.84.210.233 with SMTP id a96mr21198049pli.72.1482427072297;
	Thu, 22 Dec 2016 09:17:52 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:dc6c:df58:7743:431c?
	([2601:646:8882:b8c:dc6c:df58:7743:431c])
	by smtp.gmail.com with ESMTPSA id
	c142sm56124596pfb.23.2016.12.22.09.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Dec 2016 09:17:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <B2EC9E23-FB3F-44F0-9711-1589CEF1C21A@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Date: Thu, 22 Dec 2016 09:17:52 -0800
In-Reply-To: <20161222165029.GE3544@jama>
To: Martin Jansa <martin.jansa@gmail.com>
References: <20161213234618.31312-1-ricardo.ribalda@gmail.com>
	<20161213234618.31312-3-ricardo.ribalda@gmail.com>
	<20161222165029.GE3544@jama>
X-Mailer: Apple Mail (2.3259)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v2 3/8] opencv: Add missing depends
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
X-List-Received-Date: Thu, 22 Dec 2016 17:17:51 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 22, 2016, at 8:50 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Wed, Dec 14, 2016 at 12:46:13AM +0100, Ricardo Ribalda Delgado =
wrote:
>> contrib/modules/sfm depends on glog, gflags and libeigen. The =
CmakeList
>> does not seem to provide a way to disable/enable its build.
>=20
> There is also floating dependency on tesseract as shown in last test
> dependencies build:
>=20
> opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-text rdepends on =
tesseract,
> but it isn't a build dependency, missing tesseract in DEPENDS or
> PACKAGECONFIG? [build-deps]

There seems to be no knob for tesseract in openCVs build system. but =
extensions modules needs it may be
adding a knob for OPENCV_FIND_TESSERACT will solve it. I also notices =
that SRC_URI should be changed as well
git://github.com/Itseez/ <git://github.com/Itseez/> has moved to =
git://github.com/opencv <git://github.com/opencv>

>=20
>>=20
>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>> ---
>> meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb =
b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> index cf41d894cf7f..a5d681e79ca2 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
>> @@ -53,7 +53,7 @@ PACKAGECONFIG ??=3D "eigen jpeg png tiff v4l libv4l =
gstreamer samples tbb  gphoto2
>>=20
>> PACKAGECONFIG[amdblas] =3D =
"-DWITH_OPENCLAMDBLAS=3DON,-DWITH_OPENCLAMDBLAS=3DOFF,libclamdblas,"
>> PACKAGECONFIG[amdfft] =3D =
"-DWITH_OPENCLAMDFFT=3DON,-DWITH_OPENCLAMDFFT=3DOFF,libclamdfft,"
>> -PACKAGECONFIG[eigen] =3D =
"-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeigen,"
>> +PACKAGECONFIG[eigen] =3D "-DWITH_EIGEN=3DON,-DWITH_EIGEN=3DOFF,libeige=
n gflags glog,"
>> PACKAGECONFIG[gphoto2] =3D =
"-DWITH_GPHOTO2=3DON,-DWITH_GPHOTO2=3DOFF,libgphoto2,"
>> PACKAGECONFIG[gstreamer] =3D =
"-DWITH_GSTREAMER=3DON,-DWITH_GSTREAMER=3DOFF,gstreamer1.0 =
gstreamer1.0-plugins-base,"
>> PACKAGECONFIG[gtk] =3D "-DWITH_GTK=3DON,-DWITH_GTK=3DOFF,gtk+3,"
>> --=20
>> 2.10.2
>>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com =
<mailto:Martin.Jansa@gmail.com>

