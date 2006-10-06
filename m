Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GVoCa-0002Vu-Ft for openembedded-devel@lists.openembedded.org;
	Fri, 06 Oct 2006 13:49:16 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id BC1A4401C8B; Fri,  6 Oct 2006 04:17:43 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061006111743.BC1A4401C8B@tinman.treke.net>
Date: Fri,  6 Oct 2006 04:17:43 -0700 (PDT)
Subject: [Bug 1457] New: Stream redirection in log_check() does not work with /bin/sh
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
X-List-Received-Date: Fri, 06 Oct 2006 11:49:17 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1457

           Summary: Stream redirection in log_check() does not work with
                    /bin/sh
           Product: Openembedded
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: di@fh-wedel.de
         QAContact: tinderbox-oe@gmx.net


Consider the following code:

if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") &>/dev/null 

This fails if /bin/sh points to a dumb shell, like e.g. /bin/dash.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


