Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LV9Wh-0003PD-Rh
	for openembedded-devel@openembedded.org; Thu, 05 Feb 2009 20:04:44 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090205190414.SIDB12540.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>;
	Thu, 5 Feb 2009 14:04:14 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id CK4C1b00E1E665w03K4CF9; Thu, 05 Feb 2009 14:04:14 -0500
X-Authority-Analysis: v=1.0 c=1 a=HiWkEfo4AAAA:8 a=HTB4ooLmk-lITSnqEzgA:9
	a=tuVlGBzBfUBEH61bQ32x0Mk0IV8A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Thu, 5 Feb 2009 12:04:12 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090205190412.GS3856@smtp.west.cox.net>
References: <200902051836.25770.roman@khimov.ru>
	<200902052118.26879.roman@khimov.ru>
	<200902052142.50027.roman@khimov.ru>
	<200902052150.04203.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <200902052150.04203.roman@khimov.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] New package: byacc
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
X-List-Received-Date: Thu, 05 Feb 2009 19:04:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 05, 2009 at 09:50:04PM +0300, Roman I Khimov wrote:
> Roman I Khimov:
> > OK, will fix.
> 
> Updated one:

Perhaps a byacc.inc with most of what's in byacc_20081225.bb?

> +SRC_URI = "ftp://invisible-island.net/byacc/byacc-20081225.tgz"

then ${PN}-${PV}

> --- a/packages/byacc/byacc-native_20081225.bb	1970-01-01 03:00:00.000000000 +0300
> +++ b/packages/byacc/byacc-native_20081225.bb	2009-02-03 15:36:55.981948513 +0300
> @@ -0,0 +1,4 @@
> +SECTION = "devel"

Already set in the main one, btw.

-- 
Tom Rini


