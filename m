Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LZT84-0002vR-4l
	for openembedded-devel@openembedded.org; Tue, 17 Feb 2009 17:49:08 +0100
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090217164656.DQJX2948.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Tue, 17 Feb 2009 11:46:56 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id H4mu1b00V1E665w044muMY; Tue, 17 Feb 2009 11:46:55 -0500
X-Authority-Analysis: v=1.0 c=1 a=J7mLSMcJmIkA:10 a=flml13BasB4A:10
	a=-xjcMFyCVCy24mt1WJEA:9 a=SoHxOmOu4T5jUzwn0S0A:7
	a=ghZDY3EXA4mvLMHxwvuJwObdqDgA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Tue, 17 Feb 2009 09:46:54 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090217164654.GG11815@smtp.west.cox.net>
References: <1234884987-18223-1-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1234884987-18223-1-git-send-email-khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] busybox-1.13.2: fix parallel build failing on	appletlib
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
X-List-Received-Date: Tue, 17 Feb 2009 16:49:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2009 at 06:36:27PM +0300, Roman I Khimov wrote:

> libbb/appletlib.o depends on generated headers, build can fail with
> 
> libbb/appletlib.c:53:27: error: applet_tables.h: No such file or directory
> 
> if that dependency is not taken into account

I'm going to apply this shortly, along with seeing how far back it
applies as I've hit this error for a long time.

-- 
Tom Rini


