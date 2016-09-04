Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7A63B731AC
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Sep 2016 10:06:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so1154418wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Sep 2016 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=b3QOaInFrz5ZebhqNf67Lg5NmpfcSX5Nfibiv5xHHEM=;
	b=Ms8bNlkHAx1JrUZHxhummYdTQ1bmHy5I8s2dP9ZNMrTdGgBCfBMLVIFDv7CHJHxWkl
	7k33W7TZHhrZ+1ibyDl6ZjMp0P8BWn/91EfCukgZ+BnpX9/aJW5ncdr8DkOKC6ikhlm5
	tiYyKm9lqL706LU1nQi1zEyMhU0+qBBy4BY8tyM1RIJknn/ouBieVJ62Czw5LNlVVa/r
	NLNVvujPm+LPWOez9RU4MlXUEfeVZpVLEiAWeJZNUbOmtwvwlF8UmDHdxJ1+ITyNCWTq
	j6zv3UW1ivuZRfafDe2noxWXIUTGOXjQwiwiihgqGS72/Fn7BYxHCaVb6ZJrposQPBLr
	qNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=b3QOaInFrz5ZebhqNf67Lg5NmpfcSX5Nfibiv5xHHEM=;
	b=a4VEQ2E7+TtYAWtEwpg3oWpAKhHbiyFziYjxNdZa81wZJEXRIlOvG3L6N9BBub+qmr
	WafasV+SbNEoWYYwYZ/FPJzQFD8avvX7cGs84vRLwn68G5gEjGXDPkhFJ8/jmrtOjA9O
	npYp18f+mEGMsMZOcTY3wPgoFvBJ7kOKo2WebUqzFXpSQka815tEm8eRQ/sqZwPRWxru
	CgjKnH1fzvgL6aCOBwhuZcg8b90UkQ0QsLpD9qvFRsp+D5lZ9JSBnLlJ89MHsQ9JzY/L
	XWSsu9f7bOqgg7cBvwvzR9QKymF6xuS9+ZaX7b2Tx5219JXLsjXszZC9dJnyV5hMhWXd
	4gpQ==
X-Gm-Message-State: AE9vXwO9LNOFJMRyoz2XF+tkS9NyeYWPEaxVNWpppUGLIcD5/GN+5FkNs7ta/5Cla3+QA+z+WWI3nLB/5TUAWw==
X-Received: by 10.28.214.130 with SMTP id n124mr10233794wmg.37.1472983580096; 
	Sun, 04 Sep 2016 03:06:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.168.98 with HTTP; Sun, 4 Sep 2016 03:06:19 -0700 (PDT)
In-Reply-To: <CANwerB0gyDqWi+5d4hvLs3otSDCmZNb7BWQtaAJChbZvAM6q1Q@mail.gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
	<CANwerB0gyDqWi+5d4hvLs3otSDCmZNb7BWQtaAJChbZvAM6q1Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 4 Sep 2016 12:06:19 +0200
Message-ID: <CA+chaQd9gzwYJrnpeotmv_z7f+L6kSm4T6qHEaZoe-tuRuR2mQ@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 01/11] xf86-input-tslib: remove
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
X-List-Received-Date: Sun, 04 Sep 2016 10:06:21 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

yes I know about it and plan to merge tslib addition instead, that patchset
didn't exist yet, when I created this to resolve number of new build
failures in world build caused by tslib removal from oe-core.

On Sun, Sep 4, 2016 at 6:03 AM, Jonathan Liu <net147@gmail.com> wrote:

> Hi Martin,
>
> On 1 September 2016 at 05:40, Martin Jansa <martin.jansa@gmail.com> wrote:
> > * tslib was removed from oe-core
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../xf86-input-tslib/10-x11-input-tslib.fdi        |  11 --
> >  .../xf86-input-tslib/99-xf86-input-tslib.rules     |   5 -
> >  .../xf86-input-tslib/double-free-crash.patch       |  20 ---
> >  ...f86-input-tslib-0.0.6-xf86XInputSetScreen.patch |  31 ----
> >  .../xf86-input-tslib-port-ABI-12-r48.patch         | 196
> ---------------------
> >  .../xserver-174-XGetPointerControl.patch           |  34 ----
> >  .../xorg-driver/xf86-input-tslib_0.0.6.bb          |  35 ----
> >  7 files changed, 332 deletions(-)
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-input-tslib/10-x11-input-tslib.fdi
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-input-tslib/99-xf86-input-tslib.rules
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-input-tslib/double-free-crash.patch
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-input-tslib/xf86-input-tslib-0.0.6-xf86XInputSetScreen.patch
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-input-tslib/xf86-input-tslib-port-ABI-12-r48.patch
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-
> driver/xf86-input-tslib/xserver-174-XGetPointerControl.patch
> >  delete mode 100644 meta-oe/recipes-graphics/xorg-driver/
> xf86-input-tslib_0.0.6.bb
>
> tslib should be added to meta-openembedded instead. There is a
> patchset submitted to ML to add tslib and related recipes to
> meta-openembedded.
>
> Regards,
> Jonathan
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

