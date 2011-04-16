Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <utx@penguin.cz>) id 1QBEri-00035e-Gu
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Apr 2011 01:25:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 0A2D01416BAC;
	Sun, 17 Apr 2011 01:23:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RndPoxxv53EZ; Sun, 17 Apr 2011 01:23:14 +0200 (CEST)
Received: from [192.168.1.2] (233-15-80-78.tmcz.cz [78.80.15.233])
	by ns.penguin.cz (Postfix) with ESMTP id 2149E1416BA5;
	Sun, 17 Apr 2011 01:23:13 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Sun, 17 Apr 2011 01:23:04 +0200
Message-ID: <1302996184.3122.30.camel@utx.lan>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.1 
Cc: Paul Menzel <paulepanter@users.sourceforge.net>
Subject: [PATCH 0/5] *.bbclass: search configs in D instead of S
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Apr 2011 23:25:22 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Following series of patches changes way how config files are populated.
Searching for *-config and .pc config files in S makes more problems
than it brings benefits. Searching in the installed root seems to be
more logical.

Fixes following subtle breakages:
- files are populated with a different name that upstream intended
- populated files that were not intended to be populated

It was discussed previously here:
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-January/029261.html

Now I was able to make a complete system build with these patches, so I
guess that they are ready to be pushed. I am sending class changes for
review and waiting for ACK of class changes.

Packages that are known to be fixed by this change:
ncurses
PR update will be needed here. (Not sending this patch to the list.)

Packages that need to be modified after this change:
tcl
tk
I already have these patches ready - just remove custom staging and use
standard staging way plus simple trick. (Not sending this patch to the
list.)

Packages with secondary breakage fixed by this patch set:
alsa-utils (breakage triggered by ncurses)

New packages that may be build with this patch set:
lynx

-- 

________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



