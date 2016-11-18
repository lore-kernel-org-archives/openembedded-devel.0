Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9B64E60102
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 10:09:05 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so4530562wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:09:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/G/cGpAz01oB0u9zcYo/Gjq1qoBPChGAjTg8VqIUbtc=;
	b=TvxEtBLPAGnS7AIHLwkhGygiAq5j5vH/M7L/x7AQ8Zl2XrvTF7j1XWzk3t8EfPOVvN
	g3VtWt0WRS/bpB3W0d7x3NeGJj3qs9ynGNlF6Ptlq4MH2uXeQsg42jn+vjeWqEZCVEtm
	HyCSrYeA6pW28iItTZQnisuj1+6enuvfhrSANWYlFVwHi0nGCAha4I/rbFO3mYq8wtj5
	+qOLjvNtNHocJMG/9aq2poYXWxjMpumRlkkzPGvuDZ2+4oghVFFpzKnrn1JbuQXWH0jE
	kt3peaSOtc61m/h5zw7Ty5bltQrwzIzIMEPX4uazWd51Q5mTLqcHXvEFrU16tnMWo5XE
	KeYg==
X-Gm-Message-State: AKaTC012M8ffm6e7m7+caBLdtMd5cOesxtFAJluQgi7HejrXdmvgRU+drggJ5K49AEleXQ==
X-Received: by 10.194.186.177 with SMTP id fl17mr4901838wjc.143.1479463746790; 
	Fri, 18 Nov 2016 02:09:06 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	ab10sm7926855wjc.45.2016.11.18.02.09.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 02:09:05 -0800 (PST)
Message-ID: <1479463744.27546.7.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Nov 2016 10:09:04 +0000
In-Reply-To: <CAMKF1sqxxyjaYL2EJXD_KzGGMYuB5ohWvye9ba-YrJ6e0pU1Gg@mail.gmail.com>
References: <20161115154311.30118-3-git@andred.net>
	<20161116090234.30806-1-git@andred.net>
	<109be6fe-8d0c-619b-fb4a-4f836982e064@gmail.com>
	<1479383974.27546.3.camel@andred.net>
	<CAMKF1sqxxyjaYL2EJXD_KzGGMYuB5ohWvye9ba-YrJ6e0pU1Gg@mail.gmail.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 18 Nov 2016 10:09:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-11-17 at 09:10 -0800, Khem Raj wrote:
> On Thu, Nov 17, 2016 at 3:59 AM, André Draszik <git@andred.net> wrote:
> > On Wed, 2016-11-16 at 09:28 -0800, Khem Raj wrote:
> > > 
> > > On 11/16/16 1:02 AM, André Draszik wrote:
> > > > Signed-off-by: André Draszik <git@andred.net>
> > > > ---
> > > >  meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 32
> > > > ++++++++++++++++++++++++
> > > >  1 file changed, 32 insertions(+)
> > > >  create mode 100644 meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > > > 
> > > > diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > > > b/meta-
> > > > networking/recipes-support/ncp/ncp_1.2.4.bb
> > > > new file mode 100644
> > > > index 0000000..7bbaaad
> > > > --- /dev/null
> > > > +++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
> > > > @@ -0,0 +1,32 @@
> > > > +SUMMARY = "a fast file copy tool for LANs"
> > > > +DESCRIPTION = "ncp is a utility for copying files in a LAN. It has
> > > > absolutely no \
> > > > +security or integrity checking, no throttling, no features, except
> > > > \
> > > > +one: you don't have to type the coordinates of your peer."
> > > > +HOMEPAGE = "http://www.fefe.de/ncp"
> > > > +LICENSE = "GPLv2"
> > > > +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-
> > > > licenses/GPL-
> > > > 2.0;md5=801f80980d171dd6425610833a22dbe6"
> > > > +DEPENDS = "libowfat"
> > > > +
> > > > +SRC_URI = "https://dl.fefe.de/${BP}.tar.bz2"
> > > > +SRC_URI[md5sum] = "421c4855bd3148b7d0a4342942b4bf13"
> > > > +SRC_URI[sha256sum] =
> > > > "6cfa72edd5f7717bf7a4a93ccc74c4abd89892360e2e0bb095a73c24b9359b88"
> > > > +
> > > > +EXTRA_OEMAKE = "\
> > > > +    DIET= \
> > > > +    DEBUG=nostrip \
> > > > +    CC='${CC}' CFLAGS='${CFLAGS} -I${STAGING_INCDIR}/libowfat'
> > > > LDFLAGS='${LDFLAGS}' \
> > > > +"
> > > 
> > > Is setting CC etc. on make cmdline really needed ?
> > 
> > Yes, the Makefile sets CC CFLAGS LDFLAGS excplicitly, so make doesn't
> > inherit them from the environment variables, because OE doesn't pass the
> > -e
> > make flag anymore. https://www.gnu.org/software/make/manual/html_node/En
> > viro
> > nment.html#Environment
> > 
> > > may be just adding the -I flags to CPPFLAGS is enough ?
> > 
> > It doesn't respect CPPFLAGS, but an alternative would be:
> > 
> > EXTRA_OEMAKE = "\
> >     DIET= \
> >     DEBUG=nostrip \
> >     -e \
> > "
> > CFLAGS_append = " -I${STAGING_INCDIR}/libowfat"
> 
> Thats seems better.

I am not sure I agree. This means one could accidentally override make
variables. Being explicit as in the original version is more deterministic.
Otherwise somebody would have to audit each recipe's makefile once a
variable is added or removed from the bitbake environment. That doesn't
scale. It would appear that the -e flag was removed from EXTRA_OEMAKE in rev
aeb653861a0ec39ea7a014c0622980edcbf653fa for a similar reason... Even the
make manual recommends against using -e.


Andre'


