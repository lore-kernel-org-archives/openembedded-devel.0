Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 503636FEF5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 13:57:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q128so9702206wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=luE1gkd7fEF0SdZuLDgpynRa35s76KsIFGAoX/jd1SM=;
	b=wGIANMtYtcA21uZmvi3Lbu0LTsh1P2g1Gkxbp5WmlfGi36U+yzpP1TZ7UHoIkT+5bv
	PZNaLxn53PUUx9dMdmxjLq7p2K8cFhpIu5Eq/8Xr4LVqt3aWS6Y9tvIR8cJ+Qf3i9L5K
	XdNov5K/gUJErmh+5G9zlflSe6EE/OaZZ8NG5C55Kdp55U7izFF7JuUP7XgiK7vGi3Hw
	CQo8mU+3hpJg5nsA6A2bKEDKxqp7D02jrQjrhEZ/aMmYOrYvHeMHdMldY0i2HhyMuNmp
	9BHYoc9bJWlXOz9AHxUq4aXSmOTH//4dhEZRrAInPdUUwRTpisP2zGSBlqr3FMiqOcGL
	v7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=luE1gkd7fEF0SdZuLDgpynRa35s76KsIFGAoX/jd1SM=;
	b=AjaAGQdyGkS2n0jnTOhKQJruwldLifFiHyLumn82AyTYkZR+59a4v3nJqOoxO4166X
	x+oYYyrFbMo3RShnjhwBxi11NEKgtkXmPEn9cJuwUixi7YOv+FZX28WZsEU+r7dM5PXl
	v9Z+VhRqmNM36b6JsC/0kMDAid4ewQWgRqrYqVG8KVicbSii1AKFJzShA/tf4ATMN867
	J0US+C32/eCvNot5xe3/tuDrPWHD+KSCKEvfuuwCbk3MNR7wAH68HOq3ICsfHKIEj3Qf
	Ov6R/03xj88jSRuy1SmNjtsdXdW9I871Lf0m0bC/4RnF21lGbPKDChtAnuXhWqnWpP9l
	1ylA==
X-Gm-Message-State: AEkoouurtTbI3aKczgCoQGo/FbjCYUIweBAtCjoUa/IPg2oPdQ4fYAlMzwDMm8lumB5PiWrKLnbkWwjaYovhZA==
X-Received: by 10.46.1.195 with SMTP id f64mr695755lji.24.1470837427852; Wed,
	10 Aug 2016 06:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Wed, 10 Aug 2016 06:57:07 -0700 (PDT)
In-Reply-To: <CADNbA1oa_g158axrUwT=H3_sZkpF59MdnhC-2rQb3_zuL+sH8Q@mail.gmail.com>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
	<1470789534-602-2-git-send-email-derek@asterius.io>
	<20160810074526.giu3dvpnuyz6jo22@jama>
	<CADNbA1oa_g158axrUwT=H3_sZkpF59MdnhC-2rQb3_zuL+sH8Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 10 Aug 2016 15:57:07 +0200
Message-ID: <CA+chaQdNCbSVUaZC=OCJ-oyG+n9sJsRnFcj9gqA3eC770VzK4A@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 2/3] libp11: update to version 0.4.0
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
X-List-Received-Date: Wed, 10 Aug 2016 13:57:09 -0000
Content-Type: text/plain; charset=UTF-8

I've updated it also in engine-pkcs change, while resolving conflicts from
those SRC_URI changes for krogoth and master.

On Wed, Aug 10, 2016 at 3:32 PM, Derek Straka <derek@asterius.io> wrote:

> Ah, excellent.  Thanks for the hint.
>
> -Derek
>
> On Wed, Aug 10, 2016 at 3:45 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> > On Tue, Aug 09, 2016 at 08:38:53PM -0400, Derek Straka wrote:
> > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > ---
> > >  meta-oe/recipes-support/libp11/{libp11_0.3.0.bb => libp11_0.4.0.bb} |
> > 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >  rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =>
> > libp11_0.4.0.bb} (81%)
> > >
> > > diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > similarity index 81%
> > > rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > index d97bfc6..a7e43be 100644
> > > --- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > +++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> > fad9b3332be894bab9bc501572864b29"
> > >  DEPENDS = "libtool openssl"
> > >
> > >  SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
> > > -SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
> > > +SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
> > >
> > >  S = "${WORKDIR}/git"
> > >
> > > @@ -21,3 +21,6 @@ do_install_append () {
> > >      rm -rf ${D}${libdir}/*.la
> > >      rm -rf ${D}${docdir}/${BPN}
> > >  }
> > > +
> > > +FILES_${PN} += "${libdir}/pkcs11.so.0*"
> > > +FILES_${PN}-dev += "${libdir}/pkcs11.so"
> >
> > You can use following variables here:
> >
> > SOLIBS = ".so.*"
> > SOLIBS_darwin = ".dylib"
> >
> > SOLIBSDEV = ".so"
> > # Due to the ordering of PACKAGES and the naming of the dev symlinks on
> > # darwin,
> > # we can't make the symlinks end up in the -dev packages easily at this
> > # point. This hack
> > # at least means builds aren't completely broken and symlinks don't take
> > # up much space.
> > SOLIBSDEV_darwin = ".dylibbroken"
> >
> > If I don't forget I'll update it when cherry-picking to master-next (if
> > you don't send v2 before that).
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

