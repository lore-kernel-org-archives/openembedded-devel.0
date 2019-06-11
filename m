Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id DBF2B7E652
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 19:29:38 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id c26so21788570edt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 12:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vrmUkmyVQfADc6Q+M0z06CjOa5eOKp4nzn495bfR0bI=;
	b=uT02laUMQmng/rXdZ9f0RxRCkvH/gstJ0CNJd7l4NHleQvdBQrzzbKuRKtNBRIkBGI
	mIrurD2WAzKp+IRAPkGBaAY8BxbCUEopnel22fU1hknv24DzUoNAzAI/1z5V9i2+pOud
	VyDJzrzURVMLPI0G1jSYqdKSQFJL1e4J5y3zrmhpUFX9vgleI4PlEIlcN7XWGHM55l+1
	V/3OhIYxa+P7ch9hkYuUaT+87yvUW96esUPGTcL8Iu/8Hgi0IedskyOfIQAp+cQET5un
	w67ZCMmAgJhUeTCp/KnfmH6QHZCFM6UeDdFnTzlXJtfvGgI7WktQLSLsK9Z0jRCbwvJB
	u2QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vrmUkmyVQfADc6Q+M0z06CjOa5eOKp4nzn495bfR0bI=;
	b=JUXAKfK5G/D0nI+299Z60BjMtsXQl3uLTXpvLcNwjFsx4DzG3BNzu2LiPLRKsA5k2v
	5axBF9JBLrCsoG3r9y4S7vSQOiA41ge0zU6nojQMlA43gSXyjesiOzlSSI9n7j9EHXku
	LJDXgnboMPD5u5IuUBDBeCjz2Y5CiyyR8iMluAq8xGZYSEf7jdPe1HY0b5VnD9C4Lsri
	K271xmxXdO46U6ucYWz+4laMc+5FnP8jaOoj5s4jE1bMfhqV7Rq/6Xjf16AieUFtCIpc
	99J7cB5w/qs/SqUC+tbLDPq4cJX462/s60PIqVho1rbX6uo7D1zngrhZVbK2d22QCwiE
	hU7g==
X-Gm-Message-State: APjAAAVJI+P3HBRqOPQMEDUrTWnSKTx8u41pncwHWxmUJI/668jffge/
	0hXlmiP81WaKZ0FyQ8NT0ytZkEshtH/xeqefI30=
X-Google-Smtp-Source: APXvYqzRBrWOZ9hIm3XVMNvehI59Lynt9wjAqJmFF6SKrIOJr8TzryAPBW77UmSiN87m8Egh0YXI1ywfT6pxaVaWgA4=
X-Received: by 2002:aa7:c554:: with SMTP id s20mr8464924edr.209.1560281379491; 
	Tue, 11 Jun 2019 12:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190611165504.23049-1-Martin.Jansa@gmail.com>
	<aade7c0f-e5a1-a05b-07ac-1a77aa59a6cb@gmail.com>
In-Reply-To: <aade7c0f-e5a1-a05b-07ac-1a77aa59a6cb@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jun 2019 21:29:28 +0200
Message-ID: <CA+chaQerrxUGQSiNNUXgoFhurU_sPfVTkHpNuAE00zdRi_3M=Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][warrior][PATCH 01/11] gtkwave: add distro_features_check
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
X-List-Received-Date: Tue, 11 Jun 2019 19:29:39 -0000
Content-Type: text/plain; charset="UTF-8"

All of these are already merged in master, in this case:
http://git.openembedded.org/meta-openembedded/commit/?id=d7dd6476d1820f383aba6ada291c5a3eec7e813f

On Tue, Jun 11, 2019 at 7:28 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 6/11/19 9:54 AM, Martin Jansa wrote:
> > * fixes:
> > ERROR: Nothing PROVIDES 'gtk+' (but
> /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/
> gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
> > gtk+ was skipped: one of 'x11 directfb' needs to be in DISTRO_FEATURES
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'gtkwave', 'gtk+']
> >
> > and
> >
> > ERROR: Nothing PROVIDES 'tk' (but
> /OE/build/luneos-warrior/webos-ports/meta-openembedded/meta-oe/recipes-graphics/gtkwave/
> gtkwave_3.3.98.bb DEPENDS on or otherwise requires it)
> > tk was skipped: missing required distro feature 'x11' (not in
> DISTRO_FEATURES)
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'gtkwave', 'tk']
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> Is Master affected ?
> > ---
> >  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > index 60df6f773b..b9aae0f6c8 100644
> > --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> > @@ -14,6 +14,10 @@ inherit pkgconfig autotools gettext texinfo
> >  DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf
> glib-2.0"
> >  RDEPENDS_${PN} = "tk-lib"
> >
> > +# depends on gtk+ which has this restriction
> > +inherit distro_features_check
> > +ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> > +
> >  EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS}
> --with-tk=${STAGING_BINDIR_CROSS}"
> >
> >  FILES_${PN} = "${bindir} ${datadir}"
>
>

