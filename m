Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 78A917D912
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 May 2019 21:30:25 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j6so4512657qtq.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 May 2019 14:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XRoowWMH1QWcjQkeLhIGkdFeVKth0ZMKcjlp9YbkXYo=;
	b=hjz8SslReQlwsCsvEuG513cbzvWANwDVHSX3oILseMa1KP32jWMBHV3bKqg1E0KXzd
	UPJO45M3ffSQnJnfQctqKj/fyE5yGkZ1MeQ2pwoEw7+0ObTng/MshZ7v9TmJz2NRAVMS
	R3v/Nx+LmerQUKtzGlrtt8sWq6aPPb40Ah6E46Oxu+gd0uiQw99bL7p06FLhwlEfXx74
	X1mgMdI96EOvPpDEMfFliYt8UtQhAWBsRlor5aWZ0zEUW5XHGLnjddRdSMrpTRejWR6n
	kelacOo6s4FvWHGaecyAhtHQRTtS52LAsHXJoyZf8wO9J9tZw47f7ejdBKNgCZBHQYC1
	WY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XRoowWMH1QWcjQkeLhIGkdFeVKth0ZMKcjlp9YbkXYo=;
	b=Q54o45ESxFFOyspFlcAGcuYL+r6SFC6Qjp+4GcbR43g1G42PR51sfqGGxWQZwy+ZA7
	a7BrUiY25dE5xKk8Owbd/e5/3arwFs/OLUey0adJSHlIq1CulqEzq1dB5E+dthnnFz3X
	RoI4gYCaTQHYA+hCQ+xG40y6VKc5iVkA5uWkHWIAyfqRg6IUCgDwaSiyxh2kj0jiHbEL
	X7lFbVZjrEGHeXwaXu4pgT7LsPK8w60kShZD7UHtMLEsu3rFlMmdZsqgXfeDnbjeOUPB
	vWaHNxQzMBgdrcZvFDy0wdZMpi7fkRrgWol+dYyuYxl7sPxYz5uk/QTRHR4S9z9BvPKC
	EcNw==
X-Gm-Message-State: APjAAAUcFDJTADSc2lHAOx674z5dQcrOTQx1rYJx6OvKZZrWTAI1Od1z
	SpqIbJOUUsdthgnP9QF5E1eURE8afYhFAfc+kBo=
X-Google-Smtp-Source: APXvYqyiA3Yxr8N47cWrEoFzMWLqScFFftqC/eXGSOgGyCxX09xRkGsxn6b+Bq3/zkmTCgZgYWrDCKMC5TPohqH3ZCc=
X-Received: by 2002:ac8:2d35:: with SMTP id n50mr1110216qta.253.1556832626105; 
	Thu, 02 May 2019 14:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <1556722320-17827-1-git-send-email-akuster808@gmail.com>
	<20190501152748.GY31207@bill-the-cat>
	<044a379d-73f2-2f5d-3539-004becfebaa9@gmail.com>
In-Reply-To: <044a379d-73f2-2f5d-3539-004becfebaa9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 May 2019 14:30:00 -0700
Message-ID: <CAMKF1soM4_R_WSxFbDTDMrMmuMAn64NS4Te6rFn9-PDvyiKt0g@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Tom Rini <trini@konsulko.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [warrior][PATCH] README: updated Maintainers list for Warrior
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
X-List-Received-Date: Thu, 02 May 2019 21:30:25 -0000
Content-Type: text/plain; charset="UTF-8"

can we also remove older layers from LAYERSERIES_COMPAT while here

On Wed, May 1, 2019 at 8:56 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 5/1/19 8:27 AM, Tom Rini wrote:
> > On Wed, May 01, 2019 at 07:52:00AM -0700, Armin Kuster wrote:
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  README                      |  2 +-
> >>  meta-filesystems/README     | 12 ++++++------
> >>  meta-gnome/README           | 10 +++++-----
> >>  meta-initramfs/README       |  8 ++++----
> >>  meta-multimedia/README      | 10 +++++-----
> >>  meta-networking/MAINTAINERS | 32 +++-----------------------------
> >>  meta-networking/README      |  6 +++---
> >>  meta-oe/README              |  8 ++++----
> >>  meta-perl/README            | 10 ++++------
> >>  meta-python/README          | 12 +++++-------
> >>  meta-webserver/README       |  8 ++++----
> >>  meta-xfce/README            | 10 +++++-----
> >>  12 files changed, 49 insertions(+), 79 deletions(-)
> >>
> >> diff --git a/README b/README
> >> index 7318f09..881115e 100644
> >> --- a/README
> >> +++ b/README
> >> @@ -1,6 +1,6 @@
> >>  Collection of layers for the OE-core universe
> >>
> >> -Main layer maintainer: Khem Raj <raj.khem@gmail.com>
> >> +Warrior maintainer: Armin Kuster  <akuster808@gmail.com>
> >>
> >>  This repository is a collection of layers to suppliment OE-Core
> >>  with additional packages, Each layer have designated maintainer
> >> diff --git a/meta-filesystems/README b/meta-filesystems/README
> >> index 87cb685..d9f07df 100644
> >> --- a/meta-filesystems/README
> >> +++ b/meta-filesystems/README
> >> @@ -10,30 +10,30 @@ Dependencies
> >>  This layer depends on:
> >>
> >>    URI: git://git.openembedded.org/bitbake
> >> -  branch: master
> >> +  branch: 1.40
> > I may be starting off on the wrong patch here, but, did 1.40 or
> > bitbake.conf ever get patched up such that rm_work doesn't cause
> > world-rebuilds every time?  I recall when digging into this before there
> > was a "maybe if we tweak $something it'll be happy again with this older
> > bitbake".  Thanks!
>
> V2 sent.  Thanks for the review.
>
> Thanks,
> - armin
> >
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

