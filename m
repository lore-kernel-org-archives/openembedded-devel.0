Return-Path: <brendank310@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id EA89E79BE4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 15:04:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y15-v6so12976000wru.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=o6aIlGBNouGfxDDHT7uOUc8nvvUjude94jg839nQLMY=;
	b=JLXPoRDuEygSa0xrTT0bYIPFMJ1RslaGmibLqYc1ariHI4v01S8sTtSq/d3V1tbEJI
	vlX4KutMW8lVBagpBHsCHVR7wsB7iVE1BR9/HFcjcakue1xj0OaWx4jckYnrhkp7zM85
	xG+g/d3rJ+xTrNQz40fqgUJb9jzNgX47Tv+M0wDMqcb52KDY9V4wr+bWeDoGgouZhm+X
	3lEnhefklTe2EXCAnn7rjxRGRCn0ELaAaBBwNWhVkX1vvkBPLm496pB+WDnhW+de17gh
	PWFxk43FiMV0Grr8lNHUzP745VqIVxrhzDfquxEyYn4yhZBwBhboUeOFFq/JzcolF/Dp
	XKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=o6aIlGBNouGfxDDHT7uOUc8nvvUjude94jg839nQLMY=;
	b=Kjdj3JYBtoyBZoHA/7koG3bKbniGHztYY0RQW7Jvh5TPlZo1elWM2IUNWr3ixRbV8O
	+EYqHyXpMezADkWMTssdZ+HV/CFQJ+r4kO0ecEOJLnSff1ZIoSspAqp1FRAjjaAkARfl
	/grcYKJJc11dL9HSVh19IpPEN83YgcG36FG5hlzaLwn/mC6JoSehKTqAqlv/eWaV+XRq
	40APen+qlRioFCLcbLwBC1kZPhqmb51PEgBoLpGpENFQ/docvQOBYbEpX6UBGRlFRg8G
	2EcqrFTNyNqpWumimc4EF1W4+/4V0OcPYZlCDkkzhpAWPFevEigtU5kKqwZ/bQKCBTsL
	ve7Q==
X-Gm-Message-State: AGRZ1gL9qPeUaKs/V4lZ13i78N6+fKu/l5Q7oX0RLRZ91UyUKE/8onRz
	vcdW/Z4QFR5cj/i8v4gI+imV5b/vCKMnZCLWhCU=
X-Google-Smtp-Source: AJdET5clS2WZLgDX4wLHVe0voPKsfLpp9EilqieT+jodRm9BQ5UZ8fWs3Z8xnc8ZvfOoF74lKfNiTlsLZK11rtwJdDE=
X-Received: by 2002:adf:c90e:: with SMTP id
	m14-v6mr18973710wrh.6.1540911850437; 
	Tue, 30 Oct 2018 08:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<068fb23bf91af2a10eacc81156dc72dfb5d8ee79.1540830650.git.brendank310@gmail.com>
	<CAJTo0LbH3UCYYHCp6E1gA33fjk2xSr+ZkZjZmn-MDvabT7_EfQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbH3UCYYHCp6E1gA33fjk2xSr+ZkZjZmn-MDvabT7_EfQ@mail.gmail.com>
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Tue, 30 Oct 2018 11:03:59 -0400
Message-ID: <CAKPa3c2XXz1JNFzu-voxa-O029gh-7eSf1hWAD4U=BAjMfLx9w@mail.gmail.com>
To: ross.burton@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 05/16] lcms2: add recipe for Little Color Management System
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
X-List-Received-Date: Tue, 30 Oct 2018 15:04:10 -0000
Content-Type: text/plain; charset="UTF-8"

Sounds good, I hadn't seen that. Should the existing lcms recipe be renamed
to lcms2? Most distros seem to package it as such and it'd also simplify
the recipe a bit (the PN would align with the tarball and source directory
name).

On Tue, Oct 30, 2018 at 7:23 AM Burton, Ross <ross.burton@intel.com> wrote:

> On Mon, 29 Oct 2018 at 16:42, brendank310 <brendank310@gmail.com> wrote:
> > +inherit autotools pkgconfig distro_features_check
>
> distro_features_check isn't being used.
>
> But mainly, just update the existing recipe.
>
> Ross
>

