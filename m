Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 037997E915
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 17:01:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id w17so3879208qto.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jun 2019 10:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wUi0dvNbocbGj/t9IJh8jvpEaJtsZmdDUEh4yqvsils=;
	b=Nw6gPDb3DxFVs3NqmusSrJHK9elCAveOKr6Ew5EEUHowcDeBv+V6wj52QA1KwnOms6
	O6q9jA4DJ4VKZTwsA2+0mlvUA7lv/LzFic2HQY7n3hXhFUuUPkOAOeNX71Na4fJsuCSG
	uB8O+VT+IW2hOg426Uo42oi4Sjx/5kEhEG0fAMJaLhkjSKrbpKWdkiYPleE26xkAyKQ1
	ZgUxKxx27RSv1kWTtDFgbc0CcHxDTIfXwWQZjXCTerjz2bBhyFCM99K/SrvXsxPRN6KC
	7y4O2eKw3H4giIAjvm6eOLGK6Ns4natrfcndcuq+Wdl8DSK3PhkZ7i58O2zfDckjbauK
	rPmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wUi0dvNbocbGj/t9IJh8jvpEaJtsZmdDUEh4yqvsils=;
	b=C5otlSMrgtxSqPR2Cugh8RfbO0Zw5XynRYAailnxnRt7zuAwgiU7Xx2DvQdW5MMUS6
	jP/Mrot8vxBFZZtbF9sdTA4bewrjgI+AVhwL9YOUA+V90/AjPppsINTlIrzMCGOvq/MK
	9BZow9iIEPRy8JVHCEDNpsO9mpYAh31J8ss5QxJncQD0d4P1XfM4GpNo7CMfZTulD+sp
	CMx5ZlmFXzajcdRG6Q5B4N6jUym5QFETFoiVXq7Up2R+Q4PdhQ5t2Ht+d5KCdfp7VWWn
	ZsIb8gOAjEN3L4Hn0t52ccP/Amg9LbN4M70n7HNThbx5ffAHObZ0Y4t583iYcvLzte+F
	dD6g==
X-Gm-Message-State: APjAAAWd3jJXY1M23CzsGYtgrFb6RKCMiE2GNNt54PmOKzQVmZlBmszc
	bnrKba5TkkETzXdZMTGlgKVH/5OikRNahBHrC+0=
X-Google-Smtp-Source: APXvYqwOi/QHedap5A3bDvxNbSxhtgVQYRwSBzXD1zgVP4gJoS3tjLJcGMcME4YJHSkiZp/A36CzzxW/s4hTYeDffns=
X-Received: by 2002:a0c:bd1d:: with SMTP id m29mr40602834qvg.181.1561050110571;
	Thu, 20 Jun 2019 10:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190530055149.48837-1-yongxin.liu@windriver.com>
	<CAMKF1sr3nsW=Czi48++hsWs+J6Nqus8rM0mEe2Xh+Fo_9PNc2g@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D19C1AC20@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1srxKi9LfgEwWjTOwGNQXLZxGEF5LhdVMW8tSacBNNXa2w@mail.gmail.com>
In-Reply-To: <CAMKF1srxKi9LfgEwWjTOwGNQXLZxGEF5LhdVMW8tSacBNNXa2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jun 2019 11:01:24 -0600
Message-ID: <CAMKF1sogcJRJxQeePXzzdbiYRGRmJ5JrD30wH1ydCt8hYYpU_g@mail.gmail.com>
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
X-List-Received-Date: Thu, 20 Jun 2019 17:01:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 20, 2019 at 11:00 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Jun 20, 2019 at 2:55 AM Liu, Yongxin <Yongxin.Liu@windriver.com> wrote:
> >
> >
> > > -----Original Message-----
> > > From: Khem Raj [mailto:raj.khem@gmail.com]
> > > Sent: Friday, June 14, 2019 07:06
> > > To: Liu, Yongxin
> > > Cc: openembeded-devel
> > > Subject: Re: [oe] [meta-oe][PATCH] ndctl: v63 -> v65
> > >
> > > On Wed, May 29, 2019 at 11:02 PM Yongxin Liu <yongxin.liu@windriver.com>
> > > wrote:
> > > >
> > > > Add keyutils to DEPENDS.
> > > > Set FILES to package /usr/share/daxctl/daxctl.conf.
> > > >
> > > > Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
> > > > ---
> > > >  meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} | 6 ++++--
> > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > >  rename meta-oe/recipes-core/ndctl/{ndctl_v63.bb => ndctl_v65.bb} (87%)
> > > >
> > > > diff --git a/meta-oe/recipes-core/ndctl/ndctl_v63.bb b/meta-oe/recipes-
> > > core/ndctl/ndctl_v65.bb
> > > > similarity index 87%
> > > > rename from meta-oe/recipes-core/ndctl/ndctl_v63.bb
> > > > rename to meta-oe/recipes-core/ndctl/ndctl_v65.bb
> > > > index 61e53029b..8648ad580 100644
> > > > --- a/meta-oe/recipes-core/ndctl/ndctl_v63.bb
> > > > +++ b/meta-oe/recipes-core/ndctl/ndctl_v65.bb
> > > > @@ -10,10 +10,10 @@ LIC_FILES_CHKSUM =
> > > "file://COPYING;md5=e66651809cac5da60c8b80e9e4e79e08"
> > > >
> > > >  inherit autotools-brokensep pkgconfig bash-completion systemd
> > > >
> > > > -SRCREV = "cb2d678dd6d286dd96d31548c32449a8b883ae32"
> > > > +SRCREV = "ed17fd14608d8de072c8c090ffc5fcf78c4f48ff"
> > > >  SRC_URI = "git://github.com/pmem/ndctl.git"
> > > >
> > > > -DEPENDS = "virtual/kernel kmod udev json-c"
> > > > +DEPENDS = "virtual/kernel kmod udev json-c keyutils"
> > >
> > > Please bring in the recipe for keyutils as well. Since its not in
> > > OE-Core we should not depend
> > > on other layers for this
> >
> > The recipe for keyutils is in meta-security/recipes-security/keyutils
> > (git://git.yoctoproject.org/meta-security).
> >
> > Do you mean I should move keyutils from meta-security layer to OE-Core?
> >

or to atleast meta-oe

> >
>
> yes
>
> > Thanks,
> > Yongxin
> >
> >
> > > >
> > > >  S = "${WORKDIR}/git"
> > > >
> > > > @@ -31,3 +31,5 @@ do_configure_prepend() {
> > > >
> > > >  SYSTEMD_SERVICE_${PN} = "ndctl-monitor.service"
> > > >  SYSTEMD_AUTO_ENABLE_${PN} = "disable"
> > > > +
> > > > +FILES_${PN} += "${datadir}/daxctl/daxctl.conf"
> > > > --
> > > > 2.14.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

