Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfYiW-0006mv-Fh
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 17:18:00 +0100
Received: by mail-ob0-f175.google.com with SMTP id vb8so2539248obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xE1BVDVawbXPG+1n4yW7sQuw1wdfu94cqSMdHlPe74I=;
	b=lBxh4Jks7LJZXWak5etqX3qURaWzXLUnvjSXmDAuGVt58a7xoS8jsE5JMK0IggBGc+
	xtZe1xU1FinWI4iporJ8P2uHEvqaRMuv0xhCkpXgjzq8tDT+PKYcAY2ndZJJD0SwkzY8
	HStLbDvgL58YFpnWBmBC37AYkFxD7CL1sWIiPeUjNdKogaxBxP2v0dE/sjGMlhI6vex4
	3B1L7S+++GgJk0ZiG8z1aqa2NsZfQNOuMCW3N0zFjv0COnrIfx3rhM8rQHpc+XdN4Pwc
	A+uAJ1rH0Gui10URKmh9hO3GlkIJeVhztmWA/GGREDYwOx89WkjVx8WwZriAy1a7gfwe
	oEVg==
Received: by 10.182.31.50 with SMTP id x18mr4675699obh.56.1354550618651;
	Mon, 03 Dec 2012 08:03:38 -0800 (PST)
Received: from localhost.localdomain ([187.23.153.69])
	by mx.google.com with ESMTPS id el2sm13739774obc.9.2012.12.03.08.03.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 08:03:37 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 14:03:21 -0200
Message-Id: <1354550606-10377-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCHv2 1/6] freerdp: disable man pages generation
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
X-List-Received-Date: Mon, 03 Dec 2012 16:18:00 -0000

Man pages generation uses xmlto, and it seems that it is currently
broken on OE.

Change-Id: I1dccb9339c20b0b898344cf60c02a705d9c32794
Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index 35228ad..099a80e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -7,7 +7,9 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
 
 SRCREV = "e0f2b3ccc986a165d9c289a569b60eab66153792"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git"
-- 
1.7.2.5



