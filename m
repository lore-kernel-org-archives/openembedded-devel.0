Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OaaQb-0000nF-O4
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 22:25:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6IKPR83020056;
	Sun, 18 Jul 2010 21:25:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19464-10; Sun, 18 Jul 2010 21:25:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o6IKPIxq020041
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 18 Jul 2010 21:25:18 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Detlef Vollmann <dv@vollmann.ch>
In-Reply-To: <4C4354EF.1080004@vollmann.ch>
References: <1279290319.10837.1747.camel@rex> <4C42D208.2000909@vollmann.ch>
	<AANLkTimGdT8mVtOVYiPZfeGhRvt02DyUiiKEtITzuyQT@mail.gmail.com>
	<4C43255B.3000601@vollmann.ch>
	<AANLkTilan1WpQ8ygbi4Dg3HLgRwyggP66X_-xlT1VB5r@mail.gmail.com>
	<4C4354EF.1080004@vollmann.ch>
Date: Sun, 18 Jul 2010 21:25:16 +0100
Message-ID: <1279484716.10837.2467.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] A new bitbake extension: .bbappend files
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
X-List-Received-Date: Sun, 18 Jul 2010 20:25:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2010-07-18 at 21:24 +0200, Detlef Vollmann wrote:
> On 07/18/10 18:06, Chris Larson wrote:
> > On Sun, Jul 18, 2010 at 9:01 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> > 
> >> On 07/18/10 17:13, Chris Larson wrote:
> >>
> >>> On Sun, Jul 18, 2010 at 3:06 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> >>>
> >>>  On 07/16/10 16:25, Richard Purdie wrote:
> >>>>  For the specific case of paths, I have wondered if there would be a way
> >>>>> to leverage help from bitbake in creating a sane set of search paths but
> >>>>> I'm still thinking about that. This extension is good enough in its own
> >>>>> right in my opinion to be worthwhile.
> >>>>>
> >>>>>  This might be true, but solving the general path problem would be
> >>>> much more useful.
> >>>> If you want to add a new version of e.g. gcc in your ovlerlay,
> >>>> you have to pull over the whole gcc directory with all its .inc classes.
> >>>> This can't be solved by .bbapend, or am I missing something?
> >>>>
> >>>
> >>> You can handle that today by adding to FILESPATHBASE.  All file:// files
> >>> from SRC_URI are located using FILESPATH, which is constructed from
> >>> FILESPATHBASE, FILESPATHPKG, and OVERRIDES.
> >>>
> >> AFAIK this doen't work for include/require :-(
> > 
> > 
> > Don't copy the recipe at all, use .bbappend instead, and you won't need to
> > have the .inc in a different collection from the recipe itself.
> In that case I didn't understand .bbappend.
> If I have a recipe gcc_4.3.2.bb in e.g. oe-stable/recipes/gcc, but in
> that directory is no gcc_4.4.4.bb,  and I put gcc_4.4.4.bbappend into
> myproject/recipes/gcc, that would probably given an error like
> 'no .bb file to append'.
> At least that's how I understood .bbappend.
> 
> > Alternatively, you can adjust BBPATH to also include the other collection
> > based paths + os.path.dirname('${FILE_DIRNAME}') or so.
> I'd be very interested to find a way so that a 'require gcc.inc' in
> myproject/recipes/gcc_4.4.4.bb would find oe-stable/recipes/gcc/gcc.inc.
> So far I failed.

Does something like "require recipes/gcc/gcc.inc" not just work already
as it will search BBPATH...

Cheers,

Richard






