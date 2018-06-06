Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7ED3977029
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 18:18:29 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id o12-v6so7273066wrm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jun 2018 11:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=45XjfBExyb2gyNZgfxbXIQdFaIqKsqab8hVeqUJQmgc=;
	b=iPxhs0cAAvS7kAuSCdvb2j2Sc7MPXCqjktImBjXCHXhImgaqwqVY0r8sgTg8IWEIfb
	7PeDucCsLCmFZ0+2OG3JgzllEvCyeGTEHil3Z9yRZDay/3TUJbUnTCuC+qImZWa5by7P
	bxx8nCao5xPP9oSUOx5iVSqridkde22MuZ8XRrVZIURY9bnd30hb9bnm5qXTy374VBnA
	o8CymdkmQJSn2aVs/DQBQhvB8ramZPpDfUtsMcKWD+46h1PpEdI7rowMq5AP2q68hwA7
	xsBsLQWRV2il8670x3tv+CXWUDusKpZet+Y4EHxxD0V55CseAgewMdUqq9OJHhYajNIN
	pjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=45XjfBExyb2gyNZgfxbXIQdFaIqKsqab8hVeqUJQmgc=;
	b=M21oB/qiUZs4R1mqk6Fi/xF/9K/COlpMz1ASZJSnC4QxwUgWqTYYpTeEuCDIkaQtVK
	9olFFtDD8zvk+8fqFVaIBCrrFF5VdnBbXL1FlGrEhuZrIyVaWhKaZQptgFtaiE2UgZaB
	fTGqU25RGSYr6opQg+lk2nl7YPBu4dWgyagmc6sJo5Pb5sbdv3orVLbe84erKHhYyvWR
	14V/n6Y92ytT6XHnlk9l4Xfw9Dlq7cEmGH7zmGMfCtdah7HqMAfXtyxj2zlwaL8TFCJi
	jNYhsN88sa8DsR3djIdYMgJNlUuHaSwECVDHmF5oPZMcbQWd7HhGw71YBunQ5frB+f2O
	jV0Q==
X-Gm-Message-State: APt69E08Ug391RFarRq4YEUpe86BeAJIo1h6FUC2krMMFz6g6FX/5BWC
	Z2aekiaP5qqiLfOlCgdmdiSmbU/jrzUtqQEHzro=
X-Google-Smtp-Source: ADUXVKKGPsj0vctYHaL22jsBnY8axE3eAN58VGcZsKnP6M//J8lgV6x8ZzlOAyr5iHrnusbK8Q+BufwG2W9wgpkpZnw=
X-Received: by 2002:adf:8462:: with SMTP id
	89-v6mr3507855wrf.138.1528309110258; 
	Wed, 06 Jun 2018 11:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180604223911.14561-1-schnitzeltony@gmail.com>
	<CALbNGRSg8kYPO6x_jgXtK9Gi1gQDX7v4KbpTWVaWAQCEc=NXSg@mail.gmail.com>
	<CA+chaQcz=Ckh2=zSUBi969N-v7dJG-K2F1OXLxtnG8JLUahXYQ@mail.gmail.com>
	<CAMKF1so+ux5C6v3x_uBqiF1PjrjuYBtT7ViayqMez-oS6SbwLA@mail.gmail.com>
	<CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
In-Reply-To: <CALbNGRRt+-YK_T60D-Cz-NfEbDZTRLy7bUCVgkqCyftGkshM9w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 6 Jun 2018 20:18:18 +0200
Message-ID: <CA+chaQdCMFngAwgV2+5XY6RWf1qUTHzDpdJgFAjpyFe0RL62Eg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtwebkit: do not skip build - use cmake as build system
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
X-List-Received-Date: Wed, 06 Jun 2018 18:18:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It's not in oe-core master yet, there is branch from Khem I was using to
start the testing with gcc8.

http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-8

On Wed, Jun 6, 2018 at 8:15 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> On Wed, Jun 6, 2018 at 7:20 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Wed, Jun 6, 2018 at 10:13 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> Thanks Andreas for taking care of this, I was planing to look at it
> later
> >> and then I forgot about it when I wanted to push first 5.11 recipes.
> >>
> >> With gcc8 I see small issue:
> >> http://errors.yoctoproject.org/Errors/Details/179245/
> >>
> >> In fedora they just added -fpermissive in:
> >> https://bugzilla.redhat.com/show_bug.cgi?id=3D1582954
> >>
> >> Are you interested in fixing it properly? I don't use qtwebkit
> >> anywhere (switched
> >> to qtwebengine long time ago), so I don't mind adding -fpermissive as
> well.
> Yes - I will check - have still recipes in meta-qt5-extra depending
> on. Maybe I should check which dependency is still necessary or just
> left over. One question: is gcc8 already upstream in oe-core because I
> ran tests with quite recent masters allover.
> >>
> >
> > IMO adding -fpermissive is acceptable for this package, its on a
> lifeline anyway
> Dead ones live longer :)
>
> Andreas
>

