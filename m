Received: from [68.230.241.44] (helo=fed1rmmtao102.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Kf1Y7-0007Ri-Bq
	for openembedded-devel@openembedded.org; Mon, 15 Sep 2008 02:02:39 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao102.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20080914235942.OLRI6684.fed1rmmtao102.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 14 Sep 2008 19:59:42 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo02.cox.net with bizsmtp
	id Enze1a00c1E665w04nzfho; Sun, 14 Sep 2008 19:59:41 -0400
X-Authority-Analysis: v=1.0 c=1 a=rCeM5v77lmsA:10 a=OZgQiQfKk9MA:10
	a=b2ZvGRdsAAAA:8 a=LWtVJ2XzvaYoyJCM4l4A:9 a=PpxUCtxiL5S7z0G0V1sA:7
	a=U2R0ukHFqxJnYLnQ_LoO-sDcaeoA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 14 Sep 2008 16:59:38 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: OpenEmbedded Devel List <openembedded-devel@openembedded.org>
Message-ID: <20080914235938.GH29676@smtp.west.cox.net>
References: <20080912160657.GE29676@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20080912160657.GE29676@smtp.west.cox.net>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [Bug 4549] A number of xorg dev packages are uninstallable
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
X-List-Received-Date: Mon, 15 Sep 2008 00:02:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 12, 2008 at 09:06:57AM -0700, Tom Rini wrote:

> [ This is all also available at
> http://bugs.openembedded.net/show_bug.cgi?id=4549 ]
> 
> A number of xorg dev packages (both literally -dev and util-macros) are
> uninstallable on the target.  The problem is that by default (with ipk)
> any given -dev package will depend on the main package, for example
> xproto-dev depends on xproto.  But in these packages case, there is no
> main package (no xproto).  The following patch fixes the issue.
> 
> This is important in the case of SDK users.

So, there's three ways to fix this:
- Fix these recipes to have RDEPENDS_${PN}-dev = ""
- Fix these recipes to build empty main packages.
- Fix package.bbclass to do the 1st option, automatically (not put the
  dependency in to start with).

How do we get going ahead with one of these?  I could take a stab at the
3rd option, with some hints.

-- 
Tom Rini


