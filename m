Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1L6W0Z-0004IT-BT
	for openembedded-devel@openembedded.org; Sat, 29 Nov 2008 21:01:39 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20081129195823.WSNY23516.fed1rmmtao102.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 29 Nov 2008 14:58:23 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo01.cox.net with bizsmtp
	id l7yL1a00H1E665w037yL9y; Sat, 29 Nov 2008 14:58:23 -0500
X-Authority-Analysis: v=1.0 c=1 a=r7o_OpycDEEA:10 a=0FpxSxkeKBAA:10
	a=oB1BIEN3iRBY21r8i-0A:9 a=jWifAjJ9zyHAIV9pH09a5RSgG34A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 29 Nov 2008 12:58:27 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081129195826.GT27432@smtp.west.cox.net>
References: <c384c5ea0811291149s5c02d3c8haad5995ce1ad1522@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <c384c5ea0811291149s5c02d3c8haad5995ce1ad1522@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Building u-boot images in both kernel.bbclass:do_deploy()	and linux.inc:do_compile_append()
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
X-List-Received-Date: Sat, 29 Nov 2008 20:01:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 29, 2008 at 08:49:37PM +0100, Leon Woestenberg wrote:

> Building u-boot images using mkimage is present in both
> kernel.bbclass:do_deploy() as well as in
> linux.inc:do_compile_append().
> 
> Which one has preference in the long run, and why?

Um, why are either doing it when you can get it from
KERNEL_IMAGETYPE=uImage, at least on 2.6.  2.4 might depend on the
arch in question.

-- 
Tom Rini


