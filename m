Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TdnZF-0001lo-UR
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:45:12 +0100
Received: by mail-oa0-f47.google.com with SMTP id h1so13559894oag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=A076bFTkZw1lp03R1nTnN9BV1aS8tIvm28GpVF0ItFU=;
	b=xfSt+X+5atjSislGbLnZ78CdxXYQkcwnP8RkHyxfbTjYsTHuN8S7T2ek4zOns7wl/l
	D7IuK6dThuLz4u9H+ZsOb5CUO0s35kX4xQte4Ctnct3AHN/ViAbXFyfhhrh+30CjvYB/
	4NnuSorpVH406kAw3q+Z/NyKoj+tuRCqkydXG4sY75T1MtrISpRPAYH21DJhcJj273jq
	BaA470WscZz7Y39apCe9KeAwVUIS8JvQ7MgSwKmeOC68Z5JZuhGlQikNOGa28Pa1JiOw
	Z/JH9gtRzekWKznTgcmtdA1HiUlM4LHVLmbIpBs56S9Wmz9SvBqLOezCE6ly+dPZHOc4
	8J7A==
Received: by 10.182.95.205 with SMTP id dm13mr5319237obb.9.1354131054779;
	Wed, 28 Nov 2012 11:30:54 -0800 (PST)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id h2sm19267644obn.11.2012.11.28.11.30.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 11:30:54 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2012 17:30:35 -0200
Message-Id: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [meta-oe][PATCH 1/6] freerdp: disable man pages generation
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
X-List-Received-Date: Wed, 28 Nov 2012 19:45:13 -0000

Man pages generation uses xmlto, and it seems that it is currently
broken on OE.

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



