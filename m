Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 676B078C2E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 17:36:53 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id b5-v6so1536003qkg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 10:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qyj839iwgG6g0t933M4vggpZ/HZ6X2wXlCwM584vS38=;
	b=vGG7PIIgZTzbPzP09kOgjRf4FH/3WJcQOD8UcXJKJXMJqDwxYdqdVljkYHG8cwGLLd
	6awFKykR/UP6viXMOSb2FJldnhGZSfIEfl7BCxghFhvQEK3z3XLio8wKuL8o+zBKK9KI
	/sMoWatz6dgxJOJu94pH3oP4I3yF4z048yDDJobeths2KhPZx3WXJfMSLXd3crWuz0zT
	feEFfJ8sLelXx5uYu9KfyK4E0qKbv9pc5xZYrh3hNXom8NS22d/YTwz+ugefR/e9UkmR
	v5xG1E4pQUj3PossCJ0XUx/YlTVT2UpESYo6Qrtkja/T10dWXlN0UXPDPKG02TWQ9iAJ
	nhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qyj839iwgG6g0t933M4vggpZ/HZ6X2wXlCwM584vS38=;
	b=e+7DBcm7S172cpqaXlUJebvsy84odZr0dswirs8Y20xalRM5/cwqaJ8k2nVslqx/65
	YM4y3Uz+P3ZCrfhh2UTiynT0GLy3IQcPCQwPsSdrcCHkKhqxJkSql+RTCYYwm4jpdem4
	Xoq6C5qlVyt3AVpcScjjZ/fqcOa19g+CdOFnJ+wPNcMFq38YmoQG1bKtFTm80YxXtRSB
	rn+S8Cn/Z0M/rkgxLjWWM0MJcCnRy5auwerGpD/38Q+2167W+Q/yHOGXPZSYRXgJUOwN
	IaQMoiJnew84irl0spzwu9ZKV8jvVcC4D8UAaqwDdoEaGzJ8BM74sY9oTqmawladMtHV
	YaoQ==
X-Gm-Message-State: AOUpUlFPgrJLkNH9JmmXuIHb4yRTXS0Zkl0cXh9ux/iavpDzKCgrr/cK
	QvW7m7pgt8PgpTqBagTJgzicor+tArEGzH+6sQs=
X-Google-Smtp-Source: AAOMgpcTwMRTP2EdV7/eInS4RaQTC1jgMR0m7FgY5uP1rc3VE8OiWAzVZ2S6puEnqNFsM8rCxaK+FC1ydAZp9DxDJMU=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr2577543qke.12.1532626614072; 
	Thu, 26 Jul 2018 10:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <1532584693-20420-1-git-send-email-lukaszgardon555@gmail.com>
In-Reply-To: <1532584693-20420-1-git-send-email-lukaszgardon555@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 10:36:28 -0700
Message-ID: <CAMKF1sq=6bQ65uF75ESDUmf59UELnxbmqPrphzuq7M2=URYDuA@mail.gmail.com>
To: =?UTF-8?B?xYF1a2FzeiBHYXJkb8WE?= <lukaszgardon555@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCHv3] python-tornado: upgrade to version 5.1
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
X-List-Received-Date: Thu, 26 Jul 2018 17:36:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please address Tim's review as well. See
https://github.com/tornadoweb/tornado/blob/master/LICENSE
and change recipe to <name>_5.1.0.bb
On Wed, Jul 25, 2018 at 10:58 PM =C5=81ukasz Gardo=C5=84
<lukaszgardon555@gmail.com> wrote:
>
> License-Update: Changed begin and end line range, due to
> removed shebang line from licence file (setup.py) - no
> changes in the license terms.
>
> Signed-off-by: =C5=81ukasz Gardo=C5=84 <lukaszgardon555@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-tornado.inc              | 6 =
+++---
>  .../python/{python-tornado_4.5.3.bb =3D> python-tornado_5.1.bb}       | =
0
>  .../python/{python3-tornado_4.5.3.bb =3D> python3-tornado_5.1.bb}     | =
0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-tornado_4.5.3.bb =3D>=
 python-tornado_5.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-tornado_4.5.3.bb =3D=
> python3-tornado_5.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-tornado.inc b/met=
a-python/recipes-devtools/python/python-tornado.inc
> index 29d10da..8acb432 100644
> --- a/meta-python/recipes-devtools/python/python-tornado.inc
> +++ b/meta-python/recipes-devtools/python/python-tornado.inc
> @@ -4,10 +4,10 @@ By using non-blocking network I/O, Tornado can scale to=
 tens of thousands of ope
>  polling, WebSockets, and other applications that require a long-lived co=
nnection to each user."
>  HOMEPAGE =3D "http://www.tornadoweb.org/en/stable/"
>  LICENSE =3D "Apache-2.0"
> -LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D3;endline=3D15;md5=3D8=
d463fc66ff8f275354ffe88d1896e12"
> +LIC_FILES_CHKSUM =3D "file://setup.py;beginline=3D2;endline=3D14;md5=3D8=
d463fc66ff8f275354ffe88d1896e12"
>
> -SRC_URI[md5sum] =3D "a5fc7fd4aea94867609a491ce65786f1"
> -SRC_URI[sha256sum] =3D "6d14e47eab0e15799cf3cdcc86b0b98279da68522caace2b=
d7ce644287685f0a"
> +SRC_URI[md5sum] =3D "bd264851c409f926d1dae1ad5055d28d"
> +SRC_URI[sha256sum] =3D "4f66a2172cb947387193ca4c2c3e19131f1c70fa8be470dd=
bbd9317fd0801582"
>
>  RDEPENDS_${PN} +=3D "${PYTHON_PN}-compression ${PYTHON_PN}-numbers ${PYT=
HON_PN}-email \
>                     ${PYTHON_PN}-pkgutil ${PYTHON_PN}-html ${PYTHON_PN}-j=
son ${PYTHON_PN}-certifi ${PYTHON_PN}-threading \
> diff --git a/meta-python/recipes-devtools/python/python-tornado_4.5.3.bb =
b/meta-python/recipes-devtools/python/python-tornado_5.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python-tornado_5.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb=
 b/meta-python/recipes-devtools/python/python3-tornado_5.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-tornado_4.5.3.bb
> rename to meta-python/recipes-devtools/python/python3-tornado_5.1.bb
> --
> 1.8.3.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

