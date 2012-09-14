Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TCROT-0006iV-MM
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 10:36:57 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id A47CD254351D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 08:27:47 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>) id 1TCRCE-0006KV-62
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 10:24:18 +0200
Date: Fri, 14 Sep 2012 10:24:18 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120914082418.GD22757@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-systemd] Building systemd and sysvinit/custom-init scripts
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
X-List-Received-Date: Fri, 14 Sep 2012 08:36:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

for whatever reasons I think I want to be able to build sysvinit
and systemd images at the same time. Right now this somehow fails
due to two providers of udev and the systemd-udev not installing a
LSB start script. Is there any objection to create a systemd-udev-sysvinit
package that will install the LSB script?

holger


