Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCD2783D3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 17:34:00 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id z187so5211485vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 10:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vghecBiDf0GgH58gxG+WBhlTkxY/jKmWhmMeeGl47pc=;
	b=SKUv0+TaNykIbveaEEeNr7j6kiu0oogA1/38t4LP0GEdDgpyGY4GxNFWFzlKLpuZIv
	reS/P5BmoFw6jXKK/NWwcjKtKk3+iW3QWAEV/MZRvSrQFrjGEyA5LtTG4DOFtfeI+fhH
	4R6pQ3vHDvUXfEM40djFn0VlO1u53THLNGdZ+o9PWZY+Q4ovQGzI6sOOt03D2D15J9h7
	V0y/mjuxig9cvZVXlzNIZ5It+wl5MujjR35gqcJMHC+yJW0J3oWMStJIIDSVN1NM7Av2
	X5OnkGOMPsQJK+5rAUzDPXd0z+mqec48XRX6b/gdJry+JZgGvmBYMnvOywxyqJPoE3F1
	0GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vghecBiDf0GgH58gxG+WBhlTkxY/jKmWhmMeeGl47pc=;
	b=mMmlB4c167xf2q72K/seWoY9PjPsoL0sWf6IgqMkUd++8k9rPor94kOOPCmBApEYiz
	8Jp4ugnz+EHhYfCwyfcgqyRFlMK84PYCXjf6/f+pBLKOGAJFrNBovBUP1WvB0cOihn3S
	Oow4OvG+RGVEffJB5gPYMT1WH2JhKMuDvRXzOdQ/sGLR6cof0BFWZ40huaexC5ctpDj5
	GwJDGI5SpHYlVlbDjlVR2WHgGsYDSYPJOtqoN1sw8JltAUeXZYAS9g0gEjDR5IWY15n/
	j6HCmQqPXns/UVDmiQEeQNAikaLFdxZWaEeY+PgcSnQbNOZpdu6MJdKsGZJmQWG27cg8
	fQGA==
X-Gm-Message-State: AHYfb5jmnsXTz8Jd3L7AgfaZLWwIbXWnOltaqTgIEQuGjhwteaYKBIxA
	ToLxrO1ZYwFyGXQbbe6OUYnn2PNwnA==
X-Received: by 10.31.156.135 with SMTP id f129mr8267548vke.90.1503164041594;
	Sat, 19 Aug 2017 10:34:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Sat, 19 Aug 2017 10:34:01 -0700 (PDT)
In-Reply-To: <CAMKF1srJyq2L8eqUUaGCJ+ZUZChOPAniS0OJF-hAuF+s3sQHZA@mail.gmail.com>
References: <20170819103325.16967-1-Martin.Jansa@gmail.com>
	<CAMKF1srJyq2L8eqUUaGCJ+ZUZChOPAniS0OJF-hAuF+s3sQHZA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 19 Aug 2017 19:34:01 +0200
Message-ID: <CA+chaQcOp=F=F0B=HzEO=Qfyk2Ai-_i5QGK1YF+Eqg2mfLZDew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sat, 19 Aug 2017 17:34:00 -0000
Content-Type: text/plain; charset="UTF-8"

The -Wno-format is added for whole openh264 directory (I haven't checked
why), so at least this whole directory shouldn't use -Wformat-security or
-Wno-format should be removed/restricted to some files from gyp files for
5.8 and from gn files for 5.9.

On Sat, Aug 19, 2017 at 6:36 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Aug 19, 2017 at 3:33 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > * meta/conf/distro/include/security_flags.inc adds -Wformat and
> >   -Wformat-security, but openh264 adds -Wno-format after that causing
> >   build to fail
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  recipes-qt/qt5/qtwebengine_git.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/
> qtwebengine_git.bb
> > index 45b885c..830e640 100644
> > --- a/recipes-qt/qt5/qtwebengine_git.bb
> > +++ b/recipes-qt/qt5/qtwebengine_git.bb
> > @@ -34,6 +34,14 @@ EXTRA_QMAKEVARS_PRE += "GYP_CONFIG+=use_system_yasm \
> >  "
> >  EXTRA_QMAKEVARS_CONFIGURE += "-feature-system-ninja
> -no-feature-system-gn"
> >
> > +# chromium/third_party/openh264/openh264.gyp adds
> > +# -Wno-format to openh264_cflags_add
> > +# similarly chromium/third_party/openh264/BUILD.gn for newer
> qtwebengine
> > +# causing following error, because -Wformat-security cannot be used
> together with -Wno-format
> > +# cc1plus: error: -Wformat-security ignored without -Wformat
> [-Werror=format-security]
> > +# http://errors.yoctoproject.org/Errors/Details/150333/
> > +SECURITY_STRINGFORMAT = ""
> > +
>
> If its not happening in lot of files may be doing something like
>
>  QT_WARNING_PUSH
>  QT_WARNING_DISABLE_GCC("-Wformat-security")
> #ifdef __clang__
> QT_WARNING_DISABLE_CLANG("-Wformat-security")
> #endif
> ....
>
> QT_WARNING_POP
>
> is more targeted as it can be done per file.
>
> >  # To use system ffmpeg you need to enable also libwebp, opus, vpx
> >  # Only depenedencies available in oe-core are enabled by default
> >  PACKAGECONFIG ??= "libwebp flac libevent libxslt speex nss"
> > --
> > 2.14.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

