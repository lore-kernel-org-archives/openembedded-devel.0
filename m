Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GM3WT-0001uO-FA for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 16:09:29 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 64CAD401B2B; Sat,  9 Sep 2006 06:44:46 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060909134446.64CAD401B2B@tinman.treke.net>
Date: Sat,  9 Sep 2006 06:44:46 -0700 (PDT)
Subject: [Bug 1406] New: opie-mediaplayer1 circular dependencies
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
X-List-Received-Date: Sat, 09 Sep 2006 14:09:29 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1406

           Summary: opie-mediaplayer1 circular dependencies
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P4
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: pasky@ucw.cz
         QAContact: tinderbox-oe@gmx.net


opie-mediaplayer1 is strangled in circular dependencies:

Package opie-mediaplayer1 is depended upon by packages:
        opie-mediaplayer1-libmadplugin
        opie-mediaplayer1-libmodplugin
        opie-mediaplayer1-libtremorplugin
        opie-mediaplayer1-libwavplugin

Package opie-mediaplayer1-libmadplugin is depended upon by packages:
        opie-mediaplayer1

...(repeat for each of those lib packages)...


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


