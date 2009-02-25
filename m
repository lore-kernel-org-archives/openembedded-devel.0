Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LcRSw-00051i-GL
	for openembedded-devel@openembedded.org; Wed, 25 Feb 2009 22:38:54 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090225213538.CJIQ13097.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 25 Feb 2009 16:35:38 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id LMbc1b00S4dMFYL03MbcuL; Wed, 25 Feb 2009 16:35:39 -0500
X-Authority-Analysis: v=1.0 c=1 a=Q4-j1AaZAAAA:8 a=22pK5S-mAAAA:8
	a=fwczLco4d1agzBYopBUA:9 a=_Upx03UvB7obr1woztMA:7
	a=-qKpPbAjlHH6XQEKRyIRIyNKf3IA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 25 Feb 2009 14:35:36 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090225213536.GT2172@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
	<20090224064639.GE2172@smtp.west.cox.net>
	<1235492001.27962.60.camel@andromeda>
	<8763izyarp.fsf@neumann.lab.ossystems.com.br>
	<fce2a370902241036y359e2c7cv1126a62c8627d2bb@mail.gmail.com>
	<20090224185059.GL2172@smtp.west.cox.net>
	<87wsbfw9zy.fsf@neumann.lab.ossystems.com.br>
	<20090225022507.GP2172@smtp.west.cox.net>
	<go4d36$khh$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <go4d36$khh$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 25 Feb 2009 21:38:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 25, 2009 at 09:27:02PM +0000, Vitus Jensen wrote:
> Am Tue, 24 Feb 2009 19:25:07 -0700 schrieb Tom Rini:
> 
> > On Tue, Feb 24, 2009 at 11:01:05PM -0300, Otavio Salvador wrote: [snip]
> >> I do belive that the best way to solve it is to have a md5 file
> >> together with the .bb recipe. This solves the problems for forks,
> >> derivatives and also makes harder to just use "cat tmp/checksums.ini >>
> >> conf/checksums.ini".
> > 
> > Running a script that will make the .sum file isn't any harder really.
> > And it's still a "this is the checksum we downloaded" not "this is the
> > checksum upstream says is correct".
> ...
> 
> But "this is the checksum we downloaded" says that's it's the same 
> version the author of the .bb receipe downloaded, reviewed and tested on 
> his device.  What is the probability that this author downloaded a 
> corrupt but working archive last november and you get the same corrupt 
> archive now?

See hrw's post earlier where he points out how many checksums are a
simple fetch and add? :)

> If you want better security you have to ask the download source for a GPG 
> signature of his files or the like as MD5 isn't really safe.

This is one of my points.  People think we have security from our
current checksum list, but we do not.

> 
> Bye,
>    Vitus
> 
> -- 
> Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
Tom Rini


