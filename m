Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TCRP8-0006oa-70
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 10:37:38 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id 49C9525434E0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2012 08:20:14 +0000 (UTC)
Received: from ich by sangmingze-mail.local with local (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>) id 1TCR4u-0006JU-Hu
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 10:16:44 +0200
Date: Fri, 14 Sep 2012 10:16:44 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120914081644.GC22757@localhost>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-systemd] base-files and systemd services
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
X-List-Received-Date: Fri, 14 Sep 2012 08:37:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Good Morning,

I am playing with meta-oe's meta-systemd and have one issue with the
base-files provided by Poky. networking.service and syslog (busybox)
fail to run as directories like /var/log and /var/run do not exist. In
my images/packagegroup-core-boot I am not installing the the "initscripts"
so I have no LSB service to initialize these directories.

Taking a look at meta-angstrom I found a base-files.bbappend that removes
the "log lock tmp..." symlinks and instead just mounts /var/tmp and /var/run
as tmpfs. In "recent" Poky/OE-Core the syslogd service started to write to
/var/log under the assumption that this is a volatile directory...

I wonder how I should move forward:

a.) Use a tempfiles.d/volatile.conf to create these directories?
b.) Install initscripts in my systemd image?
c.) ???


comments/ideas?

holger


