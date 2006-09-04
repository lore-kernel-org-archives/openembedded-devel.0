Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKLZ9-00082j-Fq for openembedded-devel@lists.openembedded.org;
	Mon, 04 Sep 2006 23:01:11 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 2547D4014D4; Mon,  4 Sep 2006 13:37:40 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060904203740.2547D4014D4@tinman.treke.net>
Date: Mon,  4 Sep 2006 13:37:40 -0700 (PDT)
Subject: [Bug 1383] New: [PATCH] packages ztenv and libeb
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Sep 2006 21:01:11 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1383

           Summary: [PATCH] packages ztenv and libeb
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: bugs.openembedded.org@rolf.leggewie.biz
         QAContact: tinderbox-oe@gmx.net
OtherBugsDependingO 1362
             nThis:


Trying to make good on my promise and get some of the stuff from openzaurus-ja
into OE (bug 1362).

ztenv is a dictionary lookup tool for EPWING files which are commonly used in
Japan.  This is a just slightly modified version of
http://cvs.sourceforge.jp/cgi-bin/viewcvs.cgi/openzaurus-ja/bbfile/packages-ja/libeb/
and
http://cvs.sourceforge.jp/cgi-bin/viewcvs.cgi/openzaurus-ja/bbfile/packages-ja/ztenv/

The following changes were made:
* slightly altered the description for ztenv
* removed ozja from bb file names to conform with OE policy (ozja in the file
name creates all kinds of weird problems)
* make adjustment in bb files related to ozja removal
* add maintainer field for libeb (set to tnemoto who made the CVS commits)
* make zio.patch actually compile (thanks pH5 and koen)

The packages do compile against the latest OE tree.  But there are still a few
glitches.

* LICENSE for libeb needs fixing, Modified BSD is unknown to OE
* without the zio.patch ztenv does not compile.  It is unclear what zio.patch
is for, though.  tnemoto-san, can you clarify?
* I have not yet installed and used the packages
* there might be others, go ahead and test drive it and report back


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


