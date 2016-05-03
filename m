Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 861CD73194
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 May 2016 07:45:35 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id j8so12278383lfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2016 00:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=czwdEvKNnVKp+/tFwmOQNDlQcaOPEuzBIrrVhQbFeE0=;
	b=K4OaFFKl3mECJ0WGE9Wms1S7xC56AdN+cQt4VcBjFHk63iZli3oG2XmWWVjIrGlaXJ
	6s1LnMxOwOB/d+t9br9J238XAjOcuPf35b7mL9RIEUE/LNJ7siXOaZLsTi/bknOjdYqn
	/7QQcsma//rG7626NPO0k/MX5o6tYZy0ySTaXJrjs92E2cYA02OaO70ekg8Odsu3XhSS
	+zMc81oBnFTstb2MWMXbE9MBSs2p0pbZsW2KzIm4X85YcNIsR4C/Ocl+sMoNcNy1Tt9r
	goS8k4p+E4aTaj0fs1jC8jJjh/x3B2D2pUH3HJqQIkmj/bjM89SyyCpKDZLbytargzAY
	w4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=czwdEvKNnVKp+/tFwmOQNDlQcaOPEuzBIrrVhQbFeE0=;
	b=O6LDrhFEN2CE+zZ2ydqOjDjXxveNGdaDfG3+OsgbkhPn/TuNqv9V1rx2tyfwCmw6l4
	WgQvCL3EBguthOs2DYfxNrINS7GezQ94r0X4khjEIB3Vx0mmLIdsBERxfxeU9rfNG8Cu
	1PwwL6468+D971MOPRUSLEvdVwOEgzH8CuXiJ0vBtiFpSdW4Y30IB9SqXcWrNUzm3F4B
	GE088QNSOfq7jrFjYUT66s0yIYDQMQdWrvmnJDQJ4WV+fqy0SU9dtu38nSH4Ead9lskI
	0KlVzsvkokVPZjTv8gRuGMi52ap1XstLyQ+rnVWO8ViEc5gg25qE8o3F3GwyG+7JlGFH
	EOsg==
X-Gm-Message-State: AOPr4FUC3QyIyok+YxQm/7f8WiSRyyTt6iUMF+t+jowvsXSacsRCC2AKsWd1vThFHmOch2hp4LlcIdsAFak+kw==
MIME-Version: 1.0
X-Received: by 10.25.23.155 with SMTP id 27mr450979lfx.3.1462261535408; Tue,
	03 May 2016 00:45:35 -0700 (PDT)
Received: by 10.112.180.229 with HTTP; Tue, 3 May 2016 00:45:35 -0700 (PDT)
In-Reply-To: <1461943248-919-1-git-send-email-derek@asterius.io>
References: <1461943248-919-1-git-send-email-derek@asterius.io>
Date: Tue, 3 May 2016 09:45:35 +0200
Message-ID: <CA+chaQcWWw9nDbbKiqP7Nx9TUDNEOH-akQ=YQQTx0McCNJ52Aw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCHv2] fribidi: update to version 0.19.7
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
X-List-Received-Date: Tue, 03 May 2016 07:45:35 -0000
Content-Type: text/plain; charset=UTF-8

fbreader is still failing with this:
http://errors.yoctoproject.org/Errors/Details/61472/

And it will probably need a fix in fbreader:
https://bugs.gentoo.org/show_bug.cgi?id=417043

On Fri, Apr 29, 2016 at 5:20 PM, Derek Straka <derek@asterius.io> wrote:

>  * license copyright entities were updated
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb | 17
> -----------------
>  meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb | 17
> +++++++++++++++++
>  2 files changed, 17 insertions(+), 17 deletions(-)
>  delete mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
>  create mode 100644 meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
>
> diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> deleted file mode 100644
> index cb4bc24..0000000
> --- a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.2.bb
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -SUMMARY = "Fribidi library for bidirectional text"
> -SECTION = "libs"
> -PR = "r1"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> -BBCLASSEXTEND = "native"
> -
> -PROVIDES = "libfribidi"
> -
> -inherit autotools lib_package pkgconfig
> -
> -CFLAGS_append = "  -DPAGE_SIZE=4096 "
> -
> -SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "626db17d2d99b43615ad9d12500f568a"
> -SRC_URI[sha256sum] =
> "49cf91586e48b52fe25872ff66c1da0dff0daac2593f9f300e2af12f44f64177"
> diff --git a/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> new file mode 100644
> index 0000000..f8e7aa0
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libfribidi/fribidi_0.19.7.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "Fribidi library for bidirectional text"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
> +BBCLASSEXTEND = "native"
> +
> +PROVIDES = "libfribidi"
> +DEPENDS = "glib-2.0 libpcre"
> +
> +inherit autotools lib_package pkgconfig
> +
> +CFLAGS_append = "  -DPAGE_SIZE=4096 "
> +
> +SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "6c7e7cfdd39c908f7ac619351c1c5c23"
> +SRC_URI[sha256sum] =
> "08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

