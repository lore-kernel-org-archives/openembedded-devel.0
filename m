Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LiXt0-0003q7-Fm
	for openembedded-devel@openembedded.org; Sat, 14 Mar 2009 18:43:02 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090314174234.IQGU10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 14 Mar 2009 13:42:34 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id T5iZ1b0024dMFYL035iZbD; Sat, 14 Mar 2009 13:42:33 -0400
X-Authority-Analysis: v=1.0 c=1 a=pHtMunH1K18CL2LL5kMA:9
	a=dymNWF25yadt0vZoShIxrwZVcF4A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 14 Mar 2009 10:42:32 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090314174232.GH26343@smtp.west.cox.net>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
	<ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
	<20090313165729.GG26343@smtp.west.cox.net>
	<ac9c93b10903140329g1504f185xea0b45bee224624b@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10903140329g1504f185xea0b45bee224624b@mail.gmail.com>
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
X-List-Received-Date: Sat, 14 Mar 2009 17:43:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 14, 2009 at 11:29:28AM +0100, Frans Meulenbroeks wrote:
> Ah,
> 
> Thanks alot Tom, I was unaware of this. Mostly I repaired thse
> breakages by disabling PARALLEL_MAKE. Apparently most of the time not
> the optimal solution....
> Will do things better in the future (and will try to repair things
> where things go wrong.
> One small Q though: The fact that a package is build during the build
> of another pacakge, doesn't that implicitly say that there is a
> dependency between these?

Nope, in fact it's the opposite.  BB_NUMBER_THREADS is a max, not a min
that can be going.  So with 4 threads, up to 4 tasks that have had all
pre-requisite tasks completed, may be running.

> (actually thinking of it as I write this: guess most packages should
> depend on gcc, glibc etc but these are not made explicit)

Actually, I think those deps are explicit in the DEFAULT_DEPS or so
variable, somewhere (which is why glibc and a few others have
INHIBIT_DEFAULT_DEPS = 1).

-- 
Tom Rini


