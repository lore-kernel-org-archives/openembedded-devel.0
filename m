Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NXCh1-0007Dx-KG
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 12:56:22 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NXCer-0005x7-0o for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 06:54:05 -0500
Date: Tue, 19 Jan 2010 06:53:19 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <01e501ca98ed$823fa280$86bee780$@Willis@Distant-earth.com>
Message-ID: <alpine.LFD.2.00.1001190647010.20935@localhost>
References: <alpine.LFD.2.00.1001190305430.13206@localhost>
	<01e501ca98ed$823fa280$86bee780$@Willis@Distant-earth.com>
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
Subject: Re: tinderbox, bug reports and a freshly-broken mplayer
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
X-List-Received-Date: Tue, 19 Jan 2010 11:56:23 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 19 Jan 2010, John Willis wrote:

> rpjday wrote:

> >   ignoring gnome-games for now, after a recent "git pull" on the
> > OE dev branch, the "mplayer" package now no longer builds.  from
> > the git log, i can see:
>
> <snip>
>
> On the gnome-games front, I have been messing with gnome-games
> packages for something else (unrelated to the BB-demo image). I can
> mail you a few BB's to try if you want but none of it is working
> 100% yet (newer versions of gnome-games introduce requirements for
> OpenGL/Clutter etc. and that opens a whole world of pain).

  i'm going to ignore that package for the foreseeable future -- it
contains nothing I'm interested in and, yes, it does indeed bring a
whole world of pain.  movin' on ...

  regarding the current breakage of mplayer which seems to be the
result of this commit:

commit 33c882b663a1dd229d0ebcb187648838d0164795
Author: Koen Kooi <koen@openembedded.org>
Date:   Sun Jan 17 14:52:44 2010 +0100

    mplayer: bump SRCREV for some more ARM fixes

diff --git a/recipes/mplayer/mplayer_svn.bb
b/recipes/mplayer/mplayer_svn.bb
index 58a4bc7..d3fc2f7 100644
--- a/recipes/mplayer/mplayer_svn.bb
+++ b/recipes/mplayer/mplayer_svn.bb
@@ -15,7 +15,7 @@ SRC_URI =
"svn://svn.mplayerhq.hu/mplayer;module=trunk \
           file://fix-addrinfo.patch;patch=1;maxrev=30302 \
 "

-SRCREV = "30247"
+SRCREV = "30345"
 SRC_URI_append_armv7a = " \
                file://omapfb.patch;patch=1 \
           file://vo_omapfb.c \


> >   if i "git reset" to the commit just before that, it builds fine;
> > ergo, that seems to be the commit that broke it.  a wild guess is
> > that the "maxrev" parameters are the cause, given that at least
> > one now falls below the requested svn revision, causing an
> > essential patch to no longer be applied, but that's just a guess
> > until i look more closely.
>
> <snip>
>
> If you have a hunch on the patch then give it a go, or drop down the
> SRCREV for a few days until someone else can get around to fixing
> the issue, I suspect this bug will be seen widely (in fact I
> reproduced it on my setup with a fresh pull of mplayer_svn.bb on a
> Ubuntu build host yesterday). Your hunch seems good but I have no
> time to personally look at this now.

  neither do i, other commitments for the day.  nice to see that
you've already seen that as well.  makes me believe i am not alone.
:-)


> As for TinderBox, I did include some links in an earlier mail
>
> "I think Phil (or someone else) suggest you consider contributing your build
> logs to OESTATS/TinderBox
> (http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
> failure_reports) at least with that setup you leave a reference the failing
> logs in bug reports/mails so people can have a look into all the gory
> details :)."
>
> It only takes a few minor changes to your local.conf and all your build logs
> and build status are automatically uploaded to the server. This makes
> diagnosing build issues/collective debugging etc. that little bit easier as
> anyone can go to http://tinderbox.openembedded.org/builders/<your_nick> and
> see what your builds and failures and dig into the logs. If you worried
> about personal info. being uploaded then check into oestats-client.bbclass
> to see what is happening under the hood.
>
> To prove a point this is a link to the failed mplayer build I did yesterday
> (http://tinderbox.openembedded.org/packages/431300/).

  thanks, i'll dig into this after today.  for now, i'll just drop the
SRCREV on mplayer to get a working build and watch the logs.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


