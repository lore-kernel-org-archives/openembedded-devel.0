Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A154ECD1284
	for <webhook@archiver.kernel.org>; Fri,  5 Apr 2024 05:55:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4870.1712296500776237382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 22:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VtbUJ/L0;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4163181a7ceso254865e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 22:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712296499; x=1712901299; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYYUAB2RN40TdhsMdn3yYVxzpuO64lVSozlirYljoFA=;
        b=VtbUJ/L0+KxJ54iMf5vR6h8QCO5qPmFYN5YD3PVsDlOoQ6RxuaO8scv3Wwvye0uXZ1
         fwZoaBTgN6IMugTwBs2xCHTq6OpLqkYLtluSluewnk5XJ1b89hLHpKEjjlqILE2rNR3k
         sLxKFtt4OlMPbuNSw18C5dTXytqCYFEOHKbENE7wdmxT0CNb/VeMS4LTd7ULkdeyAGP+
         bIwY04/DJ9qqv7JXsz5y0fVvET687FLi7Mw2L18g/5IircTraAW1yBY8b2mX4UTi9/Wq
         xMe4uy7id2GBSL4hlwyYt/C5+74PLEZheHJByXHXkT/nCLlf5NRTMrE4A1e7+s07n6/M
         7c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712296499; x=1712901299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYYUAB2RN40TdhsMdn3yYVxzpuO64lVSozlirYljoFA=;
        b=JQYQOMbLocaEtY574jbLWoedS07Wt+zzc6wgxOKk3zIx9OmnsEvOMinbHyy1f4w5HN
         rLaZE5sMsRfINGfI8uGAcywJYNIPlfgT+8gkhwQRkSSEbKnXQXZ3fMYAwpEw4/IMYNcb
         GOLsLpCFJqEGtCTHWjg6JJfLbY70Ud4NPZsPxGtIV9caAHQ5Wxw3cgmD27v3nxgQEc76
         AxReowJw+TzxWf1/DyRHYlD4H+NvTt1aQozAx5busqdRrZIhwa4W2Vt8tdC7DiymkNg5
         QfbHOtyWeHyS68G+BmGqc9J3DIlLxPgBzofBPWZNmo49GI3q8in5ft55j+wTWbWxBfOO
         f46w==
X-Gm-Message-State: AOJu0YzbEvjjtACVegjIGFhpY/Mp69Scn9mW0xHmUCMwX9DYYupLg0eY
	9rHULQrowOKNdoupfXqJnlurA30+h0KC54+w5tGLzZpjNFPFZ5Sc9/ePRAkKoE1lSh2DEJ+MCkQ
	1QHv5QfL81AWrye+R/XTQBkGc9AQ=
X-Google-Smtp-Source: AGHT+IEbMAZTvn/Pkr/TViXSvu1iuITlTPvdbmcF8AZ5msEB/nJOFM8hiYlYgVhoBqV+DyCiDhPARADY0n3EYX7pW3g=
X-Received: by 2002:a5d:4706:0:b0:343:3542:b6aa with SMTP id
 y6-20020a5d4706000000b003433542b6aamr244746wrq.58.1712296498847; Thu, 04 Apr
 2024 22:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240402054947.10487-1-f_l_k@t-online.de>
In-Reply-To: <20240402054947.10487-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 5 Apr 2024 07:54:47 +0200
Message-ID: <CA+chaQe_3orTvmZcOJ1f0zaVSs4rPa0ySFZimpbfpiBKvitLgg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2] libjxl: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Apr 2024 05:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109812

I'm seeing build failure in 32bit arm builds (with multilib):

lib32-libjxl/0.10.2/recipe-sysroot-native/usr/lib/arm-oemllib32-linux-gnuea=
bi/gcc/arm-oemllib32-linux-gnueabi/13.2.0/include/arm_neon.h:7526:1:
error: inlining failed in call to 'always_inline' 'float32x4_t
vcvt_f32_f16(float16x4_t)': target specific option mismatch
 7526 | vcvt_f32_f16 (float16x4_t __a)
      | ^~~~~~~~~~~~
In file included from
TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/thir=
d_party/skcms/skcms.cc:2315:
TOPDIR/BUILD/work/mach-oemllib32-linux-gnueabi/lib32-libjxl/0.10.2/git/thir=
d_party/skcms/src/Transform_inl.h:155:24:
note: called from here
  155 |     return vcvt_f32_f16((float16x4_t)half);
      |            ~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~

should I try to reproduce on some publicly available arm MACHINE (like
qemuarm) or is someone else seeing this as well?

On Tue, Apr 2, 2024 at 7:50=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> Import this recipe from meta-wayland, because it is a prerequisite
> for the Gnome desktop. The recently updated gnome-backgrounds package
> has converted most of the backgrounds to jxl and to keep them usable
> the gdk-pixbuf-loader for jpegxl must be provided. This is included
> in the libjxl package itself.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libjxl/libjxl_2.10.0.bb                   | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
>
> diff --git a/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb b/meta-oe=
/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> new file mode 100644
> index 000000000..0c4f79fdb
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/libjxl/libjxl_2.10.0.bb
> @@ -0,0 +1,42 @@
> +SUMMARY =3D "Reference implementation of JPEG XL (encoder and decoder)"
> +HOMEPAGE =3D "https://github.com/libjxl/libjxl/"
> +
> +LICENSE =3D "BSD-3-Clause"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a905a337cc228a1f68f0b5416f52=
a7f"
> +
> +inherit cmake pkgconfig mime
> +
> +DEPENDS =3D "highway brotli"
> +
> +SRC_URI =3D "gitsm://github.com/libjxl/libjxl.git;protocol=3Dhttps;nobra=
nch=3D1"
> +
> +SRCREV =3D "e1489592a770b989303b0edc5cc1dc447bbe0515"
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_OECMAKE =3D " \
> +       -DCMAKE_BUILD_TYPE=3DRelease \
> +       -DJPEGXL_ENABLE_PLUGINS=3DON \
> +       -DBUILD_TESTING=3DOFF \
> +       -DJPEGXL_WARNINGS_AS_ERRORS=3DOFF \
> +       -DJPEGXL_ENABLE_SIZELESS_VECTORS=3DON \
> +       -DJPEGXL_ENABLE_SJPEG=3DOFF \
> +       -DJPEGXL_ENABLE_BENCHMARK=3DOFF \
> +       -DJPEGXL_ENABLE_EXAMPLES=3DOFF \
> +       -DJPEGXL_ENABLE_MANPAGES=3DOFF \
> +       -DJPEGXL_ENABLE_SKCMS=3DON \
> +       -DJPEGXL_FORCE_SYSTEM_BROTLI=3DON \
> +       -DJPEGXL_FORCE_SYSTEM_HWY=3DON \
> +       -DJPEGXL_ENABLE_JNI=3DOFF \
> +       -DJPEGXL_ENABLE_TCMALLOC=3DOFF \
> +       -DJPEGXL_ENABLE_TOOLS=3DOFF \
> +"
> +
> +PACKAGECONFIG ?=3D "mime gdk-pixbuf-loader"
> +PACKAGECONFIG[gdk-pixbuf-loader] =3D "-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=
=3DON,-DJPEGXL_ENABLE_PLUGIN_GDKPIXBUF=3DOFF,gdk-pixbuf"
> +PACKAGECONFIG[gimp] =3D "-DJPEGXL_ENABLE_PLUGIN_GIMP210=3DON,-DJPEGXL_EN=
ABLE_PLUGIN_GIMP210=3DOFF,gimp"
> +PACKAGECONFIG[mime] =3D "-DJPEGXL_ENABLE_PLUGIN_MIME=3DON,-DJPEGXL_ENABL=
E_PLUGIN_MIME=3DOFF"
> +
> +FILES:${PN} +=3D "${libdir}/gdk-pixbuf-2.0 ${datadir}"
> +
> +CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
> +
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109774): https://lists.openembedded.org/g/openembedde=
d-devel/message/109774
> Mute This Topic: https://lists.openembedded.org/mt/105282918/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

