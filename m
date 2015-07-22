Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 41D2D75669
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 19:52:37 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so146203167pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jul 2015 12:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0YC5sVFbrvtlGIAooVLq6937y0pIw/wiiJhH/NFABIw=;
	b=IeV+fbnhYUmEXWh3pFOfVbObOvLH0gNoFs+Py9FvTRfk+cl/tdMKaa0o1KGDfffSXy
	Iku+dM2viFiMscErLEHXW1F4cFf6EvpGJ22LDHtPxx9mHPysbbUBgFOC/gX4/elvhPPo
	0p84KuHDle4zJTwcEuHFJavKrRiFG6PTCFpMLgqVMafTk9AeJOEEZ8qcwcdYBP3jYQVo
	8T22cR6EXb/tncHlQRZCphnoY403f7KcLZA2t8LjAV/oKU1inlkhNvy/GgkRNngfWsFk
	ZmY9rzoprFlI6L5FMi/udpJKXMVpExsL1BD+hssx39YN8egERpG+xGwoSvrmNclqlx8V
	pETg==
MIME-Version: 1.0
X-Received: by 10.66.197.202 with SMTP id iw10mr9244625pac.77.1437594757752;
	Wed, 22 Jul 2015 12:52:37 -0700 (PDT)
Received: by 10.70.65.4 with HTTP; Wed, 22 Jul 2015 12:52:37 -0700 (PDT)
In-Reply-To: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
References: <1437594429-21142-1-git-send-email-otavio@ossystems.com.br>
Date: Wed, 22 Jul 2015 21:52:37 +0200
Message-ID: <CALbNGRRH3QtFSPRNxRb+z0TOkxL-o7G7z1Lzcy61WMz-Q_X-pg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH v3 1/4] opencv: Only enable 'libav' support if commercial license is whitelisted
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
X-List-Received-Date: Wed, 22 Jul 2015 19:52:40 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 22, 2015 at 9:47 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The libav support requires the commercial license to be
> whitelist. This makes opencv to work in non-commercial setups without
> needing to change the PACKAGECONFIG settings manually.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta-oe/recipes-support/opencv/opencv_2.4.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> index 2754616..f8946f4 100644
> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> @@ -30,8 +30,9 @@ EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}
>                   ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>  "
>
> -PACKAGECONFIG ??= "eigen jpeg libav png tiff v4l \
> -                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)}"
> +PACKAGECONFIG ??= "eigen jpeg png tiff v4l \
> +                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
> +                   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
>  PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
>  PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
>  PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
> --
> 2.4.6
>
Same for all patches of this series: What changes were made v1/v2/v3?

Andreas

