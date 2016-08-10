Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E526D77040
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 13:32:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1470835928; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=xDdKMhL1FL3vUc5CJhLMtid7uytKdZp43kdPK/W4hms=;
	b=DdKw+wfFaZmyd9jMOhYKyHH7nq122hgsinDkOzm4rV2op+5KG6cEsjOG48wwRDYI8MDMT2qX
	FJ6IYNxHaf0M9dL4ZohQpUdIACzXJCRFoUMhcLkNnQNGILmawy82g8yMSSK0cttO1BbN5IHL
	7/Jr0pEfBIHIjjzGAkNFvhQoHb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=Rtwy1E99SFtVutSJLBgYOaWNEEW7E0ydIxJPEPFkCcPV+Q7sc1wtLd/GqXn5ql3bwtKOan
	E1VrlGBJ5xepHCWuNGq+7DqO23CGLvXLYvawkogDv9COi/NZUYfarrZCy7wd0AF/prFQTzg5
	4mYDbG/tqO0WV/xbyejxA9Ff8feLQ=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mxa.mailgun.org with ESMTP id 57ab2cd8.7fecf8756eb0-in07;
	Wed, 10 Aug 2016 13:32:08 -0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id u186so38372350ita.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 06:32:08 -0700 (PDT)
X-Gm-Message-State: AEkoout/wNTKLl7jYiFhPPORvYytucheFYpbLSnWL0k/B5Iy/3eInjWc8oLyB2lHjndAihrb4x0XytFF4+J3kA==
X-Received: by 10.36.26.216 with SMTP id 207mr3152691iti.96.1470835928348;
	Wed, 10 Aug 2016 06:32:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Wed, 10 Aug 2016 06:32:07 -0700 (PDT)
In-Reply-To: <20160810074526.giu3dvpnuyz6jo22@jama>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
	<1470789534-602-2-git-send-email-derek@asterius.io>
	<20160810074526.giu3dvpnuyz6jo22@jama>
From: Derek Straka <derek@asterius.io>
Date: Wed, 10 Aug 2016 09:32:07 -0400
X-Gmail-Original-Message-ID: <CADNbA1oa_g158axrUwT=H3_sZkpF59MdnhC-2rQb3_zuL+sH8Q@mail.gmail.com>
Message-ID: <CADNbA1oa_g158axrUwT=H3_sZkpF59MdnhC-2rQb3_zuL+sH8Q@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 10 Aug 2016 13:32:12 -0000
Content-Type: text/plain; charset=UTF-8

Ah, excellent.  Thanks for the hint.

-Derek

On Wed, Aug 10, 2016 at 3:45 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Aug 09, 2016 at 08:38:53PM -0400, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-oe/recipes-support/libp11/{libp11_0.3.0.bb => libp11_0.4.0.bb} |
> 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =>
> libp11_0.4.0.bb} (81%)
> >
> > diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > similarity index 81%
> > rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > index d97bfc6..a7e43be 100644
> > --- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > +++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> fad9b3332be894bab9bc501572864b29"
> >  DEPENDS = "libtool openssl"
> >
> >  SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
> > -SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
> > +SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
> >
> >  S = "${WORKDIR}/git"
> >
> > @@ -21,3 +21,6 @@ do_install_append () {
> >      rm -rf ${D}${libdir}/*.la
> >      rm -rf ${D}${docdir}/${BPN}
> >  }
> > +
> > +FILES_${PN} += "${libdir}/pkcs11.so.0*"
> > +FILES_${PN}-dev += "${libdir}/pkcs11.so"
>
> You can use following variables here:
>
> SOLIBS = ".so.*"
> SOLIBS_darwin = ".dylib"
>
> SOLIBSDEV = ".so"
> # Due to the ordering of PACKAGES and the naming of the dev symlinks on
> # darwin,
> # we can't make the symlinks end up in the -dev packages easily at this
> # point. This hack
> # at least means builds aren't completely broken and symlinks don't take
> # up much space.
> SOLIBSDEV_darwin = ".dylibbroken"
>
> If I don't forget I'll update it when cherry-picking to master-next (if
> you don't send v2 before that).
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

