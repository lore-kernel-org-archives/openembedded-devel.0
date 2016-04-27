Return-Path: <bruno.bottazzini@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9F17391A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 16:09:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2016 09:06:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,542,1455004800"; d="scan'208";a="93005726"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.98.161])
	([10.218.98.161])
	by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2016 09:06:16 -0700
Message-ID: <1461773167.3159.9.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Apr 2016 13:06:07 -0300
In-Reply-To: <20160427140835.GA25882@jama>
References: <1461602537-19434-1-git-send-email-bruno.bottazzini@intel.com>
	<20160427075206.GE2559@jama>
	<1461765122.3159.8.camel@bottazzini-ThinkPad-T430>
	<20160427140835.GA25882@jama>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] libmicrohttpd: update to 0.9.49
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
X-List-Received-Date: Wed, 27 Apr 2016 16:09:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Martin,

I could replicate the problem here.

I will send the V2 ASAP 

thanks

On Wed, 2016-04-27 at 16:08 +0200, Martin Jansa wrote:
> On Wed, Apr 27, 2016 at 10:52:02AM -0300, Bottazzini, Bruno wrote:
> > Hi Martin,
> 
> Hi,
> 
> > I haven't received this error when compiling libmicrohttpd in the
> > version 0.9.49.
> > 
> > Did you get this error? 
> 
> Yes, otherwise I wouldn't be reporting this.
> 
> > Best Regards,
> > 
> > On Wed, 2016-04-27 at 09:52 +0200, Martin Jansa wrote:
> > > On Mon, Apr 25, 2016 at 01:42:17PM -0300, Bruno Bottazzini wrote:
> > > > Signed-off-by: Bruno Bottazzini <bruno.bottazzini@intel.com>
> > > > ---
> > > >  .../{libmicrohttpd_0.9.34.bb => libmicrohttpd_0.9.49.bb}            | 6 +++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >  rename meta-oe/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.34.bb => libmicrohttpd_0.9.49.bb} (82%)
> > > > 
> > > > diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> > > > similarity index 82%
> > > > rename from meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> > > > rename to meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> > > > index e3c833b..7b29065 100644
> > > > --- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
> > > > +++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.49.bb
> > > > @@ -6,10 +6,10 @@ SECTION = "net"
> > > >  DEPENDS = "libgcrypt gnutls file"
> > > >  
> > > >  SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
> > > > -SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
> > > > -SRC_URI[sha256sum] = "29a2bfd4fd2ddf60c756b8c283291a134898e3cc143843be421a040be1b25a88"
> > > > +SRC_URI[md5sum] = "3209aa2ac6199b874a6325342b86edbc"
> > > > +SRC_URI[sha256sum] = "9407d8252548ab97ace3276e0032f073820073c0599d43baff832902a8dab11c"
> > > >  
> > > > -inherit autotools lib_package
> > > > +inherit autotools lib_package pkgconfig
> > > 
> > > I've reported this in 0.9.48 upgrade:
> > > http://lists.openembedded.org/pipermail/openembedded-devel/2016-March/106672.html
> > > 
> > > libmicrohttpd-0.9.49: libmicrohttpd: configure was passed unrecognised
> > > options: --disable-spdy [unknown-configure-option]
> > > 
> > > This time I'll make sure to hold this patch until it's resolved.
> > > 
> > > >  # disable spdy, because it depends on openssl
> > > >  EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --disable-spdy"
> > > > -- 
> > > > 2.7.1
> > > > 
> > > > -- 
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > 
> > 
> > 
> 



