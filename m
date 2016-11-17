Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A58206078E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 11:59:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m203so20503894wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 03:59:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9Ty3rfZEryp7VPmvqEZbcfdf78xZSZIXkWAwePlhnbw=;
	b=aBJ0LxD0ch/7GQ6WK6ub4TALmItD1bASNpb5McZEALsuEhonnsfv4kEPo6Oe7jb76/
	/vnt6/UV2MN9OR6grz9Sg6hWjsbCzneHDzhuYuCIHYYio0cPGVS4Y2PIC6ZDCiFyp3pu
	T1b9VB9v+jRcIaGPOE+QKiTy/DfzxI7KFYD2mAZfgSzFlPQkHuizMK9x2xF7NKLo8kfp
	DPtby8NmIB/ihDrIBoVFffan2O6B4Q9VY9ctKN1T1MQsM6cNP4UT3BG78vRnb3Q7tOkn
	+rp4oXcKnj7o34z8NzCtsesjZ/qAhnAOy0hiw/JnhvQ9sxVMyJGwJ9Mrd+3OZBCgAhQT
	iLdA==
X-Gm-Message-State: ABUngvdNnQGrv9QEmYeR/66qEItbSP6d40+D37CO0wIdqkufUZ+++wObmTy1wElCL/n3Pw==
X-Received: by 10.28.167.139 with SMTP id q133mr17537987wme.15.1479383976024; 
	Thu, 17 Nov 2016 03:59:36 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i15sm2899386wjs.16.2016.11.17.03.59.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Nov 2016 03:59:35 -0800 (PST)
Message-ID: <1479383974.27546.3.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Thu, 17 Nov 2016 11:59:34 +0000
In-Reply-To: <109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
References: <20161115154311.30118-3-git@andred.net>
	<20161116090234.30806-1-git@andred.net>
	<109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: Re: [meta-networking][PATCH 2/2 v2] ncp: add v1.2.4
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
X-List-Received-Date: Thu, 17 Nov 2016 11:59:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-11-16 at 09:28 -0800, Khem Raj wrote:
> 
> On 11/16/16 1:02 AM, André Draszik wrote:
> > Signed-off-by: André Draszik <git@andred.net>
> > ---
> >  meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 32
> > ++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > 
> > diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-
> > networking/recipes-support/ncp/ncp_1.2.4.bb
> > new file mode 100644
> > index 0000000..7bbaaad
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > @@ -0,0 +1,32 @@
> > +SUMMARY = "a fast file copy tool for LANs"
> > +DESCRIPTION = "ncp is a utility for copying files in a LAN. It has
> > absolutely no \
> > +security or integrity checking, no throttling, no features, except \
> > +one: you don't have to type the coordinates of your peer."
> > +HOMEPAGE = "http://www.fefe.de/ncp"
> > +LICENSE = "GPLv2"
> > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-
> > 2.0;md5=801f80980d171dd6425610833a22dbe6"
> > +DEPENDS = "libowfat"
> > +
> > +SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
> > +SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
> > +SRC_URI[sha256sum] =
> > "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
> > +
> > +EXTRA_OEMAKE = "\
> > +    DIET= \
> > +    DEBUG=nostrip \
> > +    CC='${CC}' CFLAGS='${CFLAGS} -I${STAGING_INCDIR}/libowfat'
> > LDFLAGS='${LDFLAGS}' \
> > +"
> 
> Is setting CC etc. on make cmdline really needed ?

Yes, the Makefile sets CC CFLAGS LDFLAGS excplicitly, so make doesn't
inherit them from the environment variables, because OE doesn't pass the -e
make flag anymore. https://www.gnu.org/software/make/manual/html_node/Enviro
nment.html#Environment

> may be just adding the -I flags to CPPFLAGS is enough ?

It doesn't respect CPPFLAGS, but an alternative would be:

EXTRA_OEMAKE = "\
    DIET= \
    DEBUG=nostrip \
    -e \
"
CFLAGS_append = " -I${STAGING_INCDIR}/libowfat"

I have no preference either way, but my original version makes it more
obvious what we're after.


> > +
> > +do_install() {
> > +    install -d -m0755 ${D}${bindir}
> 
> not needed if you can just do
> 
> install -D -m 0755 ncp ${D}${bindir}/ncp
> 
> and avoid two calls to install ( one for dir and another for file )
> 
> > +    install -d -m0755 ${D}${mandir}/man1
> > +
> > +    install -m0755 ncp ${D}${bindir}
> 
> 
> > +    ln -sf ncp ${D}${bindir}/npoll
> > +    ln -sf ncp ${D}${bindir}/npush
> > +
> > +    install -m0644 ncp.1 npush.1 ${D}${mandir}/man1
> 
> same here not needed.

Using -D that'd still need two calls, as multiple files are being copied and
-D only allows you to specify one destination (I think). Not really gaining
anything here. In addition, you have to specify the source filename multiple
times (in src and destination).
This:
    install -d -m0755 ${D}${mandir}/man1
    install -m0644 ncp.1 npush.1 ${D}${mandir}/man1
vs.
    install -D -m0644 ncp.1 ${D}${mandir}/man1/ncp.1
    install -D -m0644 npush.1 ${D}${mandir}/man1/npush.1


Cheers,
Andre'


