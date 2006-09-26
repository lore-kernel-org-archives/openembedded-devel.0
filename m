Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GSLHO-0006LE-Gd for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 00:19:54 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 30722401B46; Tue, 26 Sep 2006 14:50:40 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060926215040.30722401B46@tinman.treke.net>
Date: Tue, 26 Sep 2006 14:50:40 -0700 (PDT)
Subject: [Bug 1439] perl 5.8.7 fails during configure
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
X-List-Received-Date: Tue, 26 Sep 2006 22:19:54 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1439


lenehan@twibble.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lenehan@twibble.org




------- Comment #1 from lenehan@twibble.org  2006-09-26 14:50 -------
Perl builds fine for me on i486. In your case this:

  grep -m1 "\/usr\/include\/.*\\.h" tmp/work/perl-5.8.7-r18/* -r | cut -f 1 -d
":"

is returning "Binary" for some reason when it doesn't for anyone else. I would
presume this is the result of grep returning something like:

  Binary file <filename> matches

If you run the above grep manually you should see which binary and your perl
workdir has /usr/include in it somewhere, which might help explain what's going
on.

Anyway, it you make grep ignore binary files:

--- packages/perl/perl_5.8.7.bb 88bb9c33126dc36e9b6ecfbdab494d1d1b974a7d
+++ packages/perl/perl_5.8.7.bb 64d1a14e86517d96cf9111d020ca709609de456c
@@ -53,7 +53,7 @@ do_configure() {
        sed -i -e "s%/usr/include/%${STAGING_INCDIR}/%g"
config.sh-${TARGET_ARCH}-${TARGET_OS}

        #These are strewn all over the source tree
-       for foo in `grep -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f 1
-d ":"` ; do
+       for foo in `grep -I -m1 \/usr\/include\/.*\\.h ${WORKDIR}/* -r | cut -f
1 -d ":"` ; do
                echo Fixing: $foo
                sed -e "s%/usr/include/%${STAGING_INCDIR}/%g" -i $foo
        done

then it should work fine. Although one wonders what's special about your
environment that it has this issue in the first place.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


