Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>) id 1PhNaE-0003MF-TE
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 15:39:55 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AtIFAJcdPU1bdWOb/2dsb2JhbACEEpI4jxCrGpAsgSSDOHQEiyA
X-IronPort-AV: E=Sophos;i="4.60,370,1291590000"; d="scan'208";a="720903056"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 24 Jan 2011 15:39:11 +0100
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNZW-0006SP-W8; Mon, 24 Jan 2011 15:39:10 +0100
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1PhNZW-0007ZK-Pw; Mon, 24 Jan 2011 15:39:10 +0100
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1PhNZW-0006GZ-9v; Mon, 24 Jan 2011 15:39:10 +0100
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 15:39:09 +0100
Message-Id: <1295879950-24057-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: [PATCH] minimal.conf: inherit devshell task
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
X-List-Received-Date: Mon, 24 Jan 2011 14:39:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everybody loves devshell

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 conf/distro/minimal.conf |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
index f495d13..11525b9 100644
--- a/conf/distro/minimal.conf
+++ b/conf/distro/minimal.conf
@@ -104,6 +104,9 @@ QA_LOG = "1"
 #run QA tests on recipes
 INHERIT += "recipe_sanity"
 
+#make devshell available as task
+INHERIT += "devshell" 
+
 #############################################################################
 # PREFERRED VERSIONS
 #############################################################################
-- 
1.7.0.2



