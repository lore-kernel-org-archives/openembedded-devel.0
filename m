Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id D1B9371BEE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2017 08:20:31 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id v77so29638980wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2017 00:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rdl/rO+2OW7k4p8oCadOzYO6Yzf5UV1ICvvX6HyltmQ=;
	b=OTick8nZeZ06TFdbbAaJJnIGZvsynPKwxKxslqkvxaYASeMdZpRUpvf91iADqZfdTC
	nXta0Gh+yM1a22Gol//+cXRnwPzAVLoWO5vJXPnLs1kUE5SwE1FBpH3Y/IPbosaAGC2I
	9KnCSu4agUy8PJabh+ZZ5BUnU+FbAjPRwVniNgUihQg7xDLFT8GC5DuHFn80Ro2a3AKG
	J57qzWgqiM9O4FigYsR16aODmDkgRJuX96PYBmtp2abtJf6b6fmKQVH+w79MGdKf/IIc
	mPSMPOXvpmIhoAGOLXV3C+yfmkccAEcroU//xZTQs33CXMVYMEAZIPoCuWNC0OLBSq3a
	JkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rdl/rO+2OW7k4p8oCadOzYO6Yzf5UV1ICvvX6HyltmQ=;
	b=SgOpXgNWZw5V4M2Fo8m3Ufz/j9OiBBYb0yH5DV4eQUM5qiBJ1+oP5rWFiBdGuj5pQT
	qmRerYUHhji4uXWHO8hMw6JHSvEsYnz1mjhRimsr75cnl45a8YrxymyJ/YrlMCIdQV9P
	KK+hjvpg5MtoXwvXb8er28MnhUeHMw9j5dpefZxhF5IPgCFMFqWnxC7dpt0uGLfRNL5R
	azwN5qTFkwxmxLAsOA4BuR5r6fh6++hdek0aJOkCiHi6JC/TdG5Djv9oDfE69cy8ntQH
	t8r1wht3Bxj2JYP/cVUjt2HpX7eDaPbY/9AxS9rUwHOyMEnu9di/QQNGgFUU7YwIDOdI
	Dq8A==
X-Gm-Message-State: AMke39mNfNKJOV7rnfx5ib0R52oJ77P5AZwaCTeLiGWmPISd34mo0Tknioa9wWwkAqqUYy1ArWRyxm2k8p8Efw==
X-Received: by 10.28.211.80 with SMTP id k77mr5049629wmg.124.1488010832439;
	Sat, 25 Feb 2017 00:20:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Sat, 25 Feb 2017 00:20:31 -0800 (PST)
In-Reply-To: <20170225034218.GK8436@mentor.com>
References: <f9cd7853-8802-4b7d-a16c-01d35461b7e5@email.android.com>
	<20170225034218.GK8436@mentor.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 25 Feb 2017 09:20:31 +0100
Message-ID: <CA+chaQe4b7QR5hHMr5S-AEeFNnZLOZivYuiqyBViROFJs=oqyQ@mail.gmail.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
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
X-List-Received-Date: Sat, 25 Feb 2017 08:20:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> My builds without gvfs are still happy, but reverting the
patch breaks all builds

What gets broken? When I removed this change from master-next after
Andreas's report I haven't seen any new issue and the gvfs one was indeed
fixed after that.

I'll include revert at least in master-next to see what it does with next
bitbake world.

On Sat, Feb 25, 2017 at 4:42 AM, Joe MacDonald <Joe_MacDonald@mentor.com>
wrote:

> [Re: [oe] [meta-networking][PATCH v2] Samba: use built-in libtevent] On
> 17.02.24 (Fri 22:33) MacDonald, Joe wrote:
>
> > Yeah.  If you're near a keyboard, please go ahead and revert otherwise
> > I'll get to in later on tonight.
>
> Bah.  This isn't just the revert I'd been hoping for.  Samba, as usual,
> is a pain.  My builds without gvfs are still happy, but reverting the
> patch breaks all builds, AFAICT, so I'm going to leave this alone until
> I sort out what the correct repair job looks like here.  Unless someone
> comes up with a solution before I get to it.  The weekend is rather full
> right now, I'm afraid.
>
> -J.
>
> >
> > On Feb 24, 2017 5:01 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Joe?
> >
> > On Fri, Feb 24, 2017 at 10:37 PM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com<mailto:schnitzeltony@googlemail.com>> wrote:
> > On Mon, Feb 20, 2017 at 5:08 PM, Szombathelyi Gy=C3=B6rgy <gyurco@freem=
ail.hu
> <mailto:gyurco@freemail.hu>> wrote:
> > > Hi,
> > >
> > > If there&#39;s no solution to resolve the conflict between the
> internal tevent and the external one, then maybe putting the
> libtevent-internal.h from the external lib to the samba tree would be a w=
ay
> to go.
> > >
> > > Br,
> > > Gy=C3=B6rgy
> > > -------- Eredeti lev=C3=A9l --------
> > > Felad=C3=B3: Andreas M=C3=BCller &lt;schnitzeltony&#64;googlemail.com=
<
> http://googlemail.com>&gt;
> > > D=C3=A1tum: 2017 febru=C3=A1r 20 12:52:18
> > > T=C3=A1rgy: Re: [oe] [meta-networking][PATCH v2] Samba: use built-in
> libtevent
> > > C=C3=ADmzett: openembedded-devel&#64;lists.openembedded.org<http://li=
sts.
> openembedded.org> &lt;openembedded-devel&#64;lists.openembedded.org<
> http://lists.openembedded.org>&gt;
> > >
> > > &gt; In last build I&#39;ve noticed only this new issue related to
> samba:
> > > &gt;
> > > &gt; ctdb-2.5.6: ctdb rdepends on samba, but it isn&#39;t a build
> dependency, missing samba in DEPENDS or PACKAGECONFIG? [build-deps]
> > > &gt;
> > > &gt; Maybe this dependency was created from samba being libldb
> provider in
> > > &gt; this build.
> > > &gt;
> > > &gt; gvfs and whole meta-gnome layers is still included in my world,
> maybe it
> > > &gt; didn&#39;t fail because some gvfs dependency was already failing
> or one of
> > > &gt; samba related changes in master-next is fixing this one.
> > > &gt;
> > > Some background: During last weekend I prepared a series based on
> > > master-next unblacklisting. First target is to build a xfce-image
> > > again [1]. Last step yesterday evening should be rebasing against
> > > latest master-next and run a test build. That failed for gvfs - so I
> > > stopped sending stuff. Now I know why gvfs fails...
> > >
> > > How do we proceed with this patch?
> > >
> > > [1] https://github.com/schnitzeltony/meta-
> openembedded/tree/work-2017-02
> > >
> > Just notices that this patch made it into master breaking at least gvfs=
.
> Revert?
> >
> > Andreas
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org<mailto:Openem
> bedded-devel@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --
> -Joe MacDonald.
> :wq
>

