Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 54DE66D545
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 01:03:12 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id t6so8527341ios.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2019 18:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=weqEC5DiUG2ZdcKdTSYGAPZ77PMIJ/8NQz482itnhlk=;
	b=dzW/YznfdJTlDL/84sWqjp/Wcp0hbiWb/ZPyJLUfkJUki7nhqFSxo2p9B1M80H3nqU
	6JukM162lkqJUZnETaQkbaROIkA1C931zhZNU4tbiD5UwXhAI8basiGZ6RTzIr5hDiPg
	jqJKcd8U1QgsvixqYN/vGFy7QWQSRD6YMET/g6yrTzm7fVaXdYXS8doUkPkfuNe5o+Vc
	PYN2HEh4gRlQGbQrO6HHNN2dwT2n8FigWWKKbxK2a3duipvLxOWKXR8cwSfukUpH2BbR
	D3aoGPw7y5rfRsjXl/dxZ4prk7sM6hSdtZefyhTNmCZm+tSgXCpuEUoop8Umb8qBUhws
	ULGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=weqEC5DiUG2ZdcKdTSYGAPZ77PMIJ/8NQz482itnhlk=;
	b=bYmKfliI9+cY1TWdrtvWjx/L/135pfIckolkpHYrGsMjU5TtVhyd78fhThbj9rwK1D
	W7tq4I5m9zmz2DJKSAXQksuRsOTWT/AFXIknEyyLv1A1wORgKEwjT453Aq8b/vukQ3Md
	jUwCofJGKunt5ig9SgBrey6AlaNgDq+Pz0OmM7s0jK/11GNmKc79oH1y5S3TfUo7FWsV
	l4DyTHbkp9rXMED/SG+49eWMvt7gmcxnmdpB4VVTyy4S+6pKQhZxZWWWNDrqm25vWR3I
	xk8ytwQ0cp6Y8ZPMUOFzPuXDITaURZQ/lBr3akLUB68EJxzweusAugS5e4yc3q4a7zj9
	zRBQ==
X-Gm-Message-State: APjAAAXA61NwmEtrQa/GOArRb0FWO+yhJY3p/k3HpApyk4x1noOkwTMb
	mW8k8InOwWKF7JIP4hnaoKAhgxg5hSr1wEzqe+c=
X-Google-Smtp-Source: APXvYqwrhpZZBudWAvWfZep56/UARUxv4krxrA/TobG5uqiRWg6NnGf1DGpsHIt+5Hiag3eAamL0uAuBx9EvxHPOstA=
X-Received: by 2002:a5d:9904:: with SMTP id x4mr5593260iol.198.1566262993135; 
	Mon, 19 Aug 2019 18:03:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190819021234.1470-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190819021234.1470-1-yuanc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 19 Aug 2019 18:03:02 -0700
Message-ID: <CANx9H-Ax0-Lmm-mzabDf-mYH3jajd6XgCSGEC85bVk_tzSXadA@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH v2] python-flask-pymongo: upgrade 0.5.1 -> 2.3.0
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
X-List-Received-Date: Tue, 20 Aug 2019 01:03:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2019 at 7:13 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote=
:

> Add depends of python-vcversioner and python3-vcversioner.
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  meta-python/recipes-devtools/python/python-flask-pymongo.inc        | 6
> ++++--
>  ...{python-flask-pymongo_0.5.1.bb =3D> python-flask-pymongo_2.3.0.bb} | =
0
>  ...ython3-flask-pymongo_0.5.1.bb =3D> python3-flask-pymongo_2.3.0.bb} | =
0
>  3 files changed, 4 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-flask-pymongo_0.5.1.b=
b
> =3D> python-flask-pymongo_2.3.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{
> python3-flask-pymongo_0.5.1.bb =3D> python3-flask-pymongo_2.3.0.bb} (100%=
)
>
> diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> index fb2d6ed..bc41fd2 100644
> --- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> +++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
> @@ -5,9 +5,11 @@ SECTION =3D "devel/python"
>  LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D
> "file://flask_pymongo/wrappers.py;beginline=3D1;endline=3D24;md5=3D424c4e=
1047d28e01b4e4634a069c019d"
>
> -SRC_URI[md5sum] =3D "d7a1b717f27154e1f3a355f8ec2467d6"
> -SRC_URI[sha256sum] =3D
> "2baaa2ba5107d72b3a8bd4b5c0c8881316e35340ad1ae979cc13f1f3c8843b3d"
> +SRC_URI[md5sum] =3D "94df71e6800b1d7915cc91a74b70f959"
> +SRC_URI[sha256sum] =3D
> "620eb02dc8808a5fcb90f26cab6cba9d6bf497b15032ae3ca99df80366e33314"
>
>  PYPI_PACKAGE =3D "Flask-PyMongo"
>
> +DEPENDS =3D "python-vcversioner python-vcversioner-native
> python3-vcversioner python3-vcversioner-native"
> +


Nacked-by: Tim Orling <ticotimo@gmail.com>

This is not the right way to do this. Use ${PYTHON_PN} otherwise you are
forcing build of both python 2 and python 3 packages every time. We will be
moving python 2 support out of meta-python in preparation for Python 2 EOL
next year.

Also, does it DEPEND (build time dependency) on both the native and target
vcversioner? That doesn=E2=80=99t feel right.

>
>  RDEPENDS_${PN} =3D "${PYTHON_PN}-pymongo ${PYTHON_PN}-flask"
> diff --git a/meta-python/recipes-devtools/python/
> python-flask-pymongo_0.5.1.bb b/meta-python/recipes-devtools/python/
> python-flask-pymongo_2.3.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/
> python-flask-pymongo_0.5.1.bb
> rename to meta-python/recipes-devtools/python/
> python-flask-pymongo_2.3.0.bb
> diff --git a/meta-python/recipes-devtools/python/
> python3-flask-pymongo_0.5.1.bb b/meta-python/recipes-devtools/python/
> python3-flask-pymongo_2.3.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/
> python3-flask-pymongo_0.5.1.bb
> rename to meta-python/recipes-devtools/python/
> python3-flask-pymongo_2.3.0.bb
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

