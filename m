Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GFug6-0008FL-99 for openembedded-devel@lists.openembedded.org;
	Wed, 23 Aug 2006 17:30:02 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 46D67401B3F; Wed, 23 Aug 2006 08:09:42 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060823150942.46D67401B3F@tinman.treke.net>
Date: Wed, 23 Aug 2006 08:09:42 -0700 (PDT)
Subject: [Bug 1353] New: gpe-session-scripts shouldn't depend on gpe-bluetooth
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
X-List-Received-Date: Wed, 23 Aug 2006 15:30:03 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1353

           Summary: gpe-session-scripts shouldn't depend on gpe-bluetooth
           Product: Openembedded
           Version: OpenZaurus 3.5.4.x
          Platform: ARM
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P4
         Component: Build
        AssignedTo: openembedded-devel@lists.openembedded.org
        ReportedBy: hma@syd.odn.ne.jp
         QAContact: tinderbox-oe@gmx.net


gpe-session-scripts is essential package to login to /logout from GPE.
Now the package depends on gpe-bluetooth.

SL-C700 doesn't have bluetooth facility.
I want more free space rather than unused package,
so tried to remove gpe-bluetooth package.
After that, I can't login to GPE, because gpe-session-scripts also removed.

I replaced the lines in gpe-session-scripts_0.66.bb.
Is this reasonable solution?

#RDEPENDS_${PN} = "matchbox gpe-session-starter gpe-bluetooth xstroke xtscal
gpe
-question gpe-clock matchbox-applet-inputmanager xrandr xmodmap xdpyinfo
xserver
-common"
RDEPENDS_${PN} = "matchbox gpe-session-starter xstroke xtscal gpe-question
gpe-c
lock matchbox-applet-inputmanager xrandr xmodmap xdpyinfo xserver-common"

and

-DEPENDS = "matchbox-wm matchbox-panel gpe-bluetooth xstroke xtscal
gpe-question
 matchbox-applet-inputmanager gpe-clock xrandr xmodmap xdpyinfo xserver-common"
+DEPENDS = "matchbox-wm matchbox-panel xstroke xtscal gpe-question
matchbox-apple
t-inputmanager gpe-clock xrandr xmodmap xdpyinfo xserver-common"


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


