Return-Path: <mbc@koumoul.net>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id CDDB173CBD
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  8 Oct 2015 10:46:09 +0000 (UTC)
Received: by igxx6 with SMTP id x6so9630605igx.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2015 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=WWv6TScbw81Cwef11Qp/ZoHnf3+JSkRT84T7aPKOU9M=;
	b=cgNJHbmjgzK1HoTHeY5QA+XN4EiDRaXVSy4eYx7uw6DnknO6c/2lSPmIO3vzR1U6/R
	UKnKF/hMX3wZb/T7nVlC6dckz5F7R2DrPdzX95vl6q6aJ8J/k7wwxWt3exrBkGwcYMx+
	NKGv3zNZvPZLfwuqRQUMMZ/Ww/vuLQQsIAzjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=WWv6TScbw81Cwef11Qp/ZoHnf3+JSkRT84T7aPKOU9M=;
	b=KRTlM4RC50EXqhwPOmaVpt/y7VRteHJ/Gsp1Q1w7Ezn4f0MpM/txDbECgTfNivpBHX
	yHlIGAYlvweC4vcIad+a9vG+5HMOVqx8OzdW/6Hk7ZVfsH8ztzGELkHEj0bnOWhHcgJ/
	5zPX4jYLrEG6bBnUzW73NIvqNt08vQAsZ3sfJnAsu34k7iJtAgUVMqf9uGanczSJYGSq
	XC7x7rZQuJJrK+2c5XmWDMabbXbqe+XlxY1HVuiQSllXCt/cOM1IL1YvxgutdjWDMnOV
	5Zxqxjn1d7qvSX8srB01BNWpWEQjMnsHF+uRvnqX6tcIz+IgnD+QZbwXzDBD8wz4L/w3
	d+/w==
X-Gm-Message-State: ALoCoQn68JAOX6j/F2fMbCfjQwKRKYDkVs7FDg9E6Hq4vA9WJxOpj73NUAo+PN9Hg/DE21KE8Aw+
MIME-Version: 1.0
X-Received: by 10.50.66.197 with SMTP id h5mr2687483igt.82.1444301169103; Thu,
	08 Oct 2015 03:46:09 -0700 (PDT)
Sender: mbc@koumoul.net
Received: by 10.79.111.6 with HTTP; Thu, 8 Oct 2015 03:46:09 -0700 (PDT)
X-Originating-IP: [46.18.96.42]
In-Reply-To: <20151008100448.GC2385@jama>
References: <1443904539-21781-1-git-send-email-manuel.bachmann@iot.bzh>
	<20151008100448.GC2385@jama>
Date: Thu, 8 Oct 2015 12:46:09 +0200
X-Google-Sender-Auth: s-_qX7wyb7SXLbd4QMODNXoS-HU
Message-ID: <CANTDXNcD6Kg9=Q3FSiimvd3X+KwrJzo8p9YPd1MkchGjauO+Dg@mail.gmail.com>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 2/3][meta-multimedia] gupnp-dlna: Update to 0.9.4, support gstreamer
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
X-List-Received-Date: Thu, 08 Oct 2015 10:46:10 -0000
Content-Type: text/plain; charset=UTF-8

Thanks Martin, and sorry for not having tried "media-manager-upnp" ; will
fix and let you know.

Regards,

*Manuel Bachmann, Graphics Engineer www.iot.bzh <http://iot.bzh> *


2015-10-08 12:04 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:

> On Sat, Oct 03, 2015 at 10:35:39PM +0200, Manuel Bachmann wrote:
> > Minor update.
> > As we now have GStreamer 1.0+, add a PACKAGECONFIG option
> > to build the additional "gupnp-dlna-gst" library if it is
> > present.
> > This is most notably needed by Rygel.
>
> This seems to break media-service-upnp/0.4.0-r0:
> http://errors.yoctoproject.org/Errors/Details/20232/
>
> >
> > Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
> > ---
> >  meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb   | 20
> --------------------
> >  meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb   | 19
> +++++++++++++++++++
> >  delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/
> gupnp-dlna_0.9.2.bb
> >  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/
> gupnp-dlna_0.9.4.bb
> >  2 files changed, 19 insertions(+), 20 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-connectivity/gupnp/
> gupnp-dlna_0.9.2.bb b/meta-multimedia/recipes-connectivity/gupnp/
> gupnp-dlna_0.9.2.bb
> > deleted file mode 100644
> > index b7e71cf..0000000
> > --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.2.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -SUMMARY = "Helpers for AV applications using DLNA"
> > -LICENSE = "LGPLv2"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c
> \
> > -
> file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"
> > -
> > -DEPENDS = "libxml2 glib-2.0"
> > -
> > -SRC_URI = "
> http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
> > -SRC_URI[md5sum] = "d972f9b03f0f3793cb895eb034ea314f"
> > -SRC_URI[sha256sum] =
> "c28d5650604c7da4f193e6b85049a4885f3a01f1996df768d55b5cb898a9fc53"
> > -
> > -inherit autotools pkgconfig
> > -
> > -require no-vala.inc
> > -
> > -# The GStreamer metadata backend requires GStreamer 1.0, so skip this
> until we
> > -# have that packaged.
> > -EXTRA_OECONF = "--disable-gstreamer-metadata-backend"
> > -
> > -FILES_${PN} += "${datadir}/gupnp-dlna-2.0/dlna-profiles"
> > diff --git a/meta-multimedia/recipes-connectivity/gupnp/
> gupnp-dlna_0.9.4.bb b/meta-multimedia/recipes-connectivity/gupnp/
> gupnp-dlna_0.9.4.bb
> > new file mode 100644
> > index 0000000..b7e71cf
> > --- /dev/null
> > +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "Helpers for AV applications using DLNA"
> > +LICENSE = "LGPLv2"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c
> \
> > +
> file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"
> > +
> > +DEPENDS = "libxml2 glib-2.0"
> > +
> > +SRC_URI = "
> http://download.gnome.org/sources/${BPN}/0.9/${BPN}-${PV}.tar.xz"
> > +SRC_URI[md5sum] = "f93665e535a512e4d515a86311435cb6"
> > +SRC_URI[sha256sum] =
> "69969713f36c0e815fbbbcfdfb3ad9bd447cfd10d0fd86227d82dfd8edb6c807"
> > +
> > +inherit autotools pkgconfig
> > +
> > +require no-vala.inc
> > +
> > +PACKAGECONFIG ?= "gstreamer"
> > +PACKAGECONFIG[gstreamer] =
> "--enable-gstreamer-metadata-backend,--disable-gstreamer-metadata-backend,gstreamer1.0
> gstreamer1.0-plugins-base"
> > +
> > +FILES_${PN} += "${datadir}/gupnp-dlna-2.0/dlna-profiles"
> > --
> > 1.8.3.1
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

