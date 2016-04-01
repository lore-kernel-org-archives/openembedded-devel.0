Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2530876FE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 21:46:34 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p65so1338360wmp.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=VDND/EDnyHXm9co7M2QsrDABOAAnqfiwtwaGwvCDp3Y=;
	b=JhaZx27CRXuk0tZsSUixQMomEvbTiX8ivIcwYiUI/RRCtzxNL4Sk/Kc1RHcw2KBfZb
	xH9w5aAFc2JP5hE+AoP9yz2rdZBbIFsByAPyu4t3bjzedld+JV9/s5AWi5pIRDDEyfUX
	q33wUoRYHwCyZaSOx+ftEhGBFJM6ahlvquDtY4hp4QI/1f9QtJIz3vu4kQpBwdvyr7Js
	FJzSNSF6vmbcRUQtoMh6MlE/vd6S5ArP4QQKXzGKjsTVPGlbc6STOM58Eabb8n0MnuyV
	WnyHMza7f8PUMe8O0Zi0sBXZeWxFBnHjMNzHatwL1mzgCPGs9z7TVU3OEFJAXS+cqZK/
	cRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=VDND/EDnyHXm9co7M2QsrDABOAAnqfiwtwaGwvCDp3Y=;
	b=AVaRLHOPACFTtfvslx2kOIxaa5aw3s1HIyICZ7c8804CZzyGEgr5jYVU20iuuXcuH6
	K0uSBrnF8w23WYp3BV7/DxUA+BzRrieimiNXk/fXL/YOYXWjJw/ccpequPyxpNUxavh2
	EPMmU497aVxKUsAXjSIPGIuWCc/Xsz9A12IgCkIdFd6li1LX6JoZB7nHMru+jtGCiyHq
	4rRDJ4N1UAgYTN02AuCQoWN+LGDIoD2lfyUER2fqGCbhjxXSCgo9R1wJAh9Qd0KiDd1A
	9LKdx5JuBYw9oORieVSBO7mEX0Wy1Jlgp9j7uYcXsehvnbpuLPw/1gNnQZkCc0IEejUV
	aaRA==
X-Gm-Message-State: AD7BkJLdesUvLEBKuvwZmXKwWxf2A5mOEokULVRsV2zLYqIjT8mRmfOlaPVr2w1Hen1JeprtpvzxCDM/1Ex+2A==
MIME-Version: 1.0
X-Received: by 10.194.63.242 with SMTP id j18mr7823585wjs.114.1459547195067;
	Fri, 01 Apr 2016 14:46:35 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 1 Apr 2016 14:46:35 -0700 (PDT)
In-Reply-To: <1459546590-9513-7-git-send-email-ricardo.ribalda@gmail.com>
References: <1459546590-9513-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459546590-9513-7-git-send-email-ricardo.ribalda@gmail.com>
Date: Fri, 1 Apr 2016 14:46:35 -0700
Message-ID: <CAJ86T=Ve72OuEUAof1Tcogn5kqU=W7-_OY7TsTvJcYaVUDvrhA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v7 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Fri, 01 Apr 2016 21:46:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 1, 2016 at 2:36 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> OpenCV wrongly assumes that the X86 variable would be set on Intel 32
> bit architectures.
>
> This patch adds the missing definition on those cases.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> index 63955a862d4a..b89fbbb214f6 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
>                   ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
>                   ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>  "
> +EXTRA_OECMAKE_append_x86 = "-DX86=ON"

That should be:

EXTRA_OECMAKE_append_x86 = " -DX86=ON"

Note the leading space. See:

  http://www.yoctoproject.org/docs/2.0/bitbake-user-manual/bitbake-user-manual.html#appending-and-prepending-override-style-syntax

>
>  PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
>                     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
> --
> 2.8.0.rc3
>

