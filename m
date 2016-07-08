Return-Path: <ticotimo@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3B92760119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 15:43:03 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id l188so7976275lfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 08:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ViHCnpgKlSZCXzP3CjDQYxWi3m72AM28TNbEINAVY9c=;
	b=C96SvYYI+BlQSN7xr1LCzayKmtQthdgKmLKK2R6gf2jk6MiqVVDL2+HLvWFVFDT6sq
	CPvHPXvyxNCVcN18qHZhlxURAaaC7HaD//oEuDwyQr7Gchouqbu8j9kD6n3YfELz9677
	YVEObB0caVGPaJ6rKognSWec9Z0xStTmFhh/NZP6RHYveVBtUcSkVXiU3VjNPqNnjU2j
	czyfbjgt6ABr5yjNSSyJ/wozv+DP/lzyUkdyTiFn+/Jsj1qoIi7123BPYHHzTw0RmwJ3
	AmNbily8OdoOEPvdZBY9xqLgL4MU2dU+srDkxYLPYFR+eSqC5dCdeZMDgKm2hbdpqNiQ
	tPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ViHCnpgKlSZCXzP3CjDQYxWi3m72AM28TNbEINAVY9c=;
	b=dNmkLlGj/rBCLvbH5gOMtSLmbjADQkyU4XVW0ijU1va0s7uhfs6dAedGXdVJGmC4IS
	z31eIZFep/dQqDV738HXtvSJ4hjST+3MLCdmsjWKaEKspFrCQpZ9hkFWf9cQJ2EEJrgW
	1IvL2oUo86tVu4C2ecbpHHh8QB4plPKtpiYbq2IyBil/Nq6nW69rR8pbNb5SYxmZpxLl
	HV6HYp8//fblrXfl5PHUYXu5ffHp/Q6dTSr7onChhdMPbsojX/5ySWrSYrjcJnFz/F43
	GfBrBxirUjXe4GzAS1Jd62Hu7dqkzymjsppu50bwbRMr1xc0BhTeo4DefY+vTjl0pmUA
	x+Bw==
X-Gm-Message-State: ALyK8tKtgDjdtftbeIbimAhADji0OpHHvpuo3F8Kq3Z/qV6Yha0du42kJlf16nN5M9h0yZ7Qnx9FjZC6Du07Vw==
X-Received: by 10.25.153.148 with SMTP id b142mr1860024lfe.61.1467992583555;
	Fri, 08 Jul 2016 08:43:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.10.10 with HTTP; Fri, 8 Jul 2016 08:43:02 -0700 (PDT)
In-Reply-To: <20160708102904.10675-1-andrei@resin.io>
References: <20160708102904.10675-1-andrei@resin.io>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Jul 2016 08:43:02 -0700
Message-ID: <CANx9H-C3h3ehH9pCy2EZgwUgZ5J_i9W8pV3amyxrVZEeio0gAQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Andrei Gherzan <andrei@resin.io>
Subject: Re: [meta-python][PATCH 1/1] python-imaging: Add patch to fix host sysroot fails
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
X-List-Received-Date: Fri, 08 Jul 2016 15:43:04 -0000
Content-Type: text/plain; charset=UTF-8

I built for beaglebone and saw the same error. I did not run-time test.

Since this recipe does not include -native support, this patch seems ok.
I have a tingling "not quite the right fix" feeling about it, but...it does
fix the error. I assume you have run-time tested?

PIL is really old, any chance pillow would work for your use case?

Acked-by: Tim Orling <ticotimo@gmail.com>

On Fri, Jul 8, 2016 at 3:29 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> Signed-off-by: Andrei Gherzan <andrei@resin.io>
> ---
>  .../python/python-imaging/remove-host-libdir.patch | 25
> ++++++++++++++++++++++
>  .../python/python-imaging_1.1.7.bb                 |  3 ++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
>
> diff --git
> a/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> new file mode 100644
> index 0000000..028a51a
> --- /dev/null
> +++
> b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
> @@ -0,0 +1,25 @@
> +Avoid getting host sysroot paths in the library paths to fix issue like:
> +
> +|
> /home/andrei/work/yocto/build-rpi-master/tmp/sysroots/x86_64-linux/usr/lib/libz.so:
> file not recognized: File format not recognized
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> +
> +
> +Index: Imaging-1.1.7/setup.py
> +===================================================================
> +--- Imaging-1.1.7.orig/setup.py
> ++++ Imaging-1.1.7/setup.py
> +@@ -155,11 +155,6 @@ class pil_build_ext(build_ext):
> +
> +         # FIXME: check /opt/stuff directories here?
> +
> +-        prefix = sysconfig.get_config_var("prefix")
> +-        if prefix:
> +-            add_directory(library_dirs, os.path.join(prefix, "lib"))
> +-            add_directory(include_dirs, os.path.join(prefix, "include"))
> +-
> +         #
> +         # locate tkinter libraries
> +
> diff --git a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> index a678328..d2f1a8c 100644
> --- a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> +++ b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
> @@ -9,7 +9,8 @@ PR = "r5"
>  SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
>
> file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
>             file://allow.to.disable.some.features.patch \
> -           file://fix-freetype-includes.patch"
> +           file://fix-freetype-includes.patch \
> +           file://remove-host-libdir.patch"
>
>  SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
>  SRC_URI[sha256sum] =
> "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

