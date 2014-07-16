Return-Path: <amy.fong@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24D9A7057D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 15:36:14 +0000 (UTC)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6GFaFRO005550
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:36:16 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.82)
	(envelope-from <amy.fong@windriver.com>) id 1X7RFe-0000Hq-Pz
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jul 2014 11:36:15 -0400
Date: Wed, 16 Jul 2014 11:36:14 -0400
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140716153613.GA1067@windriver.com>
References: <20140716145924.GA13352@windriver.com> <20140716152657.GD2433@jama>
MIME-Version: 1.0
In-Reply-To: <20140716152657.GD2433@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe] [PATCH] postgresql configure error
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
X-List-Received-Date: Wed, 16 Jul 2014 15:36:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 16, 2014 at 05:26:57PM +0200, Martin Jansa wrote:
> On Wed, Jul 16, 2014 at 10:59:28AM -0400, Amy Fong wrote:
> > Author: Amy Fong <amy.fong@windriver.com>
> > Date:   Wed Jul 16 10:57:38 2014 -0400
> > 
> >     postgresql: libxml2 configure error
> >     
> >     postgresql is looking for libxml2 in the wrong location .../usr/include
> >     libxml2 installs its header files under .../usr/include/libxml2
> >     
> >     Signed-off-by: Amy Fong <amy.fong@windriver.com>
> > 
> > diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgre
> > index 4e5ec02..47aa3a6 100644
> > --- a/meta-oe/recipes-support/postgresql/postgresql.inc
> > +++ b/meta-oe/recipes-support/postgresql/postgresql.inc
> > @@ -47,7 +47,7 @@ PACKAGECONFIG[uuid] = "--with-ossp-uuid,--without-ossp-uuid,ossp-uuid,"
> >  PACKAGECONFIG[tcl] = \
> >      "--with-tcl --with-tclconfig=${STAGING_BINDIR_CROSS},--without-tcl,tcl,"
> >  PACKAGECONFIG[nls] = "--enable-nls,--disable-nls,,"
> > -PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
> > +PACKAGECONFIG[libxml] = "--with-libxml CFLAGS=-I${STAGING_INCDIR}/libxml2,--without-libxml,libx
> 
> Using libxml pkgconfig is better option (see patch on ML)

D'oh. Thanks!

> >  PACKAGECONFIG[perl] = "--with-perl,--without-perl,perl,perl"
> >  
> >  EXTRA_OECONF += "--enable-thread-safety --disable-rpath \
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


