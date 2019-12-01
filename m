Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A8E3C7DD6A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Dec 2019 06:41:27 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s2so1136019iog.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 22:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NkzOiwzS204axWFNqr2QNWaumwoPW38dyTl1lHvWhXE=;
	b=cu0BLjVefQL5pmi7kxUy7BWxgsY+RKAxNcyzzEGqPpwrgOh81IEw/yg90sX1q/suX0
	RvUChbDfxNQLQ6u/XT0yy78WK44CP+vucUJbxxqxwMFLANx9x2TW7LBEMm4NVn6J2YmP
	UJNWhQhT+urZHkUejXdcvoVZT41lWg6s2PbkB9Ya1AdillWAvetdrQ3IQ1/LA9QwRLII
	Z2EIKvL23MZf1yNGWp475436vqbqpeMTIi0cuzitTNqoP+/DY+mAakcKXE/hZYp6SvMD
	2aaT8rnnhuuIbBWEu3ucHNbGs/Um5aHAFmVCriIl4+cYpEdDQflnUXQqIToJkcZX6qO4
	aHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NkzOiwzS204axWFNqr2QNWaumwoPW38dyTl1lHvWhXE=;
	b=gz+axuOkJxornma20cgKQ945cm0VkVrBZ4EbtN/kGw5pmVaA1AX4ouZVXC9o2lDOOK
	KSyJuO4LH6FxD+D4uUwylmdwSs+CCJLa7MwHHJfzYNnDw89QaCXaRxSIW6WzpdjabgjZ
	wJ6t1TDDfs0CpWGo5Rqtzo6rh0QaOlLOZMliBkjlDsJMH0f1BYDheU2scuGFg6590Yr2
	Ck1XOT9g4aeThReLTAI9dpJAz2qFs5Z5E76u4ZMOwLlWy1LXmLfSGVaea6W4x1VfqJB+
	IwJ9W45GKS/IlWAIJJMF7Vt+SpNQRilmHNm6r9ypPXMm3Igg1DxI64RUDXxJfdJs4nxq
	/T+Q==
X-Gm-Message-State: APjAAAWtsAbcjy2DEjvC0SQ9G95Sq+LRStLrGrpGZLVBzprFruCgPcsQ
	u7CGkJxtUnk6JllnD1G1MA5XJLYC4zckZUKsx47Qw3DL
X-Google-Smtp-Source: APXvYqyEio0lID5G/zjog4xL/vKWPEscPA2GcohVg42DCdpV9tXHMntmXzwug33OrP0IfGv+UPcZ12ar6kwD3hhPuEs=
X-Received: by 2002:a05:6638:35d:: with SMTP id
	x29mr15039613jap.46.1575182488579; 
	Sat, 30 Nov 2019 22:41:28 -0800 (PST)
MIME-Version: 1.0
References: <1574932470-14682-1-git-send-email-wangmy@cn.fujitsu.com>
	<1574932470-14682-5-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1so-mGHLhpebFOGC+4Qn7M9_99MrNq8uM7d6ieWmcA3k0w@mail.gmail.com>
In-Reply-To: <CAMKF1so-mGHLhpebFOGC+4Qn7M9_99MrNq8uM7d6ieWmcA3k0w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 30 Nov 2019 22:41:17 -0800
Message-ID: <CANx9H-Ceb07rnb1Z8q3avFsHHpkJSaX3Nj2+ObPqj4wF9k8Sow@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] python-cmd2: upgrade 0.9.19 -> 0.9.20
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
X-List-Received-Date: Sun, 01 Dec 2019 06:41:27 -0000
Content-Type: text/plain; charset="UTF-8"

Also, please use the correct subject line [meta-python] NOT [meta-oe]. This
makes it much harder to automate patch review.

On Fri, Nov 29, 2019 at 4:36 PM Khem Raj <raj.khem@gmail.com> wrote:

> please upgrade both py2 and py3 versions together
>
> On Wed, Nov 27, 2019 at 6:30 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  meta-python/recipes-devtools/python/python-cmd2.inc                   |
> 4 ++--
> >  .../python/{python-cmd2_0.9.19.bb => python-cmd2_0.9.20.bb}
>  | 0
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-cmd2_0.9.19.bb =>
> python-cmd2_0.9.20.bb} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-cmd2.inc
> b/meta-python/recipes-devtools/python/python-cmd2.inc
> > index 3a6bf54..1a4249d 100644
> > --- a/meta-python/recipes-devtools/python/python-cmd2.inc
> > +++ b/meta-python/recipes-devtools/python/python-cmd2.inc
> > @@ -3,8 +3,8 @@ HOMEPAGE = "http://packages.python.org/cmd2/"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=01aeabea7ae1529a8e4b674b7107d6bc"
> >
> > -SRC_URI[md5sum] = "20f3f76b2aaf36a17372717b469ca969"
> > -SRC_URI[sha256sum] =
> "c81284083d993af18b8fef57d89d854d49d051d4c2c8a8e12d0281e369ac3682"
> > +SRC_URI[md5sum] = "38e573f0b1d868f21068b726c285e52b"
> > +SRC_URI[sha256sum] =
> "1ba349af127f9052363972adcbcfb921f9ca5e90f2bcbfba11b117500f11a845"
> >
> >  inherit pypi
> >
> > diff --git a/meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb
> b/meta-python/recipes-devtools/python/python-cmd2_0.9.20.bb
> > similarity index 100%
> > rename from meta-python/recipes-devtools/python/python-cmd2_0.9.19.bb
> > rename to meta-python/recipes-devtools/python/python-cmd2_0.9.20.bb
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

