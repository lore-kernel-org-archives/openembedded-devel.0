Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 20AEF606D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 21:31:38 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g53so6368445wra.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 13:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a3qaBSsT7w8yK/n/tsBMWm0Cb2Okp9kzBSQ/MLXSGGo=;
	b=jXcoAv1iT9DecugxGo2eel7a/ZDCWgDvAtBD+29iDlm8MnQNqn1j5pTRkXOUoRh1cb
	PBmWSHdFmNUFtC9UMJn+Jo4XMQJArOqvT4j0rxqVJ8S/N+fAezwjMM2R3AirfQVG+1I2
	4cKYomwb3Cvx2lkL0GPMK7xtnlqqpWRvDz4Xc4EGOCUDuq7PWvRq6cxbY+flURsnXJvh
	xVc+XfopomNI9ylvjEHREibenatfUGskCfSd5e2NhrFyBoxZvNGLmqTSYflv2Nx3att5
	9PFEuiwcq4usqhvxSO84gGmWSE8s2/yRWW9naysSu5ugF+6T7UhSMoTd3ghJY7IFvsh7
	6uUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a3qaBSsT7w8yK/n/tsBMWm0Cb2Okp9kzBSQ/MLXSGGo=;
	b=PSzGZ8oCNgTozv+l65psQIIqKZD/hVVOpeD26djwIVWJ/amx8OVeM2own77+lur4Tx
	/yri6Dnq6w0tsc2RkqT0cQ8/9PRUyWiUDde5trdbAuT4x8Ytbr0OPVUHED87FoCwL7X2
	GQVZpqtvCY1iJS01oSlkxxXVrFg5r9PMM7GzfifIsZh4neUy7DMH9MapxDtJBS8s5ZyC
	KlGfiJSI7eLbi5q/ZN7VuZqtPYaO0nKvDktXB5ZCZh/WAS46hrjR8YvXPeA9z2r9WPTV
	DJjZJpnMcJHPfBEeQ5h13UxgYyDcaPxYvUqtSgO/+ZoR0tLs+cZHtDifzkwGYE3xXV1z
	GQlw==
X-Gm-Message-State: AKGB3mIG9PSy67w/eT4//PMUumXayL+oU4GYdB6NrULP8gAK+7peRgU5
	VC1G4Ry9KgoORtOKGJ8u4Xt/U0EYJltPosRzHrc=
X-Google-Smtp-Source: ACJfBosUhHeEhkmB5GrgYV7S6dw+XLq9hJbCXwElAgttFqWJYOkNZF1Tdn5Kq1BOBvo5HyB+m0IDAPVtmHwz5O96iTY=
X-Received: by 10.223.144.41 with SMTP id h38mr7539117wrh.228.1513287099548;
	Thu, 14 Dec 2017 13:31:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Thu, 14 Dec 2017 13:31:39 -0800 (PST)
In-Reply-To: <20171214100929.11094-2-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
	<20171214100929.11094-2-schnitzeltony@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 14 Dec 2017 13:31:39 -0800
Message-ID: <CAJ86T=V-2063Upvq+YU+Md4b5GiwN1O2S9eeiKDG2Hrh+y2SXA@mail.gmail.com>
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
X-List-Received-Date: Thu, 14 Dec 2017 21:31:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2017 at 2:09 AM, Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
> Building yoshimi failes otherwise with many errors as:
> | error: <sysroot>/usr/lib/libfltk.a(Fl_File_Browser.cxx.o): requires uns=
upported dynamic reloc R_ARM_THM_MOVW_ABS_NC; recompile with -fPIC

From that error it looks more like a bug in whatever is trying to link
a static library (libfltk.a) into something which expects to be
linking with a shared library.

If so, then forcing the fltk static libs to be PIC is just a
workaround rather than a real fix.

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

