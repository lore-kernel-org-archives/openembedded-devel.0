Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LiAhk-0004za-DX
	for openembedded-devel@openembedded.org; Fri, 13 Mar 2009 17:57:52 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090313165730.JVJG15318.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Mar 2009 12:57:30 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id SgxV1b00N4dMFYL03gxVgJ; Fri, 13 Mar 2009 12:57:29 -0400
X-Authority-Analysis: v=1.0 c=1 a=_zo9k9qn05R-Kw4Y_5MA:9
	a=yL4B0lsicLPnjU6Vflj27FtGV2QA:4 a=LY0hPdMaydYA:10
	a=Hsa7Bxc7kfmR-1Cg:21 a=vAflNjOIrIXEbU9Y:21
X-CM-Score: 0.00
Date: Fri, 13 Mar 2009 09:57:29 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090313165729.GG26343@smtp.west.cox.net>
References: <20090313145610.GA26373@denix.org>
	<018101c9a3f0$7f5b2cd0$5e3018ac@Glamdring>
	<20090313160732.GA26615@denix.org>
	<ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10903130920t14221262y841d9999563bd912@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Mar 2009 16:57:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2009 at 05:20:51PM +0100, Frans Meulenbroeks wrote:

> I'm not sure how PARALLEL_MAKE is supposed to work, but I noticed that
> often there is a problem because with it a package on which there is a
> dependency is build in parallel. Since there is a dependency in a lot
> of cases the underlying package fails.

PARALLEL_MAKE is just a wrapper around make ( / cmake?) -j N.
BB_NUMBER_THREADS is how you get different packages going in parallel.

> A typical scenario:
> a package X depends on perl-native, typically they start to build in
> parallel but perl-native does take much longer than X. X requires
> perl-native to complete and fails.

Right.  This is a bug on package X not listing perl-native as a
dependancy as with BB_NUMBER_THREADS >1 perl-native will be worked until
do_populate_staging before X do_configure is started.

-- 
Tom Rini


