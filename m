Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 564C065E4C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 14:27:46 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N44001BXO5N0R50@vms173023.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	16 Apr 2014 09:27:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9E8BB201C0; Wed,
	16 Apr 2014 10:27:23 -0400 (EDT)
Date: Wed, 16 Apr 2014 10:27:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20140416142722.GJ11339@denix.org>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
	<534E7151.5030504@balister.org>
	<CALYKT1gmOJES7rY0OZjEcUNM6zr0E8YtgHRxDOmNF1u3WWYK7g@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALYKT1gmOJES7rY0OZjEcUNM6zr0E8YtgHRxDOmNF1u3WWYK7g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Apr 2014 14:27:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

I don't know what "OE for MSM" is, that you keep referring, probably your 
company's product based on OE. OE stands for OpenEmbedded and is the 
underlying technology for the Yocto Project and other things around it...

I would recommend you to talk to someone from your company who's more familiar 
with the code base that you are trying to look at and how it is derived and/or 
relates to OpenEmbedded and the Yocto Project.

-- 
Denys


On Wed, Apr 16, 2014 at 09:37:49PM +0900, Journeyer J. Joh wrote:
> Hi, Samuel Stirtzel, Khem Raj and Philip Balister,
> 
> Thank you for the kind answers!!
> 
> I understood what are those.
> 
> > - What is the relationship between those two? Any differences? Commons?
> OE for MSM is one instance of Yocto Project - OE-core. And It's like Poky -
> An reference instance of Yocto Project.
> 
> > - Can I refer to the documents about poky for my openembedded-core?
> I think I can refer to the poky's documentations but must make sure that
> poky and OE for MSM are siblings from the same framework - Yocto Prooject -
> OE-core
> 
> Thank you very much for the kindness!!
> 
> Sincerely
> Journeyer
> 
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
> 
> 
> 2014-04-16 21:02 GMT+09:00 Philip Balister <philip@balister.org>:
> 
> > On 04/16/2014 02:49 AM, Journeyer J. Joh wrote:
> > > Hello,
> > >
> > > First of all I thank Nicolas Dechesne and Brian Hutchinson, for the
> > > previous kind replies.
> > >
> > > While I was reading documents from Yocto Project, I found my source code
> > in
> > > use in my company is of Open Embedded for MSM.
> > >
> > > I found this from the git remote url of my surce code. It is
> > >   git://codeaurora.org/quic/le/openembedded/openembedded-core
> > >
> > > And the one of Yocto project is
> > >   git://git.yoctoproject.org/poky
> > >
> > >>From the git log prints poky is actively developped now but
> > > openembedded-core is not.
> > >
> > > In a nutshell(I learned this expression today^^),
> > > - What is the relationship between those two? Any differences? Commons?
> > > - Can I refer to the documents about poky for my openembedded-core?
> >
> > OpenEmbedded is the build system and has been actively developed since
> > 2004 or so (give or take a few years)
> >
> > Poky is the reference distribution from the Yocto Project.
> >
> > The Yocto Project is working to make embedded development easier.
> >
> > You should check the OpenEmbedded git server for activity;
> >
> > http://cgit.openembedded.org/openembedded-core/
> >
> > I'm guessing (without looking) the codeaurora git is based of a release
> > bench.
> >
> > Philip
> >
> > >
> > > Thank you very much in advance.
> > >
> > > Sincerely
> > > Journeyer
> > >
> > > ----------------------------------------
> > > Journeyer J. Joh
> > > o o s a p r o g r a m m e r
> > > a t
> > > g m a i l  d o t  c o m
> > > ----------------------------------------
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

