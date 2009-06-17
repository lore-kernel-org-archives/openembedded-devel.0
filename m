Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MH0ex-0007bJ-Eo
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 21:18:59 +0200
Received: (qmail 28877 invoked from network); 17 Jun 2009 19:08:31 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 17 Jun 2009 12:08:31 -0700
Date: Wed, 17 Jun 2009 12:08:31 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090617190830.GG15477@smtp.west.cox.net>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
	<1245261716.27027.18.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1245261716.27027.18.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image	creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 19:19:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2009 at 07:01:56PM +0100, Richard Purdie wrote:
> On Wed, 2009-06-17 at 10:10 -0700, Chris Larson wrote:
> > Set IMAGE_KEEPROOTFS to something other than the empty string to keep
> > tmp/rootfs around after image creation, otherwise it will be removed, as it's
> > not a fully functional filesystem, and causes much confusion among users as a
> > result.
> > 
> > Signed-off-by: Chris Larson <clarson@mvista.com>
> > ---
> >  classes/image.bbclass |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/classes/image.bbclass b/classes/image.bbclass
> > index f0cc3b3..974e734 100644
> > --- a/classes/image.bbclass
> > +++ b/classes/image.bbclass
> > @@ -133,6 +133,7 @@ fakeroot do_rootfs () {
> >  	${IMAGE_POSTPROCESS_COMMAND}
> >  	
> >  	${MACHINE_POSTPROCESS_COMMAND}
> > +	${@['rm -rf ${IMAGE_ROOTFS}', ''][bool(d.getVar("IMAGE_KEEPROOTFS", 1))]}
> >  }
> >  
> >  do_deploy_to[nostamp] = "1"
> 
> Something I've been thinking about for a while is moving rootfs into
> ${WORKDIR}/. That way you can have concurrent image generation for a
> start and rm_work could be taught to clean it up...

Isn't the other part of that the need to serialize making the package
index files?

-- 
Tom Rini


