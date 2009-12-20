Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NMHCn-0001bU-0A for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 09:32:00 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NMHAz-0003MS-Fc
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Dec 2009 09:30:05 +0100
Received: from c-24-2-192-205.hsd1.ct.comcast.net ([24.2.192.205])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 09:30:05 +0100
Received: from buckleyassoc by c-24-2-192-205.hsd1.ct.comcast.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2009 09:30:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: John Buckley <buckleyassoc@comcast.net>
Date: Sun, 20 Dec 2009 08:27:38 +0000 (UTC)
Message-ID: <loom.20091220T090122-975@post.gmane.org>
References: <1986479129.867281259879607562.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
	<4B1916FD.7080905@cs.put.poznan.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.2.192.205 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.14) Gecko/2009090216 Ubuntu/9.04 (jaunty) Firefox/3.0.14)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: minimal xwindows
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
X-List-Received-Date: Sun, 20 Dec 2009 08:32:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Przemyslaw Wesolek <przemyslaw.wesolek <at> cs.put.poznan.pl> writes:

> 
> John Buckley wrote:
> > I would like to keep the build intact since it contains all the
> > components and libraries I need.  However, I would like to strip the
> > XWindows boot-up so that only my Xwindow application runs for now so
> > I can see if there are any significant performance improvements in my
> > video streaming.
> > 
> > Does anyone know how I can prevent the GPE from starting?  And, how I
> > can launch my GTK+/Xwindows application on bootup.
> 
> Startup of application happens as a result of running scripts in
> /etc/rcX.d dirs which are links to /etc/init.d. To stop program loading,
> simply remove the appropriate links, preferably with update-rc.d.
> 
> GPE login screen is loaded from gpe-dm script.
> 
> Similarly, to run a program on boot time, just add a script for it in
> /etc/init.d and link to it in /etc/rcX.d. Take a look on existing
> scripts on how to implement "start", "stop", etc. modes.
> 
> Przemek
> 


Okay, I was able to disable the bootup of gpe-dm.  Now I want to run my own
Xwindows program and have it be the only client calling on the Xserver.

It appears that the 'X' command will launch an instance of Xserver and I can
bring up a plain black or white screen but then OE waits for this process to
finish, therefore I can't subsequently launch my own GTK+/Gstreamer application
that will interact with the Xserver.

Question:  How do I get the Xserver to run in the background as a service so I
can then run my application.  Or, do I just run 'X' and launch my application
using the script .xinitrc or .xsession?

-John




