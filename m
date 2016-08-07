Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id A1B3B77103
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  7 Aug 2016 20:10:07 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id EE4882BD; Sun,  7 Aug 2016 22:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id BE3D820C;
	Sun,  7 Aug 2016 22:10:06 +0200 (CEST)
Date: Sun, 7 Aug 2016 22:10:06 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160807201006.GF8132@piout.net>
References: <1470498772-18435-1-git-send-email-alexandre.belloni@free-electrons.com>
	<CA+chaQfAeAmNb3Dh2YwVgj5nr1p8FBN8_fWBJF3KLp5=QOaDUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQfAeAmNb3Dh2YwVgj5nr1p8FBN8_fWBJF3KLp5=QOaDUQ@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH] dpkg: Avoid automatic target architecture detection
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
X-List-Received-Date: Sun, 07 Aug 2016 20:10:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 06/08/2016 at 19:16:41 +0200, Martin Jansa wrote :
> Wrong ML, send it to openembedded-core ML.
> 

Indeed, I'll do that.

> On Sat, Aug 6, 2016 at 5:52 PM, Alexandre Belloni <
> alexandre.belloni@free-electrons.com> wrote:
> 
> > dpkg is using a script (dpkg-architecture.pl) to detect the target
> > architecture automatically.
> > Unfortunately, it is using the cross compiler prefix to do the detection
> > and for ARM, oe-core is using <vendor>-linux-gnueabi for toolchains with
> > and without call-convention hard. The script then always detects
> > 'armel' and never gets 'armhf' for call-convention hard.
> >
> > This solves:
> > dpkg: error processing archive evtest_1.32+0+b8343ec112-r0_armhf.deb
> > (--install):
> >  package architecture (armhf) does not match system (armel)
> >  Errors were encountered while processing:
> >  evtest_1.32+0+b8343ec112-r0_armhf.deb
> >
> > Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > ---
> >  meta/recipes-devtools/dpkg/dpkg.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-devtools/dpkg/dpkg.inc
> > b/meta/recipes-devtools/dpkg/dpkg.inc
> > index 440a500..1f29113 100644
> > --- a/meta/recipes-devtools/dpkg/dpkg.inc
> > +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> > @@ -35,6 +35,7 @@ EXTRA_OECONF = "\
> >                 "
> >
> >  EXTRA_OECONF += "TAR=tar"
> > +EXTRA_OECONF += "DEB_HOST_ARCH=${DPKG_ARCH}"
> >
> >  do_configure () {
> >      echo >> ${S}/m4/compiler.m4
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

