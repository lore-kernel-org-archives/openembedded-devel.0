Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4CADF6DA6E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 21:45:55 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id sa20so3043354veb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Mar 2014 14:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=5FQfNet1M5ASWrgRYvG2QEPC5GtXRj32oxLW9ybCEnU=;
	b=bKqqKoMN5+bCwurzisD27mSCl6HCyyZcNz3wHnOsnU4nGvXuUsg9bLUOnFsO2GJ+Q5
	KUCKJgPJttX5BS3BqFTZX1H97ZB+3EeVWr9FgSWkqaTj+OKd4RjwbiShFHoenS9LRU79
	CT9CJ1gWgbNPDIvDa1hxliujgY4OVfLEyNuKFvooRrmjBiJRaxxGKtBe1ZbV4uuEf1Db
	VKGfkm567BCOT9ttMsAW3m9QfK3crwRT+p+qBKMCy9WgZhsbm+G6eLzF2djXBn679APl
	kzmXvjYNQTPMin6wAMnyxuM+xro4QFVwfQZKPlKxVzjmI2Qj8iYuYpmdPmYj9Lu66WNT
	283w==
MIME-Version: 1.0
X-Received: by 10.220.163.3 with SMTP id y3mr3452129vcx.7.1395870355698; Wed,
	26 Mar 2014 14:45:55 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Wed, 26 Mar 2014 14:45:55 -0700 (PDT)
In-Reply-To: <20140326213520.GN3709@jama>
References: <1395869254-7092-1-git-send-email-adam.yh.lee@gmail.com>
	<20140326213520.GN3709@jama>
Date: Wed, 26 Mar 2014 14:45:55 -0700
Message-ID: <CAFeBWL6AUcjAd+fwtkC6rt2Cn735XMcsPkRCzLOez6KHG6AqCQ@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] exo: Add intltool-native as native dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Mar 2014 21:45:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

Cool, thanks JaMA

Adam


On Wed, Mar 26, 2014 at 2:35 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Mar 26, 2014 at 02:27:34PM -0700, Adam YH Lee wrote:
> > exo-native fails to build due to more strict dependency checking
> > introduced in autotools.bbclass. intltool-native should be explicitly
> > defined as a dependency.
> >
> > Signed-off-by: Adam YH Lee <adam.yh.lee@gmail.com>
> > ---
> >  meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bbb/meta-xfce/recipes-xfce/exo/
> exo_0.10.2.bb
> > index 09aacc3..3eb03bc 100644
> > --- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> > +++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> > @@ -3,8 +3,8 @@ SECTION = "x11"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >  DEPENDS = "gtk+ libxfce4util libxfce4ui virtual/libx11
> liburi-perl-native cairo"
> > -DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native"
> > -PR = "r4"
> > +DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native
> intltool-native"
> > +PR = "r5"
>
> We don't do PR bumps anymore, I'll remove that when cherry-picking to
> master-next.
>
> >  inherit xfce pythonnative perlnative
> >
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

