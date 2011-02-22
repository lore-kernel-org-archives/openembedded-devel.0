Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Prgqo-0004tB-Dx
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 02:15:38 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PrgpY-0007NW-Eb from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 17:14:20 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 21 Feb 2011 17:14:20 -0800
Received: from localhost.localdomain ([172.30.80.151]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 21 Feb 2011 18:14:18 -0700
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Feb 2011 18:14:05 -0700
Message-Id: <1298337246-11794-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 22 Feb 2011 01:14:18.0755 (UTC)
	FILETIME=[D44FC530:01CBD22D]
Subject: [PATCH 0/1] bitbake.conf: Simplify TARGET_CPPFLAGS/LDFLAGS
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
X-List-Received-Date: Tue, 22 Feb 2011 01:15:38 -0000

As part of my looking into RPATH QA errors I noticed that we pass it
in _everywhere_ on non-libtool 2.4 distributions and looked around
a little.  I noticed that poky had dropped this change long ago on
the grounds that it's not needed with gcc & company obeying --sysroot
(rather than libtool).  This doesn't appear to have had the giant
fixing of RPATH issues that I had hoped for (but I can spot check if
people ask).  This change was tested in the trini/simplify-target-flags
branch and over the weekend I got the following results:
http://dl.dropbox.com/u/3284539/feb18matrix_withsimplifyflags.pdf

I've spot-checked the failures and the only unexpected to me ones are
related to hitting the bitbake cache unexpectedly locked bug and the gvfs
glib-2.0 version conflict.



