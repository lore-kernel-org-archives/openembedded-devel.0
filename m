Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id E64A6719DD
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Apr 2017 07:20:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o81so1464783wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Apr 2017 00:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tL4TkKiSiRYRj1uz8KnqzhEfgLMItQcSWoP9inuZ0Ds=;
	b=VY93P2AeYuHPYhhnfocd5w7XFdhfCPqks3sfU2Ln7cb3xYNDHJuR9ZUtJtc55Frfrn
	RIwZqc0eCsJZgJ8DUrJ8NFTviO/d272u+r0h5Agtf8TGkRZwZBboRdKAo1PpdjH8Rkjp
	gp2az47IFfM/7BJACoAXlS9c8+TB7XWzC57ryVbPdj0/aKnl6dM1AmunR47BhiCyRNYC
	+TZ7duQbKd7Ok2r7WDn6nUopE4LYdVT2X02WG9KiLyv9i1+mTkarlE96Itdkw9vx0Bgu
	CDQd8o/qgmjsC2za4+6O5qG0LYdP+ApX9GuydlHz8xWfkRnFlIRyG7Y5OqKb5rvaf19a
	jebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tL4TkKiSiRYRj1uz8KnqzhEfgLMItQcSWoP9inuZ0Ds=;
	b=mac5HLf/Z83zPaxiHPR4CyOZ5Cf+0zx1l4pfD2obfNO/Nd7wkaSo1UD/X6VRrnfQma
	yIH8zI6hSOKUkbma4kxG+BQvARwLWpcWp+kRgKyAqo8uOo4RnWghxqQ1gVvXxB/EAj6W
	loecTSJjo2fo/o3bPl7T1aK6BthBhER4iw0AefSo7K3raBd2j8jrJa0P89krnX7ag2Pu
	KOaGK9b/7tMm0WoqjlLUyCDTTo4xKQoyXSvYrUvo6SnhJaAtsklnHWCWE32LhuvQ8iPu
	Pk8+bEFWgvJEUKuUvIxiNk4C4lLdtPAp5WydSjf+NiogGRvg8zhm62snJ1jszKnN4pqX
	9HYg==
X-Gm-Message-State: AN3rC/7+qJjs5ik8qz5X0cZBhgUPNW9sKUsPM2QrmDk+lw9H1ayox0N8Ao1Pdc5LyPooOUWX84lRw/F2A32mfQ==
X-Received: by 10.28.103.84 with SMTP id b81mr2212438wmc.124.1491636032625;
	Sat, 08 Apr 2017 00:20:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Sat, 8 Apr 2017 00:20:32 -0700 (PDT)
In-Reply-To: <CAMKF1srj1Fchi4-MShD_NpL6WpP7vz_C=oq16CEXdejiQxytuQ@mail.gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-13-raj.khem@gmail.com>
	<20170407174249.GC3022@jama>
	<CAMKF1sqxFob2R_2HAYTi=zE2k+HzyiUW7P7CP72mFOmO1Cnuqg@mail.gmail.com>
	<CAMKF1srj1Fchi4-MShD_NpL6WpP7vz_C=oq16CEXdejiQxytuQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 8 Apr 2017 09:20:32 +0200
Message-ID: <CA+chaQeKnMA2LDHZnRODZKF_M+zkAHonhXNsxeMANE1BY-mJoA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 13/43] poco: Upgrade to 1.7.8
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
X-List-Received-Date: Sat, 08 Apr 2017 07:20:34 -0000
Content-Type: text/plain; charset=UTF-8

This is warning during buildtime.

If this 2 packages are fighting which will provide the library, then users
of this library will get different one to RDEPENDS from shlibs code each
time the poco* are finished building in different order.

I don't know if we have any poco users in our metadata, but making it
deterministic is always good thing.

On Sat, Apr 8, 2017 at 1:43 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Apr 7, 2017 at 3:21 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Apr 7, 2017 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >> WARNING: poco-1.7.8-r0 do_package: poco-1.7.8 was registered as shlib
> >> provider for libCppUnit.so.1, changing it to poco-cppunit-1.7.8 because
> >> it was built later
> >
> > actually poco should not build a shared object at all since that
> > should come from cppunit recipe.
>
> actually the library names are different. And move to make it part of
> poco--cppunit is the right thing. What problems do you see ? package
> upgrade ?
>

