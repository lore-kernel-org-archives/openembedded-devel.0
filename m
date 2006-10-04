Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GV94A-0000Jq-7H for openembedded-devel@lists.openembedded.org;
	Wed, 04 Oct 2006 17:53:50 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id A4671401B45; Wed,  4 Oct 2006 08:22:47 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20061004152247.A4671401B45@tinman.treke.net>
Date: Wed,  4 Oct 2006 08:22:47 -0700 (PDT)
Subject: [Bug 1452] New: fakeroot has runtime dependency on getopt; where is getopt?
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
X-List-Received-Date: Wed, 04 Oct 2006 15:53:50 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1452

           Summary: fakeroot has runtime dependency on getopt; where is
                    getopt?
           Product: Openembedded
           Version: Angstrom
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Distributions
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: martinwguy@yahoo.it
         QAContact: tinderbox-oe@gmx.net


fakeroot's runtimedependency on command-line "getopt" is not coded

Environment:
http://www.angstrom-distribution.org/unstable/images/20060905/c7x0/Angstrom
-bootstrap-image-test-20060904-c7x0.rootfs.tar.bz2 running under QEMU on x86,
updated and upgraded to 4 oct 2006 with relevant dpkg-* parts installed by hand
from source.

# ipkg install fakeroot
$ dpkg-buildpackage -d -rfakeroot
...
dpkg-buildpackage: source version without epoch 1.3.2a-3
 fakeroot debian/rules clean
/usr/bin/fakeroot: /usr/bin/fakeroot: 30: getopt: not found
/usr/bin/fakeroot: /usr/bin/fakeroot: 38: getopt: not found
fakeroot, create a fake root environment.
   usage: fakeroot [-l|--lib fakerootlib] [-r|--faked fakedbin]
...
# ipkg install getopt
Nothing to be done
An error ocurred, return value: 4.
Collected errors:
Cannot find package getopt.
Check the spelling or perhaps run 'ipkg update'
#

(if it's in another package, then which?)


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


