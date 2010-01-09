Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NTjEC-0007qO-04 for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:52:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NTjC9-0006vQ-3c
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:50:05 +0100
Received: from chello080108092216.22.11.tuwien.teleweb.at ([80.108.92.216])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:50:05 +0100
Received: from chris by chello080108092216.22.11.tuwien.teleweb.at with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:50:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris Veigl <chris@shifz.org>
Date: Sat, 9 Jan 2010 20:47:34 +0000 (UTC)
Message-ID: <loom.20100109T213305-664@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 80.108.92.216 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.0.17) Gecko/2010010604 Ubuntu/9.04 (jaunty) Firefox/3.0.17)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: building classpath / ecj-initial fails
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
X-List-Received-Date: Sat, 09 Jan 2010 21:52:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi all,

  I ran into problems when bitbaking java-related stuff for the 
  OMAP3-platforms (gumstix-overo, beagleboard)
  in the current org.openembedded.dev environment:

  I receive the following error at task 
  /recipes/classpath/classpath-native_0.97.2.bb, do_configure

"checking if /media/disk/overo-oe/tmp/staging/i686-linux/usr/bin/ecj-initial
works... configure: error: The Java compiler
/media/disk/overo-oe/tmp/staging/i686-linux/usr/bin/ecj-initial failed (see
config.log, check the CLASSPATH?)"

  the problem seems to be that jamvm-initial (which is called by ecj-initial)
  produces a memory-allocation fault (maybe related to the argument -Xmx1024m ?)

  I found similar problems browsing the OE-build stats and the web, 
  but no hints for a solution ..

any help or comments very much apprechiated,
regards,
Chris



