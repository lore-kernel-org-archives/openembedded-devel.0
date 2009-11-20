Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NBQEu-0004KW-6H
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 10:57:19 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NBQDX-0003P4-Fz for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 04:55:51 -0500
Date: Fri, 20 Nov 2009 04:55:44 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200911201040.17657.holger+oe@freyther.de>
Message-ID: <alpine.LFD.2.00.0911200452470.21460@localhost>
References: <alpine.LFD.2.00.0911200415360.22257@localhost>
	<200911201040.17657.holger+oe@freyther.de>
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
Subject: Re: FYI, non-fatal fetch errors for ffmpeg
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
X-List-Received-Date: Fri, 20 Nov 2009 09:57:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 20 Nov 2009, Holger Hans Peter Freyther wrote:

> On Friday 20 November 2009 10:20:25 Robert P. J. Day wrote:
>
> >   obviously, the fetch of ffmpeg eventually works, but any value
> > in cleaning up the initial fetch errors?
>
> This is normal operation. The reasoning is that we want to be good
> to the upstream infrastructure and don't want all OE users hammer on
> the SCM Servers of the upstream project to checkout a static
> tarball.
>
> This is why OE tries to download a snapshot from a tarball stash, in
> your case two have been tried and then it falls back to the SCM of
> the upstream directly.

  i suspected it was something like that, i just wasn't sure whether,
*eventually*, tarballs are uploaded to satisfy those first attempts.
in any event, it clearly didn't stop the build.

rday

p.s.  "NOTE: Running task 6568 of 10078 ..." on my way to
beagleboard-demo-image -- so far, so good.  and guile-native has long
since been built.  yippee.  thanks for your patience.

--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


