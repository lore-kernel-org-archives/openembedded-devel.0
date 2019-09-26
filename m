Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3BAE67EDF5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 17:02:58 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c4so2853417edl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=nYfftAO0wZZs7mpK9nHxk49768aBw/lKKnKCKA4bmuI=;
	b=EyJI5NbiJmcmAGRHiMeOCqrFZ1nbMTnfDkDL2Z1UuUmGy4nmO2RB1guSPXM5KzeCN6
	0DOXUaHG0GktBrNFcwNJzUMzn4vWpeJI7/6zbrvv0b/MV8H890SFOo22j4HEhOSsTZfj
	bXb3WzyuZFhdpFC9w9pZcyDZ3rGHwHyUkYXwB5AHHccXV30Vwr3PgE1/iNex+KxW/Pjl
	ax9gZGqKjnWjF9MyEvGRcCoWjsMNaTasMFNEO13QXrxIKC0y4plMpT+LT1Yf+ny5DXnT
	PeHcSBWz3ws42dXdPpBW4fTN5axZzhk20dgWydpOmaZ0+NaXjEM64FtDNCZsksuEwnEr
	qvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=nYfftAO0wZZs7mpK9nHxk49768aBw/lKKnKCKA4bmuI=;
	b=NB+++pbTZvq8rXAei8ZbXEFgMx3iabWX8rCNaBeGqxBtcbahraxm4+K6e0DdgF4r2Y
	Q14jkvTeaziiNu2nAinoXezXUyxp1iQ92Jdb9GGSw7/y5QesLmDwP5qjv1dY4vAZQv0L
	Vd7pmWWFUpuUDSUT8MggdTnVuH9n8KM/j8IgtrNwNRJDRO86ttcBx9D/sufkEQDlv2lx
	xeO2ec7sL6APwfll5dJ/CiBo0g4VdKegxUiSOojsJQ8CSjaC0h1X8KM2G+u8qlOdCJ1e
	ZHDBeMLYPOLp1ebv3FCjeLCOQGF5VAxdUQzZ/f2AoGwA4wDpjsPVt93vxd9sDBXr3kpc
	Resg==
X-Gm-Message-State: APjAAAVEi5ebFWh8LNWJCttISipqnIcRyhYahHIv+02MiC+XRtNeprzR
	t2I2N9q0K2ckkSOmnm8lCpg6t2ZKMDE1amREXvX7tLB9
X-Google-Smtp-Source: APXvYqxMs2vfjK0WUEITovZsO9l4DfRMSFJhtHL5FYXc0tyeW5CbIGdsTWX3bh9ntNDIRbweGdgzhBXjnqKJQOe0iSE=
X-Received: by 2002:a17:907:20f1:: with SMTP id
	rh17mr4108854ejb.110.1569517378759; 
	Thu, 26 Sep 2019 10:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190926162655.375600-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190926162655.375600-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 26 Sep 2019 19:02:56 +0200
Message-ID: <CA+chaQfJWkSzmET6tJqZ2ROmxD9KhZkZaFkewYgHAhC6o=kCUw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 1/2] spice: append -Wno-error=address-of-packed-member only for target
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
X-List-Received-Date: Thu, 26 Sep 2019 17:03:00 -0000
Content-Type: text/plain; charset="UTF-8"

It looks like it's also needed for nativesdk. Will send v2 soon.

On Thu, Sep 26, 2019 at 6:26 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * with older native gcc on host this will break spice-native with:
>   cc1: error: -Werror=address-of-packed-member: no option
> -Waddress-of-packed-member
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
> index 30e939ac07..2829a59d15 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -37,7 +37,7 @@ DEPENDS_append_class-nativesdk = "nativesdk-openssl"
>  export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>  export
> PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
>
> -CFLAGS_append = " -Wno-error=address-of-packed-member"
> +CFLAGS_append_class-target = " -Wno-error=address-of-packed-member"
>
>  PACKAGECONFIG_class-nativesdk = ""
>  PACKAGECONFIG ?= "sasl"
> --
> 2.17.1
>
>

