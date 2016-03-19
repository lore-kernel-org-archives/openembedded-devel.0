Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id E1A9F60621
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2016 21:38:30 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id l68so79558071wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Mar 2016 14:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=SmMO+D3mXEtf2FN8Q09Fz7pMoHudF3VX4GYTkbNTaEU=;
	b=WNkM3rMDOVTad43MV1aLvCc9OQkcTYEWlPm+gm6ThScXNHdEUKj8rXKh/wIKOUoECl
	ZwaLYSBXbdqQjP6K6Zix43ZIaBxQ+lbtkduNiH+AK1+rqOZyJl7aTEMnduHALO51bzcF
	n7psNImxWOl05j+ZEoZXigILJe9XbEG38ynfjM9O5ZiWP3nc3Cs2EhNN97f1E46UGo1G
	IrGlym0+GNW70/gsextqvXJ+OM92a1hIHgM6YnzC3kkEs4FsC0+b5M/F0wGpM6BQBtCn
	ClmqnF+1MwkbXOxxLHFI2N2qfrfEJTOTkyPAflCSLwQbGwXpBR3FGIbk9NFJ+KzCuI/e
	QLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=SmMO+D3mXEtf2FN8Q09Fz7pMoHudF3VX4GYTkbNTaEU=;
	b=Y6lOslQjQwlylrr+C6ZejWHohqlmTNDhsFEBZp3HEhC7z1KDNt32bfCILKedjr4rv8
	gEJ4J4IDDDEkJV2K022c5vMSpj3MRO5/wFwfVOVd8gECqp9eh9rj+5h0oyQVf1m6gzlT
	DohSJmC4OtVfedsynTDgBad+nH5EIdBGCaS4u1QS0U6rRaUkmjMg0Thp/2L4j7ctamXN
	4xH5Z+Kw1rLKSc0Y52N4OlG+C8i53zElI7l5wrWAm0JxhWtQsEMqLxuODF7UUR0MtGur
	mcA5W+CQVusSssARp9Pn1hJKjGix1o3r9W7Z8kOY6AICGgoCTsWBqES9cAarlHXsvPxS
	2CFg==
X-Gm-Message-State: AD7BkJKN9N6GDQWSrozHdBZe/OCZhDfWCKzoLoKKYB0qf/K0VrEvPDcuRUkc0RlC7ueGm16a/bo13q60E8rSMA==
MIME-Version: 1.0
X-Received: by 10.28.30.208 with SMTP id e199mr5743892wme.74.1458423510825;
	Sat, 19 Mar 2016 14:38:30 -0700 (PDT)
Received: by 10.194.102.74 with HTTP; Sat, 19 Mar 2016 14:38:30 -0700 (PDT)
In-Reply-To: <1458300015-9666-4-git-send-email-ricardo.ribalda@gmail.com>
References: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
	<1458300015-9666-4-git-send-email-ricardo.ribalda@gmail.com>
Date: Sat, 19 Mar 2016 22:38:30 +0100
Message-ID: <CA+chaQeEY-1_DdGqn+aD+_pfMky-8qv9u7tB32OLW9xJTd+o3w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v3 4/4] opencv: Remove blacklist
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
X-List-Received-Date: Sat, 19 Mar 2016 21:38:33 -0000
Content-Type: text/plain; charset=UTF-8

OK, it build now, but please add one more patch to fix autodetected
dependencies:

opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-videoio rdepends on
libgphotoport, but it isn't a build dependency, missing libgphoto2 in
DEPENDS or PACKAGECONFIG? [build-deps]
opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-videoio rdepends on
libgphoto2, but it isn't a build dependency, missing libgphoto2 in
DEPENDS or PACKAGECONFIG? [build-deps]
opencv-3.1+gitAUTOINC+92387b1ef8: libopencv-dnn rdepends on protobuf,
but it isn't a build dependency, missing protobuf in DEPENDS or
PACKAGECONFIG? [build-deps]



On Fri, Mar 18, 2016 at 12:20 PM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Opencv 3.1 builds fine with ffmpeg.
>
> ricardo@neopili:~/curro/qt5022/oe/openembedded-core/build$ bitbake
> opencv
> Loading cache: 100%
>
> |############################################################################|
> ETA:  00:00:00
> Loaded 2018 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION        = "1.29.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Debian-testing"
> TARGET_SYS        = "i586-oe-linux"
> MACHINE           = "qemux86"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "m32 i586"
> TARGET_FPU        = ""
> meta              = "master:300f858ba07c938427ccd05a3d7220027a03d461"
> meta-oe           = "master:29462f7161b346dbc2ea00830da869a0a1c35fb9"
>
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 1242 tasks of which 1228 didn't need to
> be rerun and all succeeded.
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> index 6f0c83829809..87338cad4a4b 100644
> --- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
> +++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
> @@ -133,5 +133,3 @@ do_install_append() {
>      cp -f bin/*-tutorial-* bin/*-example-*
> ${D}${datadir}/OpenCV/samples/bin/
>  }
>
> -# http://errors.yoctoproject.org/Errors/Details/40660/
> -PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
> --
> 2.7.0
>
>

