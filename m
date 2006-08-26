Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GH1L3-0007cI-QA for openembedded-devel@lists.openembedded.org;
	Sat, 26 Aug 2006 18:48:54 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 11A81401B3B; Sat, 26 Aug 2006 09:27:47 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060826162747.11A81401B3B@tinman.treke.net>
Date: Sat, 26 Aug 2006 09:27:47 -0700 (PDT)
Subject: [Bug 1353] gpe-session-scripts shouldn't depend on gpe-bluetooth
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
X-List-Received-Date: Sat, 26 Aug 2006 16:48:54 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1353





------- Comment #6 from philipp.zabel@gmail.com  2006-08-26 09:27 -------
> > 1. patch gpe-auto-bluetooth.sh to fail silently when gpe-bluetooth is not
> > installed, rather than producing an error; and
>
> Would that be hard to do?

would just changing the "exec gpe-bluetooth" to "exec gpe-bluetooth || true"
work? otherwise you'd have to wrap it in an "if [ -x /usr/bin/gpe-bluetooth ];
then ...; fi" or something like that.


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


