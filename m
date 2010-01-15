Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1NViLY-0002zz-2k
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 10:20:03 +0100
Received: from cpe002129687b04-cm001225dbafb6.cpe.net.cable.rogers.com
	([99.235.241.187] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1NViJP-00080Y-QL for openembedded-devel@lists.openembedded.org;
	Fri, 15 Jan 2010 04:17:48 -0500
Date: Fri, 15 Jan 2010 04:16:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.LFD.2.00.1001150413260.1718@localhost>
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
Subject: OE dev branch broken package: gnome-games
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
X-List-Received-Date: Fri, 15 Jan 2010 09:20:03 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  currently building BB-demo-image from the dev branch, and breakage
of gnome-games just flashed by on the screen.  here's the tail end of
the log file:

CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
cc1: internal compiler error: in add_path, at c-incpath.c:425
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
cc1: internal compiler error: in add_path, at c-incpath.c:425
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
cc1: internal compiler error: in add_path, at c-incpath.c:425
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/SDL
cc1: internal compiler error: in add_path, at c-incpath.c:425
Please submit a full bug report,
with preprocessed source if appropriate.
See <http://gcc.gnu.org/bugs.html> for instructions.
make[3]: *** [client.lo] Error 1
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [chat.lo] Error 1
make[3]: *** [about.lo] Error 1
make[3]: *** [first.lo] Error 1
make[3]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.24.0-r5/gnome-games-2.24.0/dependencies/ggz-gtk'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.24.0-r5/gnome-games-2.24.0/dependencies'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/rpjday/oe/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/gnome-games-2.24.0-r5/gnome-games-2.24.0'
make: *** [all] Error 2
FATAL: oe_runmake failed


rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


