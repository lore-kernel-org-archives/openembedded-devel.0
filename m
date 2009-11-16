Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NA44W-0007Re-Ga
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 17:04:59 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NA43B-0005hI-PH for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 11:03:33 -0500
Date: Mon, 16 Nov 2009 11:03:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B017271.5040209@balister.org>
Message-ID: <alpine.LFD.2.00.0911161100340.31519@localhost>
References: <alpine.LFD.2.00.0911161031420.15588@localhost>
	<4B017271.5040209@balister.org>
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
Subject: Re: apparently, i have a beagleboard-demo-image!
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
X-List-Received-Date: Mon, 16 Nov 2009 16:05:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 16 Nov 2009, Philip Balister wrote:

> On 11/16/2009 10:34 AM, Robert P. J. Day wrote:
> >
> >    build just finished, 0 errors.  go figure.  but i'm puzzled
> > since, until recently, guile-native was failing to build and i
> > don't see anything in the git log that would have done anything
> > with that package.  can someone clarify this?  i also don't recall
> > manually patching that package based on an earlier poster's
> > suggestion, so i have no idea why it would suddenly start to
> > build.  (perhaps i'll distclean that and make sure it builds
> > again.)
> >
> >    in any event, happy happy, joy joy.
>
> Lucky you, opkg-cl is failing for me. Fortunately, I have some real
> work to keep me out of trouble.

  anything i can do to test on this end?  here's my current repo
status:

=====

$ git show
commit 9cbd93cd04ffa16a6b9aee5b6d63751777b91b16
Author: Richard Purdie <rpurdie@linux.intel.com>
Date:   Mon Nov 16 12:46:10 2009 +0000

    package.bbclass: Add back import os until further metadata cleanups happen

    Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>

diff --git a/classes/package.bbclass b/classes/package.bbclass
index 5de48d6..246ecd4 100644
--- a/classes/package.bbclass
+++ b/classes/package.bbclass
@@ -338,7 +338,7 @@ python perform_packagecopy () {
 }

 python populate_packages () {
-       import glob, stat, errno, re
+       import glob, stat, errno, re,os

        workdir = bb.data.getVar('WORKDIR', d, True)
        outdir = bb.data.getVar('DEPLOY_DIR', d, True)

=====

  at some point in the near future when f12 comes out (couple days),
i'll try to reproduce the build from scratch on a fresh install, just
to play it safe.  at least i have a benchmark now.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


