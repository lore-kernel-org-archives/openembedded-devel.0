Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDAA47842D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 16:36:52 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id h75so3206528pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A24BqOfbdEbqqmzER7HzgL91lhPyTz+2HnH5H5bZk5s=;
	b=HR1SbSYd1InnUdS54o4tIO/gciRX4MMgw0jhS/JCOoa7ZR97PltMdzHMLRwyOL9dhI
	HtKCzm5d/uJgTYDyNTE/dQwyabdbp8DIR2CetdHVKoVVR0KPMnvkCfIgkLbHqS4E7USQ
	sbwLgNRduEbBAA6AVeCEcLit/KhnuXImrPBCAXM9eED8/t848adze8GEqz67gnQV1amy
	e3WDgzCF387a8cBlgELrgiILU55x8cbu3MtWKhGGgDbQnIRxbq/WySZX/fGwT1uAnorM
	fmivVsBNwMHROCttZ++hFHzLlu9JsP8PsG08awOMpcSXuS9F9BG1pX3wJ2U/t9A/wdy1
	Kqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A24BqOfbdEbqqmzER7HzgL91lhPyTz+2HnH5H5bZk5s=;
	b=OJom9Dcv6/s0+RFtIWVbKpdWFlQi+E6nmWcyBYTaTSgBJGa+oRk67sA7SXFr0LhHty
	DkWdFE3VhUZ+o+SccXK2tw0ZWMqQLqXk3d5a9NxnBIewCoQNpr1j/K7BRxT6uxtTm+MN
	54jw9td8Z1DDKc8VXyDMTy8MtTP5datPBdxODfm/bMkflqCYAfeREETww5PGPcifwhYo
	UltqqihatytBaWkBFNra0fqxI5NHb9U5ynhehffrgbOxDRtpOOxhGibtVnwAAqeC0nc+
	LKqTZInDWuVas334f8Dz5ZIngELWtio1ThFf0RUxnD9TKiTy23i+WCbH3zyVru1H6eKa
	6NOQ==
X-Gm-Message-State: AHYfb5g42oZvlrvqHTtEGPS5U2MN67NyH96LFEJdEQnX2yJzVDapfB6g
	FM5JyxpHPqtX/U72sKJNeQNdj8i8Yg==
X-Received: by 10.84.138.129 with SMTP id 1mr14032135plp.223.1503160613791;
	Sat, 19 Aug 2017 09:36:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Sat, 19 Aug 2017 09:36:23 -0700 (PDT)
In-Reply-To: <20170819103325.16967-1-Martin.Jansa@gmail.com>
References: <20170819103325.16967-1-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Aug 2017 09:36:23 -0700
Message-ID: <CAMKF1srJyq2L8eqUUaGCJ+ZUZChOPAniS0OJF-hAuF+s3sQHZA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebengine: disable SECURITY_STRINGFORMAT to fix the build
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
X-List-Received-Date: Sat, 19 Aug 2017 16:36:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 19, 2017 at 3:33 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * meta/conf/distro/include/security_flags.inc adds -Wformat and
>   -Wformat-security, but openh264 adds -Wno-format after that causing
>   build to fail
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-qt/qt5/qtwebengine_git.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
> index 45b885c..830e640 100644
> --- a/recipes-qt/qt5/qtwebengine_git.bb
> +++ b/recipes-qt/qt5/qtwebengine_git.bb
> @@ -34,6 +34,14 @@ EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
>  "
>  EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja -no-feature-system-gn"
>
> +# chromium/third_party/openh264/openh264.gyp adds
> +# -Wno-format to openh264_cflags_add
> +# similarly chromium/third_party/openh264/BUILD.gn for newer qtwebengine
> +# causing following error, because -Wformat-security cannot be used together with -Wno-format
> +# cc1plus: error: -Wformat-security ignored without -Wformat [-Werror=format-security]
> +# http://errors.yoctoproject.org/Errors/Details/150333/
> +SECURITY_STRINGFORMAT = ""
> +

If its not happening in lot of files may be doing something like

 QT_WARNING_PUSH
 QT_WARNING_DISABLE_GCC("-Wformat-security")
#ifdef __clang__
QT_WARNING_DISABLE_CLANG("-Wformat-security")
#endif
....

QT_WARNING_POP

is more targeted as it can be done per file.

>  # To use system ffmpeg you need to enable also libwebp, opus, vpx
>  # Only depenedencies available in oe-core are enabled by default
>  PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
> --
> 2.14.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

