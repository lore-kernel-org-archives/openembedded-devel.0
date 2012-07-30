Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SvxMm-0007k7-4x
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 23:19:04 +0200
Received: by pbbrq2 with SMTP id rq2so9175068pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 14:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=kbHRrtM+ZRICNyPv9uKD0OVoEnQuEJ8h6u5TYlbMTws=;
	b=X922KeWOV4fPoaOVCHCUDS3LtuefZUd+xc7VYf53h4p9+fl4ZtN7K1VSaUGUtUydul
	WCOoYYXb+AgqlxwWnHhFLruJzqhlXL03mFbShn7UzZGmeDKT5zKEedpSxfeB3t7PsM4r
	H248MotSTufL61ZyUPODG0Uz/mrsjKluz8aovU3ljzLFUS7ZCAZJiAIUrPfRvDH84wmr
	nYZDQ3J9dQekSbN4AS1n/eBOMoImBxtaMguiFE3CRm73eLaFfWhDmQmut2dktSPdytTf
	Kb8XzCk+UgHFAyf2uPxjsxRr/sP7GKmWWWF8DfHULWTBZeLiAzOjOAfZ7QP4xOk//Bxr
	hCsA==
Received: by 10.68.224.70 with SMTP id ra6mr38275578pbc.11.1343682446962;
	Mon, 30 Jul 2012 14:07:26 -0700 (PDT)
Received: from bill-the-cat ([2001:470:d:eba:b058:e4b1:e360:44b4])
	by mx.google.com with ESMTPS id of1sm8597672pbb.15.2012.07.30.14.07.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 14:07:26 -0700 (PDT)
Date: Mon, 30 Jul 2012 14:07:32 -0700
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120730210732.GD9554@bill-the-cat>
References: <cover.1342677797.git.apelete@seketeli.net>
	<20120723194807.GB8985@bill-the-cat>
	<20120723203323.GC10225@hermes>
MIME-Version: 1.0
In-Reply-To: <20120723203323.GC10225@hermes>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH 0/9] Pull request 20120719
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
X-List-Received-Date: Mon, 30 Jul 2012 21:19:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 23, 2012 at 10:33:23PM +0200, Apelete Seketeli wrote:
> Le 23-Jul-12, Tom Rini a ?crit:
> > On Thu, Jul 19, 2012 at 07:20:31PM +0200, Apelete Seketeli wrote:
> > 
> > > Hello,
> > > 
> > > The patches that come as a follow-up of this message fix issues found
> > > while building muffinman-image on top of the 2011.03-maintenance
> > > branch.
> > > These modifications were tested by successfully building
> > > muffinman-image from scratch on a Debian Squeeze host.
> > > Please pull into 2011.03-maintenance branch.
> > > 
> > > The following changes since commit f9611c025109a3e0d6cebf12f49ae24c97759c09:
> > > 
> > >   psplash: convert from svn.o-hand.com to git.yoctoproject.org (2012-07-04 22:34:04 +0200)
> > > 
> > > are available in the git repository at:
> > > 
> > >   git://seketeli.net/~apelete/oe.git muffinman-image-fix
> > 
> > I have a concern right now.  It is that 9160263 was reported to have
> > changed the behavior slightly such that some SDK tasks/images now
> > fail.  So..
> 
> I can't seem to find the commit corresponding to the 9160263 hash in
> the 2011.03 branch. Could you point it to me please ?

Sorry, the leading 'f' got missed, and I see Denys has a pull request to
deal with that breakage now.

-- 
Tom


