Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1KnTaR-0003U6-EW
	for openembedded-devel@openembedded.org; Wed, 08 Oct 2008 09:35:59 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP
	id <20081008073118.XQBO6175.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 8 Oct 2008 03:31:18 -0400
Received: from localhost ([68.230.61.57]) by fed1rmimpo03.cox.net with bizsmtp
	id Q7XK1a00F1E665w047XKi8; Wed, 08 Oct 2008 03:31:20 -0400
X-Authority-Analysis: v=1.0 c=1 a=dYWHU-MwCFke1KCWy5kA:9
	a=aSbNgCJLC6WlOhGkffQviluVQXwA:4 a=toL_iAlXHfkA:10 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 8 Oct 2008 00:31:19 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20081008073119.GK14282@smtp.west.cox.net>
References: <200810080751.15817.zecke@selfish.org>
	<19c1b8a90810080010t7b21de2eh376a8693b64053a2@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90810080010t7b21de2eh376a8693b64053a2@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Wed, 08 Oct 2008 07:36:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 08, 2008 at 12:10:55AM -0700, Khem Raj wrote:
> On Tue, Oct 7, 2008 at 10:51 PM, Holger Freyther <zecke@selfish.org> wrote:
> > Hey,
> >
> > we would like to switch to git by next wednesday. Jan Lübbe went through the
> > hassle to fix two issues in my mtn2git.py and we are happy with the metadata
> > and can even unite it with the data exported from bitkeeper.
> >
> > The plans would be:
> >        - Send your public ssh keys if you have not done so
> >
> > Tuesday:
> >        - Set monotone readonly 16h german time
> >        - merge the multiple heads (if they exist)
> >        - Try to add the revs from now to tuesday to git
> >
> > Wednesday:
> >        - Be back up with git and use that as primary system.
> >        - Disable monotone completely
> >
> >
> > Things to note:
> >        The history will be different from the trial. You will need to
> > git-rebase --from trial-head --to official-head or just git-reset to get to
> > the official head.
> >
> > Thanks to Jan for wrestling with monotone, git, the script and the data and we
> > will keep you informed about how the migration is going.
> >
> > comments
> 
> Great job!!

Indeed!

> if we are ready then dont wait till next week. We can use this time to
> stabilize on git.

Think of now until read-only as a last call for "push your outstanding
changes already" :)

... looking forward to seeing if moving to git makes getting patches in
any easier.

-- 
Tom Rini


