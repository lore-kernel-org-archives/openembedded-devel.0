Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1LxnBO-0004yi-NH
	for openembedded-devel@openembedded.org; Sat, 25 Apr 2009 21:05:03 +0200
Received: (qmail 7764 invoked from network); 25 Apr 2009 19:00:10 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by  with SMTP; 25 Apr 2009 12:00:10 -0700
Date: Sat, 25 Apr 2009 12:00:09 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090425190009.GI15489@smtp.west.cox.net>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251304.17624.mickey@vanille-media.de>
	<49F310E0.6030909@balister.org>
	<200904251540.40566.mickey@vanille-media.de>
	<be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
	<20090425182756.GH15489@smtp.west.cox.net>
	<be7a9f3d0904251151n6d733c7ds10ed3f2b43a1c8ab@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <be7a9f3d0904251151n6d733c7ds10ed3f2b43a1c8ab@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the	new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 19:05:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Apr 25, 2009 at 03:51:21PM -0300, Otavio Salvador wrote:
> Hello Tom,
> 
> On Sat, Apr 25, 2009 at 3:27 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> > If I can sum up what it sounds like mickey is saying, he fixed some
> > issues that Koen didn't yet (and thus are back now that his changes are
> > committed).  So is .dev where we need to freak out and revert things
> > that do fix some issue but open another?
> 
> Obviously not BUT we need to consider the effects of each change.
> 
> Having problems with RRECOMMENDS and like are surely less boring to
> break a whole upgrade path. I do believe that the fixes need to be
> bringed back but we should really see if we can get the upgrade path
> sorted out. If it shows to be rather difficult to get it done so
> believe that this needs to be automated in some way (like providing a
> script that removes the old packages and install the equivalent new
> ones or like).
> 
> I also don't think that if a patch has broken a thing we ought to go
> and fix it. The first thing to do is to revert it and keep things
> going while the issue is solved, preferrable in a branch.

OK.  Shall we move the GNU_HASH QA error being fatal over to a branch
until Khem is happy with the changes required to make gcc package again
then?  All of the meta target are quite broken (and I still need some
ack's on my change to insane.bbclass to fix the devdbg check for sdk
packages too).

-- 
Tom Rini


