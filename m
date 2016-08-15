Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 125917321C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 18:16:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1471285019; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=EGC4HspL67p5KFbI45oN6ns76v8J9d4NIKqcIo1NuL8=;
	b=GHRZVYlCM8T3oSP85drb3z/Z3loIW6dzGwE3ypgTFXFK6RhzU9U8fWoo3tNLFpbo9ODDUuBY
	TkNEWTQlgnjSKKcGQz4hgnaVrjgQLltVKGD+7sxxm6TKvsc0pqjBeABG271ZL7cafsHN8UKK
	E2t3iGrzlSn/GA83VGo4Z44G9wU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=mGgQ7ne30gT3OwuoR+i147nnncMEl32Z5QlFdiwkmy4A/1G0sBq2rxI2eyAAR4a6GGsOVH
	sQKgdjcfyfv6QCCZh6mqGHvQuwV4B7352ZgCFRrHHAmDt8l4EzYpsCTh30ls0DFjJntUYo6t
	4JFg/YwI2CfgLBETnTh1dBsj4jR3E=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mxa.mailgun.org with ESMTP id 57b2071b.7f7a3f6c0670-in2;
	Mon, 15 Aug 2016 18:16:59 -0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m101so86477609ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 11:16:59 -0700 (PDT)
X-Gm-Message-State: AEkoousBjDxExc5617En53euSmgdCRI/d2Pz1daiDvfL0ZQztMhmnxz2fr+lcYQhfkCM6RQYXlPTFelUrnS6iw==
X-Received: by 10.107.62.4 with SMTP id l4mr329350ioa.185.1471285019065; Mon,
	15 Aug 2016 11:16:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Mon, 15 Aug 2016 11:16:58 -0700 (PDT)
In-Reply-To: <20160815110307.iezdfp7u4zh2mr6c@jama>
References: <1470789534-602-1-git-send-email-derek@asterius.io>
	<1470789534-602-2-git-send-email-derek@asterius.io>
	<20160810074526.giu3dvpnuyz6jo22@jama>
	<CADNbA1oa_g158axrUwT=H3_sZkpF59MdnhC-2rQb3_zuL+sH8Q@mail.gmail.com>
	<CA+chaQdNCbSVUaZC=OCJ-oyG+n9sJsRnFcj9gqA3eC770VzK4A@mail.gmail.com>
	<20160815110307.iezdfp7u4zh2mr6c@jama>
From: Derek Straka <derek@asterius.io>
Date: Mon, 15 Aug 2016 14:16:58 -0400
X-Gmail-Original-Message-ID: <CADNbA1oGQ0ua6WqBkYM=7VaHp8Dnm9a5v8tGD9Pge-sUetinyQ@mail.gmail.com>
Message-ID: <CADNbA1oGQ0ua6WqBkYM=7VaHp8Dnm9a5v8tGD9Pge-sUetinyQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 15 Aug 2016 18:17:00 -0000
Content-Type: text/plain; charset=UTF-8

Interesting.  I didn't see that until I cranked up the number of bitbake
threads to match your build slave's count.  I'll take a quick peek at the
Makefile dependencies; otherwise, I will just set PARALLEL_MAKE
accordingly.

-Derek

On Mon, Aug 15, 2016 at 7:03 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Wed, Aug 10, 2016 at 03:57:07PM +0200, Martin Jansa wrote:
> > I've updated it also in engine-pkcs change, while resolving conflicts
> from
> > those SRC_URI changes for krogoth and master.
>
> There is one more issue:
> cd .libs && ln -s -f pkcs11.so libpkcs11.so
> /bin/bash: line 0: cd: .libs: No such file or directory
> make[2]: *** [all-local] Error 1
>
> http://errors.yoctoproject.org/Errors/Details/75462/
>
> So keeping this in master-next with other 3 changes, until this is
> resolved.
>
> > On Wed, Aug 10, 2016 at 3:32 PM, Derek Straka <derek@asterius.io> wrote:
> >
> > > Ah, excellent.  Thanks for the hint.
> > >
> > > -Derek
> > >
> > > On Wed, Aug 10, 2016 at 3:45 AM, Martin Jansa <martin.jansa@gmail.com>
> > > wrote:
> > >
> > > > On Tue, Aug 09, 2016 at 08:38:53PM -0400, Derek Straka wrote:
> > > > > Signed-off-by: Derek Straka <derek@asterius.io>
> > > > > ---
> > > > >  meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =>
> libp11_0.4.0.bb} |
> > > > 5 ++++-
> > > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > >  rename meta-oe/recipes-support/libp11/{libp11_0.3.0.bb =>
> > > > libp11_0.4.0.bb} (81%)
> > > > >
> > > > > diff --git a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > > b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > > > similarity index 81%
> > > > > rename from meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > > > rename to meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > > > index d97bfc6..a7e43be 100644
> > > > > --- a/meta-oe/recipes-support/libp11/libp11_0.3.0.bb
> > > > > +++ b/meta-oe/recipes-support/libp11/libp11_0.4.0.bb
> > > > > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=
> > > > fad9b3332be894bab9bc501572864b29"
> > > > >  DEPENDS = "libtool openssl"
> > > > >
> > > > >  SRC_URI = "git://github.com/OpenSC/libp11.git;protocol=http"
> > > > > -SRCREV = "6f71240991aa831f6fc2cc5431faf6ebec627ed2"
> > > > > +SRCREV = "22de793340ab73cafc92f8238afb51a06d8411c3"
> > > > >
> > > > >  S = "${WORKDIR}/git"
> > > > >
> > > > > @@ -21,3 +21,6 @@ do_install_append () {
> > > > >      rm -rf ${D}${libdir}/*.la
> > > > >      rm -rf ${D}${docdir}/${BPN}
> > > > >  }
> > > > > +
> > > > > +FILES_${PN} += "${libdir}/pkcs11.so.0*"
> > > > > +FILES_${PN}-dev += "${libdir}/pkcs11.so"
> > > >
> > > > You can use following variables here:
> > > >
> > > > SOLIBS = ".so.*"
> > > > SOLIBS_darwin = ".dylib"
> > > >
> > > > SOLIBSDEV = ".so"
> > > > # Due to the ordering of PACKAGES and the naming of the dev symlinks
> on
> > > > # darwin,
> > > > # we can't make the symlinks end up in the -dev packages easily at
> this
> > > > # point. This hack
> > > > # at least means builds aren't completely broken and symlinks don't
> take
> > > > # up much space.
> > > > SOLIBSDEV_darwin = ".dylibbroken"
> > > >
> > > > If I don't forget I'll update it when cherry-picking to master-next
> (if
> > > > you don't send v2 before that).
> > > >
> > > > --
> > > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
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

