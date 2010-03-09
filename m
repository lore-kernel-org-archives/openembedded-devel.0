Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Np6fW-0005cX-RV
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Mar 2010 22:08:51 +0100
Received: from gandalf.denix.org ([unknown] [71.251.51.225])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KZ100CKA98P6HR4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	09 Mar 2010 15:05:19 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 64AB014AF60; Tue,
	09 Mar 2010 16:05:13 -0500 (EST)
Date: Tue, 09 Mar 2010 16:05:13 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100309210513.GB19931@denix.org>
References: <1268134848.32439.12.camel@hydra>
	<1268165249.16526.156.camel@trini-m4400>
MIME-version: 1.0
In-reply-to: <1268165249.16526.156.camel@trini-m4400>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issue with (gcc-cross-|glibc-)initial and packaged staging
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
X-List-Received-Date: Tue, 09 Mar 2010 21:08:51 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 09, 2010 at 01:07:29PM -0700, Tom Rini wrote:
> On Tue, 2010-03-09 at 11:40 +0000, Thomas Horsten wrote:
> > I've spotted a rather annoying interim build failure but I'm not sure
> > how to best tackle the situation.
> > 
> > For example, gcc-cross-initial and gcc-cross install some of the same
> > files in staging. Normally this doesn't matter, since gcc-cross
> > overwrites the earlier ones installed by -initial, but when using
> > packaged staging and many threads (BBTHREADS=10 for example), it
> > sometimes happens that the pstaging packages for gcc-cross-initial and
> > gcc-cross get installed into staging in the wrong order (or at the same
> > time in two different threads), resulting in all builds after that
> > failing due to undefined references in the lib files from -initial.
> 
> So, my guess is that what happens is that when we copy the stamps from
> the pstage package over to the live stamps directory to check them,
> another thread comes along and sees they're in and we get out of order.
> Can you try something like (pastebin'd to avoid patchwork doing
> something silly):
> http://pastebin.com/rCijESQ8
> 
> This is possibly not ideal, but as I comment there, grab the lock for
> staging before we copy stamps in (and release it if there's problems).
> But this should fix the problem, yes?  If gcc-cross-initial thread is
> going and the gcc-cross thread fires, it'll be stuck waiting for
> gcc-initial to finish up fully.

As I've previously seen and complained on IRC about a similar issue with many 
BB threads failing in packaged staging, but for different packages, I would 
like to try this patch as well. BTW, looking into the patch it is funny that I 
also tried to fix it by using SYSROOT_LOCK, but I don't think I was doing it 
properly. I'll see if Tom's patch fixes it...

-- 
Denys


