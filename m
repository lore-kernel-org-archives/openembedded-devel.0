Received: from [206.46.173.5] (helo=vms173005pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1Lu8AW-0000hd-Fz
	for openembedded-devel@openembedded.org; Wed, 15 Apr 2009 18:41:04 +0200
Received: from [10.0.1.5] ([71.182.247.84]) by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KI500981I5X5OQQ@vms173005.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Wed, 15 Apr 2009 11:37:10 -0500 (CDT)
Message-id: <49E60CD2.2080806@cs.cmu.edu>
Date: Wed, 15 Apr 2009 12:35:30 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-version: 1.0
To: openembedded-devel@openembedded.org
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50, FM_FAKE_HELO_VERIZON,
	RDNS_NONE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Canadian Cross building broken due to PN in pkginfo files
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
X-List-Received-Date: Wed, 15 Apr 2009 16:41:04 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit

This issue:

http://thread.gmane.org/gmane.comp.handhelds.openembedded/22376/focus=22556

also seems to affect building gcc-canadian-sdk - it leads to a "lockfile
path does not exist!" error where it's trying to create a lockfile in
the work directory for gcc-4.2.4-r3.

The problem happens here, in read_subpackage_metadata():

        for pkg in bb.data.getVar('PACKAGES', d, 1).split():
                sdata = read_subpkgdata(pkg, d)
                for key in sdata.keys():
                        bb.data.setVar(key, sdata[key], d)

The problem is that ${PN} is defined in the subpackage's pkginfo file,
so it overwrites the definition from the main package.  The last
subpackage defines PN="gcc", so that's where the packaging stage tries
to put the lockfile.

The original fix suggested in that thread seems to work well:

git revert -n 1af5030de05a1e65d1de734f7675ffc22c8318fc


I'm not sure what other packages or tasks this change might be affecting.


