Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QEQbU-000329-69
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 20:33:48 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QEQZ5-0004z4-D3 from Tom_Rini@mentor.com ;
	Mon, 25 Apr 2011 11:31:19 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 25 Apr 2011 11:31:19 -0700
Received: from localhost.localdomain ([172.30.80.238]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Apr 2011 12:31:17 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 11:31:10 -0700
Message-Id: <1303756273-22385-1-git-send-email-tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
X-OriginalArrivalTime: 25 Apr 2011 18:31:18.0043 (UTC)
	FILETIME=[F7822EB0:01CC0376]
Cc: koen@dominion.thruhere.net
Subject: [RFC, PATCH] Add minver/maxver to patch.bbclass, update bluez
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
X-List-Received-Date: Mon, 25 Apr 2011 18:33:48 -0000

Hey all,

In digging at some other bluez problems, I found that at least
4.91 no longer needs the sbc-thumb patch.  But without moving it to the
N versions of bluez4 we have or starting a new inc file for later bluez4
versions, there wasn't a clean way to exclude the patch.  Until now.
Borrowing the minrev/maxrev logic I added minver/maxver patch params
and tested them lightly (the patch is applied on 4.89 and not on
4.91).  I'm cc'ing Koen here because patch #3 adds 4.91 and make it
default for Angstrom, but all I've done myself is build testing.
It should be safe, based on upstream changelog tho.

-- 
Tom Rini
Mentor Graphics Corporation



