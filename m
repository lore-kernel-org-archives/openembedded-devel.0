Received: from smtp4.mundo-r.com ([212.51.32.151])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjaquez@igalia.com>) id 1P4HN1-0002X3-5p
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 20:08:42 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AhIFAOD6rkxbdWOb/2dsb2JhbACDH5Eohz+HLKtZklOBIoMxdASKQIR+
X-IronPort-AV: E=Sophos;i="4.57,304,1283724000"; d="scan'208";a="688215876"
Received: from 155.99.117.91.static.mundo-r.com (HELO fanzine.igalia.com)
	([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 08 Oct 2010 20:07:13 +0200
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1P4HLd-000609-DB; Fri, 08 Oct 2010 20:07:13 +0200
Received: from ip148.dynamic.igalia.com ([192.168.10.148]
	helo=lit.local.igalia.com) by mail.igalia.com with esmtps 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim)
	id 1P4HLd-0006ZR-8b; Fri, 08 Oct 2010 20:07:13 +0200
Received: from vjaquez by lit.local.igalia.com with local (Exim 4.72)
	(envelope-from <vjaquez@igalia.com>)
	id 1P4HLc-00085J-Nw; Fri, 08 Oct 2010 20:07:12 +0200
From: =?UTF-8?q?V=C3=ADctor=20Manuel=20J=C3=A1quez=20Leal?=
	<vjaquez@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 20:07:11 +0200
Message-Id: <1286561232-31048-1-git-send-email-vjaquez@igalia.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.51.32.151
X-SA-Exim-Mail-From: vjaquez@igalia.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>, Koen Kooi <k-kooi@ti.com>
Subject: [PATCH] angstrom.inc: set TARGET_VENDOR ?= "-angstrom"
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
X-List-Received-Date: Fri, 08 Oct 2010 18:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By doing this we could use external toolchains for build angstrom
based images.

Signed-off-by: Víctor Manuel Jáquez Leal <vjaquez@igalia.com>
---
 conf/distro/include/angstrom.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
index 8983c86..9e5c869 100644
--- a/conf/distro/include/angstrom.inc
+++ b/conf/distro/include/angstrom.inc
@@ -9,7 +9,7 @@ DISTRO_NAME = "Angstrom"
 
 BUILDNAME = "Angstrom ${DISTRO_VERSION}"
 
-TARGET_VENDOR = "-angstrom"
+TARGET_VENDOR ?= "-angstrom"
 
 SOC_FAMILY ?= "Unknown"
 
-- 
1.7.1



