Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LevBE-00080G-U8
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 18:46:53 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304174238.NZJF15318.fed1rmmtao105.cox.net@fed1rmimpo02.cox.net>;
	Wed, 4 Mar 2009 12:42:38 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id P5ib1b0094dMFYL045ibPW; Wed, 04 Mar 2009 12:42:37 -0500
X-Authority-Analysis: v=1.0 c=1 a=AYkYuw04ExYA:10 a=YCkBchfvqYgA:10
	a=Js0LpgGrAAAA:8 a=b_OEaAMLAAAA:8 a=TVNzOE90O2ceT0RJq0IA:9
	a=2LsMjO5Nx5MEOBSpHTl97Ugy0boA:4 a=LY0hPdMaydYA:10 a=_qZRxRWV73kA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 10:42:35 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304174234.GS26343@smtp.west.cox.net>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-34-git-send-email-openembedded@haerwu.biz>
MIME-Version: 1.0
In-Reply-To: <1236182004-4523-34-git-send-email-openembedded@haerwu.biz>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Richard Purdie <richard@openedhand.com>
Subject: Re: [PATCH 33/70] Add rootfs_rpm.bbclass, a start at image	generation from rpms. Its not expected to be entirely functional	yet. (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 17:46:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 04:52:48PM +0100, Marcin Juszkiewicz wrote:

> From: Richard Purdie <richard@openedhand.com>
> 
> git-svn-id: https://svn.o-hand.com/repos/poky@5101 311d38ba-8fff-0310-9ca6-ca027cbcb966
> ---
>  classes/rootfs_rpm.bbclass |  148 ++++++++++++++++++++++++++++++++++++++++++++

There's a 'poky' references here that should either be dropped or made
into ${DISTRO}:

[snip]
> +[poky-feed]
> +name = Poky RPM Feed

-- 
Tom Rini


