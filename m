Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKrAW-0002jy-Jb for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 08:45:52 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 1B269401B2B; Tue,  5 Sep 2006 23:22:00 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906062200.1B269401B2B@tinman.treke.net>
Date: Tue,  5 Sep 2006 23:22:00 -0700 (PDT)
Subject: [Bug 1389] New: SMPEG stages with broken link, cannot link against library
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
X-List-Received-Date: Wed, 06 Sep 2006 06:45:53 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1389

           Summary: SMPEG stages with broken link, cannot link against
                    library
           Product: Openembedded
           Version: Angstrom
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: pmiscml@gmail.com
         QAContact: tinderbox-oe@gmx.net


smpeg_0.4.4+0.4.5cvs20040311.bb creates dangling link 'libsmpeg.so' pointing to
non-existent 'libsmpeg-0.4.so', whereas actualy there's 'libsmpeg-0.4.so.0'. As
a result, linking against libsmpeg fails.

This happens due to undersmartness of oe_libinstall when dealing with libs with
custom suffixes ('libsmpeg-0.4' instead of 'libsmpeg' in this case). It fails
to recognize such library as libtoolized, even so it actually is.

So, either oe_libinstall should be made more smart, or simple one-line patch in
attachment should be added.

The issue described here can be reproduced by building 'rocksndiamonds',
recently added.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


