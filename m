Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id DEA946093F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 23:09:59 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id b52so4355337wrd.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Feb 2018 15:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EBqb++DdwJ6NvMT2vgG6HVdRW8FiAB7j2rKy9Rn5o8c=;
	b=RNStBib2yTOnDjl2gbJjwobNzacKkuhX2kVwn3nV4SznoV7K/GEuf5/60wXrLFpLEx
	/KlzFAc2nBElMAqWi4MT3j2IW22KGCrSnMn7LF/qybib3+EW2jVK7Y82BvxBp1YdaJep
	q5JgJ7MN+6CzAsNbeqUG0KcVniYqT/steQVt1Cm7GYulNfKLTECR21ISw6hvtJNTJRBD
	RGd1e6lGR4cBG357+mWsZUcqYn5lDzDaWFbstKEynDhyvuB7E3WQQXazt3G0jJjfwx7O
	7Cs5q+i0ivyEXBtjy9cI2uuP45Kt+dFXeOQ+YqgXWCRZ8NxIRQjUcOcX/XQdGwYRDs4i
	mPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EBqb++DdwJ6NvMT2vgG6HVdRW8FiAB7j2rKy9Rn5o8c=;
	b=AOHV02n+pgGiaX024HeoEVZnDT6NtFBGnw3yDlLBiFJP8U57nb4ThXLJBq7NKqopEc
	GUgJb7ViQPktMfz268rXx/xRpxkml69ii8V1S3UZMmO0kSzUbUd7CjWkMBvBfIVn0+2v
	WVAHJZyYUvmUDJWJ3QKKPBYVqZN3NhcO740ZBPXkI98m9WNmic+fqtcBw/F3xZ/JL2wu
	WMY7mSQE9VS5GOrFrGSv2tnCcvBhOMua8OyNmMCClJ9sFIXx+dXQJg4bbXZLAwCgVV60
	WQliqGoii5LuD/QFCzWT3XVpw3NP3vpbA+ArKp6V6nhTajY3v+0iLByOHJ9mZES93cLg
	KNXQ==
X-Gm-Message-State: APf1xPDx4vvhJgjIpe9cuBu9WZ66b+q63B3XIm1k67VkDYcQ9S7ziOrD
	hoVfPY2Yd/6cMBBHrapcKjI/ew+bxsqrncskXkI=
X-Google-Smtp-Source: AH8x227xB08lR7SxIqElIa5/eAkvGR4ofzcI5zJPxgfG2KmgTzoPWqSa9I/Ryj8ejfLPC1Okq/+S62S8Q3jHhSFmN+M=
X-Received: by 10.223.151.129 with SMTP id s1mr7224637wrb.206.1518822600596;
	Fri, 16 Feb 2018 15:10:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 16 Feb 2018 15:10:00 -0800 (PST)
In-Reply-To: <1518819754.6900.50.camel@gmail.com>
References: <20180216213511.117-1-Martin.Jansa@gmail.com>
	<1518819754.6900.50.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 17 Feb 2018 00:10:00 +0100
Message-ID: <CA+chaQcKXbteCmzE7SCZdZ5zjBnnAefyH+JdJDGChKmUpNvG+g@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] waf-samba: use new oe.utils.parallel_make_argument function instead of removed get_waf_parallel_make
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
X-List-Received-Date: Fri, 16 Feb 2018 23:10:00 -0000
Content-Type: text/plain; charset="UTF-8"

This is just to fix the parsing ASAP, you can still send your updated
change which removes the waf inherit completely.

On Fri, Feb 16, 2018 at 11:22 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> On Fri, 2018-02-16 at 21:35 +0000, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta-networking/classes/waf-samba.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-
> > networking/classes/waf-samba.bbclass
> > index e490176241..a63842cadc 100644
> > --- a/meta-networking/classes/waf-samba.bbclass
> > +++ b/meta-networking/classes/waf-samba.bbclass
> > @@ -87,7 +87,7 @@ do_configure() {
> >  }
> >
> >  do_compile () {
> > -    python ./buildtools/bin/waf ${@get_waf_parallel_make(d)}
> > +    python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d
> > , '-j%d', limit=64)}
>
> Ah, beat me to it. Either way, I approve FWIW.
>
> >  }
> >
> >  do_install() {
> > --
> > 2.15.1
> >
>

