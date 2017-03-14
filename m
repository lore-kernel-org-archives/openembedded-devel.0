Return-Path: <alexandre.belloni@free-electrons.com>
X-Greylist: delayed 608 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 Mar 2017 17:47:12 UTC
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8911B778DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:47:12 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 2D7372077D; Tue, 14 Mar 2017 18:37:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (unknown [88.191.26.124])
	by mail.free-electrons.com (Postfix) with ESMTPSA id EBFA420767;
	Tue, 14 Mar 2017 18:37:05 +0100 (CET)
Date: Tue, 14 Mar 2017 18:37:04 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170314173704.paadx2itbq6anwkh@piout.net>
References: <20170228150119.21252-1-nicolas.ferre@microchip.com>
	<20170314161431.GJ15664@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170314161431.GJ15664@denix.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] devmem2: Change source URL to regain access to it
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
X-List-Received-Date: Tue, 14 Mar 2017 17:47:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14/03/2017 at 12:14:31 -0400, Denys Dmytriyenko wrote:
> On Tue, Feb 28, 2017 at 04:01:19PM +0100, Nicolas Ferre wrote:
> > Change URL due to connexion error on the original page.
> > As the header of the new devmem2.c source file has changed, change the
> > signature and the LIC_FILES_CHKSUM specificaiton.
> 
> Oh, great! So, now, everyone who has this file cached locally would have to 
> invalidate their mirrors? Moreover, if you are building master and morty or 
> older, you can't reuse the same source mirror as each of the builds will 
> complain about bad checksums...
> 

Please suggest another solution. The main issue is that lartmaker.nl
doesn't reply anymore and we don't have a local copy of the previous
devmem2.c and I don't see it on
http://downloads.yoctoproject.org/mirror/sources/ either.

> -- 
> Denys
> 
> 
> > Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > ---
> >  meta-oe/recipes-support/devmem2/devmem2.bb | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
> > index e48cc9210bb3..c42eb5e0b1c5 100644
> > --- a/meta-oe/recipes-support/devmem2/devmem2.bb
> > +++ b/meta-oe/recipes-support/devmem2/devmem2.bb
> > @@ -1,9 +1,9 @@
> >  SUMMARY = "Simple program to read/write from/to any location in memory"
> >  LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://devmem2.c;endline=28;md5=dd68f2b0a5184b3db3dc25c99e0bd0cd"
> > +LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf986297cf"
> >  PR = "r7"
> >  
> > -SRC_URI = "http://www.lartmaker.nl/lartware/port/devmem2.c \
> > +SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c \
> >             file://devmem2-fixups-2.patch;apply=yes;striplevel=0"
> >  S = "${WORKDIR}"
> >  
> > @@ -18,5 +18,5 @@ do_install() {
> >      install devmem2 ${D}${bindir}
> >  }
> >  
> > -SRC_URI[md5sum] = "be12c0132a1ae118cbf5e79d98427c1d"
> > -SRC_URI[sha256sum] = "ec382c90af3ef2f49695ff14a4d6521e58ac482c4e29d6c9ebca8768f699c191"
> > +SRC_URI[md5sum] = "e23f236e94be4c429aa1ceac0f01544b"
> > +SRC_URI[sha256sum] = "3b15515693bae1ebd14d914e46d388edfec2175829ea1576a7a0c8606ebbe639"
> > -- 
> > 2.9.0
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

