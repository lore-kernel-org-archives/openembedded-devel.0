Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LetCy-0004qJ-1W
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 16:40:32 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304153617.QLJB13097.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Mar 2009 10:36:17 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id P3cH1b0044dMFYL043cHiZ; Wed, 04 Mar 2009 10:36:17 -0500
X-Authority-Analysis: v=1.0 c=1 a=af50XY3WUk0A:10 a=xz7DMSkBCQEA:10
	a=QIkhV5f_XBPuennm-rkA:9 a=ORgBk2AaCqmsbk0Qp0tIANnGmjkA:4
	a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 08:36:17 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304153617.GQ26343@smtp.west.cox.net>
References: <1236178350.4249.5.camel@debian.dorg.org>
MIME-Version: 1.0
In-Reply-To: <1236178350.4249.5.camel@debian.dorg.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Compile OE on Sun Ultrasparc 64 architecture?
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
X-List-Received-Date: Wed, 04 Mar 2009 15:40:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 03:52:30PM +0100, harald wrote:

> Hello,
> 
> tried to compile OE on my Sun Ultrasparc 64 machine running on debian
> lenny. 
> Compilation fails, package qemu-native fails to compile with an error in
> zlib. please see build logs, machine h4000, user ba0547.

You might want to disable binary locale generation on the host and see
what else falls down.  ENABLE_BINARY_LOCALE_GENERATION = 0 in your
local.conf

-- 
Tom Rini


