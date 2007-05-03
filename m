Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1Hjas6-0000X4-46
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2007 14:57:22 +0200
Received: by py-out-1112.google.com with SMTP id n39so372566pyh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2007 05:47:51 -0700 (PDT)
Received: by 10.65.43.17 with SMTP id v17mr3419625qbj.1178196453376;
	Thu, 03 May 2007 05:47:33 -0700 (PDT)
Received: from cube ( [82.193.98.2])
	by mx.google.com with ESMTP id 36sm1745981nza.2007.05.03.05.47.32;
	Thu, 03 May 2007 05:47:33 -0700 (PDT)
Date: Thu, 3 May 2007 15:47:32 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <35653307.20070503154732@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [ALERT] Security vulnerability with recent OE bitbake.conf changes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2007 12:57:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

A commit made some time ago,

http://lists.linuxtogo.org/pipermail/openembedded-commits/2007-April/004912.html

introduced a hole which may lead to unnoticed security vulnerabilities
slipping into the packages/images produced. Specifically, it defines a
random application of a random suite to be used for resolving patching
conflicts/failures. If you don't happen to have that random tool,
patching failure will be silently swallowed, leading to any adverse
effects imaginable - from compile failure to the mentioned security
vulnerabilities.

Proposed solutions:

1. Bring back some reality and switch back to previous default of
dropping to standard shell for resolution:

-TERMCMD ?= "${GNOME_TERMCMD}"
-TERMCMDRUN ?= "${GNOME_TERMCMDRUN}"
+TERMCMD ?= "${SHELLRCCMD}"
+TERMCMDRUN ?= "${SHELLRCCMD}"


2. Add DEPENDS on that random tool, namely gnome-terminal.

If going with choice 2, I proposed also to do the following: 1) add
depends on xine, mplayer, totem, few other video players; 2) add depends
on mesa and show nice 3d rotating menu to select player of user choice;
3) use selected player to show video during the build - after all,
if user deserves comfort of using superfluous GUI tools for conflict
resolution, why one should be bored during normal build process?


Thanks,

-- 
 Paul                          mailto:pmiscml@gmail.com



