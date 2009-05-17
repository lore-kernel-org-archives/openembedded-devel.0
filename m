Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M5nfJ-0006dP-Th
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 23:13:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M5nYK-0002Ma-AR
	for openembedded-devel@openembedded.org; Sun, 17 May 2009 21:05:48 +0000
Received: from p5b3b31b9.dip.t-dialin.net ([91.59.49.185])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 21:05:48 +0000
Received: from no2spam by p5b3b31b9.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 17 May 2009 21:05:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 17 May 2009 23:05:24 +0200
Message-ID: <4A107C14.90108@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b31b9.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
Sender: news <news@ger.gmane.org>
Cc: devel@lists.openmoko.org
Subject: [RFC] nuke dpkg prior to 1.14.25 in org.oe.dev branch
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
X-List-Received-Date: Sun, 17 May 2009 21:13:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

we have a number of bb recipes for very old dpkg versions.  According to 
bug 5026 even the second most recent version in OE has been removed from 
the mirrors for quite a while now.  I don't see any value in bb files 
that aren't even fetchable and thus suggest to drop all but the most 
recent dpkg recipe which in this case is 1.14.25.

cc: openmoko (1.13.22 is listed in preferred-om-2008-versions.inc)

jlime-shrek.conf lists 1.10.23 as PREFERRED_VERSION but that one is not 
available anyway.

Regards

Rolf



