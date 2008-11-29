Received: from [202.4.237.240] (helo=kirsty.vergenet.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raster@vergenet.net>) id 1L6XaX-0006Tf-TE
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Nov 2008 22:42:54 +0100
Received: by kirsty.vergenet.net (Postfix, from userid 1001)
	id 53D2A2406F; Sun, 30 Nov 2008 08:39:38 +1100 (EST)
Date: Sun, 30 Nov 2008 08:39:34 +1100
From: Carsten Haitzler (The Rasterman) <raster@rasterman.com>
To: Stanislav Brabec <utx@penguin.cz>
Message-Id: <20081130083934.d9ee3e4e.raster@rasterman.com>
In-Reply-To: <20081129215247.52c40a2b@zaurus>
References: <ggonls$p8a$1@ger.gmane.org>
	<20081129010422.ecd2adb6.raster@rasterman.com>
	<20081129215247.52c40a2b@zaurus>
Organization: You expect me to be organized?
X-Mailer: Sylpheed 2.4.8 (GTK+ 2.12.9; i486-pc-linux-gnu)
X-Pants: on
X-Cluestick: Get jiggy with it!
Mime-Version: 1.0
Cc: Koen Kooi <k.kooi@student.utwente.nl>,
	openembedded-devel@lists.openembedded.org
Subject: Re: Requiring root access for windowmanagers?
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
X-List-Received-Date: Sat, 29 Nov 2008 21:42:54 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Nov 2008 21:52:47 +0100 Stanislav Brabec <utx@penguin.cz> babbled:

> Sat, 29 Nov 2008 01:04:22 +1100
> Carsten Haitzler (The Rasterman) wrote:
> 
> > On Fri, 28 Nov 2008 13:20:12 +0100 Koen Kooi
> > <k.kooi@student.utwente.nl> babbled:
> 
> > > What's the consensus on requiring root access for running an OE
> > > built windowmanager?
> > > 
> > > Case in point: e-wm does 'renice -10', which only root is allow to
> > > do.
> > > 
> > > Proposal: remove the 'renice' so regular users can start a window 
> > > manager as well.
> > 
> > i did this specifically for performance. basically it makes things
> > MUCH smoother.
> 
> I understand your trick - I do the same with video player if I want to
> compile in parallel with DVD playback.
> 
> Running WM as root would increase any security hole to root access flaw.
> I can see cleaner solutions:

as such though.. the openmoko distro runs everything as root - that's why i
really look at it and went "well.. in this case it'd work - for other cases
where its not root - well. no thing will break but you get no benefit".

> 1. Write a small SUID wrapper. Change priority, drop permissions, run
> window manager.

sure. shouldn't be hard.  i have one of these for playing with the realtime
scheduler (eg set scheduler to FIFO... this is fun for benchmarking!)
 
> 2. Run WM as root and drop privileges after setting priority.

wm would need code internally for this. this is possible. E already runs
sub-process at nice +1 so anything it launches will be of lower priority than
the wm (we can argue pros and cons forever and a day - but imho this is the
right thing. the managing infra here should get top priority for app switching,
launching feedback etc. etc.).

> 3. Use capabilities and enable CAP_SYS_NICE.

never touched this.

> 4. And finally, the best solution may be a different kernel scheduler.
> But I don't follow the development there, so I don't know, whether
> there is possible to find a good solution: "This process does not eat a
> much CPU time, but it wants fast processing".

that's pretty much everything :) the question is... when more than 1 of these
want the cpu "now"... who get's first-pick :)

as it is right now - non-root wm's don't break. they simply don't get a higher
priority. so this is relatively harmless. it just is non-beneficial for
non-root. the question is more - is there an agreement that this is a good
thing to do at all. i'd also argue X should be reduced in nice value (higher
priority) too so all refreshing, drawing, etc. takes priority over back-end
processing by apps.

-- 
------------- Codito, ergo sum - "I code, therefore I am" --------------
The Rasterman (Carsten Haitzler)    raster@rasterman.com



