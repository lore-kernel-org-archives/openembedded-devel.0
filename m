Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 95A1E7F579
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 03:28:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id u184so595076qkd.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 20:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3nhUV6e6qe9odsyxM+llksw+Rq8UZZAGnq4enVsTozk=;
	b=AasvMTYuworPeMnZZUc60/OZQZDvmRf20q4PDYYKIHiRW6tnkRGvU0sPtpfy71Prpd
	rnJVPUNWESBiHcpQO8y9QMc9OdfesopJBkH1WhDwQ7aDq9361mQgt2M33PsiqUL+wVWF
	IqUAnTprW59bHWnBG78jXfjTA86uQZP0pccmoLopkTZgobTikP4j8udyWQsFIYJ1kQHe
	sFyqKjPhuzKW5rX9i9pvVg7+c1oCB1Pe2wFaATodB4DsC0iFfnQ2l9elcLjENiVo4mRg
	x9fwhR9kKrB+UyVkaoYdSndO6tFrnT/2Vnu+wpzD2HBtVeXA28mfhX0PQMvErXNvcd7q
	UOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3nhUV6e6qe9odsyxM+llksw+Rq8UZZAGnq4enVsTozk=;
	b=R3Oa5b6So2pzRYjrh2q67QbL0py1ZyxNljdOnfJyaZQpQyNV6BZCXe88B9cHl6dUPc
	EuEWNk/zUQmw7NnrZTdTT/Z6T12zLrprSN/lCRx+6u/i5rIQ6H5z43C061VwSukXfLI8
	gHoxLkTEw4PbXfYZRHLzNl/5JSRafc8IDyyPukkSte5VMyw++vrtJgOEf/0wAqiYrlyz
	0d4lggHYC3GM9AU/+jSMnZuPB0FyKDsHmGXnB2CJl+3hbprVpjlZmwHBDY8ADhk4kHpX
	nTl4IuiLgc6n9e3jWZYUo7Yzypw6pFOMzu85r5CYud5xI/ZyebMb3sCo/nIR6z5OXuXF
	PCzA==
X-Gm-Message-State: APjAAAXf9xDU0at0ZxY7Ga/MqZ8EQUJ1rKzQs8H57IEHEutofZCKrh4T
	tIHlFtDKssjXKWLuUYBcZFz301DdNSTU6AO12O4=
X-Google-Smtp-Source: APXvYqwjJKjqSHArtkOVnXVHVug3dfFz3nxE4i+RFeCoOeINnFnXICBvrlTzKc+v6Uh9UARH3NEnHgTapWmT9Iwpu8k=
X-Received: by 2002:a37:b985:: with SMTP id j127mr1301405qkf.337.1571282922934;
	Wed, 16 Oct 2019 20:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <1570962384-18643-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1570962384-18643-1-git-send-email-ankit.tarot@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2019 08:58:16 +0530
Message-ID: <CAMKF1spaP3ztOn+-Nyib8aR=7ZLwtATBe1mMvvbHKzTshhTOoQ@mail.gmail.com>
To: Ankit Navik <ankit.tarot@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glfw: Initial recipe for glfw
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
X-List-Received-Date: Thu, 17 Oct 2019 03:28:42 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build https://errors.yoctoproject.org/Errors/Details/273662/

On Sun, Oct 13, 2019 at 3:55 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> It adds generic recipe for glfw: a multi-platform library for OpenGL,
> OpenGL ES, Vulkan, window and input.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  meta-oe/recipes-core/glfw/glfw_3.3.bb | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-oe/recipes-core/glfw/glfw_3.3.bb
>
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> new file mode 100644
> index 0000000..b23d723
> --- /dev/null
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY  = "A multi-platform library for OpenGL, OpenGL ES, Vulkan, window and input"
> +HOMEPAGE = "https://www.glfw.org/"
> +DESCRIPTION = "GLFW is an Open Source, multi-platform library for OpenGL, \
> +OpenGL ES and Vulkan application development. It provides a simple, \
> +platform-independent API for creating windows, contexts and surfaces, reading \
> +input, handling events, etc."
> +LICENSE  = "Zlib"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=98d93d1ddc537f9b9ea6def64e046b5f"
> +SECTION = "lib"
> +
> +inherit pkgconfig cmake
> +
> +S = "${WORKDIR}/git"
> +SRC_URI = "git://github.com/glfw/glfw.git"
> +SRCREV = "d25248343e248337284dfbe5ecd1eddbd37ae66d"
> +
> +EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
> +
> +DEPENDS = "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
> +REQUIRED_DISTRO_FEATURES = "x11"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

