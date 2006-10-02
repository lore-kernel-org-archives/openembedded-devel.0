Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GUNyv-0003Uv-G7 for openembedded-devel@lists.openembedded.org;
	Mon, 02 Oct 2006 15:37:17 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 0C9F2401B45; Mon,  2 Oct 2006 06:06:47 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061002130647.0C9F2401B45@tinman.treke.net>
Date: Mon,  2 Oct 2006 06:06:47 -0700 (PDT)
Subject: [Bug 1448] New: GLIBC_2.4+NPTL missing pthread_kill external declaration in header file
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
X-List-Received-Date: Mon, 02 Oct 2006 13:37:17 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1448

           Summary: GLIBC_2.4+NPTL missing pthread_kill external declaration
                    in header file
           Product: Openembedded
           Version: unspecified
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: shanevolpe@gmail.com
         QAContact: tinderbox-oe@gmx.net


I tried to compile DirectFB with glibc_2.4 and NPTL enabled.  The directFB
compiling errored out with:  "error: implicit declaration of function
'pthread_kill'"

Further investigation revealed that the function pthread_kill is part of POSIX
and is compiled into the glibc_2.4 lib for OE, but the external declaration is
missing from the header files in the staging area.

I added it to the staging/arm-linux/include/pthread.h and rebuilt directFB with
out any issues.

I would submit a patch but I'm not sure why it was not included in the header
to begin with and also there could be more functions missing.
I would like feedback from others or someone else more familiar with the
glibc_2.4 OE build to write the patch.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


