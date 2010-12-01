Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PNn8R-00028I-09
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 14:54:15 +0100
Received: by bwz10 with SMTP id 10so6015714bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 05:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=2dWdC3DPEvBhuTSgAbisn2q/Cw+E3ZrNj6UF8zGIcCk=;
	b=K1xtwEOWxtlcCvfyG70p9RCwBwQWaDOJSc2na/NpYJkiFQ/ESRdxQlJWxW2QMinQkJ
	RH6wO8deqUj4fV33rLAq/vc8m9VFB53Frt+9/0WddXVPvpAiYE6mvpXPxZNoA3nnVNTO
	9rJ2xKum3vzD8HnmD6Z0XIzW1chF1pkJb6PsM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CCp4R9TI3eDqoj5SRIAiHWd9HnOzoIaHLDQASi1qtaIa6NBhpVNbR6VhhTKn+MBnvy
	3umAD4LcIO3PaEwpvOsKO9js+PYaIpLMdYiVyXi4ShVmQB9e90y7rr1zujKDVMZCZc0j
	+rKXvfogPwot4QisHy5w2oG+PWgPrdOqzgMrw=
Received: by 10.204.46.167 with SMTP id j39mr8254194bkf.0.1291211572214;
	Wed, 01 Dec 2010 05:52:52 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a24sm873006fak.1.2010.12.01.05.52.50
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 01 Dec 2010 05:52:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Dec 2010 14:52:47 +0100
Message-Id: <1291211567-2520-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.2
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] module-init-tools: fix multiple runtime providers
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
X-List-Received-Date: Wed, 01 Dec 2010 13:54:15 -0000

* NOTE: multiple providers are available for runtime module-init-tools-depmod (module-init-tools, module-init-tools-cross)
  NOTE: consider defining a PREFERRED_PROVIDER entry to match module-init-tools-depmod
---
 recipes/module-init-tools/module-init-tools.inc |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes/module-init-tools/module-init-tools.inc b/recipes/module-init-tools/module-init-tools.inc
index 3cfaf11..247b39a 100644
--- a/recipes/module-init-tools/module-init-tools.inc
+++ b/recipes/module-init-tools/module-init-tools.inc
@@ -3,13 +3,13 @@ removing kernel modules for Linux (versions 2.5.48 and above). It serves \
 the same function that the modutils package serves for Linux 2.4."
 LICENSE = "GPLv2"
 SECTION = "base"
-PR = "r5"
+PR = "r6"
 
-PACKAGES =+ "module-init-tools-insmod-static module-init-tools-depmod"
-RDEPENDS_${PN} += "module-init-tools-depmod"
+PACKAGES =+ "${PN}-insmod-static ${PN}-depmod"
+RDEPENDS_${PN} += "${PN}-depmod"
 
-FILES_module-init-tools-depmod = "${sbindir}/depmod.26"
-FILES_module-init-tools-insmod-static = "${sbindir}/insmod.static"
+FILES_${PN}-depmod = "${sbindir}/depmod.26"
+FILES_${PN}-insmod-static = "${sbindir}/insmod.static"
 
 SRC_URI = "${KERNELORG_MIRROR}/pub/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
 	   file://ignore_arch_directory;apply=yes \
-- 
1.7.3.2



