Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MQrJs-0007u1-5H
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 01:21:56 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Jul 2009 01:08:34 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Jul 2009 01:08:14 +0200
Received: from localhost.localdomain ([79.51.85.54]) by FBCMCL01B08.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Jul 2009 01:08:14 +0200
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Jul 2009 01:08:11 +0200
Message-Id: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.0.6
X-OriginalArrivalTime: 14 Jul 2009 23:08:14.0199 (UTC)
	FILETIME=[F700E070:01CA04D7]
Subject: mdev.sh: permit serial console login and permit correct runlevel
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
X-List-Received-Date: Tue, 14 Jul 2009 23:21:56 -0000

Hi, This patch is permit the login via serial console,and to go to the correct runlevel(2345),
without this patch init is blocked at the last script of runlevelS and we can never login via serial console
(the patch created /dev/null and /dev/console)
I send it for review because it touch a core part and that I'm not shure how the others distro handle that.
Here I used:
*wrt54.conf
*micro-base-image
*micro-uclibc

Denis




