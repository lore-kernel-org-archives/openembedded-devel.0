Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NB0QT-0002Py-D8
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 07:23:32 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NB0P7-0006mc-0E for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 01:22:05 -0500
Date: Thu, 19 Nov 2009 01:22:01 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.0911190116480.18080@localhost>
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
Subject: the latest scoop on guile (native) build failure on fedora
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
X-List-Received-Date: Thu, 19 Nov 2009 06:23:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just FYI, as a benchmark for a native build, i downloaded the
guile-1.8.7 tarball and tried to build it on my system with your basic
"make; configure".  that failed exactly as the OE build has been
failing.

  as a last resort, i downloaded the fedora source rpm and tried to
use "rpmbuild" to rebuild the binary package.  same failure.  so this
is clearly a guile/fedora issue, nothing to do with OE.

  i'm about to bugzilla this, but i'm wary only because i'm running on
a sort of f12 system that is f11 but rawhide updated, so it might be
that there's a subtle version mismatch.

  if someone out there has either a pure f11 or pure f12 system, feel
free to download the guile-1.8.7 tarball:

  ftp://ftp.gnu.org/pub/gnu/guile/guile-1.8.7.tar.gz

and try nothing more than untar/configure/make and see what happens.

rday

p.s.  install libtool-ltdl-devel first.  philip?  want to give that a
shot?  should take only a couple minutes and will go a long way to
isolating what the mutt is going on here.

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


