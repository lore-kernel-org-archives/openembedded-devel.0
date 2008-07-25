Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KMMoc-0004jJ-9z
	for openembedded-devel@openembedded.org; Fri, 25 Jul 2008 14:54:34 +0200
Received: (qmail 2082 invoked by uid 813007); 25 Jul 2008 12:53:13 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 25 Jul 2008 12:53:13 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Jul 2008 14:53:13 +0200
User-Agent: KMail/1.10.0 (Linux/2.6.26; KDE/4.1.0; x86_64; ; )
MIME-Version: 1.0
Message-Id: <200807251453.21851.openembedded@haerwu.biz>
Subject: [RFC] Naming of packages for x86 archs
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
X-List-Received-Date: Fri, 25 Jul 2008 12:54:34 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hi

OpenEmbedded supports granulated packaging and tuning to get as much as 
possible from each CPU. This works fine for ARM and PowerPC platforms as 
their cores are easy to recognize (armv4t, armv5te, armv6, armv7a for 
ARM). The problem lies in x86 land where there is no such order in 
cores...

Currently we have following tunings for x86:

name		| -march value	| packaging
---------------------------------------------
athlonmp	| i686		| i686
c3		| c3		| i586
geodelx		| k6-2		| geode
pentium		| pentium	| i586
prescott	| prescott	| i686p4c
pentiumpro	| pentiumpro	| i686
x86-nocona	| nocona	| NOT SET
x86-prescott	| prescott	| NOT SET
x86		| i486		| i486

And we have Progear machine which use Transmeta Crusoe which can have 
own optimisations (I have to unpack mine one day and build something for 
it).

I would like to start discussion about naming for x86 package archs. One 
of propositions in past was use something like "tune-prescott" does - 
adding description after arch name (i686p4c). This way we can have list 
like:

i486

i586      - pentium
i586mmx   - pentium with mmx, Geode GX1
i586c3    - VIA C3
i586k6    - AMD K6
i586k62   - AMD K6-2, Geode LX
i586geode - Geode LX with gcc 4.3 or patched 4.2

i686      - pentium pro, Crusoe TM5xxxx (MMX only)
i686p2    - pentium II
i686sse   - pentium III
i686sse2  - pentium-m, Transmeta Efficeon
i686sse3  - pentium with SSE3, VIA C7
i686p4    - pentium 4 cores
i686p4c   - celeron with pentium 4 core
i686c32   - VIA Eden, Nehemiah (-march=c3-2)
i686ath   - AMD Athlon Thunderbird core
i686axp   - AMD Athlon XP cores
i686asse3 - AMD64 cpus in 32bit mode (those with SSE3 support)

Names are ofcourse to define in more sane way but to make it easy to 
recognize does package will work on target platform or not. So if my 
target platform cpu will handle sse1/2/3 and 3dnow then I can run 
everything from above list, but if it GeodeLX then I can run every i586 
variants on it.

What does other developer think about it? Does it have a sense?






