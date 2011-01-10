Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PcIaT-0000gZ-HL
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 15:19:09 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AuoFAAaiKk1bdWOb/2dsb2JhbACECJIqjwGuKI0WgSGDN3QEiwqFKg
X-IronPort-AV: E=Sophos;i="4.60,300,1291590000"; d="scan'208";a="318803459"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 10 Jan 2011 15:12:16 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PcITo-0003nn-HO; Mon, 10 Jan 2011 15:12:16 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PcITo-0003nQ-An; Mon, 10 Jan 2011 15:12:16 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PcITn-0006fq-TY; Mon, 10 Jan 2011 15:12:15 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 15:12:14 +0100
Message-Id: <1294668735-25620-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>, Michael Lauer <mickey@vanille-media.de>
Subject: [PATCH v2] scons: add EXTRA_OESCONS
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
X-List-Received-Date: Mon, 10 Jan 2011 14:19:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's similar to EXTRA_OEMAKE, which appends arguments to the scons
command

v2:
* initialise the EXTRA_OECONS if it is not defined

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 classes/scons.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/classes/scons.bbclass b/classes/scons.bbclass
index 2a935e4..c19f8d4 100644
--- a/classes/scons.bbclass
+++ b/classes/scons.bbclass
@@ -1,5 +1,7 @@
 DEPENDS += "python-scons-native"
 
+EXTRA_OESCONS ?= ""
+
 export TARGET_LINK_HASH_STYLE
 
 scons_do_compile() {
@@ -11,7 +13,7 @@ scons_do_compile() {
         fi
     fi
 
-    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}" PREFIX=${prefix} prefix=${prefix} || \
+    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}" PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
     oefatal "scons build execution failed."
 }
 
-- 
1.7.2.3



