Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C3D9F7F7C5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 09:25:16 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i26so7154939iog.9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hheS+hKMf26VcYgqHTH8Yr3yK5L9Vqd+0gY9mM5JM+c=;
	b=oblmja1azMW5yCzKY92rhk4LMxZzLjRUkNZSg+ZAEcYzkWtYhVQdawcUkkB7las9pG
	bew2dThl9AjuvVgFVSbJxPuMmwwRWznOroR9ClNq1dRjB2hnNQN7URFyGasupJ+TJSDs
	OTuCkAhlX8gl0GWHk/3/bHBACgN1Jx+tTeH67pxb/UYj4xiDXj4+wye4bw7NnCOeeYUp
	+ttlyNUZkM7Cxs6RYs/wAzd+BVTBvLH/8zntBut9oqv76mvy0bCFN6B5yKwazA+CVm0Y
	bzLe+cON8AGComyI2R82ZRu6MAoRpKFxJ4QLzLrL+P1A+Z+roqVf5Lx+gtrbX8s/NTXf
	za4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hheS+hKMf26VcYgqHTH8Yr3yK5L9Vqd+0gY9mM5JM+c=;
	b=hFrKQiPY46p8dgjRr3mj3sPMR6V8H4rB8HnaA2Q5O4SvCzYJBUlVigYCWAbhClaGYS
	NpVl13Bmt1l89Its24wYmxaDYWQ3AC6sz0d5uuXnAImR4Yu7rbaNNAGvl4Uh0UixrSYw
	0EBRwYIJUyr1uhMgW6sfEJU3+CJSRv3R3CfF0xjMz2fRWIaP3DoxNDwU672OdU8Rt9wY
	gK3W1LnZwnNiW6keZ9Butdt/6vO5I7kTXY4aCE3/81WeWHQrE5pIsCkcrKpz4FjJrYb3
	0J9LTVrUxgFPXih5SwUN7sjeemVzcFcmYY/zGxVBJHG0sAtlN6GuE+mfZfpET7HfUCpx
	cHRg==
X-Gm-Message-State: APjAAAVwvDsDvWfBeHkGJyv5ytY07eoVyRfnCuWjQz9B/ngIsuH7AcVY
	xj3L9eU13n3Bb32JDWMooZt78V3uVQbX73QDGs8=
X-Google-Smtp-Source: APXvYqwJTNSmOQzLCXRQsOnZkfUFISupsmyfhUVGus254KBsP+u92FhsMeES2QY7+wpPpuPbTjEryhP+H/O3nT7ugCY=
X-Received: by 2002:a5d:8185:: with SMTP id u5mr12039892ion.147.1572168317977; 
	Sun, 27 Oct 2019 02:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-3-schnitzeltony@gmail.com>
	<CAMKF1sqoAUa_Fs1LeLK0U2N=U2nS4cGwVWvYJ3xQNqq8_sJj5Q@mail.gmail.com>
In-Reply-To: <CAMKF1sqoAUa_Fs1LeLK0U2N=U2nS4cGwVWvYJ3xQNqq8_sJj5Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sun, 27 Oct 2019 10:25:06 +0100
Message-ID: <CALbNGRSM09Q=qvEHJXhFgCVG=_6BjNpQejHAsg6ah2et3xc=ag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gnome-help.bbclass: Handle gnome-help files with new distro feature 'helpfiles'
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
X-List-Received-Date: Sun, 27 Oct 2019 09:25:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 27, 2019 at 7:08 AM Khem Raj <raj.khem@gmail.com> wrote:
> > +PACKAGES_DYNAMIC_append = " ^${PN}-help-.*"
>
> if we put this in layer.conf it will appear at global config meta
> data, since it remains pertinent to gnome
> perhaps its best to add it in gnome related bbclass maybe

You are right this looks odd. Try to remember what my thought were >6
month ago but I think this is another candidate for V2 (or with the
others V3)

Andreas

