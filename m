Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MdzS4-0003L3-SS
	for openembedded-devel@openembedded.org; Thu, 20 Aug 2009 06:40:41 +0200
Received: (qmail 18850 invoked from network); 20 Aug 2009 04:23:23 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 19 Aug 2009 21:23:23 -0700
Date: Wed, 19 Aug 2009 21:23:25 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090820042324.GC4952@smtp.west.cox.net>
References: <4A8C1EB7.4050500@atmel.com> <20090820033157.GB32010@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090820033157.GB32010@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: fbv neutered
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
X-List-Received-Date: Thu, 20 Aug 2009 04:40:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 19, 2009 at 11:31:57PM -0400, Denys Dmytriyenko wrote:

> On Wed, Aug 19, 2009 at 05:48:07PM +0200, Ulf Samuelsson wrote:
> > I added "fbv" "frame buffer viewer" to the file system,
> > and happily tried to watch my Mustang rental car.
> > 
> > -- fbv did not recognize the file format.
> > 
> > Generated a nice bmp file and tried this...
> > 
> > --  fbv did not recognize the file format.
> > 
> > I then checked the recipe:
> > 
> > 
> > ---------------------------------
> > 	CC="${CC}" ./configure --without-libungif --without-bmp \
> > 		--without-libjpeg
> > ---------------------------------
> > 
> > Beats me why someone would want to have it built this way.

Yes, I pushed it that way as I only needed it as a png viewer (we needed
a simple "can we display graphics?" test program) and someone on IRC
also only needed PNGs, I guess.

Of course, it'd be pretty easy to add ungif/bmp/jpeg to the dependancies
list and recompile if you wanted more support.

> > Is there another application one should use?
> 
> Try fbida - worked for me just fine

It didn't when I tried, way way back when.  It also wanted way more
stuff :)

-- 
Tom Rini


