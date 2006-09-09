Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GLrQl-0003Go-U9 for openembedded-devel@lists.openembedded.org;
	Sat, 09 Sep 2006 03:14:48 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 349A3401B4A; Fri,  8 Sep 2006 17:50:13 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060909005013.349A3401B4A@tinman.treke.net>
Date: Fri,  8 Sep 2006 17:50:13 -0700 (PDT)
Subject: [Bug 54] Flakey on/off suspend/resume behavior on Embedix kernel (SL5600+SL6000) with OZ3.5.3 and OZ3.5.4-RC
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
X-List-Received-Date: Sat, 09 Sep 2006 01:14:48 -0000

http://bugs.openembedded.org/show_bug.cgi?id=54


pasky@ucw.cz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pasky@ucw.cz




------- Comment #27 from pasky@ucw.cz  2006-09-08 17:50 -------
I can reproduce with about 90% probability the freeze when suspending my Collie
with the cancel button, while apm -s from console works fine. With the freeze,
the screen and backlight stays on, but even repeated pressing of the cancel
button has no effect; freezes even with opie-alarm uninstalled, doctab disabled
and the apmproxy scripts disabled as well. Using OZ 3.5.4 upgraded to the
latest feed, kernel Linux collie 2.4.18-rmk7-pxa3-embedix #1 Sun, 12 Mar 2006
16:58:40 +0100 armv4l unknown. I can confirm the clock problem as well, it
seems the clock is reverted to the time of the last correct shutdown or
something.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


