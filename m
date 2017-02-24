Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4B8774FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:00:35 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r141so24428386wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xz/yTbOzVGh/96hb3dgZpB7eTU+hYM6Pkjj4E2Uju7Q=;
	b=DS/WIaTRJFWf4lok1tSUts/D6Jeedez/aoqbhNLo+4r4UoQR6FFY32RYkvjHS3HNlS
	TyQa04y4l+C3HjMFPYEOOlnxFgknd/8QT1BRE0aeWoagEDxvkGVi0o/s/4jfIlIMz4+O
	7HtRcIHNa0+MyLm1MrOF4GiCaTrPSb2XlgX12KovvtG2C1XoQDbfwrnpwl7MD5KqFCgq
	hRaGCel9FJDZ5Hh6vs4x6M703PG+Es6PuR8U5m8XVhw5a16ZdZJSp0J2i27vtGlwcyIR
	+Bm9b1rDiYeevFR9E/6uta0QRavcmX2vGuMyBrzkyhGqxWsc/h1CNI/RTbFt3iI06715
	PpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xz/yTbOzVGh/96hb3dgZpB7eTU+hYM6Pkjj4E2Uju7Q=;
	b=LeB9vu9DcP9SkAMi+051HhAkJmLFU6Rpg/zaKmDOBBB6GCqWc/Xu0r9VL0Cm+FMzLD
	AOiC1JWUeHm4/y4NHzfRcRVTWe2u9yLetQYtVQcOsOeRAOfRf+ynVnntD2VJQFwqk+43
	kIdhHH+9WFCWlRHjlMYqGUJYPbSEegGwEQGbKkP/GJsjrMadCTERDwOQhuyl5FukSFjT
	b+2z8DgZYYAV6kjTcsryG/wlPZct9mEagGSOl/W8PTZIIuDiY0qt6mBuriIYsSHkjLv/
	2dFAVWXgSUbAEez/6++A4O+b9ZuhYs5SVaQTJUCrRsBnGi2P5ZeeTun6Bm6cftkTX+Uw
	jw5Q==
X-Gm-Message-State: AMke39kiwpSEegP6uV885ZczIB6qOF4YGd/4SNlvHv0MtOyY73ptrswN/ut8dohu4uFKT7BsSrgtfmNN6NKiiw==
X-Received: by 10.28.211.80 with SMTP id k77mr3718377wmg.124.1487973636680;
	Fri, 24 Feb 2017 14:00:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.208.207 with HTTP; Fri, 24 Feb 2017 14:00:36 -0800 (PST)
In-Reply-To: <CALbNGRSvWsmkDnxVPb5PFe1tCgJB+0vpK8pPYB9a+h8EnpTipw@mail.gmail.com>
References: <20170211141745.3380-1-gyurco@freemail.hu>
	<CALbNGRQ9c=JeSRA2r5xWhpHB+fSf2JKQbjp=S4HmGJjdyJKV5A@mail.gmail.com>
	<20170220121752.GB3266@jama>
	<CALbNGRRTvzyGpT4O0YCSmz-WvSjxVOEZCXxRE_grdV2MmvW4jQ@mail.gmail.com>
	<AvSi0A.u5mfvzOvRT55.zGleTngOVAwASoCrPaYd@freemail.hu>
	<CALbNGRSvWsmkDnxVPb5PFe1tCgJB+0vpK8pPYB9a+h8EnpTipw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 Feb 2017 23:00:36 +0100
Message-ID: <CA+chaQfsCfSOAxqJd3F-Lj6Wvm-zH8qX9Jz9JCm0LvZgF3iZxQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>, 
	Joe MacDonald <joe_macdonald@mentor.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2] Samba: use built-in libtevent
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
X-List-Received-Date: Fri, 24 Feb 2017 22:00:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Joe?

On Fri, Feb 24, 2017 at 10:37 PM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Mon, Feb 20, 2017 at 5:08 PM, Szombathelyi Gy=C3=B6rgy <gyurco@freemai=
l.hu>
> wrote:
> > Hi,
> >
> > If there&#39;s no solution to resolve the conflict between the internal
> tevent and the external one, then maybe putting the libtevent-internal.h
> from the external lib to the samba tree would be a way to go.
> >
> > Br,
> > Gy=C3=B6rgy
> > -------- Eredeti lev=C3=A9l --------
> > Felad=C3=B3: Andreas M=C3=BCller &lt;schnitzeltony&#64;googlemail.com&g=
t;
> > D=C3=A1tum: 2017 febru=C3=A1r 20 12:52:18
> > T=C3=A1rgy: Re: [oe] [meta-networking][PATCH v2] Samba: use built-in li=
btevent
> > C=C3=ADmzett: openembedded-devel&#64;lists.openembedded.org
> &lt;openembedded-devel&#64;lists.openembedded.org&gt;
> >
> > &gt; In last build I&#39;ve noticed only this new issue related to samb=
a:
> > &gt;
> > &gt; ctdb-2.5.6: ctdb rdepends on samba, but it isn&#39;t a build
> dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
> > &gt;
> > &gt; Maybe this dependency was created from samba being libldb provider
> in
> > &gt; this build.
> > &gt;
> > &gt; gvfs and whole meta-gnome layers is still included in my world,
> maybe it
> > &gt; didn&#39;t fail because some gvfs dependency was already failing o=
r
> one of
> > &gt; samba related changes in master-next is fixing this one.
> > &gt;
> > Some background: During last weekend I prepared a series based on
> > master-next unblacklisting. First target is to build a xfce-image
> > again [1]. Last step yesterday evening should be rebasing against
> > latest master-next and run a test build. That failed for gvfs - so I
> > stopped sending stuff. Now I know why gvfs fails...
> >
> > How do we proceed with this patch?
> >
> > [1] https://github.com/schnitzeltony/meta-openembedded/tree/work-2017-0=
2
> >
> Just notices that this patch made it into master breaking at least gvfs.
> Revert?
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

