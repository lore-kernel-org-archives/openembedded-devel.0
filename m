Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q267m-0006Fx-Js
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 19:16:10 +0100
Received: by iwn10 with SMTP id 10so8001328iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=zFoRPNOIGNJOJOLZQrfPk1/BsW0/SzcwGmeciJSHHfw=;
	b=DPMWEIGf7quCyCp3hUoDNt/yxfULnb12Ly7LNultooiC5IQsZ9SUxVraWHlMRIK+1q
	z0Qz1YCiZ58oT2KL+4eipQbQeXNczcgxfyqoQGtalFbCmviKBht6RWKBj/uYt48xw+a0
	0xVZk0xeFYi544DUudH/mWCpdqmwBanE2CeBA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=K+j3JZnSdNu+cGFBc8vnnk+/zl2Cxmm21s92TnWv7EYSsudnfEp23a7Y5dEArIoZ1h
	vLkynj9evtstJ6OzhPVPc72dUWEjMFUJqfjh+s3WSwc4QZK042fUMW0HA7KNLCNPOyCN
	QheOIaC4jQYOOG0pXK8tsBYjOSsMYN30DsIBA=
Received: by 10.42.247.202 with SMTP id md10mr9478578icb.342.1300817656727;
	Tue, 22 Mar 2011 11:14:16 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id gy41sm3388051ibb.5.2011.03.22.11.14.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 11:14:14 -0700 (PDT)
Date: Tue, 22 Mar 2011 11:14:29 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110322181429.GB26336@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1300780910-28866-1-git-send-email-heinold@inf.fu-berlin.de>
	<1300780910-28866-3-git-send-email-heinold@inf.fu-berlin.de>
	<20110322171954.GA22283@sakrah.homelinux.org>
	<20110322173047.GA10685@rhein.zuhause.netz>
MIME-Version: 1.0
In-Reply-To: <20110322173047.GA10685@rhein.zuhause.netz>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 2/3] cairo.inc: let arm, mips and ppc depend on libatomic-ops
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2011 18:16:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (22/03/11 18:30), Henning Heinold wrote:
> On Tue, Mar 22, 2011 at 10:19:54AM -0700, Khem Raj wrote:
> > On (22/03/11 09:01), heinold@inf.fu-berlin.de wrote:
> > > From: Henning Heinold <heinold@inf.fu-berlin.de>
> > > 
> > > 
> > > Signed-off-by: Henning Heinold <heinold@inf.fu-berlin.de>
> > > ---
> > >  recipes/cairo/cairo.inc |    9 ++++++++-
> > >  1 files changed, 8 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/recipes/cairo/cairo.inc b/recipes/cairo/cairo.inc
> > > index c60d7d9..fad50b3 100644
> > > --- a/recipes/cairo/cairo.inc
> > > +++ b/recipes/cairo/cairo.inc
> > > @@ -1,15 +1,22 @@
> > >  SECTION = "libs"
> > >  PRIORITY = "optional"
> > > -DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
> > >  DESCRIPTION = "Cairo graphics library"
> > >  LICENSE = "MPL LGPL"
> > >  
> > > +DEPENDS = "virtual/libx11 pixman libsm libpng fontconfig libxrender glib-2.0"
> > > +
> > > +DEPENDS_append_arm = " libatomic-ops"
> > > +DEPENDS_append_mips = " libatomic-ops"
> > > +DEPENDS_append_mipsel = " libatomic-ops"
> > > +DEPENDS_append_ppc = " libatomic-ops"
> > > +
> 
> No,
> 
> but how do you will filter it? We have no versions dep in bitbake.

Yes a limitation. If it will still let gcc use its atomics if they
exist then we can live with unused dependency. Can you put a comment
saying that you can ammend the deps if you are using a gcc/arch combo
which supports atomics ?
> 
> Bye Henning
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


