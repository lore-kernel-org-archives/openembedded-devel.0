Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RXsUc-0006yo-U5
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 11:43:23 +0100
Received: by eeav2 with SMTP id v2so932295eea.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2011 02:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=f+Mbs8YMXTrvE3IToWWtfxCdW0ChG9B01miywFzfSiI=;
	b=E17UuxUF+L+yMbtHECo5cEC0A4evahN6K8VOGrQuF5VwXDfDoJop7HkFCkkfuPtfL/
	rEF/UqC2ZuGPi1jVjtE0zOBIjQ6sSLB+qqv6zoqFThIbZsw4YB21mdIL0cq7CdNccwkc
	o40V4p6RSkaCNOCpO4kM5cfRppq54wAXnq5Yk=
Received: by 10.213.28.11 with SMTP id k11mr1168512ebc.101.1323167792715;
	Tue, 06 Dec 2011 02:36:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z54sm69658346eeh.5.2011.12.06.02.36.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:36:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2011 11:36:07 +0100
Message-Id: <d5b2825b5023a31e85196bb4b5b74ff6d470474b.1323167378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
References: <78add3cb4853a6c50ac4f8b41f92b85d6c31a6b3.1323167378.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323167378.git.Martin.Jansa@gmail.com>
References: <cover.1323167378.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 3/5] vala-terminal: upgrade to 1.3
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
X-List-Received-Date: Tue, 06 Dec 2011 10:43:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../vala-terminal/vala-terminal_git.bb             |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index 2549fd6..e81e952 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -1,12 +1,11 @@
 DESCRIPTION = "A lightweight Terminal Emulator based on libvte, written in Vala."
 SECTION = "x11/applications"
 DEPENDS = "vala-native vte"
-SRCREV = "6cfb8bf8eb1a3812e39fac10a4810b6680fa066a"
+SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PV = "1.1.1+gitr${SRCPV}"
+PV = "1.3+gitr${SRCPV}"
 PE = "1"
-PR = "r1"
 
 inherit autotools perlnative
 
-- 
1.7.8



