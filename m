Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MQrLV-0007vD-Eu
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 01:23:37 +0200
Received: from FBCMMO05.fbc.local ([192.168.184.136]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Jul 2009 01:10:15 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO05.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Jul 2009 01:08:15 +0200
Received: from localhost.localdomain ([79.51.85.54]) by FBCMCL01B08.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 15 Jul 2009 01:08:14 +0200
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@openembedded.org
Date: Wed, 15 Jul 2009 01:08:12 +0200
Message-Id: <1247612892-19937-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
References: <1247612892-19937-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 14 Jul 2009 23:08:14.0746 (UTC)
	FILETIME=[F75457A0:01CA04D7]
Subject: [PATCH] mdev: mdev.sh: permit serial console login and correct init runlevel
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
X-List-Received-Date: Tue, 14 Jul 2009 23:23:37 -0000

create /dev/console and /dev/null in order to permit someone to login via serial console
and to be able to go to others runlevel than runlevel S : for instance runlevel 2345

diff --git a/recipes/mdev/mdev-1.2.1/mdev.sh b/recipes/mdev/mdev-1.2.1/mdev.sh
index 9744322..b4bb28c 100755
--- a/recipes/mdev/mdev-1.2.1/mdev.sh
+++ b/recipes/mdev/mdev-1.2.1/mdev.sh
@@ -66,4 +66,12 @@ ln -sf /proc/self/fd/2 /dev/stderr
 ln -sf /proc/kcore /dev/core
 ln -sf /proc/asound/oss/sndstat /dev/sndstat
 
+if [ ! -e /dev/console ]; then
+mknod /dev/console c 5 1
+fi
+
+if [ ! -e /dev/null ]; then
+mknod /dev/null c 1 3
+fi
+
 exit 0
-- 
1.6.0.6



