Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 610E87199D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 15:36:48 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id j189so475488vka.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 08:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3k+C6QRFhAAQSEUfLkMvSZ0bsSRI5vsowNfh1YgwFB0=;
	b=MwR2ITCHlo2EzlwTg+Hg/JMM+1Ryw1cufZZujCeabpVc/J03BQdImUu6TKBZeCimt1
	h5douURpmGHQwDMqglRWUZIVH0w4y0YayX+dolXkwyXxLQunmfSeIDTAokTo1tyqK6jv
	VP8R3sp0jlmu5SWB9kB8Amb49DeAZFvV4F1/3PGKkBNbdjlHWt7Ogy5WdFALQbHFPGSr
	H79n3jmAnqgDaCv4V+RSNyVSPUBZSN1n2QEuEmzmQPqD/BAGgv31Bzg8GhA1wNYZg/p+
	XXYBwlC/ljizSfJ0Sf8IRn7LJx2Y5JPvAHHduEUerJVPMnifS/ECBWNnHDR2wIQJVnJa
	nlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3k+C6QRFhAAQSEUfLkMvSZ0bsSRI5vsowNfh1YgwFB0=;
	b=LU4LRo3GHGyOMITuLSJro/6uocyH5scAlyTh/clN7OxCdIR1gI4g22MhKadXkoNwXC
	evcdSY8Ctw5NODW8kr2C21KfGtIBcc6EAW1/StB1XIHSSGCYgHch1RXuwdFvjx7GKzDf
	q0dRrLL7T6IKzpLYKG6+KD5T0YJFekRZF8JZcnN37iwZyqIchk/yOcj9o2F3wvMl7bgs
	SaNVBTmx8gVclEqnYI9QYER7zUT3f7ns/b5GDnDv9IX96A3YN8GAkNyx4hQyOhwxMRvr
	XaZh2FaR8AGPKY/YM+mhHg0UCA2ccWft35Us9YFxRzl/LLDBrNz6oztvZDoaWikW1GWs
	JWmQ==
X-Gm-Message-State: AHYfb5hG54OQXWUUwVgLDJsCjy9A55D4Up1OBNoxG1GspiGOXnjzUR23
	nALmS79n2ouSJ1L9InFRI9yECNb2rg==
X-Received: by 10.31.3.146 with SMTP id f18mr8317312vki.184.1502379410092;
	Thu, 10 Aug 2017 08:36:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Thu, 10 Aug 2017 08:36:49 -0700 (PDT)
In-Reply-To: <2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
References: <1502377935-30119-1-git-send-email-liu.ming50@gmail.com>
	<2f7ad030-fd8a-c925-5435-fe73cebbc443@gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 10 Aug 2017 17:36:49 +0200
Message-ID: <CALatG=6hnNTwGzz1FrFhiCGkj16xHHz_57SKGJjQfY7vWsLNuQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] json-spirit: Add -latomic to LDFLAGS
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
X-List-Received-Date: Thu, 10 Aug 2017 15:36:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi, Khem:

I added that since I observed the error only on a armv5e machine, error did
not show up on cortexa8/x86_64 machines, so I attempted to guess that
option would not be always needed, for instance, if some ARCH support
atomic instructions.

//Ming Liu

2017-08-10 17:19 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On 8/10/17 8:12 AM, liu.ming50@gmail.com wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > This fixes following errors when compiling with clang:
> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
> '__atomic_load_4'
> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
> '__atomic_compare_exchange_4'
> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
> '__atomic_fetch_sub_4'
> > | ../json_spirit/libjson_spirit.so.4.0.8: error: undefined reference to
> '__atomic_fetch_add_4'
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> > index 53bbf7e..2f456bf 100644
> > --- a/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> > +++ b/meta-oe/recipes-devtools/json-spirit/json-spirit_4.08.bb
> > @@ -17,6 +17,8 @@ S = "${WORKDIR}/json_spirit_v${PV}"
> >
> >  DEPENDS = "boost"
> >
> > +LDFLAGS += "-Wl,--as-needed -latomic -Wl,--no-as-needed"
>
> Do we need --as-needed
>
> > +
> >  inherit cmake
> >
> >  FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibJsonSpirit.cmake"
> >
>
>
>

