Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LoU4i-00081q-Ka
	for openembedded-devel@openembedded.org; Tue, 31 Mar 2009 04:51:41 +0200
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090331024928.EPPT10385.fed1rmmtao107.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 22:49:28 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id ZepR1b00E4dMFYL03epR19; Mon, 30 Mar 2009 22:49:28 -0400
X-Authority-Analysis: v=1.0 c=1 a=I0l-3axpi8cA:10 a=W2UYVCv3iGAA:10
	a=cdIBcQxmch8PBfQryu8A:9 a=X6Q4kGzd-wGc1XjOrIqV6A4ZjtMA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 30 Mar 2009 19:49:25 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090331024925.GJ14278@smtp.west.cox.net>
References: <49D17F70.8020109@dls.net>
MIME-Version: 1.0
In-Reply-To: <49D17F70.8020109@dls.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] make preferred openssl version match for -native	recipe
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
X-List-Received-Date: Tue, 31 Mar 2009 02:51:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 30, 2009 at 09:26:56PM -0500, Mike (mwester) wrote:
> I'd like to propose that we remove the "DEFAULT_PREFERENCE = "-1"" line
> from openssl-native_0.9.8j.bb.
> 
> This is causing a problem in select cases (for example, python-native
> fails "import md5"), because we build and stage openssl 0.9.8j, but the
> corresponding -native that gets built and staged is openssl 0.9.7g.
> 
> The 0.9.8j version is currently selected as the PREFERRED_VERSION in the
> preferred-om-2008-versions.inc file, as well as for SlugOS.  I've
> successfully built it on both 32 and 64 bit hosts.
> 
> Unless there are objections, I'll commit a fix in a couple of days.

Perhaps we should also make sure anyplace that defines a preferred
provide for one sets the same version for the other (with an appropriate
poke to the maintainer) ?

-- 
Tom Rini


