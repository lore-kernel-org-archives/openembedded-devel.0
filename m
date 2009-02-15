Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LYoKi-0005sv-AH
	for openembedded-devel@openembedded.org; Sun, 15 Feb 2009 22:15:24 +0100
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20090215211330.MIXS8485.fed1rmmtao105.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sun, 15 Feb 2009 16:13:30 -0500
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id GMDX1b0011E665w04MDXdn; Sun, 15 Feb 2009 16:13:31 -0500
X-Authority-Analysis: v=1.0 c=1 a=VwQbUJbxAAAA:8 a=Cu6ceZRdmSXQdME2P8wA:9
	a=Nj1LDStfLhDGsLLpewavIqds2BMA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Sun, 15 Feb 2009 14:13:30 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090215211330.GB11815@smtp.west.cox.net>
References: <200902140035.13820.khimov@altell.ru>
	<200902140730.32782.openembedded@haerwu.biz>
	<200902141715.56797.khimov@altell.ru>
	<87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Sun, 15 Feb 2009 21:15:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 15, 2009 at 03:23:25PM -0300, Otavio Salvador wrote:
> Roman I Khimov <khimov@altell.ru> writes:
> 
> > Marcin Juszkiewicz:
> >> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
> >> > diff --git a/packages/siproxd/siproxd.inc
> >> >
> >> > +RDEPENDS = "libosip2"
> >> >
> >> > diff --git a/packages/siproxd/siproxd_0.7.1.bb
> >> >
> >> > +PR = "r0"
> >>
> >> Drop those two lines. You should not add libs to RDEPENDS (OE takes care
> >> of it) and "r0" is default PR value.
> >
> > OK.
> 
> It would be quite nice if you could send a git exported patch since it
> makes the life eaiser for anyone going to apply your commit (locally or
> for pushing it) and also keeps the credit for you.
> 
> If you doesn't know to do that, some guidance can be find at:
> 
> http://www.kernel.org/pub/software/scm/git/docs/git-format-patch.html

Maybe getting a little OT, but now that we're starting to use patchwork,
maybe some comments to GitPhraseBook on how people should be using
git format-patch for OE?

-- 
Tom Rini


