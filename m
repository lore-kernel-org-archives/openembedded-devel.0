Received: from [85.33.3.5] (helo=smtp-OUT05A.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1MBcdC-0003Hy-UI
	for openembedded-devel@openembedded.org; Wed, 03 Jun 2009 00:38:54 +0200
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Jun 2009 00:30:00 +0200
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Wed, 3 Jun 2009 00:29:59 +0200
Received: from localhost.localdomain ([80.180.55.127]) by
	FBCMCL01B03.fbc.local with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 3 Jun 2009 00:29:59 +0200
From: Denis 'Gnutoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@openembedded.org
Date: Wed,  3 Jun 2009 00:29:58 +0200
Message-Id: <1243981798-11167-2-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1243981798-11167-1-git-send-email-GNUtoo@no-log.org>
References: <1243981798-11167-1-git-send-email-GNUtoo@no-log.org>
X-OriginalArrivalTime: 02 Jun 2009 22:29:59.0303 (UTC)
	FILETIME=[A9CA0970:01C9E3D1]
Subject: [PATCH] uclibc.inc : also exclude mips and mipsel from GNU hash.
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
X-List-Received-Date: Tue, 02 Jun 2009 22:38:55 -0000


diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index f2f3e9b..a967954 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -95,7 +95,7 @@ configmangle = 's,^KERNEL_SOURCE=.*,KERNEL_SOURCE="${KERNEL_SOURCE}",g; \
 		s,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX="/lib",; \
 		s,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g; \
 		${@["","s,.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y,;"][bb.data.getVar("USE_NLS", d, 1) == "yes"]} \
-		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) == "avr32"]} \
+		${@["","s,.*LDSO_GNU_HASH_SUPPORT.*,# LDSO_GNU_HASH_SUPPORT is not set,;"][bb.data.getVar("TARGET_ARCH", d, 1) in ['mips', 'mipsel', 'avr32']]} \
                '
 
 CFLAGS := "${@oe_filter_out('-I\S+', '${CFLAGS}', d)}"
-- 
1.6.0.6



