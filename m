Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RNtxx-00036s-2B for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 23:16:25 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RNtrv-00074E-91 for openembedded-devel@lists.openembedded.org;
	Tue, 08 Nov 2011 23:10:11 +0100
Received: from kogut-pc.sd.spawar.navy.mil ([128.49.73.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 23:10:11 +0100
Received: from gkogut by kogut-pc.sd.spawar.navy.mil with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2011 23:10:11 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Greg Kogut <gkogut@yahoo.com>
Date: Tue, 8 Nov 2011 22:05:03 +0000 (UTC)
Message-ID: <loom.20111108T225635-677@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 128.49.73.66 (Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US;
	rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8)
Subject: Anstrom boot hang with MACHINE=i686-generic and DISTRO=anstrom-2010.x
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
X-List-Received-Date: Tue, 08 Nov 2011 22:16:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I've tried both console-image and x11-image. 

During the boot process they both hang.  All of the rcS.d scripts appear to run,
but I never get to a getty screen.   It appears to hang either just before getty
runs, or getty itself is hanging.  

I've tried booting at run-level one, and toying with a very minimal set of
startup scripts.

I thought maybe that getty was configured to display to ttyS0, etc, but it
should be going to tty1 - my DVI output.   I added some lines to inittab to
spawn gettys to multiple tty's, but no luck.

The hardware is just a modern mini-mobo.  Core Duo, DVI out, ext2 disk.  

Any ideas?







