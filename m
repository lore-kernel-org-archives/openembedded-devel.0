Received: from [206.46.173.13] (helo=vms173013pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Mv11n-0006Ke-MG
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Oct 2009 05:47:58 +0200
Received: from gandalf.denix.org ([71.127.57.136]) by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KR200I46QHZMLLI@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	05 Oct 2009 22:46:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9690714AF60; Mon,
	05 Oct 2009 23:46:46 -0400 (EDT)
Date: Mon, 05 Oct 2009 23:46:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20091006034646.GA22854@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Version sorting in BitBake
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
X-List-Received-Date: Tue, 06 Oct 2009 03:47:58 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

While debugging the problem with the wrong kernel recipe being picked up by 
BitBake, based on a complex PV value (there were several instances, once of 
them recently mentioned at [1]), I found a small flaw in BitBake's version 
comparison algorithm, as it relates to -preX and -rcX versions.

For the above cases we use this format: PV = "2.6.29+2.6.30-rc5"

At this point both BitBake and opkg (I haven't tried other package managers) 
sort those PVs properly, as EOL sorts lower than any other character:

2.6.29 < 2.6.29+2.6.30-rc5 < 2.6.30

Since the introduction of MACHINE_KERNEL_PR, we moved modifiers such as 
"+gitr${SRCREV}" (or any distro/local suffixes) from PR to PV, but still 
placing them after PR for proper sorting:

PV1 = "2.6.29-${PR}+gitr${SRCREV}"
PV2 = "2.6.29+2.6.30-rc5-${PR}+gitr${SRCREV}"
PV3 = "2.6.30-${PR}+gitr${SRCREV}"

That still works with opkg, as ipkg-compare-versions sorts above PVs as 
expected - PV1 < PV2 < PV3

But BitBake now has this flaw and sorts like this: PV2 < PV1 < PV3

Looks like ipkg-compare-versions/opkg algorithm has a special handling for '-' 
and '.' characters, making them sort lower than '+', thus producing expected 
results.

I understand that this behavior can be controlled by PREFERRED_VERSION and 
DEFAULT_PREFERENCE variables. But would it make sense to also fix it in 
BitBake? I do have a patch, which I'll send next. Please provide comments.

[1] http://thread.gmane.org/gmane.comp.handhelds.openembedded/26622/focus=26634

-- 
Denys


