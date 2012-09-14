Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TCRo2-0007uZ-EI
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 11:03:22 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 727B625434E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 08:54:15 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>) id 1TCRbp-0006OO-S9
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 10:50:45 +0200
Date: Fri, 14 Sep 2012 10:50:45 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120914085045.GE22757@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-systemd] Plan on building systemd and sysvinit images from the same machine
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
X-List-Received-Date: Fri, 14 Sep 2012 09:03:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I wonder what is the plan for building systemd/sysvinit images for
the same machine. Right now the packagegroup-core-boot selects the
initsystem and I wonder how to overcome that?

Was it discussed to have a packagegroup-core-boot that will depend on
either a -sysvinit -tinyinit -systemd packagegroup? This way the image
could help in selecting the right dependency?

Would that work? What are the alternatives?

	holger


