Return-Path: <sumit.garg@linaro.org>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 61F557F888
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 05:30:21 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id b15so22986370lfc.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jan 2020 21:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kda9DpqObEveJb1mKFQ9HFgNM0IHlMpGBH2xuqIlqzw=;
	b=VONAs1yyVXEiAMvIsB7i8zhSHfg/g+hPCA7rQhQdYwoj6hQmcH34Ka/EmwIbXLOFr2
	3LRlK1enrimj795j5iV7o/Uv8KXCiQHWwolxfuctPI1NUKi7n94ZbBjvRHcLjrnlKHKC
	aDfP6E4hPGUDhx0Vcez/FkCPYqasUj2RhMHyXZw5FX5+2qQsSoqLjLrrUs6DDfWnNlb2
	NG7wpq4s+585Z/ePbFDQQpx1IoAt9PGr/2ewBKMoimgVqRU2vS2fOuXzlkaZr+YMXu6K
	0X6T58LeiErQyR1bUe9tm9OSncHlE/qxCQg8BI8yCzZIXCerGKQdlOD8mXexvdAhyYtH
	gFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kda9DpqObEveJb1mKFQ9HFgNM0IHlMpGBH2xuqIlqzw=;
	b=qqL981nat1UsYpXcmszbjL4Hc4SCiOCLQBc5MFnxDTEG2fCHtbNXg0CWTReqbNNEVm
	gNPUqGyR8Hnymup4rP337paULH+W0QU+YM/ZbKUfNss4tDIfT6mOtPY3dtJrAN3DblUD
	KIvNEml293x1T7cuvTBnTTHnEOeBVs3cbFJNIPhhgk7iKjegt7fRrOzJ7aJdfI6YSJML
	rTVSob5INZuLMHeQXgytoNa91APvxClpYAa4k4IsT86gBdqRN7UWMOuQb6+tHjID5VVs
	eOOjlWTJPOr2dYzRwuTVQbwjSlsXoP8WzEhPb0R9ECGyetVxWwoX5Uy27cfP22aybz4X
	dVdw==
X-Gm-Message-State: APjAAAXjO2V4L4inuOR1ifSDDfj8ESvSHRQyVZYteO/R/iyoOFGXk/oK
	YyXVYTB6VVr29e6F/ZVtsVsdUF8D/1tikuDD1PrLCg==
X-Google-Smtp-Source: APXvYqxgCvw9szUE8//ZLazDJKIMdpPzlrzrdCdq+biChn/BRIBLmP7YcKZg/k4dlhs/o5a1HRX9S2973cI9pBnxxxM=
X-Received: by 2002:a19:4208:: with SMTP id p8mr12312380lfa.160.1579498221987; 
	Sun, 19 Jan 2020 21:30:21 -0800 (PST)
MIME-Version: 1.0
References: <1579245551-14394-1-git-send-email-sumit.garg@linaro.org>
	<16e95266-ffa0-ec52-0c9b-4eebc33c267c@gmail.com>
In-Reply-To: <16e95266-ffa0-ec52-0c9b-4eebc33c267c@gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 20 Jan 2020 11:00:09 +0530
Message-ID: <CAFA6WYOpuUNTP0BSd=fu4+dajEEmmZwOBNUH1-SW_zTOhyp3dA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] meta-networking: fix recipes build with external tool-set
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
X-List-Received-Date: Mon, 20 Jan 2020 05:30:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Jan 2020 at 00:24, Khem Raj <raj.khem@gmail.com> wrote:
>
> On 1/16/20 11:19 PM, Sumit Garg wrote:
> > - drbd-utils: fix native tool dependency which was implicitly met while
> >    building with source GCC tool-set.
> > - unbound: Use HOST_SYS variable instead of TARGET_PREFIX for libtool as
> >    TARGET_PREFIX may vary from source GCC tool-set to external GCC
> >    tool-set. Also, libtool-cross is installed in recipe sysroot using
> >    HOST_SYS variable only.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > ---
> >   meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb | 2 ++
> >   meta-networking/recipes-support/unbound/unbound_1.9.4.bb  | 2 +-
> >   2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> > index 286b0f6..01bb16a 100644
> > --- a/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> > +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.11.0.bb
> > @@ -23,6 +23,8 @@ UPSTREAM_CHECK_URI = "https://github.com/LINBIT/drbd-utils/releases"
> >   SYSTEMD_SERVICE_${PN} = "drbd.service"
> >   SYSTEMD_AUTO_ENABLE = "disable"
> >
> > +DEPENDS = "flex-native"
> > +
> >   inherit autotools-brokensep systemd
> >
> >   EXTRA_OECONF = " \
> > diff --git a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > index 03eb2fa..6200214 100644
> > --- a/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > +++ b/meta-networking/recipes-support/unbound/unbound_1.9.4.bb
> > @@ -23,7 +23,7 @@ S = "${WORKDIR}/git"
> >
> >   EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
> >               --with-ssl=${STAGING_EXECPREFIXDIR} \
> > -             libtool=${TARGET_PREFIX}libtool \
> > +             libtool=${HOST_SYS}-libtool \
> >   "
> >
>
> there is a build error happening in unbound see [1], this is using
> musl/aarch64
>
> [1] https://errors.yoctoproject.org/Errors/Details/306768/
>

It doesn't seem to be related to this patch as "TARGET_PREFIX" and
"HOST_SYS" for musl/aarch64 seems to point to the same libtool:
"aarch64-yoe-linux-musl-libtool". Could you reproduce this error
without this patch?

-Sumit

