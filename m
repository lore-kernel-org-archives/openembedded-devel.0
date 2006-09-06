Received: from [192.216.230.225] (helo=tinman.treke.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <bugzilla-daemon@tinman.treke.net>)
	id 1GKwID-0002jm-3I for openembedded-devel@lists.openembedded.org;
	Wed, 06 Sep 2006 14:14:09 +0200
Received: by tinman.treke.net (Postfix, from userid 33)
	id 61E49401B45; Wed,  6 Sep 2006 04:50:17 -0700 (PDT)
X-Bugzilla-Reason: AssignedTo
To: openembedded-devel@lists.openembedded.org
From: bugzilla-daemon@tinman.treke.net
Message-Id: <20060906115017.61E49401B45@tinman.treke.net>
Date: Wed,  6 Sep 2006 04:50:17 -0700 (PDT)
Subject: [Bug 1383] [PATCH] packages ztenv and libeb
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
X-List-Received-Date: Wed, 06 Sep 2006 12:14:09 -0000

http://bugs.openembedded.org/show_bug.cgi?id=1383





------- Comment #9 from koen@dominion.kabel.utwente.nl  2006-09-06 04:50 -------
(In reply to comment #8)
> koen, thanks for the reworked libeb.
> 
> This breaks compilation of ztenv which would need to be revised as well.
> 

CFLAGS =+ "-DQTOPIA -DZAURUS"

change that to 

CFLAGS =+ "-DQTOPIA" 

and it should compile against a stock libeb


-- 
Configure bugmail: http://bugs.openembedded.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.


