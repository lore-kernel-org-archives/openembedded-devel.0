Received: from [68.230.241.39] (helo=fed1rmmtao107.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LlXh3-0000Mm-Pb
	for openembedded-devel@openembedded.org; Mon, 23 Mar 2009 01:07:06 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao107.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090323000544.GLEB10385.fed1rmmtao107.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 22 Mar 2009 20:05:44 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id WQ5i1b00B4dMFYL04Q5iAq; Sun, 22 Mar 2009 20:05:44 -0400
X-Authority-Analysis: v=1.0 c=1 a=PBL4Yze-TnsA:10 a=FkxXT6p2H6oA:10
	a=9tHQh3dixEq_OuM3fNQA:9 a=LS5mtgMDKUmgIuth139Aj7pKBHwA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 22 Mar 2009 17:05:42 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090323000542.GL14278@smtp.west.cox.net>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>
	<20090322172416.GA16899@denix.org>
	<d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
	<d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Mon, 23 Mar 2009 00:07:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2009 at 12:30:10AM +0100, Andrea Adami wrote:
> Wait a moment:
> 
> if we weak-assign DEPLOY_DIR in angstrom.inc
> DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROMLIBC}"
> 
> then it takes the value from bitbake.conf?
> DEPLOY_DIR ?= "${TMPDIR}/deploy"

Sounds like Angstrom needs:
USER_DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROMLIBC}"
DEPLOY_DIR = "${USER_DEPLOY_DIR}" if users are going to further override
what the distro thinks is best.

-- 
Tom Rini


