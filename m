Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PUku0-0001J2-Mi
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 19:56:08 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap0FAF81D01bdWOb/2dsb2JhbACDY5IbjwyuDJBkgSCDNXQEiwE
X-IronPort-AV: E=Sophos;i="4.60,203,1291590000"; d="scan'208";a="710896343"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 20 Dec 2010 19:55:01 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PUksv-0001CU-Lt; Mon, 20 Dec 2010 19:55:01 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PUksv-0004s0-Eg; Mon, 20 Dec 2010 19:55:01 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PUksu-00063Q-KR; Mon, 20 Dec 2010 19:55:00 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Dec 2010 19:54:59 +0100
Message-Id: <1292871300-22853-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
Subject: [PATCH] db5: append CXX tag to libtool
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
X-List-Received-Date: Mon, 20 Dec 2010 18:56:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 recipes/db/db5.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/db/db5.inc b/recipes/db/db5.inc
index 78b99ff..390dfac 100644
--- a/recipes/db/db5.inc
+++ b/recipes/db/db5.inc
@@ -62,7 +62,7 @@ MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX}"
 
-LIBTOOL = "${HOST_SYS}-libtool"
+LIBTOOL = "${HOST_SYS}-libtool --tag=CXX"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
 
 # Cancel the site stuff - it's set for db3 and destroys the
-- 
1.7.2.3



