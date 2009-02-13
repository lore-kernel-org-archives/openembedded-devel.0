Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LY1Ze-0008Bu-6C
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 18:11:34 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090213171000.PQWI131.fed1rmmtao107.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 12:10:00 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id FVA01b0031E665w04VA0CU; Fri, 13 Feb 2009 12:10:00 -0500
X-Authority-Analysis: v=1.0 c=1 a=8jbNM3j2dy7V8XXtv9oA:9
	a=pDTdzF5B1P9LBnq-MsheBNcfnW4A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Fri, 13 Feb 2009 10:09:59 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090213170959.GW11815@smtp.west.cox.net>
References: <200902131728.08634.openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <200902131728.08634.openembedded@haerwu.biz>
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
X-List-Received-Date: Fri, 13 Feb 2009 17:11:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 13, 2009 at 05:28:08PM +0100, Marcin Juszkiewicz wrote:
> 
> Hi
> 
> It is nearly two years since conf/checksums.ini was introduced. We 
> populated it with over 6000 entries during that time (mostly by 
> automatic fetching of all source on CELF and EWI machines). But there 
> are problems with it's format.
> 
> First problem is how to use it when overlays are used. Not every entry 
> of SRC_URI can be provided into public (NDA binaries etc) so people 
> starts to switch off checking of checksums which is not good idea. OE 
> reads only one copy of file. OK, such users can copy it to their overlay 
> and extend with own entries which will work with properly created value 
> of BBPATH variable. But this does not sound as solution.

People with overlays already need to setup BBPATH correctly, so I don't
think this part is an issue.

[snip]
> Other was to use filename as key and add "url[0-xx]" fields which will 
> list alternative locations. This one looks better but still does not 
> solve situation when someone use DEBIAN_MIRROR which is not present in 
> checksums.ini file.

Could we perhaps have a literal:
['${DEBIAN_MIRROR}/...']
md5sum:...
sha256:...

format instead?

-- 
Tom Rini


