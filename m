Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RNv3X-0006UV-OH for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 00:26:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RNuxV-0002RJ-GO for openembedded-devel@lists.openembedded.org;
	Wed, 09 Nov 2011 00:20:02 +0100
Received: from kogut-pc.sd.spawar.navy.mil ([128.49.73.66])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 00:20:01 +0100
Received: from gkogut by kogut-pc.sd.spawar.navy.mil with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Nov 2011 00:20:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Greg Kogut <gkogut@yahoo.com>
Date: Tue, 8 Nov 2011 23:19:45 +0000 (UTC)
Message-ID: <loom.20111109T001647-942@post.gmane.org>
References: <loom.20111108T225635-677@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 128.49.73.66 (Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US;
	rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8)
Subject: Re: Anstrom boot hang with MACHINE=i686-generic and	DISTRO=anstrom-2010.x
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
X-List-Received-Date: Tue, 08 Nov 2011 23:26:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Greg Kogut <gkogut <at> yahoo.com> writes:

> 
> I've tried both console-image and x11-image. 


Edit:

I was able to to boot fully after appending "-o rw" to the "root"
kernel parameter.

I suspect the issue was that the read-only mount was not allowing
udev to correctly populate /dev with the tty devices passed to 
getty, and getty was flummoxed.

So I'm amending my question:  Help a n00b -what's the standard
practice with respect to maintaining an embedded-safe read-only
rootfs while allowing udev to do its thang?   Separate partition
for /dev? 







