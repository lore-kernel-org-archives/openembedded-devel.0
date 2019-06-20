Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id B0C777E655
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:01:21 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id x2so3959738qtr.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lXE0W35/FpeI4r4OJu60rmpTer+s5m8deljS5zH3W0s=;
	b=SUwuwu8KbCinlB5qH5wLZaM2xKdEl1GxT86LpPH4BL/ZX591HVwlpPqi0XvKnzggZY
	l+/Qw4V+10FsH6x92RSx6Wt+XBU4fltlFvvtV3IpDHGup91/6NXhUYZ/hrRx9ZICDWCQ
	wAXXXwJxXetJjc0ybx4dr700SQBAnGppx8RbJxfnD+PZIXayedCh27REIBbG/U8e4j6q
	UiGZh64mr1uB9K2dA4/M9xIyfMJYVPl50uOcKEhvRw6PL0I8HOIWFne8x3lYDUa6Gg7+
	vgTf3ra+HZRS3ypntuzugbKvJQFNscjABqJIJGNmAo4RrkaM2srilfdIbu+TDV0XuJVc
	+cVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lXE0W35/FpeI4r4OJu60rmpTer+s5m8deljS5zH3W0s=;
	b=mgONcxSkTNBP/NWpDGQQJNq9kwptLmEfsXV4oFJIk9A7vzrN/HGGaCCPBzCg9at2wl
	BhmCvw+/fstUU9BcJGkUagHyno0t/Lx6sweG9zwYq11lv21Vob69oFYHSZHey8Q8xAbA
	0ccRgCLVd+fgSrMNMg+1JOUW6j9sp+YHYQyf7j6Q2RdmHuhrATSFIJ47v9uJhLLkBqZ8
	vuVMozfr8ea+TSJ2Wm6yV9fm92d44PHN1bpWn7iPCoqB7Ndhk2AP7p6wJu5FRh5TjsAH
	glGewNbvMWRnZHiJrh9M/pW9Ss/STQ94oGL7vcxis/22hvwN4fwgy9WnsBQBRrHu+I+R
	DaxA==
X-Gm-Message-State: APjAAAVTYxBmef54A0CCERzvKPd8F8AQ/0Jx+dCFddxB60ufQXDX3nxS
	/os+q/c5/dVry7S4C0C5zUWMw0eCpGwm0NbA3Fg=
X-Google-Smtp-Source: APXvYqxWvdZlPqfql7nTo4ummu1eFdNj24lyZ5FGRp+zLfW6lp20HgLaQXVIc5BE+8Z3CVQbK8S3Qnk/nCg2L/YW6lA=
X-Received: by 2002:aed:3f1d:: with SMTP id
	p29mr113065400qtf.378.1561050082380; 
	Thu, 20 Jun 2019 10:01:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190530055149.48837-1-yongxin.liu@windriver.com>
	<CAMKF1sr3nsW=Czi48++hsWs+J6Nqus8rM0mEe2Xh+Fo_9PNc2g@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D19C1AC20@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <597B109EC20B76429F71A8A97770610D19C1AC20@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 11:00:56 -0600
Message-ID: <CAMKF1srxKi9LfgEwWjTOwGNQXLZxGEF5LhdVMW8tSacBNNXa2w@mail.gmail.com>
To: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ndctl: v63 -> v65
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
X-List-Received-Date: Thu, 20 Jun 2019 17:01:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 2:55 AM Liu, Yongxin <Yongxin.Liu@windriver.com> wrote:
>
>
> > -----Original Message-----
> > From: Khem Raj [mailto:raj.khem@gmail.com]
> > Sent: Friday, June 14, 2019 07:06
> > To: Liu, Yongxin
> > Cc: openembeded-devel
> > Subject: Re: [oe] [meta-oe][PATCH] ndctl: v63 -> v65
> >
> > On Wed, May 29, 2019 at 11:02 PM Yongxin Liu <yongxin.liu@windriver.com>
> > wrote:
> > >
> > > Add keyutils to DEPENDS.
> > > Set FILES to package /usr/share/daxctl/daxctl.conf.
> > >
> > > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > ---
> > >  meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >  rename meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} (87%)
> > >
> > > diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-
> > core/ndctl/ndctl_v65.bb
> > > similarity index 87%
> > > rename from meta-oe/recipes-core/ndctl/ndctl_v63.bb
> > > rename to meta-oe/recipes-core/ndctl/ndctl_v65.bb
> > > index 61e53029b..8648ad580 100644
> > > --- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
> > > +++ b/meta-oe/recipes-core/ndctl/ndctl_v65.bb
> > > @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
> > >
> > >  inherit autotools-brokensep pkgconfig bash-completion systemd
> > >
> > > -SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
> > > +SRCREV = "ed17fd14608d8de072c8c090ffc5fcf78c4f48ff"
> > >  SRC_URI = "git://github.com/pmem/ndctl.git"
> > >
> > > -DEPENDS = "virtual/kernel kmod udev json-c"
> > > +DEPENDS = "virtual/kernel kmod udev json-c keyutils"
> >
> > Please bring in the recipe for keyutils as well. Since its not in
> > OE-Core we should not depend
> > on other layers for this
>
> The recipe for keyutils is in meta-security/recipes-security/keyutils
> (git://git.yoctoproject.org/meta-security).
>
> Do you mean I should move keyutils from meta-security layer to OE-Core?
>
>

yes

> Thanks,
> Yongxin
>
>
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > @@ -31,3 +31,5 @@ do_configure_prepend() {
> > >
> > >  SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
> > >  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> > > +
> > > +FILES_${PN} += "${datadir}/daxctl/daxctl.conf"
> > > --
> > > 2.14.4
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

