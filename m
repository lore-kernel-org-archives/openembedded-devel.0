Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 231D260697
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 19:37:43 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s24so23619031iog.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 11:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6cbf/QAGYG0LbDvj/Woc5z/K8GRWHzfdqnOQ4PtFeDY=;
	b=AgVEhaLLhymgfnlQRwaORxy9Hpc31h/5BNxf9XE520QDVHXn7Nh/GagGq+IKMz2pSO
	tT4x2IOFgCSZPw1rLkUSdxXbViAhEHw8z28L2p/yO3zpp/ONxyakOh2maoEcl6pxB+MA
	2oHOJunanbVfAYu/QpTjsJCOPgJ05JHLebpKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6cbf/QAGYG0LbDvj/Woc5z/K8GRWHzfdqnOQ4PtFeDY=;
	b=AqIKX2LI5pQA4JiabkYl0oSFb9KdK9lBCenFPfSCR2upztQ/6bgnzGyEUirKEPcHho
	c6KZCet19RQqw1S1WSiVA3OsJW2WxWUbT5IO+vXd5Lw0LCLlfnfVl7785QZAQJl0wQLj
	zDWkl9uiyWsE08Mbsl2AOb3RHIItb3Jt9Zv+noFVzMZPc7WMqOFk+6n2fjP4m+cA/AKm
	F1A7DLFhABqSrMhNH696R7pfSOCsrkj51DqG5gjrm/xkB2v7umv1nyuKSoDdc28GlAFS
	qDS1tZgUfWXFbbQHELyjZKWvZc6Feoc1gThsO91Tsk7Q6AnRIfJLFkVrGRR1CDvt1FQh
	z8yw==
X-Gm-Message-State: APjAAAWCe7Nz1xNs2h3girboFCyeBtODmVrTDwZtvm1W7Wm7d9Hy0y9z
	Bb6HiPaVZdAueYoSmPm3W4uplh1jxzt5nDp2W0CuThRJzXs=
X-Google-Smtp-Source: APXvYqyXXW1FiOCzYfggjVC16pSzPWGanRtC78s+l20RNENnVDUpFXxC0ItZiFLftKUTld8job3TbK3E1l6LYpV+5JQ=
X-Received: by 2002:a02:9503:: with SMTP id y3mr9527481jah.14.1582054664025;
	Tue, 18 Feb 2020 11:37:44 -0800 (PST)
MIME-Version: 1.0
References: <1581723823-21171-1-git-send-email-wangmy@cn.fujitsu.com>
	<1581723823-21171-2-git-send-email-wangmy@cn.fujitsu.com>
	<CAMKF1srVisq=yo-3dJ50T8xnBimO=gDkumZLw=yEaugxGbz7Lw@mail.gmail.com>
In-Reply-To: <CAMKF1srVisq=yo-3dJ50T8xnBimO=gDkumZLw=yEaugxGbz7Lw@mail.gmail.com>
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
Date: Tue, 18 Feb 2020 11:37:33 -0800
Message-ID: <CAHrpVsXMkZydpmbXPdQJo5qW1=DpJTqSUghNjTnZahqCg7hj9Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fio: upgrade 3.17 -> 3.18
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
X-List-Received-Date: Tue, 18 Feb 2020 19:37:43 -0000
Content-Type: text/plain; charset="UTF-8"

I was just about to submit a patch to remove the disabling of compiler
optimizations to fio. On our cortex A72 this kills the performance of fio
by 25%. That would solve this build issue also. I haven't seen any crashes
with fio. If there are some architecture specific issues can the removal
of optimizations be arch specific only and not the default?

On Sat, Feb 15, 2020 at 12:40 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> https://errors.yoctoproject.org/Errors/Details/391129/
>
> On Fri, Feb 14, 2020 at 8:11 AM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
> >
> > Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> > ---
> >  meta-oe/recipes-benchmark/fio/{fio_3.17.bb => fio_3.18.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-benchmark/fio/{fio_3.17.bb => fio_3.18.bb} (96%)
> >
> > diff --git a/meta-oe/recipes-benchmark/fio/fio_3.17.bb b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> > similarity index 96%
> > rename from meta-oe/recipes-benchmark/fio/fio_3.17.bb
> > rename to meta-oe/recipes-benchmark/fio/fio_3.18.bb
> > index 482928c31..b6484290f 100644
> > --- a/meta-oe/recipes-benchmark/fio/fio_3.17.bb
> > +++ b/meta-oe/recipes-benchmark/fio/fio_3.18.bb
> > @@ -22,7 +22,7 @@ PACKAGECONFIG_NUMA_armeb = ""
> >  PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
> >  PACKAGECONFIG[numa] = ",--disable-numa,numactl"
> >
> > -SRCREV = "08ce9dc20b8a4e55db7af6d869ddfa49b4a02d03"
> > +SRCREV = "ac694f66968fe7b18c820468abd8333f3df333fb"
> >  SRC_URI = "git://git.kernel.dk/fio.git \
> >            file://0001-update-the-interpreter-paths.patch \
> >  "
> > --
> > 2.17.1
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

