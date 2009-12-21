Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NMfSo-0007tn-PO
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 11:26:09 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NMfR2-00060g-6A
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 10:24:16 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NMfR1-0003i5-Qz
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 10:24:15 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <loom.20091220T090122-975@post.gmane.org>
References: <1986479129.867281259879607562.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>
	<4B1916FD.7080905@cs.put.poznan.pl>
	<loom.20091220T090122-975@post.gmane.org>
Date: Mon, 21 Dec 2009 10:24:11 +0000
Message-Id: <1261391051.779.441.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
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
X-List-Received-Date: Mon, 21 Dec 2009 10:26:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-12-20 at 08:27 +0000, John Buckley wrote:
> Okay, I was able to disable the bootup of gpe-dm.  Now I want to run my own
> Xwindows program and have it be the only client calling on the Xserver.
> 
> It appears that the 'X' command will launch an instance of Xserver and I can
> bring up a plain black or white screen but then OE waits for this process to
> finish, therefore I can't subsequently launch my own GTK+/Gstreamer application
> that will interact with the Xserver.
> 
> Question:  How do I get the Xserver to run in the background as a service so I
> can then run my application.  Or, do I just run 'X' and launch my application
> using the script .xinitrc or .xsession?

The easiest way to do this would be to leave gpe-dm enabled, but remove
all the unwanted stuff from /etc/X11/Xinit.d and install a script in
there that starts the app that you want.

If it's the GPE login screen that you're trying to avoid, removing the
gpe-login package is probably what you want to do.

p.




