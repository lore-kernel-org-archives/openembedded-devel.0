Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3BEC83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 15:24:33 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.10470.1753802665174854689
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Jul 2025 08:24:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VsIYdwl1;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e8e0d1d8939so2244380276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753802664; x=1754407464; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHSsWncV4N9i7hMHqIpGF1eTtVNXRxlRkZkubY4zd8c=;
        b=VsIYdwl15H4t0O6BbdE+KYH7M5gpxyKkqLvS0PNAq4D24vfNtVNh1g/RsoorInmMNL
         gsL+EXSQMh+RSQMdDsUg1IpVTI5Ja7yGN86QV9jB2Y1YcxMu9syFhIivNeO2Fk4Guak3
         A+h2uKMvpRrdoegGImeTxZosy2sXmVI2lWjqX4SCY427P4m4YpW94lgZqq8Ut7idNVAX
         dOefn5fgVyY/QBBf66KcmPXJgow76pMFUph7s8/MNRcgrZG7uMeR/pcS5CKMJYzi978a
         Unz349ChXhehwf2mffQT9Bs2q3w0iMsZpG5oE3t4FdeVI4P49LL4nsyzjVsAv2kZqLQ8
         X3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753802664; x=1754407464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHSsWncV4N9i7hMHqIpGF1eTtVNXRxlRkZkubY4zd8c=;
        b=uUgwPROMCiUMU3ozS9GH6zr7+mSmhyOks9oT5g1E7QNfp5sqv0zqqYC0Blyj/VbJBX
         deft1hvlfFeHwkuWTkAoxvOOOfXQPPS031C0CLRmWqscNgegW+38I13qLEnh24EhoYbG
         ufls+dwpo7KujPpsS1qwryFe6re7PFiPsp5ehvrnnpH18hwvkKdcdEaAGivDDXLM9V9W
         b3uUxLuD01bv7iF0UwxNIJS5j0mHKrb2EJD7C0en3iFdqLfd5YoMr0JH0x1dEgW25NPr
         yTd23Ob7CAe+XdEXY8NFqCZu8k02EXudewtKqGtYUgbIRoNZtDwJqcIMogg7zVpKa02X
         FpyA==
X-Gm-Message-State: AOJu0YyjV5o0XpFEu+uQF/DGI3qjhsHyx2Qcqcj7mb+pvDT+cfY55Bnx
	YyjlHFkIWZg0dvtrZ+JGIK0wZU1vJEwCRnPMUULNOO8GFxCb6LK3BsoTi6goFGRb3hhkQOWX6By
	zyeew9itejfdpilnc4tLkBfhr2PGZWOg=
X-Gm-Gg: ASbGnctZLw6NXuKMeaY0yBMZ/HxOe2LRBNx0DQ/dazM8qfer2CqoD10oFgMKh4iyoXR
	l491EIVq14RpxsdJvhVhfdtzDK1We6uQCBO1MfR91am9xR1vbGDP9c04LQtLq6wfz3HaCgb/s0s
	CMlSXALv5wUNAWoaCIckpiYa6qaHphTKiF2MdQUw3RIQ+7fZDLJu6wEqIGIb9n9ORsp1mxr0P6m
	rVEDWriqHHwoxD6653oS9wlTKyEg7pnVzoUG6Q=
X-Google-Smtp-Source: AGHT+IGhFfSXuxW/Pge4tl6zdvCCdbhSIXvc9k/J4rtypBvNjpXBCdhVhnOIHwN27Qi8jrKwETamnA9WbMRDPcfMuiE=
X-Received: by 2002:a05:6902:1403:b0:e8e:2368:d660 with SMTP id
 3f1490d57ef6-e8e315eb0b0mr72415276.34.1753802664115; Tue, 29 Jul 2025
 08:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250728094518.1636494-1-kraghava@qti.qualcomm.com> <20250729065634.3055856-1-kraghava@qti.qualcomm.com>
In-Reply-To: <20250729065634.3055856-1-kraghava@qti.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2025 08:23:57 -0700
X-Gm-Features: Ac12FXxlmRKhdlc3O1n0N7i6rjVz7VDo9aBMiRJ6Iy4JGNyl4MgJ6z5SkY6Wxc8
Message-ID: <CAMKF1sqCSo3rA65a0d9ScACF_amGmAuF92oXfMqAzAbAwdRn=Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] opencv: install test and sample
 binaries, rename /usr/bin/shape
To: kraghava@qti.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Jul 2025 15:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118758

On Mon, Jul 28, 2025 at 11:57=E2=80=AFPM Keerthivasan Raghavan via
lists.openembedded.org
<kraghava=3Dqti.qualcomm.com@lists.openembedded.org> wrote:
>
> Install the test and sample binaries. Rename "/usr/bin/shape"
> directory to "/usr/bin/opencv_shape". This avoids conflict
> with "/usr/bin/shape" file installed by mesa-demos.
>
> Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/re=
cipes-support/opencv/opencv_4.12.0.bb
> index d8295912fa..8652baa0e9 100644
> --- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
> @@ -113,9 +113,9 @@ PACKAGECONFIG[openvino] =3D "-DWITH_OPENVINO=3DON,-DW=
ITH_OPENVINO=3DOFF,openvino-infer
>  PACKAGECONFIG[oracle-java] =3D "-DJAVA_INCLUDE_PATH=3D${ORACLE_JAVA_HOME=
}/include -DJAVA_INCLUDE_PATH2=3D${ORACLE_JAVA_HOME}/include/linux -DJAVA_A=
WT_INCLUDE_PATH=3D${ORACLE_JAVA_HOME}/include -DJAVA_AWT_LIBRARY=3D${ORACLE=
_JAVA_HOME}/lib/amd64/libjawt.so -DJAVA_JVM_LIBRARY=3D${ORACLE_JAVA_HOME}/l=
ib/amd64/server/libjvm.so,,ant-native oracle-jse-jdk oracle-jse-jdk-native,=
"
>  PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOFF,libpng,"
>  PACKAGECONFIG[python3] =3D "-DPYTHON3_INCLUDE_PATH=3D${STAGING_INCDIR}/$=
{PYTHON_DIR}${PYTHON_ABI} -DPYTHON3_NUMPY_INCLUDE_DIRS:PATH=3D${STAGING_LIB=
DIR}/${PYTHON_DIR}/site-packages/numpy/_core/include,,python3-numpy,"
> -PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_PYTHON_EXAMP=
LES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
> +PACKAGECONFIG[samples] =3D "-DBUILD_EXAMPLES=3DON -DINSTALL_BIN_EXAMPLES=
=3DON -DINSTALL_PYTHON_EXAMPLES=3DON,-DBUILD_EXAMPLES=3DOFF,,"
>  PACKAGECONFIG[tbb] =3D "-DWITH_TBB=3DON,-DWITH_TBB=3DOFF,tbb,"
> -PACKAGECONFIG[tests] =3D "-DBUILD_TESTS=3DON,-DBUILD_TESTS=3DOFF,,"
> +PACKAGECONFIG[tests] =3D "-DBUILD_TESTS=3DON -DINSTALL_TESTS=3DON,-DBUIL=
D_TESTS=3DOFF,,"
>  PACKAGECONFIG[text] =3D "-DBUILD_opencv_text=3DON,-DBUILD_opencv_text=3D=
OFF,tesseract,"
>  PACKAGECONFIG[tiff] =3D "-DWITH_TIFF=3DON,-DWITH_TIFF=3DOFF,tiff,"
>  PACKAGECONFIG[v4l] =3D "-DWITH_V4L=3DON,-DWITH_V4L=3DOFF,v4l-utils,"
> @@ -213,4 +213,6 @@ do_install:append() {
>              sed -i -e 's,${S},/usr/src/debug/${PN}/${PV},g' ${B}/modules=
/core/$fn
>          fi
>      done
> +
> +    mv ${D}/usr/bin/shape ${D}/usr/bin/opencv_shape

Use bitbake variables instead of hardcodings in path, replace /usr/bin
with ${bindir}
secondly, I wonder how this binary is used because those calls need to
change to use this name as well.

>  }
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118755): https://lists.openembedded.org/g/openembedde=
d-devel/message/118755
> Mute This Topic: https://lists.openembedded.org/mt/114427547/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

