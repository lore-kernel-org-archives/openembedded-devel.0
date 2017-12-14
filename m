Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD457875C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:30:55 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e14so3840993pgr.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ldBnrgXp+2o6Nbrf7oEUx/cfpO/AQT5u91KCeJxCpiQ=;
	b=TdD9kYaWWUDT49Qc3hsiPTYcUIIfkOFmOH2NuDzKa1/9KsCQFrgkJcFLxmzMvdFxJS
	I/ylk46Ngtj0hmkw+Nnq1n6v1rbKcpz7NMk/kz7mkfstQRnlQU3dWm3rsVCFU/l+1os6
	8AoIV4jfyuOQLghjbH822sn9DYp7h4RRCjdd12x9SHpaQ9vXOlZH8ZnsM3QXOSmroXWC
	WrAtOQf+YCBpU3lqm38OL6S7Sn1xCWDe5+VePrG8LTGLaj2EAkJMruD/G75wjvTOfI6h
	+EZM/Xb4Qi000n83yc/72rBRes/7WT/r3vHMOWSV6sZ9RlI70+JtkZZDipEnPi9Z9rwy
	7KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ldBnrgXp+2o6Nbrf7oEUx/cfpO/AQT5u91KCeJxCpiQ=;
	b=dbABX/TCYRIvDEyJupqpRwyEhaWvLC6xqiVCRHhrrs43qnTFoJlImDGaNrhkjYrc3D
	T7j5x0Jk7tWl1wk89JdcUqfbHkIIHm7IMyrjYq70GJ4ESQAMCUM9i6tJvMmwTUDij9KX
	gG+mhobv0v+8ihbnASnvoY54PLdkkO/L1t9BzFurHXYbiPG95dxBVZu162PWM1csFg81
	goFxHdbhs0l8SZQvBkAUp7pvl0dPpIBiNDIehDfENe5lBySzdOV86YmNlvq5jBQjus1B
	6srR5CiGLD+weehjnLz1LNBfqnCXIiXPyxWs2FDdHQs0ozadvDYubC6U4CqMTS85b01H
	DfBw==
X-Gm-Message-State: AKGB3mJxETZefyyy37FzcsgbbEKdqLTuw1mrSsjeKCJQH+V3Wn/bylrF
	YXIR8LNQjaeOtcqxX/TOD92P3FdLM4pE0cEi8vE=
X-Google-Smtp-Source: ACJfBotbR2mZNKjse9TPz9U4r/PEv/FRTs/MhTARAeJcTHf0BQ9YchnkPfWkThVw1W5pENU3lD4pGT5ii2RcM77qKfU=
X-Received: by 10.99.160.96 with SMTP id u32mr9281108pgn.25.1513272656662;
	Thu, 14 Dec 2017 09:30:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 14 Dec 2017 09:30:26 -0800 (PST)
In-Reply-To: <20171214100929.11094-2-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
	<20171214100929.11094-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2017 09:30:26 -0800
Message-ID: <CAMKF1so8LTwxZsGT1xXXX0eo=KCJwg4G3u4wYiR1VDkWef1VtQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] fltk: add -fPIC to compile flags
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
X-List-Received-Date: Thu, 14 Dec 2017 17:30:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 2:09 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> Building yoshimi failes otherwise with many errors as:
> | error: <sysroot>/usr/lib/libfltk.a(Fl_File_Browser.cxx.o): requires uns=
upported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-oe/recipes-support/fltk/fltk.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-suppo=
rt/fltk/fltk.bb
> index 542fd66..be76062 100644
> --- a/meta-oe/recipes-support/fltk/fltk.bb
> +++ b/meta-oe/recipes-support/fltk/fltk.bb
> @@ -14,6 +14,10 @@ EXTRA_OECMAKE =3D " \
>
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl', d)}=
"
>
> +# for sake of other packages linking against fltk libs
> +CFLAGS +=3D "-fPIC"
> +CXXFLAGS +=3D "-fPIC"
> +
I will test it out with PIE but
I wonder if it will be better to add this to the Makefiles.

>  PACKAGECONFIG[examples] =3D "-DOPTION_BUILD_EXAMPLES=3DON,-DOPTION_BUILD=
_EXAMPLES=3DOFF,"
>  PACKAGECONFIG[opengl] =3D "-DOPTION_USE_GL=3DON,-DOPTION_USE_GL=3DOFF,vi=
rtual/libgl"
>  PACKAGECONFIG[xinerama] =3D "-DOPTION_USE_XINERAMA=3DON,-DOPTION_USE_XIN=
ERAMA=3DOFF,libxinerama"
> --
> 2.9.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

