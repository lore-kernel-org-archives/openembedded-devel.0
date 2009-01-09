Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LLMI0-0006bZ-5C
	for openembedded-devel@openembedded.org; Fri, 09 Jan 2009 19:41:00 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090109183442.ZPJI8485.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 9 Jan 2009 13:34:43 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id 1Wah1b00H1E665w04WahYL; Fri, 09 Jan 2009 13:34:43 -0500
X-Authority-Analysis: v=1.0 c=1 a=apU7BvleTLQOQm5HJ9sA:9
	a=tEaUyrp6PtT_xlgliOx_OPmCIf4A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 9 Jan 2009 11:35:13 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090109183512.GK400@smtp.west.cox.net>
References: <20090109155223.GF400@smtp.west.cox.net>
	<gk7tkl$p1o$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gk7tkl$p1o$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Blackfin support
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
X-List-Received-Date: Fri, 09 Jan 2009 18:41:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 09, 2009 at 05:22:43PM +0100, Koen Kooi wrote:
> On 09-01-09 16:52, Tom Rini wrote:
>> Hey all.  Has anyone built any of the blackfin boards recently?  I'm
>> finding things like uClibc 0.9.29+ require -mfdpic which isn't in our
>> gcc 4.1.x, is in gcc 4.2.x (but requires a patch to define __FDPIC__
>> rather than __BFIN_FDPIC__) and other issues still.  Just seeing if
>> anyone else has these things working before I start getting down and
>> dirty.  Thanks!
>
> I keep starting anew with blackfin support due to the current problems:
>
> * ADI uses their own 'distro', the rest of the world a custom buildroot
> * You need to get gcc from blackfin SVN to get something to compile
> * you need to choose either uclibc from blackfin svn or upstream uclibc

Oh joy of joys.  Would it be a problem to import the ADI magic versions
of thing (and SRC_URI_append_bfin) ?

-- 
Tom Rini


