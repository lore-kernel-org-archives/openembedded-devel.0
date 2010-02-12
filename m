Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Ng1Eb-00057p-6e
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 20:31:31 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 20:28:46 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 20:28:46 +0100
Received: from localhost.localdomain ([79.17.136.227]) by
	FBCMCL01B08.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 12 Feb 2010 20:28:46 +0100
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2010 20:28:35 +0100
Message-Id: <1266002916-32059-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.4.4
X-OriginalArrivalTime: 12 Feb 2010 19:28:46.0085 (UTC)
	FILETIME=[982EE350:01CAAC19]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] autotools.bbclass: fix issue with native and sed
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
X-List-Received-Date: Fri, 12 Feb 2010 19:31:32 -0000


Hi,
libxml2-native failed with:
sed: -e expression #1, char 0: no previous regular expression
I've a temporary fix for it.
The details are in the patch commit message.

Denis.


