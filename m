Received: from [68.230.241.40] (helo=fed1rmmtao106.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LeJqZ-0003uj-DQ
	for openembedded-devel@openembedded.org; Tue, 03 Mar 2009 02:55:03 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090303015103.MBVK22254.fed1rmmtao106.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Mon, 2 Mar 2009 20:51:03 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id NRr21b0094dMFYL03Rr26f; Mon, 02 Mar 2009 20:51:02 -0500
X-Authority-Analysis: v=1.0 c=1 a=85LXE5cmSUYA:10 a=CN5fEjPCIr0A:10
	a=h8Kh432jOsXbWBHWUYkA:9 a=2Dh1KQFeb_t3vuynUdwA:7
	a=GL33DEnxCnEMJp841AVu9Mv_yq8A:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Mon, 2 Mar 2009 18:51:02 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090303015101.GJ26343@smtp.west.cox.net>
References: <ac9c93b10903021148v423481c1v4c9a39ba762a984a@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <ac9c93b10903021148v423481c1v4c9a39ba762a984a@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: improved/extended bitbake -c clean ?
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
X-List-Received-Date: Tue, 03 Mar 2009 01:55:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2009 at 08:48:21PM +0100, Frans Meulenbroeks wrote:
> Hi,
> 
> Not sure if others have the same problem, but sometimes I have the
> need to edit in the work dir of a package. Especially if a package
> does not function as expected or does not build this can be handy.
> Typically what I then do is remove all stamps from compile onwards.
> 
> However, it would be convenient if there is a way to tell to bitbake
> to remove e.g. the stamp for a step and all later stamps.
> E.g. something like bitbake -c clean:compile

bitbake -f -c compile pkg && bitbake pkg should do what you're wanting.

-- 
Tom Rini


