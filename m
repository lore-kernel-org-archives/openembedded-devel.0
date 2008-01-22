Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JHIuF-0003x7-2X
	for openembedded-devel@openembedded.org; Tue, 22 Jan 2008 14:11:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JHIuG-0006Ci-Rm
	for openembedded-devel@openembedded.org; Tue, 22 Jan 2008 13:11:12 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 22 Jan 2008 13:11:12 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 22 Jan 2008 13:11:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Tue, 22 Jan 2008 14:11:02 +0100
Message-ID: <fn4q16$dm2$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
Sender: news <news@ger.gmane.org>
Subject: Machine configs
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2008 13:11:11 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

it seems to me the machine configs for the collie need a little more
love.  At first, I thought that possibly my recent changes were faulty.
 But it seems the problems run back further.  Here is what happened,
please comment if you can shed light on the situation.

It was around January 10th that I successfull built my last image for
collie.  I had not restarted from scratch for about 4-6 weeks at least.
 A few days later, I would run into trouble with do_rootfs about
unsatisfiable dependency, even though the respective packages had just
been rebuilt a few minutes earlier.  http://oe.pastebin.com/m67158bdf is
the log from yesterday that AFAICT is identical to that problem.  It
seems that all packages in arm-oabi directory are ignored (FEED_ARCH
seems not to be set).

I then asked others to try and reproduce the situation and cleaned out
tmp to start anew.  I also reverted my monotone work dir to revision
37149b3d7b17d35e06e93ecd95c7eb36f4425da6 from Jan 7th.  I stopped
"MACHINE=collie bitbake minimal-image" when I saw

NOTE: Unpacking /export/embedded/sources/gcc-4.1.2.tar.bz2 to
/export/embedded/tmp/sonkei-0.0.1/work/armv5te-sonkei-linux/gcc-cross-4.1.2-r13/

Something is incorrect with arches for collie and this predates my
latest changes.

Can anybody please clarify why a build for collie messes with armv5te?
Why is do_rootfs ignoring arm-oabi directory?

Further tests to try and reproduce this and narrow the problem down are
also welcome.

Regards

Rolf



