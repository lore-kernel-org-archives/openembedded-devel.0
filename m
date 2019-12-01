Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD917DD6A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 06:42:14 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id u16so4378877ilg.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 22:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iXgPbiF11rcVzVQq+MjPTywIqdb2FapRaWu3QIjsneQ=;
	b=PAd99bs4c/mBv5fgDFzpbYTDYznUBph+qDDZ+cgP0J6XoEf8BKOgkjsp8gggRKM0SS
	t2SpASBP9bY48ZpukV3NintWNCgoTvten8NV7BjZ2JoDkRx+NAQz9hoWauLU/Ia8KCHj
	UWr7Bw/Qk5no/dWyhRV7M3UeorUwMJx3H2UqPESAA4QdXCdc0dA4sIhyhqQSlZCqGp03
	LlOsyDKh4l1Bio88BWz3ELpRWGPGoeVJ+OEFOknCNo3umnFU2HYtgTDaQe9HJNF5R2NW
	sYQwT0bqTC07XWWjfy1IDoGOtdkCyEGY28MNNWWN131wNTPyD3/Nec04Te5x5guxGl7c
	4cnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iXgPbiF11rcVzVQq+MjPTywIqdb2FapRaWu3QIjsneQ=;
	b=LJ1Yt5vCQxnabU4d/djc78o1KaXuQU277P49maVAPbOpDq2t1IjMEzEWe+g4E54g9t
	NQDZfzXR1Fw1g4mlIe7X6TgFCUl7HniwTEcX+ux6OB1FNEPRF2NZdO1oZ5uPYyW/GXuH
	jQ7+5nSbkKhAYgRW5exV7mudQjGKH3SG24R054uSPAL17Qsw3BdvCEvD8mFf6ZgAMAKd
	CMJywqENfxMUShd7o7pZqChJjYdImDKqwFtWMee3ZioCS5XcxNyx8UUKuTRMdpvG6OFQ
	GKEG0znoQ0EZ0RaoVl/+Qml1m5YeCvXmI8b8tBp2sGcgsQbvdLa+vRhUjAtQeblgaT3/
	uwjA==
X-Gm-Message-State: APjAAAV/znLZ6Oa92Wp1O0evidIfX9NJahZ2rbv9Kt8fAqr6Oopc/tNK
	glZOCd8ZWGQv0/KBakSFowKonx/dLobbDlgqjO8ujLvZwXg=
X-Google-Smtp-Source: APXvYqwIA8kb6/HotTwLVm2VbKCjUy+IEhyMFjR0Vjv+Totf2tORhAEAYaoOupve0O/0NHVDgMezdfPTbuPh/nBnIlg=
X-Received: by 2002:a92:1092:: with SMTP id 18mr13861307ilq.198.1575182535406; 
	Sat, 30 Nov 2019 22:42:15 -0800 (PST)
MIME-Version: 1.0
References: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1spgSzLNDKqZiVLfg3E2R3KKAT_JaEaoSg6ew0jq8iWZDg@mail.gmail.com>
In-Reply-To: <CAMKF1spgSzLNDKqZiVLfg3E2R3KKAT_JaEaoSg6ew0jq8iWZDg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 30 Nov 2019 22:42:03 -0800
Message-ID: <CANx9H-Bnma31n4LcwHCHkThCh7X8QMZqdhKgzdGByyKXBxxy=g@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] python-simplejson: upgrade 3.16.0 -> 3.17.0
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
X-List-Received-Date: Sun, 01 Dec 2019 06:42:14 -0000
Content-Type: text/plain; charset="UTF-8"

Also, please use the correct subject line [meta-python] NOT [meta-oe]. This
makes it much harder to automate patch review.

On Fri, Nov 29, 2019 at 4:34 PM Khem Raj <raj.khem@gmail.com> wrote:

> there is a py2 variant as well. So please upgrade both in tandem.
>
> On Wed, Nov 27, 2019 at 6:30 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  meta-python/recipes-devtools/python/python-simplejson.inc             |
> 4 ++--
> >  .../{python-simplejson_3.16.0.bb => python-simplejson_3.17.0.bb}
> | 0
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-simplejson_3.16.0.bb
> => python-simplejson_3.17.0.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc
> b/meta-python/recipes-devtools/python/python-simplejson.inc
> > index 5592eaf..1a8d390 100644
> > --- a/meta-python/recipes-devtools/python/python-simplejson.inc
> > +++ b/meta-python/recipes-devtools/python/python-simplejson.inc
> > @@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson
> "
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
> >
> > -SRC_URI[md5sum] = "744fa99aed207478f8fbf9dd9f04fad3"
> > -SRC_URI[sha256sum] =
> "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"
> > +SRC_URI[md5sum] = "8a5ed75c367b90fedc3d685742e2a1c7"
> > +SRC_URI[sha256sum] =
> "2b4b2b738b3b99819a17feaf118265d0753d5536049ea570b3c43b51c4701e81"
> >
> >  inherit pypi
> >
> > diff --git a/meta-python/recipes-devtools/python/
> python-simplejson_3.16.0.bb b/meta-python/recipes-devtools/python/
> python-simplejson_3.17.0.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/
> python-simplejson_3.16.0.bb
> > rename to meta-python/recipes-devtools/python/
> python-simplejson_3.17.0.bb
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

