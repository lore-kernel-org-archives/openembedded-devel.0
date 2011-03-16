Received: from gate.tarent.de ([212.79.178.249] helo=ugs.tarent.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <henning@tarent.de>) id 1PzoPK-0002vt-4R
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 11:56:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 7BB6C4005161C;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by ugs.tarent.de (Postfix) with ESMTP id 73F71400014D5;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from ugs.tarent.de ([127.0.0.1])
	by localhost (ugs.tarent.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 92Dc+SEvU5y6; Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from entw1 (lui.tarent.buero [192.168.4.41])
	by ugs.tarent.de (Postfix) with ESMTPSA id 52FA5400B3839;
	Wed, 16 Mar 2011 11:55:07 +0100 (CET)
Received: from henning by entw1 with local (Exim 4.71)
	(envelope-from <henning@tarent.de>)
	id 1PzoNe-0006KU-UV; Wed, 16 Mar 2011 11:55:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Mar 2011 11:54:44 +0100
Message-Id: <1300272884-24220-5-git-send-email-heinold@inf.fu-berlin.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300272884-24220-1-git-send-email-heinold@inf.fu-berlin.de>
Cc: Henning Heinold <h.heinold@tarent.de>
Subject: [PATCH 4/4] angstrom-jalimo: use cacao-native hg version for javac-native
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
X-List-Received-Date: Wed, 16 Mar 2011 10:56:50 -0000

From: Henning Heinold <h.heinold@tarent.de>

* build java packages is more stable than with jamvm
---
 conf/distro/include/angstrom-jalimo.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/conf/distro/include/angstrom-jalimo.conf b/conf/distro/include/angstrom-jalimo.conf
index f95c7c9..3ab8e2d 100644
--- a/conf/distro/include/angstrom-jalimo.conf
+++ b/conf/distro/include/angstrom-jalimo.conf
@@ -5,9 +5,8 @@ PREFERRED_VERSION_jamvm-initial = "1.4.5"
 PREFERRED_VERSION_classpath-initial = "0.93"
 
 # Native VM
-PREFERRED_PROVIDER_virtual/java-native ?= "jamvm-native"
-PREFERRED_VERSION_jamvm-native = "1.5.3"
-#PREFERRED_VERSION_cacao-native = "0.99.3"
+PREFERRED_PROVIDER_virtual/java-native ?= "cacao-native"
+SRCREV_pn-cacao-native ?= "c7bf150bfa46"
 PREFERRED_VERSION_classpath-native = "0.98"
 
 # Native compiler settings
-- 
1.7.0.4



