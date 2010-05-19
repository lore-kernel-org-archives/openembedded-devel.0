Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OEqhl-000704-Gk
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 23:21:31 +0200
Received: from [10.134.70.180] (unknown [188.46.70.180])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 03E051B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 21:25:47 +0000 (UTC)
Message-ID: <4BF45542.2000406@freyther.de>
Date: Thu, 20 May 2010 05:16:50 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Lightning/1.0b1
	Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: TSC Meetings for the meeting of may
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
X-List-Received-Date: Wed, 19 May 2010 21:21:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

sorry for the delay of finishing up the minutes, it is late at night so
I am sure I have messed up something in one way or another... take care.


TSC Meeting 2010/05/06

Where to hold meetings
======================
The TSC decided to hold future meetings on IRC as every member
of the TSC already have irc clients installed and the same was
not true for jabber clients.

Make packaged-staging mandatory
===============================
The TSC decided to make packaged-staging mandatory as this will
allow further simplification of the classes, gives additional
features. The TSC is aware that there are still recipes left to
migrate away from the legacy staging and that building these will
increase the build time right now.

Make insane mandatory
=====================
The TSC believes that the insane.bbclass contributes to making
builds more reliable and point out errors early on. On the other
hand the TSC is aware that these checks might get into the way
during rapid prototyping. The TSC believes the right balance is
to enable the insane.bbclass by default but to change the default
to warn instead of failing the build and existing users will be
able to opt for fatal errors instead of warnings.


Removing old versions
=====================
The TSC looked into the topic of when to remove versions.


The TSC thinks there can not be a general rule of when to delete
a package. The TSC believes that in some cases a package should
never be deleted, e.g. with GCC/GLIBC to target a specific device
or distribution. For a series of major releases it seems plausible
to only keep the latest minor release of each release series around
given that the quality should increase with each minor release but
a removal of a minor release should not be done if there is a
PREFERRED_VERSION set. The TSC believes that 24 months can be a good
time to remove old major releases but it is certainly not the only
criteria for a removal.


