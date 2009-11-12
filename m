Received: from [64.235.106.9] (helo=astoria.ccjclearline.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1N8blR-0003T3-LA
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 16:39:16 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1N8bkB-0005rf-IZ for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 10:37:56 -0500
Date: Thu, 12 Nov 2009 10:37:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20091112130528.GB2239@xora-eee>
Message-ID: <alpine.LFD.2.00.0911121034200.2140@localhost>
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<200911120656.41249.holger+oe@freyther.de>
	<200911120722.09166.holger+oe@freyther.de>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>
	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
	<alpine.LFD.2.00.0911120748300.3045@localhost>
	<20091112130528.GB2239@xora-eee>
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
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 15:39:17 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 12 Nov 2009, Graeme Gregory wrote:

> On Thu, Nov 12, 2009 at 07:58:23AM -0500, Robert P. J. Day wrote:
> > > PS: Personally I think it is a bad idea to change the output format of
> > > a utility that is more than 30 years old and that is so widespread.
> >
> >   i have to agree but, frankly, i'm astonished that that
> > fundamental a change caused breakage in only one package out of
> > about 10,000 (i tripped across that building
> > beagleboard-demo-image -- it was the only package that failed
> > because of that; i actually think that shows an amazing level of
> > robustness).
> >
> And it doesnt make it fail here, selinux enabled, can see the extra
> . in my normal ls commands. xterm still builds fine.

  ok, that's just odd since i was sure it was that trailing period
that was causing all the trouble.  and adding a single line to the
sinstall.sh script to strip it fixed the problem.  how curious.

  in any event, i think it's safe to say that that sinstall.sh script
was a bit of a hack.  if one wanted to dup some file perms onto a new
file, it would have been way easier to just:

  $ chmod --reference=oldfile newfile

or something like that.  running the symbolic mode through multiple
sed's to get the numeric mode is the definition of massive overkill.

  and i'll try that posted patch shortly, i suspect it will work just
fine.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


