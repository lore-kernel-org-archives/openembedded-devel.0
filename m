Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Ll3YS-00048J-Ec
	for openembedded-devel@openembedded.org; Sat, 21 Mar 2009 16:56:12 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090321155500.DRBW27308.fed1rmmtao101.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 21 Mar 2009 11:55:00 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id Vruz1b0074dMFYL03ruzMA; Sat, 21 Mar 2009 11:54:59 -0400
X-Authority-Analysis: v=1.0 c=1 a=E7u09eCIMb8A:10 a=1t2Z4OKylgoA:10
	a=xQg4TLlEX-8usgI_k1AA:9 a=xIqWomdXNaOkY6RoBGDc0rIdUhMA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 21 Mar 2009 08:54:59 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090321155458.GJ14278@smtp.west.cox.net>
References: <1237645284.7417.6.camel@think-laptop>
MIME-Version: 1.0
In-Reply-To: <1237645284.7417.6.camel@think-laptop>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: i686 meta-toolchain on x86_64 for arm target
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
X-List-Received-Date: Sat, 21 Mar 2009 15:56:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Mar 21, 2009 at 08:21:24AM -0600, Angus Ainslie wrote:

> I have a x86_64 host that I've successfully generated a meta-toolchain
> for a om-gta02 machine. 
> 
> On that same buildhost can I generate an i686 version of the toolchain ?

Most easily with 'linux32' and an i686 chroot.  You should, however, be
able to use the canadian-sdk target to do this as well, but it's not yet
been tested.

-- 
Tom Rini


