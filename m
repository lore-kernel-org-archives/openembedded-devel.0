Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7B4CE79B8E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:30:04 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id e22-v6so14258514qto.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n46v9eqKNVfBxCEcw2NKs5dmyMT5bVVNd4oIfzX4Wik=;
	b=rUkqwJf3FUQNRkHN5AWCv3wmizzbW7sRAsAtZ4qiJiJhOxYjbf9ktUuwgWJbX4KHc4
	6qi+Vdz7JHovhiRiOKFA40dB+dbmUwv2OCee4HSS+TBcOkEXB5K4yIJ+/b9B3gxInz7B
	ryTScQlY7GqWX2t8U5/2Nw5MD+kcW5R7g/3UWzR5bZ/lx1/kCLofE1cP3d+/eOaA7boL
	LorNUPcgGWSi9gcnlkxuFbQTMfSloiC/DYQNHTc+m5jRoV/UsHc9f9PpXSVhQ7NuHxYz
	kDIJMJ7d+myW5Soe32BBJ8NKPNUQH9OaJCILHaBgsljDGut0x8acTGXhZTOq6ChzNWA/
	Jspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n46v9eqKNVfBxCEcw2NKs5dmyMT5bVVNd4oIfzX4Wik=;
	b=FBede7wZkHyRDvBy2yBDXEkqpst7x5Yw2DjQnqnA5WrsM7eoMq/IHzX6kKLelBc0mZ
	SARqEea7TksKZGGaqKMHgXrxBQuaeE2n969IpNTdS0cDAk/BI9nTYMqU9s3oi+dGvHu6
	8iiXZN+xbpXgrKINf02yo/SJRyYtDu7xBarFMa62RsFio42jopd5cWJg+jP7TydyrM0m
	JLLI6zZa/q6RcqnUqe2CDG2CnGk8as3hPcDBG2FNBZjbkIdz14Ev1/ENQQHMLDnQZNFr
	ZYlf1aOSdCvUdJvD9UxWfvmAH6OYEc3iUUgeqTMoMP1OhuA9A0mjBRf+n39aMRGIzHEa
	kJgA==
X-Gm-Message-State: ABuFfoj3JZ5gbDBPBI/oNct7Hu1SQ+xYaScJshHf2TcRxN+o2kHAZ8Tj
	3nABJ9PVLzAiDff6XCG9N4L1ObgRuprZqTnLxwA=
X-Google-Smtp-Source: ACcGV607gAKjD5Rw5N4Btwme3i63HtAc31wfvY3hUVyZpoi/pO7RpdcPt1hjfZVmnH1PQ5wAf5b0ETaJcivO6PTMfWs=
X-Received: by 2002:ac8:689a:: with SMTP id
	m26-v6mr6035165qtq.254.1539358205163; 
	Fri, 12 Oct 2018 08:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
	<1539357981-3675-3-git-send-email-akuster808@gmail.com>
In-Reply-To: <1539357981-3675-3-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 08:29:38 -0700
Message-ID: <CAMKF1so6ocQQxBpAt63EgcFtRkaKc66JU2NGkN6DyBTRRspa2g@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/5] vlc: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 15:30:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin

On Fri, Oct 12, 2018 at 8:27 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> Nothing PROVIDES gtk+
>

Commit message and code changes seems to not matching

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> index f13c0ea..e395b24 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -19,6 +19,8 @@ LICENSE_FLAGS = "commercial"
>  SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
>
>  inherit autotools gettext pkgconfig distro_features_check
> +#REQUIRED_DISTRO_FEATURES = "x11"
> +
>
>  ARM_INSTRUCTION_SET = "arm"
>
> @@ -40,7 +42,7 @@ EXTRA_OECONF = "\
>      ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
>  "
>
> -PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl vdpau', '', d)}"
> +PACKAGECONFIG ?= " live555 dc1394 dv1394 fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl vdpau notify', '', d)}"
>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
>  PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

