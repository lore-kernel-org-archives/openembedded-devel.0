Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LONuP-0006Vc-9K
	for openembedded-devel@openembedded.org; Sun, 18 Jan 2009 04:01:09 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090118025415.LLCR2342.fed1rmmtao102.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 17 Jan 2009 21:54:15 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id 4quD1b00G1E665w04quDGz; Sat, 17 Jan 2009 21:54:16 -0500
X-Authority-Analysis: v=1.0 c=1 a=ajOfDFksIysA:10 a=Uk3zMMqMCUQA:10
	a=mNIh1PUbOxkuTBsERZ8A:9 a=E_FLG01zL7JuAaRJEBfOIe3enQ8A:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sat, 17 Jan 2009 19:54:13 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090118025413.GU6710@smtp.west.cox.net>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 07/14] kexecboot: use custom device table with mmc	and event0
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
X-List-Received-Date: Sun, 18 Jan 2009 03:01:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 18, 2009 at 03:24:27AM +0100, Andrea Adami wrote:

> - revert 98e9985edab2eb072795a443e6d193fac7c048eb
> - revert 5c1a421f73d9688341ace9c4dd4db59c3ef4b988
> - add mmc devices mmcblk0p4 - mmcblk0p10
> - fix 'cannot boot from logical partitions on SD'

As a general thing, I have some problems with what we throw into the
static dev and think we need to get things sorted out "better" for the
various cases.  That said, can you please confirm that the nodes being
removed from -minimal.txt were put there explicitly for the kexecboot
case?

-- 
Tom Rini


