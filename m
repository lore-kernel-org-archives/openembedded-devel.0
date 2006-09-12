Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GN4g6-0001rx-RR for openembedded-devel@lists.openembedded.org;
	Tue, 12 Sep 2006 11:35:39 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id EEBD0401B48; Tue, 12 Sep 2006 02:10:16 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060912091016.EEBD0401B48@tinman.treke.net>
Date: Tue, 12 Sep 2006 02:10:16 -0700 (PDT)
Subject: [Bug 1391] minimo package bit rotted badly
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
X-List-Received-Date: Tue, 12 Sep 2006 09:35:39 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1391


alain2210@free.fr changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alain2210@free.fr




------- Comment #15 from alain2210@free.fr  2006-09-12 02:10 -------
Hello,

it put here also the comment made on handhelds :

It seems that the
small screen rendering is not working. I succeed in making it work with theses
changes :
1)in minimo_20060720.bb add
install -m 0644 res/smallScreen.css ${D}${mozdir}/res
install -m 0644 res/sites.css ${D}${mozdir}/res
2) modifying minimo.patch such that
a) mozilla/minimo/Makefile contains
DIRS = config components chrome locales customization base
b) mozilla/minimo/components/Makefile
DIRS = ssr
c) mozilla/minimo/components/ssr/Makefile
MODULE_NAME     = SSRModule


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


