Received: from [68.230.241.54] (helo=fed1rmmtai106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Li1BQ-0002Kc-2n
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 07:47:52 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao103.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090313060547.KKWE4363.fed1rmmtao103.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Mar 2009 02:05:47 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id SW5n1b00A4dMFYL03W5nGc; Fri, 13 Mar 2009 02:05:47 -0400
X-Authority-Analysis: v=1.0 c=1 a=AuO5VmLqvttDYGAxARIA:9
	a=RBAtniO5cGs6yAlbuTV4nl5NchkA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 12 Mar 2009 23:05:47 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090313060546.GF26343@smtp.west.cox.net>
References: <1236900736.26901.8.camel@grond.atmel.com>
	<200903121838.58470.raj.khem@gmail.com>
	<20090313034930.GA23252@denix.org>
MIME-Version: 1.0
In-Reply-To: <20090313034930.GA23252@denix.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 06:47:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 12, 2009 at 11:49:30PM -0400, Denys Dmytriyenko wrote:
> On Thu, Mar 12, 2009 at 06:38:54PM -0700, Khem Raj wrote:
> > On Thursday 12 March 2009 16:32:16 Ulf Samuelsson wrote:
> > > Is there any activity to make this more useful?
> > > Just managed to install a Core i7 machine, which speeded
> > > up my Buildroot build from about 4 hours to less than 1 hour.
> > > (There was an error in the build right at the end,
> > > so it could have been downto 40 minutes or so)
> > > Building the cross compiler took 10 minutes with "make -j 16"
> > > compared to 1-2 hours on a P4 @ 3GHz.
> > >
> > > Openembedded does not seem to use PARALLEL_MAKE extensively.
> > > I have the frequency meter activated for all 8 CPUs in the Core i7,
> > > and most of the time the CPUs seems to idle at 1.6 GHz,
> > > with one CPU (or rarely 2) are running at the full 2.67 GHz.
> > >
> > > Last time I built OE on a P4@ 3 GHz it took ~40 hours
> > > for the SAM9263, so some speedup would be nice.
> > > Maybe we should make an effort?
> > 
> > I use 
> > 
> > PARALLEL_MAKE = "-j4" 
> > BB_NUMBER_THREADS = "2"
> > 
> > in my local.conf. I see my core 2 duo machine spawning parallel tasks.
> 
> I'm setting 4/4 to the above two variables on my Quad Core and it loads all 4 
> cores at 100% almost all the time. Sometimes it slows down due to the 
> bottleneck in the harddrive access...

On the dual dual-core (4 total) boxes I have, I do -j6/4 threads.  On my
new quad-core box I haven't yet had a chance to figure out what's best.
I also use -j6/4 threads on an older dual-core amd64 box we've got
around and that seems best for my tasks at least (I tried a few
combinations of more jobs/threads and less and both were slower).

-- 
Tom Rini


