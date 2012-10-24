Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRAzh-0005Eb-3J
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 02:08:17 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so770869wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Oct 2012 16:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=g134I1FhVapwniN2UQmJh7w6SUeUpSyBUKrjk29sw30=;
	b=Qp9AuoIZ5lsUx1fM+SSQ62JTwLonQm3hAuiMgUHimJNBQnN9V2iCbWb6Hk/2O8EWcP
	fdFqXznVnQC2ufDBXl0pHdhTfoGg0YavYYUIvnYjFbDYkept1jeVlnrM7GyqNHPJNuN4
	Ge0fNCCxaYpmSJ/PA1ihwHQV3PbkkNKWmBTZhRdCneam8051bjeIwpYCArGl6COVG+64
	lFRMMIXIiAOptYW+x2QmZS2+mMAfsVy7pKjOK8D9VRGRIldMpoOSqW6ROusRRgBQXVXc
	Eupzc2a81fW7qHvfIYQ1TIe1531nr9rCfo7RzTdH82uYjFZfe26lV6jIC5Tz6h0WcOYw
	Vr2w==
Received: by 10.216.85.212 with SMTP id u62mr10937162wee.185.1351122889404;
	Wed, 24 Oct 2012 16:54:49 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cn6sm7864313wib.9.2012.10.24.16.54.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 16:54:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Oct 2012 01:54:26 +0200
Message-Id: <f040b0321d939cd86e382b44348e97353049266e.1351122431.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1351122431.git.Martin.Jansa@gmail.com>
References: <cover.1351122431.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/8] vala-terminal: inherit vala
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
X-List-Received-Date: Thu, 25 Oct 2012 00:08:17 -0000

* we need to export XDG_DATA_DIRS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index e81e952..4e76534 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -1,13 +1,14 @@
 DESCRIPTION = "A lightweight Terminal Emulator based on libvte, written in Vala."
 SECTION = "x11/applications"
-DEPENDS = "vala-native vte"
+DEPENDS = "vte"
 SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 PV = "1.3+gitr${SRCPV}"
 PE = "1"
+PR = "r1"
 
-inherit autotools perlnative
+inherit autotools perlnative vala
 
 SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;protocol=git;branch=master"
 S = "${WORKDIR}/git"
-- 
1.7.12.4



