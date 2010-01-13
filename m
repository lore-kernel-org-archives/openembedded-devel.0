Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NV4MJ-00066V-Mr
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 15:38:10 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NV4KD-0003n7-2o for openembedded-devel@lists.openembedded.org;
	Wed, 13 Jan 2010 09:35:57 -0500
Date: Wed, 13 Jan 2010 09:35:04 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hiklbj$uu2$1@ger.gmane.org>
Message-ID: <alpine.LFD.2.00.1001130933170.27297@localhost>
References: <alpine.LFD.2.00.1001130657110.487@localhost>
	<hikjqr$ohr$1@ger.gmane.org>
	<alpine.LFD.2.00.1001130915570.18493@localhost>
	<hiklbj$uu2$1@ger.gmane.org>
User-Agent: Alpine 2.00 (LFD 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: dev branch, bitbake of "mplayer" fails
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
X-List-Received-Date: Wed, 13 Jan 2010 14:38:11 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 13 Jan 2010, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 13-01-10 15:16, Robert P. J. Day wrote:
> > On Wed, 13 Jan 2010, Koen Kooi wrote:
> >
> >> I suspect the build will work if you happen to have ffmpeg already staged.
> >>
> >> This should solve the issue:
> >>
> >> http://lists.mplayerhq.hu/pipermail/mplayer-cvslog/2010-January/038178.html
> >>
> >> testing now to see if that works.
> >
> >   so you're saying that if i bitbake ffmpeg first, then the bitbake of
> > mplayer should work?  i can test that quickly enough.
>
> That's the only thing I can think of that would get rid of the
> mismatch between mplayer configure and their svn-external'ed ffmpeg
> copy. Anyway, my patch seems to be working and I shall be pushing it
> soon.

  just tested and seems to work.  eggcellent.  also, graham's
e2fsprogs version upgrade to 1.41.9 now seems to produce a buildable
e2fsprogs, so that could be pushed as well.

  at some point this week, i'm thinking of poring over the bitbake/OE
manuals so i can debug some of these things myself.

rday
--


========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


