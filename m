Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GFql4-0007Fn-FA for openembedded-devel@lists.openembedded.org;
	Wed, 23 Aug 2006 13:18:54 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id F221F401B40; Wed, 23 Aug 2006 03:58:32 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060823105832.F221F401B40@tinman.treke.net>
Date: Wed, 23 Aug 2006 03:58:32 -0700 (PDT)
Subject: [Bug 1260] wlan-ng patching failure when wlan-ng is fetched from svn
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
X-List-Received-Date: Wed, 23 Aug 2006 11:18:54 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1260


openembedded@hrw.one.pl changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




------- Comment #3 from openembedded@hrw.one.pl  2006-08-23 03:58 -------
pushed into .dev:

wlan-ng: fixing to get it build and updated - close #1260
- added 0.2.4+svn20060823
- bumped SVN to 0.2.4
- SVN are DEFAULT_PREFERENCE = -1 now
- dropped pcmcia-driver.patch from wlan-ng-modules.inc
  - for PCMCIA cards we use HostAP not wlan-ng


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


