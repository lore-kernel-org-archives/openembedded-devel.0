Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E1A4D79608
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:58:09 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id h138-v6so6148616qke.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oWIlN8ZDm8/EwE1L1hmwTbZWWgFv9OXiUinLRVn4PjQ=;
	b=l1QFS11sA83h+R7J6sB/L6PuYn9kB08OfAMw7VacG9YqFBKb44dJrTgppoQu22dRiV
	Phk5+6qSFZSqfmd9+UOTANokTcozNPthkNtLt9eBLFnaePuCvP0Orod+WTSitgwD+Mwb
	BZPxhPy8/faLPoN0zpnXYa/ujdpvZar1uk2QsjGtnZCozQFDigM6HQUxDAoUW7jjoGhv
	P3w3yoJYfygd9tCCXbxkIW1WXuPE2LCnhfZFqCvn02V+68MhWNCRnR0p4M2yLmn+Mihd
	q2+l6GSlopEIWKoXWHSV/VFliNPRVigPXIG+XuA83bLX0CpalHucDyRREvDTpaQn6q1L
	uvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oWIlN8ZDm8/EwE1L1hmwTbZWWgFv9OXiUinLRVn4PjQ=;
	b=DxX6X29Z2SbvXURa8nnAkwt+soffsMGCxY3iLsEL270AaVnAJw4S+s4K8neYnH093c
	U7t6bf7MJhPkXcAJBwFgx5ObieFliWRL26Su0J1cXGdEhqITUc9T/tJvuqyUg01QeO/q
	aj9eIMp7uRwUfSi48ZYUxSRHnhQ/TrbekTIXFYQ71kJ2rhZ+HpruSZGXgVKsYAYZcqUR
	YBSPI8YkLEApIGouoYWf40wxOv2VKH0tIJdzAvA+jdy13pyN1s6hsnQzb7nQEW1yPt55
	ibnTiwFByWzqFofs1Cf72rJAqScrBAgCriQq/TyLPq+nFvGxo35rNilpVY/xElxAHGVl
	fW+A==
X-Gm-Message-State: APzg51DKqto98CnJCdQbICoS+pmwzQioT9R+mJ3SfdgGXHQ6VF/2j1bI
	wRbDsDZh1FPZu5IDlxOSVqlN/7PbhCrIi7Dk3Zg=
X-Google-Smtp-Source: ANB0VdaJAG/NqyzqC4C+E2uai2W1F7DJunBOmxMvb7u7m63I7dkOM2sWAy6NUwRO2sVQPdcy+UVyOIxiaBSVj33UqhU=
X-Received: by 2002:a37:2e03:: with SMTP id
	u3-v6mr2271321qkh.223.1535126290546; 
	Fri, 24 Aug 2018 08:58:10 -0700 (PDT)
MIME-Version: 1.0
References: <1535024421-10058-1-git-send-email-kuo-lang.tseng@intel.com>
	<CAMKF1soraLLWVhx+tk3fB8dv1gB7yarS8vqJMum8Vkg7C+XiHQ@mail.gmail.com>
In-Reply-To: <CAMKF1soraLLWVhx+tk3fB8dv1gB7yarS8vqJMum8Vkg7C+XiHQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 08:57:44 -0700
Message-ID: <CAMKF1sqboZpbh3iXhPfvHfZZtNqiUu0UHhq4OhjDuo9wVLCbvA@mail.gmail.com>
To: kuo-lang.tseng@intel.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] turbostat: upgrade to 18.07.27
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
X-List-Received-Date: Fri, 24 Aug 2018 15:58:10 -0000
Content-Type: text/plain; charset="UTF-8"

another failure seen in License checksum mismatch

http://errors.yoctoproject.org/Errors/Details/187128/
On Fri, Aug 24, 2018 at 1:12 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> it does not seem to build see
> http://errors.yoctoproject.org/Errors/Details/187118/
> On Thu, Aug 23, 2018 at 11:44 AM Kuo-Lang Tseng
> <kuo-lang.tseng@intel.com> wrote:
> >
> > Update the license hash value also since SPDX header has been
> > inserted to kernel COPYING file since v4.17.
> >
> > Signed-off-by: Kuo-Lang Tseng <kuo-lang.tseng@intel.com>
> >
> > v2: add meta-oe prefix to subject line
> > ---
> >  .../turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb}               | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-kernel/turbostat/{turbostat_3.4.bb => turbostat_18.07.27.bb} (96%)
> >
> > diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > similarity index 96%
> > rename from meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> > rename to meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > index 3559417..5e64efa 100644
> > --- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
> > +++ b/meta-oe/recipes-kernel/turbostat/turbostat_18.07.27.bb
> > @@ -12,7 +12,7 @@ processor frequency and idle power saving state residency on supported \
> >  processors."
> >
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >
> >  COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
> >  COMPATIBLE_HOST_libc-musl = "null"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

