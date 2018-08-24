Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id E1A5F745F2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 20:22:33 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id f17-v6so6677772qkh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w3fj2eim9+Br60w+6RCJ9+6AvUlKx6RD3BTU+wPqoRo=;
	b=vXq3/gQkSHBmKgIP1X3p5JtSK07VBm/7WOmXvl/7iO2Qcyehn4xkmI9bodCm5JJXvx
	b/Uikrehq51I8kCuSFSWTsZXlEs0cHF5LiFgoJOS4Sp5es9bMxhGROBIFUUCdCnh/SKb
	AxhDkLpwzKcFWr9bX3kMeWMJ7Ttpz0kKOC4pIMSp4pqRLLQ/58eWQOaMbihgpmXucl13
	DtkT9+ChiKa/aYKihQahYyS4xKIio3M4lGVWaLbdwnDGhaykMYrJCZnaK0/5FXOJhL0u
	qPY5BGVcTwVxMDONyEIqGo55iOQHu03wq6am5aFc1ETmvdjwo8qTG2DRlogi3atvFQRS
	euyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w3fj2eim9+Br60w+6RCJ9+6AvUlKx6RD3BTU+wPqoRo=;
	b=mfSo8QWdaAhKSBuIJ5Z2ZmLVcak1Gdq7YyL0mNKfb8m4ss2jLSyGjZTWmw3w2mZQVD
	hIo7oSrAErPJnrogQizj3021QWzEU1j2t1ulUeGstKh3qZwlXtoKBwIu61MrQNLzUkyw
	uO7rww4YvGltQWFaGOr2EkYqR6mfQI1SRQ3dpQZgWI3Am86pha295OEII7WsuQLCih4I
	uHIT2t6LUQFUrS3gIGdcaKQvoreYJP2/Q+WKWB+4vG6Wq3kXNH5FD8HNnwML5tNulrvV
	BvcoIjnGXMeVJEKVs5RrS8XF8YvU1thlh/0GRoNc+kujvuTA7T55HEjaN7vZTfVkyqFH
	aLvQ==
X-Gm-Message-State: APzg51AsOStwkoE3K+eGL9bws1g//ZIzrNY2L2iOOZ5+SZKrjYiIT3w0
	tXGfMMsz9E2Ygd3fyCcI0cNIcik5byvuQhDkWZI=
X-Google-Smtp-Source: ANB0Vdb9hedLLwNxHIAyXMuvsUuGs2xbFHPLqiRcp126p173US35hfbhDmFWdMUJczC476RNDG35R17lmTPvqiEhi7g=
X-Received: by 2002:a37:2e03:: with SMTP id
	u3-v6mr3342100qkh.223.1535142154544; 
	Fri, 24 Aug 2018 13:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180824193454.146236-1-joe.slater@windriver.com>
In-Reply-To: <20180824193454.146236-1-joe.slater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 13:22:08 -0700
Message-ID: <CAMKF1spEy0_3DdinAzP4qxv_heCXHwsqBmdtYfRMV3a+nJms=w@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] php: specify no valgrind
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
X-List-Received-Date: Fri, 24 Aug 2018 20:22:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 24, 2018 at 12:35 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> configure will look by default for valgrind.h in some host directories.
> We override this by setting --with-valgrind=no.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta-oe/recipes-devtools/php/php.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/php/php.inc b/meta-oe/recipes-devtools/php/php.inc
> index 4231fcc..ef03e66 100644
> --- a/meta-oe/recipes-devtools/php/php.inc
> +++ b/meta-oe/recipes-devtools/php/php.inc
> @@ -47,6 +47,7 @@ EXTRA_OECONF = "--enable-mbstring \
>                  --enable-wddx \
>                  --enable-fpm \
>                  --enable-zip \
> +                --with-valgrind=no \

perhaps turning it into a packageconfig is better.

>                  --with-libdir=${baselib} \
>                  --with-gettext=${STAGING_LIBDIR}/.. \
>                  --with-zlib=${STAGING_LIBDIR}/.. \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

