Return-Path: <ticotimo@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id E48AE7032B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 17:47:57 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id s18so4170522lam.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Jul 2014 10:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=tuUTGNHp5Zzjy8BhbxOcn4AjMJ6QgeaYFcK+TTYrfuE=;
	b=Mll0BWCHp32+TneOJX9AOAZcmoWEBimFz9+xL15tu9iuBNMXKvbiVXTnqlslzjRZpe
	D4WACd1cm2lHC+PftKaC4qEV6ob4nCXoUFJaeONW5sSycLflCG0V/4hC8+cxsGR8tOZP
	wV8E7bNNvVQAP1md9q/JQiHkn0CVw+jOKfEAs4HUSShDKGVL7xcVMs8aJK5PyJozyyi+
	XFmnH7KYcmUN3gP/jJHhHdQ2rD3/J6E9611KHeap4iv9BGWaGNdZ4gqy7MTK0U/VoD6f
	lPtBVEzpxFl/LDNem5dcpVGgo814I+GEwcBhVUkGW8FpZXhyZJRGLtCm2hQSn8H5y7e4
	kL5g==
MIME-Version: 1.0
X-Received: by 10.152.204.102 with SMTP id kx6mr21229387lac.32.1405878477674; 
	Sun, 20 Jul 2014 10:47:57 -0700 (PDT)
Received: by 10.114.216.35 with HTTP; Sun, 20 Jul 2014 10:47:57 -0700 (PDT)
In-Reply-To: <20140720094933.GW2433@jama>
References: <1405829260-13293-1-git-send-email-TicoTimo@gmail.com>
	<1405829260-13293-5-git-send-email-TicoTimo@gmail.com>
	<20140720081931.GU2433@jama> <20140720094933.GW2433@jama>
Date: Sun, 20 Jul 2014 10:47:57 -0700
Message-ID: <CANx9H-C4n_ecWdVa1Bm1ETB_GE8T0LngtY3_ztAhZF5vJEG0vw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-multimedia][PATCH 4/4] vlc: add patches to fix B!=S and pkg-config
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
X-List-Received-Date: Sun, 20 Jul 2014 17:47:59 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Jul 20, 2014 at 2:49 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Sun, Jul 20, 2014 at 10:19:31AM +0200, Martin Jansa wrote:
> > On Sat, Jul 19, 2014 at 09:07:40PM -0700, Tim Orling wrote:
> > > Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> > > ---
> > >  meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> > > index 46a2712..f9be48d 100644
> > > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> > > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_2.1.4.bb
> > > @@ -5,6 +5,8 @@ EXTRA_OECONF += " --enable-libxml2=no"
> > >
> > >  SRC_URI += "file://0001-enable-subdir-objects.patch \
> > >              file://0002-glibc-does-not-provide-strlcpy.patch \
> > > +            file://0003-use-am-path-libgcrypt.patch \
> > > +            file://0004-modules-gui-qt4-out-of-tree-build.patch \
> > >  "
> >
> > Please add this together with .patch file itself.
>
> nvm, I did that when cherry-picking to master-next
>
>
Much cleaner. Thank you, Martin.


> >
> > >  SRC_URI[md5sum] = "7ed67d22f7425011078772bfc62ac222"
> > > --
> > > 1.9.3
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
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

