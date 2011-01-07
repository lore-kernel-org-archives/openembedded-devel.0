Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PbJLG-0001Ce-Sn
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 21:55:22 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AgkFAOoMJ01bdWOb/2dsb2JhbACDd5IljwKtX40pgSGDN3QEiwmFKA
X-IronPort-AV: E=Sophos;i="4.60,290,1291590000"; d="scan'208";a="715974567"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 07 Jan 2011 21:54:57 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PbJKr-0001um-2w; Fri, 07 Jan 2011 21:54:57 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PbJKq-000050-S8; Fri, 07 Jan 2011 21:54:56 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PbJKq-0000kC-C1; Fri, 07 Jan 2011 21:54:56 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Jan 2011 21:54:55 +0100
Message-Id: <1294433696-2824-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.2.3
MIME-Version: 1.0
Cc: Koen Kooi <koen@openembedded.org>, Michael Lauer <mickey@vanille-media.de>
Subject: [PATCH] scons: add EXTRA_OESCONS
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
X-List-Received-Date: Fri, 07 Jan 2011 20:55:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's similar to EXTRA_OEMAKE, which appends arguments to the scons
command

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 classes/scons.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/scons.bbclass b/classes/scons.bbclass
index 2a935e4..13243a0 100644
--- a/classes/scons.bbclass
+++ b/classes/scons.bbclass
@@ -11,7 +11,7 @@ scons_do_compile() {
         fi
     fi
 
-    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}" PREFIX=${prefix} prefix=${prefix} || \
+    ${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} CXX="${CXX}" PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
     oefatal "scons build execution failed."
 }
 
-- 
1.7.2.3



