Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF05B76C9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 20:35:52 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i204so1020270wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Apr 2016 13:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=qwHpNC12yaZ74NKL0GORu/4WXBrjAfDh6Xa9PSa0/rI=;
	b=0C8Rv7bttDdiCzsBzxRKUgXOqB+FuIEGiOBTVfxUkVYhqhiXavaJeXkYl6+vVJYi78
	E1FPp6oIYwkSHC5MxE5IwiGGP08dOCrIc89qLBXCy8rNKBhl0hlMKhD1Z1kOpRNUBUa6
	xfqlUoVnIeMEUW3PgU3w5hpbe9l8eHS8J4ofh64WB8YPF/SX5WQecY51LQBite/tkiek
	mUFQ3luN2Ph+umwLPRhuLd2BIv9uxxEoVNlXbD6sY44nr4DmpBsVsOr4V44N6E/8lrCO
	pNg3hueVXSISNCx2YWTNGLwLQlSbD7zDmmH3Ot+V9KeJNVHNo9u5D6zQrHC6YRAH63y3
	6luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=qwHpNC12yaZ74NKL0GORu/4WXBrjAfDh6Xa9PSa0/rI=;
	b=Qaksr6qjRpwEY3uVeHuLf4929U0ICbBEi2oBrcrqN6/lNXLE735aSdm9gtw8zVNH0m
	OjLs0nx87aUW0QfBj7FIYtXsDlWMQo2tyKMdvJ2205zpTtyuTB56JzV+pnMFxh+GamV5
	+v3clTORdafCB/IwXEKtqDq926Ok2T26FjH6GinygDEGnL0SgyqvB4CZakAsy2LW9vg2
	lWdCJOcpJhYW5AH9bvFHmabs+YDLvU+wi0VkEg/AU/uZ9VR7w+liYpEZR0HRy6bnsaRm
	SO+toKZVwMWLIvDvirmqea29bbrIF58EzHuFSBJgrb3NKH+ec/61feEPcBlPGs9KAnHh
	ddwg==
X-Gm-Message-State: AD7BkJL80yId+4XcTcHti7j7b8Y/86z/mQa543xLS/C+Fr5WUkmWIlHjCkthLoOUwgNJRb9iuAyUMW/irQUHvw==
MIME-Version: 1.0
X-Received: by 10.28.59.87 with SMTP id i84mr532553wma.61.1459542952704; Fri,
	01 Apr 2016 13:35:52 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Fri, 1 Apr 2016 13:35:52 -0700 (PDT)
In-Reply-To: <1459433492-9346-2-git-send-email-ricardo.ribalda@gmail.com>
References: <1459433492-9346-1-git-send-email-ricardo.ribalda@gmail.com>
	<1459433492-9346-2-git-send-email-ricardo.ribalda@gmail.com>
Date: Fri, 1 Apr 2016 13:35:52 -0700
Message-ID: <CAJ86T=Vsw91Wk6QWxSwRtvtp5OmjeHHO1RQmndSE0Om9aw0Tuw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v6 6/7] opencv: Fix build on x86 platform
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
X-List-Received-Date: Fri, 01 Apr 2016 20:35:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 31, 2016 at 7:11 AM, Ricardo Ribalda Delgado
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
> index 63955a862d4a..ecba0216fd45 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -45,6 +45,7 @@ EXTRA_OECMAKE = "-DPYTHON2_NUMPY_INCLUDE_DIRS:PATH=${STAGING_LIBDIR}/${PYTHON_DI
>                   ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
>                   ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
>  "
> +EXTRA_OECMAKE_append_x86 += "-DX86=ON"

Version 6 seems to have gone back to combining _append with +=

It should be:

EXTRA_OECMAKE_append_x86 = " -DX86=ON"

>
>  PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l gstreamer samples tbb \
>                     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
> --
> 2.8.0.rc3
>

