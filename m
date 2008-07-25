Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thommycheck@gmx.de>) id 1KMNBm-0005fK-6W
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jul 2008 15:18:30 +0200
Received: (qmail invoked by alias); 25 Jul 2008 13:17:08 -0000
Received: from BAA15d0.baa.pppool.de (EHLO [192.168.178.36]) [77.128.21.208]
	by mail.gmx.net (mp068) with SMTP; 25 Jul 2008 15:17:08 +0200
X-Authenticated: #2218979
X-Provags-ID: V01U2FsdGVkX1/vRcgbQ43v2ay91/JGStxAeJeir5+NhmhusmNOM5
	rAkjcyyJuw8cgC
Message-ID: <4889D253.9040908@gmx.de>
Date: Fri, 25 Jul 2008 15:17:07 +0200
From: Thomas Kunze <thommycheck@gmx.de>
User-Agent: Mozilla-Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200807251453.21851.openembedded@haerwu.biz>
In-Reply-To: <200807251453.21851.openembedded@haerwu.biz>
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.53
Subject: Re: [RFC] Naming of packages for x86 archs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 25 Jul 2008 13:18:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Hi
>
> OpenEmbedded supports granulated packaging and tuning to get as much as 
> possible from each CPU. This works fine for ARM and PowerPC platforms as 
> their cores are easy to recognize (armv4t, armv5te, armv6, armv7a for 
> ARM). The problem lies in x86 land where there is no such order in 
> cores...
>
> Currently we have following tunings for x86:
>
> name		| -march value	| packaging
> ---------------------------------------------
> athlonmp	| i686		| i686
> c3		| c3		| i586
> geodelx		| k6-2		| geode
> pentium		| pentium	| i586
> prescott	| prescott	| i686p4c
> pentiumpro	| pentiumpro	| i686
> x86-nocona	| nocona	| NOT SET
> x86-prescott	| prescott	| NOT SET
> x86		| i486		| i486
>
> And we have Progear machine which use Transmeta Crusoe which can have 
> own optimisations (I have to unpack mine one day and build something for 
> it).
>
> I would like to start discussion about naming for x86 package archs. One 
> of propositions in past was use something like "tune-prescott" does - 
> adding description after arch name (i686p4c). This way we can have list 
> like:
>
> i486
>
> i586      - pentium
> i586mmx   - pentium with mmx, Geode GX1
> i586c3    - VIA C3
> i586k6    - AMD K6
> i586k62   - AMD K6-2, Geode LX
> i586geode - Geode LX with gcc 4.3 or patched 4.2
>
> i686      - pentium pro, Crusoe TM5xxxx (MMX only)
> i686p2    - pentium II
> i686sse   - pentium III
> i686sse2  - pentium-m, Transmeta Efficeon
> i686sse3  - pentium with SSE3, VIA C7
> i686p4    - pentium 4 cores
> i686p4c   - celeron with pentium 4 core
> i686c32   - VIA Eden, Nehemiah (-march=c3-2)
> i686ath   - AMD Athlon Thunderbird core
> i686axp   - AMD Athlon XP cores
> i686asse3 - AMD64 cpus in 32bit mode (those with SSE3 support)
>
> Names are ofcourse to define in more sane way but to make it easy to 
> recognize does package will work on target platform or not. So if my 
> target platform cpu will handle sse1/2/3 and 3dnow then I can run 
> everything from above list, but if it GeodeLX then I can run every i586 
> variants on it.
>
> What does other developer think about it? Does it have a sense?
>
>   
I'm not really into x86 for oe or details of x86 cpus, but this sounds
as a good idea.


