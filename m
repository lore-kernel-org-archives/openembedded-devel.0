Received: from [68.230.241.42] (helo=fed1rmmtao104.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lbyr4-0003fR-1s
	for openembedded-devel@openembedded.org; Tue, 24 Feb 2009 16:05:54 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao104.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090224150248.PZSQ16134.fed1rmmtao104.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 24 Feb 2009 10:02:48 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id Kr2n1b0064dMFYL04r2nSr; Tue, 24 Feb 2009 10:02:49 -0500
X-Authority-Analysis: v=1.0 c=1 a=Q4-j1AaZAAAA:8 a=wuIpMq_6gPoDj06tMQsA:9
	a=IO6aI5YcfM-UsYAcPmsA:7 a=KmBdyMamaV5KNF1XPGZL4bdK9mgA:4
	a=LY0hPdMaydYA:10 a=UcWZWmDdwLsA:10
X-CM-Score: 0.00
Date: Tue, 24 Feb 2009 08:02:47 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090224150247.GG2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<200902240949.10862.openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <200902240949.10862.openembedded@haerwu.biz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: checksums situation
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
X-List-Received-Date: Tue, 24 Feb 2009 15:05:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 24, 2009 at 09:49:04AM +0100, Marcin Juszkiewicz wrote:
> On Tuesday 24 of February 2009 07:46:39 Tom Rini wrote:
> 
> > And, is anyone doing more then 'cat tmp/checksums.ini >>
> > openembedded/conf/checksums.ini && python the-sorter' ?  And by more
> > I mean check for an upstream .md5 or similar, to make sure this is
> > really right?
> 
> commit 67aa127f4b4cb2e4083a02adfddd7d82534751a3
> Author: Marcin Juszkiewicz <hrw@openembedded.org>
> Date:   Thu Nov 13 18:07:47 2008 +0100
> 
>     checksums.ini: add 1212 entries from test fetch build
> 
>     This is result of simple shell script and few hours of fetching:
>     for recipe in $OEROOT/packages/*/*.bb
>     do
>       bitbake -b $recipe -cfetch
>     done
> 
> This was done with not so empty DL_DIR but most of entries were fresh 
> fetched. If someone has machine with good network connection (I no 
> longer have access to machine where I was running that test) then feel 
> free to call that loop with empty DL_DIR.

IOW, no.  We're just using checksums.ini as a "at one point, it was ..."
and not actually making sure that it's the right checksum.

-- 
Tom Rini


