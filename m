Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PhUr1-0006TM-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 23:25:44 +0100
Received: by ywi6 with SMTP id 6so1629846ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 14:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=3qlARy0xrS9SJ0dh0RvXddSdaAjQJNQsB0p3MfrhIs8=;
	b=p+q/uF8ep/f0xAE9zY1DNknLLSFl1NIts7TxLDiWLOcUUFnByKji6NoRsmViK+DApA
	pohH061DBbBlVUKeQWXEPu0kip+2xC3sWGY2SiuXNPTq7fPZyMH2hL/nkjZb8PPrOjSi
	NTwy/dD2z0E3x1r7t/93GEfwgs/5fjoMQQCMg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Tn7Axv2kHo0tQU+vDHGTrUoRu1bh0/Wia8OuFrkqrTwikssKtWbjwdM67QpU4jb0VA
	Yt5O5JlqUS3T1WZs6wfHzzh3Vjxhx20V5F7GV1T/DmyiOy9Os3KYfvE4QKqy5Mqmvjqc
	DWa6cJuYWu0uFq/r700axh5lSamqJXxI7xU7s=
Received: by 10.151.78.19 with SMTP id f19mr5143148ybl.143.1295907897739;
	Mon, 24 Jan 2011 14:24:57 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id r24sm3268420yba.18.2011.01.24.14.24.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 24 Jan 2011 14:24:57 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Jan 2011 16:22:26 -0600
Message-Id: <1295907746-7913-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/2] matrix-gui-common: Support SVG icons
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
X-List-Received-Date: Mon, 24 Jan 2011 22:25:44 -0000

  * Add support to install *.svg icons as well as *.png icons
  * Bump up the recipe revision

Signed-off-by: Jeff Lance  <j-lance1@ti.com>
---
 recipes/ti/matrix-gui-common.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/ti/matrix-gui-common.inc b/recipes/ti/matrix-gui-common.inc
index 4185b34..c0edbfd 100644
--- a/recipes/ti/matrix-gui-common.inc
+++ b/recipes/ti/matrix-gui-common.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "multimedia"
 PRIORITY = "optional"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
@@ -34,6 +34,7 @@ do_install() {
     install -m 0644 ${S}/${PLATFORM}/html/* ${D}/${datadir}/matrix/html
     install -d ${D}/${datadir}/matrix/images
     install -m 0644 ${S}/images/*.png ${D}/${datadir}/matrix/images/
+    install -m 0644 ${S}/images/*.svg ${D}/${datadir}/matrix/images/
 
 }
 
-- 
1.6.3.3



