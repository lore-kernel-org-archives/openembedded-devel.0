Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LIVuC-0002OD-Tx
	for openembedded-devel@openembedded.org; Thu, 01 Jan 2009 23:20:45 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090101221459.XHDC8485.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Thu, 1 Jan 2009 17:14:59 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id yNEy1a00J1E665w03NEytK; Thu, 01 Jan 2009 17:14:58 -0500
X-Authority-Analysis: v=1.0 c=1 a=LLvST7gcIdsA:10 a=0G8rmy93P40A:10
	a=ha1EZUEiTR7tGLq7f9kA:9 a=DhfcjOVEPLYi6UR-NPoA:7
	a=x5f3d0S5_rcwzfSnkzGfhANM0P8A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 1 Jan 2009 15:15:25 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090101221525.GI7040@smtp.west.cox.net>
References: <1230827114.5320.42.camel@dax.rpnet.com>
MIME-Version: 1.0
In-Reply-To: <1230827114.5320.42.camel@dax.rpnet.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: RFC: "Virtual" native and sdk recipes
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
X-List-Received-Date: Thu, 01 Jan 2009 22:20:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 01, 2009 at 04:25:14PM +0000, Richard Purdie wrote:

[snip]
> Proposal Step B:
> 
> To add a new variable which is a list of classes to additionally parse
> after parsing the 'base' recipe. In the above example, foo-native-1.0.bb
> would be removed and we'd instead have:

I think the canadian SDK stuff should fit into this scheme as well.
There's a few very trivial packages (mpfr, gmp) and most of the rest of
the magic ends up being in canadian-sdk.bbclass.

-- 
Tom Rini


