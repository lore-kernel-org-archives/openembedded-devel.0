Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NX9K6-0006EU-QB
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 09:20:30 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NX9Hv-0002O1-Q0 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 03:18:11 -0500
Date: Tue, 19 Jan 2010 03:17:26 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.1001190305430.13206@localhost>
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
Subject: tinderbox, bug reports and a freshly-broken mplayer
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
X-List-Received-Date: Tue, 19 Jan 2010 08:20:30 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  in order to keep the peace, i'm more than willing to file actual OE
bug reports for breakage i discover when building.  specifically, i'm
almost always trying to build beagleboard-demo-image on my up-to-date
fedora system, which seems to be a relatively unpopular working system
for most people here (except for philip b.), so i'm getting used to
running into breakage that no one else is seeing -- it's just a fact
of life.

  ignoring gnome-games for now, after a recent "git pull" on the OE
dev branch, the "mplayer" package now no longer builds.  from the git
log, i can see:

=====

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

=====

  if i "git reset" to the commit just before that, it builds fine;
ergo, that seems to be the commit that broke it.  a wild guess is that
the "maxrev" parameters are the cause, given that at least one now
falls below the requested svn revision, causing an essential patch to
no longer be applied, but that's just a guess until i look more
closely.

  the tail end of the log file:

fmt-conversion.c
fmt-conversion.c:28: error: 'PIX_FMT_RGB32' undeclared here (not in a function)
fmt-conversion.c:30: error: 'PIX_FMT_RGB565' undeclared here (not in a function)
fmt-conversion.c:31: error: 'PIX_FMT_RGB555' undeclared here (not in a function)
fmt-conversion.c:40: error: 'PIX_FMT_BGR32' undeclared here (not in a function)
fmt-conversion.c:42: error: 'PIX_FMT_BGR565' undeclared here (not in a function)
fmt-conversion.c:43: error: 'PIX_FMT_BGR555' undeclared here (not in a function)
make: *** [fmt-conversion.o] Error 1
FATAL: oe_runmake failed


  so ... i can file this over at http://bugs.openembedded.net/ if
that's the way to go.  but others were talking about this tinderbox
thing, which i've never used.  a quick glance suggests it's a more
formal, automated way of doing regular builds.  would that be
appropriate for me, if it's understood i'm always building on the same
distro?  feel free to point me at a quick intro, or i'll just file a
regular bug if that's the way to go.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


