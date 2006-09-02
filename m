Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GJV5x-0006tO-Bs for openembedded-devel@lists.openembedded.org;
	Sat, 02 Sep 2006 14:59:33 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 431BA401B3E; Sat,  2 Sep 2006 05:36:42 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060902123642.431BA401B3E@tinman.treke.net>
Date: Sat,  2 Sep 2006 05:36:42 -0700 (PDT)
Subject: [Bug 1379] New: imagemagick tries to link with libraries from host /usr
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
X-List-Received-Date: Sat, 02 Sep 2006 12:59:33 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1379

           Summary: imagemagick tries to link with libraries from host /usr
           Product: Openembedded
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P2
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: nail@nslu2-linux.org
         QAContact: tinderbox-oe@gmx.net


chmod 644 Magick.bs
rm -f blib/arch/auto/Image/Magick/Magick.so
arm-linux-gcc -march=armv5te -mtune=xscale -mthumb-interwork -mno-thumb 
-L/usr/lib -shared -L/usr/local/lib Magick.o  -o
blib/arch/auto/Image/Magick/Magick.so      \
           -L/usr/lib
-L/home/repvik/slug/releases/slugos-3.10-beta/debianslug-nslu2.tmp/work/imagemagick-6.2.9-r0/ImageMagick-6.2.9/PerlMagick/../magick/.libs
-lMagick
-L/home/repvik/slug/releases/slugos-3.10-beta/debianslug-nslu2.tmp/staging/arm-linux/lib
-ltiff -lz -lpthread -lm -lpthread         \

/usr/lib/libz.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


