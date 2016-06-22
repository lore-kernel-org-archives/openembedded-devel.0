Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 931BB6014F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:49:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1466624957; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=4y9+S5Feib4s+bdYdjJOnW0B3JCjrL9XN3qaoT7q3jM=;
	b=QoDOOi/soQndL/tJLDWZi4kOBLpNwYX4WoxZDyqwrGEx2s5n/iNNyU56PpQoOimGj4wFdU9Q
	G2XPdDR8TTiZzs7wqAXLna+DZSNZu7MpT+D6OAlgEShjBheQzIsmO/yI1Cls9U0304XSrFwr
	pS2U3+9x/Hu9UIKq1x/rwAygDsQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=mXpZduawY/3IRVWxX4yZcmi86U1uMsZ6FOEfztfc1s5Ai4oqsDpcPTFyND7Igo7DVnLyI9
	Is7rLQQDv02KvgS3GgsKB/eI9DceKbygMil/p9xQVO1aCwuPceDaFxSXT/PJi/Zj/m+Cd6iR
	N7UW45MoAILx2wiibUDFgYewzwW6c=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mxa.mailgun.org with ESMTP id 576aeb05.7f54783b62f0-in7;
	Wed, 22 Jun 2016 19:46:13 -0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id a5so108944077ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 12:46:12 -0700 (PDT)
X-Gm-Message-State: ALyK8tJO68+4/+6JTfxN0xeB7tPdmGRd1C0LISG/ExtKgml2NXNjdXDUu/2V1JVhqqgYCYifi6rc6Vkt5uK5MA==
X-Received: by 10.36.9.129 with SMTP id 123mr16893278itm.75.1466624772784;
	Wed, 22 Jun 2016 12:46:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.178.215 with HTTP; Wed, 22 Jun 2016 12:46:12 -0700 (PDT)
In-Reply-To: <20160622193559.GD4153@jama>
References: <1466192409-3297-1-git-send-email-derek@asterius.io>
	<1466192409-3297-2-git-send-email-derek@asterius.io>
	<20160622193559.GD4153@jama>
From: Derek Straka <derek@asterius.io>
Date: Wed, 22 Jun 2016 15:46:12 -0400
X-Gmail-Original-Message-ID: <CADNbA1qZ3me8J-389Uz4PZDaNFF4y5ZZ+gmh-9CxLj-1W5etiQ@mail.gmail.com>
Message-ID: <CADNbA1qZ3me8J-389Uz4PZDaNFF4y5ZZ+gmh-9CxLj-1W5etiQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] Remove blacklisted recipes due to poppler build failures
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
X-List-Received-Date: Wed, 22 Jun 2016 19:49:17 -0000
Content-Type: text/plain; charset=UTF-8

Patch to fix evince coming shortly

On Wed, Jun 22, 2016 at 3:35 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Jun 17, 2016 at 03:40:09PM -0400, Derek Straka wrote:
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> >  meta-efl/recipes-efl/efl/epdf_svn.bb                 | 2 --
> >  meta-gnome/recipes-gnome/evince/evince_3.18.2.bb     | 2 --
> >  meta-gnome/recipes-support/tracker/tracker_0.14.2.bb | 2 --
> >  meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb         | 2 --
> >  meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb     | 2 --
> >  5 files changed, 10 deletions(-)
> >
> > diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb
> b/meta-efl/recipes-efl/efl/epdf_svn.bb
> > index a4c7d49..e32a5fd 100644
> > --- a/meta-efl/recipes-efl/efl/epdf_svn.bb
> > +++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
> > @@ -25,5 +25,3 @@ EXTRA_OECONF = "\
> >
> >  # Some upgrade path tweaking, as in evas
> >  AUTO_LIBNAME_PKGS = ""
> > -
> > -PNBLACKLIST[epdf] ?= "Depends on broken poppler"
> > diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
> b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
> > index 4fa11a5..fe63093 100644
> > --- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
> > +++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
> > @@ -46,5 +46,3 @@ FILES_${PN}-staticdev +=
> "${libdir}/nautilus/extensions-2.0/*.a \
> >                            ${libdir}/evince/*/backends/*.a"
> >  FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
> >  FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
> > -
> > -PNBLACKLIST[evince] ?= "Depends on broken poppler"
>
> evince is broken on it's own:
>
> | ../../evince-3.18.2/libdocument/ev-document-misc.c: In function
> 'ev_document_misc_format_date':
> | ../../evince-3.18.2/libdocument/ev-document-misc.c:534:33: error: '%c'
> yields only last 2 digits of year in some locales [-Werror=format-y2k]
> |   len = strftime (s, sizeof (s), fmt_hack, &t);
> |                                  ^~~~~~~~
>
>
> > diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
> b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
> > index 7e6c400..ff53669 100644
> > --- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
> > +++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
> > @@ -83,5 +83,3 @@ FILES_${PN}-nautilus-extension +=
> "${libdir}/nautilus/extensions-2.0/*.so"
> >
> >  SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
> >  SRC_URI[sha256sum] =
> "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
> > -
> > -PNBLACKLIST[tracker] ?= "Depends on broken poppler"
> > diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
> b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
> > index 3c134bb..29ed4d9 100644
> > --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
> > +++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb
> > @@ -30,5 +30,3 @@ CFLAGS += "-fPIC"
> >
> >  FILES_${PN}-dbg += "${libdir}/gimp/2.0/*/.debug"
> >  FILES_${PN}  += "${datadir}/appdata"
> > -
> > -PNBLACKLIST[gimp] ?= "Depends on broken poppler"
> > diff --git a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> > index 5a0fc6d..66385a4 100644
> > --- a/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> > +++ b/meta-xfce/recipes-xfce/tumbler/tumbler_0.1.31.bb
> > @@ -27,5 +27,3 @@ FILES_${PN}-dbg += "${libdir}/tumbler-1/.debug \
> >                      ${libdir}/tumbler-1/plugins/.debug \
> >                      ${libdir}/tumbler-1/plugins/cache/.debug \
> >  "
> > -
> > -PNBLACKLIST[tumbler] ?= "Depends on broken poppler"
> > --
> > 1.9.1
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

