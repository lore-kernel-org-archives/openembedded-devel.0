Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id CB73771A37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 20:37:10 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id z204so54670421vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 13:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=knNlXBrK36vus3xJfuehv0qIYVZdYZOwo0Gq+Dfp7aE=;
	b=Rlq2INLKzrNybefsSKr+c9w4E2hIxbdXHhGJqXqUYMei0pBT93EJhuVmN3A4EVDs+e
	Xv2etxeE685HIC4L+uZQBJh97c3QNswJPKfe9mstz9LNdiCkzDOEKsEtXvCSc6aK6rQ9
	V9hB7lTTXGD5A3/FFx1fzg0EUqiTFTyXSjlQ0BWiTE1MDGNcDX3htpBEsQDrvViNIQ8c
	Mf3Y7KER8ScksAd9u2a/nT3Qdi5blal845wvPlc0F8Xrtyrs/wnA/ZrAc+TpHkLBrB2q
	Jn5f54RyHdBg0j4wFL6ob/HYg8XOYiD+cQESF7+TXMPQiRIYFWpPWtTHF5pV4IvNKWQu
	Zdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=knNlXBrK36vus3xJfuehv0qIYVZdYZOwo0Gq+Dfp7aE=;
	b=L2lQtxdQbIY17oGQ/Q5ISK7SMvcJVWPJ8cFHB/PLFRDYwZUgHnvISE6uCtZmBpSDO3
	eJbHPd5v+62pCRJpj0PFJA13bS94DgUMDy5j6+zbjSNcDNqlaKkHlk5yY3BPzFcq3aMA
	Qu7hfJXNVp9bgwKwLvmR7TYU79yU82iJpOh1NxcUzNjo+xY1VH4B36zPSwBjfezBwEhQ
	CSNLcTpbMm0dKoYcMuQ0ZOpcsWqAsbH9HHlbWGNe+cgGfWmSAzS4XMGoczv8FYRxQNMs
	buKOogYLazZIKquR30NAJznR20NJ34XqN8DF/dPi2iHWDjRipyMQRFhNWTgIRLgv2okL
	AzJA==
X-Gm-Message-State: AFeK/H3kOrIeuqtjblYudiidA/jVZROsTZDV2gAx56uikt/h/eKhdS1GD0irckznP+W/LblUeF4doB49tXqpIQ==
X-Received: by 10.176.84.209 with SMTP id q17mr18813378uaa.129.1491511031390; 
	Thu, 06 Apr 2017 13:37:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.30.70 with HTTP; Thu, 6 Apr 2017 13:37:10 -0700 (PDT)
In-Reply-To: <CA+chaQeaHRpRBQ_AEe7GDM2fxHZc81jkYcJbfBsf72XGEu_aeA@mail.gmail.com>
References: <20170403183815.2997-1-twoerner@gmail.com>
	<CA+chaQeaHRpRBQ_AEe7GDM2fxHZc81jkYcJbfBsf72XGEu_aeA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 6 Apr 2017 16:37:10 -0400
Message-ID: <CAHUNapR=5Tj+jAF5_hMgZ1MMSaEiGbNRrj36YL12zcETqhzBYA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser][PATCH] chromium: 52.0.2743.76 -> 54.0.2810.2
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
X-List-Received-Date: Thu, 06 Apr 2017 20:37:11 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 6, 2017 at 3:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> In my world build it (surprisingly) didn't fail, good job Trevor!

Sadly, it does fail with one specific PACKAGECONFIG: ignore-lost-context

I have a fix which I've build-tested both for x11 and wayland with a
bunch of different targets, which is just waiting for run-testing:
https://github.com/twoerner/meta-browser/tree/contrib/twoerner/chromium_54_pkgconfig_fix

> Are you willing to check 2 QA issues which might be there in older version
> as well?
>
> chromium-54.0.2810.2: ELF binary
> '/tmp/work/i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome'
> has relocations in .text [textrel]
> chromium-wayland-53.0.2785.143: ELF binary
> '/tmp/work/i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome'
> has relocations in .text [textrel]

Yes, I'll have a look.

Currently I'm trying to figure out how to move past this version.
After 53.0.2810.2 the current method OE uses to build chromium starts
to fail because (as is my understanding) it was around this point that
the chromium build switched from gyp+ninja (what we're using in OE) to
gn+ninja (ninja is like "make" and gyp/gn are like the autotools)
Therefore the gyp support starts to break down due to lack of upstream
maintainership. I'm starting to be able to do successful chromium
builds from tarballs on the cmdline (outside of OE) up to
57.0.2987.133 but I need to figure out how to translate that into a
recipe.

Oh, and it'd be nice to have an aarch64 build too.

