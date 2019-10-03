Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC53C6C216
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 23:38:09 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id a15so4207724edt.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Oct 2019 16:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RUB/W+5iTiG0QwVE6vaGLavtS3TqRSL/A4ftpB5LtpM=;
	b=CvEg2eh8uk+oScUe2GqBGJ2tZS59EPk8Pk42ZF75M3JN2cwyBAUd0XMyMdTgKXP5fX
	cRhziCBVJiMj+3A7wgGrpn8Cv0PGRFbKcoQa8NfCJAC7BkEiy0bQEaVD+4UQefNudoDt
	hHjPyy/zvVtJ9xlAKM2AngpjRoVEWS3Gs7475KuhtLDrm6ujF6saP5qZKo0PQXdMmFQ7
	z1rjV0y5lqs0t+TlGpGQcXI+MTNQEYe88dOf1j2Nud92Jixump3bhoz831WqGTNGTs73
	Lo/s7Vn9qArQ5iZuOfZHF/QHp4vEODLtvcLkvSszzrglvJs7Jy3yDyN/g1cRNrejoV9S
	RQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RUB/W+5iTiG0QwVE6vaGLavtS3TqRSL/A4ftpB5LtpM=;
	b=RjXgmwTe9OrpHqNhHt6YGk/HT2E2iWheiZWODxOpCNqCNWn2qtGiFgQHxj+Pk0rs+m
	YZJFOtNRJMJk1Lr8c0BLeIbwNBjZ7TZz3p01YumBYIsZ51FpZP7tzRhE1HGpIbZPjqG5
	h6qIfjTg7E324GL2cZOHBxVZqC4i5TS5d9PW9h8YqVGglmh+0FUoEV+Vba6lespGE1LN
	r54F+m7Q1P6CLnNHlevCaUZAzL+9DP/hWaf1Ptjbbj/yqsR4S/pCuwLJMboxv9YYLpDt
	hRugW+0JAaAf7G5WKr45O0u1gFmEaIzwc0PBnQwoPB+YG84BJ31rh9BfHgPj68KHI1za
	Nn6A==
X-Gm-Message-State: APjAAAV+CBFRM4QBW/7J1Scxd5EaD/32cUxoNUK6c6KgZ3P7yCEjghwZ
	NzVrOydTNukF80CSwM0B7Yjtbi1zGaQ62CeBjEc=
X-Google-Smtp-Source: APXvYqzK4BjF981fD6d9rfUV9aB5bs2Rp+OtLMjge4hgzPnmQhYrcRfdCe74CcJMenYCHK6ssofIKU2Rc/n1UNHv0nM=
X-Received: by 2002:a17:906:4a5a:: with SMTP id
	a26mr10100570ejv.154.1570145890515; 
	Thu, 03 Oct 2019 16:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190927165605.1900768-1-adrian.ratiu@collabora.com>
	<CAMKF1sqTmvwNDbXnvHvUfPVjq-hPLAQ6Yne=sph3Q-gqLGU3UA@mail.gmail.com>
	<20190929124049.GB30130@localhost> <87ftkf9ery.fsf@collabora.com>
In-Reply-To: <87ftkf9ery.fsf@collabora.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 4 Oct 2019 01:37:59 +0200
Message-ID: <CA+chaQeeZFnAAUbGFGHgypBF-O53pv1Gv7q8ZmjiOH95D5Wksw@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH v3] renderdoc: add new recipe
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
X-List-Received-Date: Thu, 03 Oct 2019 23:38:11 -0000
Content-Type: text/plain; charset="UTF-8"

This should have x11 in REQUIRED_DISTRO_FEATURES to fix:

ERROR: Nothing PROVIDES 'libxcb' (but
meta-oe/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb DEPENDS on or
otherwise requires it)
libxcb was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'renderdoc', 'libxcb']

On Sun, Sep 29, 2019 at 7:46 PM Adrian Ratiu <adrian.ratiu@collabora.com>
wrote:

> On Sun, 29 Sep 2019, Adrian Bunk <bunk@stusta.de> wrote:
> > On Sat, Sep 28, 2019 at 12:48:10PM -0700, Khem Raj wrote:
> >> On Fri, Sep 27, 2019 at 9:56 AM Adrian Ratiu <
> adrian.ratiu@collabora.com> wrote:
> >>...
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-graphics/renderdoc/renderdoc/0002-q-renderdoc-CMakeLists.txt-remove-flag-unsupported-b.patch
> >> > @@ -0,0 +1,48 @@
> >> > +From 40511a6f4dc6311c8cf7f2954d1202ede55881ff Mon Sep 17 00:00:00
> 2001
> >> > +From: Adrian Ratiu <adrian.ratiu@collabora.com>
> >> > +Date: Wed, 25 Sep 2019 19:31:14 +0300
> >> > +Subject: [PATCH] (q)renderdoc/CMakeLists.txt: remove flag
> unsupported by GCC
> >> > +
> >> > +-Wno-unknown-warning is not supported by GCC, only by Clang so we
> >> > +remove it because newer GCC versions like 9.2.0 will complain, older
> >> > +versions would just ignore it.
> >> > +
> >> > +Upstream-Status: Pending [
> https://github.com/baldurk/renderdoc/pull/1530]
> >> > +
> >>
> >> gcc9 does support -Wno-unknown-warning perhaps you want
> >> -Wno-error=unknown-warning
> >>...
> >> > +TARGET_CFLAGS += "-Wno-error=deprecated-copy"
> >> > +
> >>
> >> this option is GCC specific mark it
> >> TARGET_CFLAGS_append_toolchain-gcc
> >>...
> >
> > Using -Wno-error always could solve both problems,
> > and would also avoid similar problems in the future.
>
> That's a good idea, however I can't pass directly -Wno-error in the
> recipe because of how the top-level CMakelists.txt is written: it always
> *appends* -Werror to the flags, so it overwrites our -Wno-error.
>
> A better solution which has the same effect is to use
> -DCMAKE_BUILD_TYPE=Release which prevents -Werror being appended at all
> in the top-level CMakelists.txt (there is no other effect than this!)
>
> Thanks! Will send an updatet v4 soon.
>
> >
> > cu
> > Adrian
> >
> > --
> >
> >        "Is there not promise of rain?" Ling Tan asked suddenly out
> >         of the darkness. There had been need of rain for many days.
> >        "Only a promise," Lao Er said.
> >                                        Pearl S. Buck - Dragon Seed
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

