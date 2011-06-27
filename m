Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QbHhQ-0001Bv-U7
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jun 2011 21:42:25 +0200
Received: by gyd12 with SMTP id 12so2100294gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jun 2011 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=mZV6Yov4eMklXg6Skt91ZFDTFlqGB/QVcW4pV581xbU=;
	b=Vbb3BN8IUcGktaFZHKqRGgl5JSS8Ftmjrdg2On5DGGkq5s/gbHQJDdYPSp5AfG2Yxv
	4aMc0RTSNp9C6Ag7pm3WcEney5svTGZsEPIKyng3iVKoluryKgNraRqs94ofsg5aykxE
	tUc2LMDp+wUde4Nvks2iw3f64EdBWi56VI+2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=SzS+ZeFBQGykDejDyXclitQxE4e8iy+egEgY4lsIwAkGkNhYL0lU2PUWPChq05C75g
	MmNYWWV7jxlhtPzTaprE9XqHy1YLryTstoGMjIxtMhaCexrSCYYGkxqoKx6cUsKMNZnf
	9uiKAgxeR6omLYi7QXAevoScPcJdsg76i/MWM=
Received: by 10.236.157.197 with SMTP id o45mr9996346yhk.44.1309203523049;
	Mon, 27 Jun 2011 12:38:43 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id e24sm3675890yhk.51.2011.06.27.12.38.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Jun 2011 12:38:42 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jun 2011 19:38:23 +0000
Message-Id: <8efb3511bf35aa7aa66398640679e73b6e617cc5.1309203431.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1309203431.git.otavio@ossystems.com.br>
References: <cover.1309203431.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [[meta-oe][PATCH 2/4] freerdp: bump SRCREV to gather fixes
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
X-List-Received-Date: Mon, 27 Jun 2011 19:42:25 -0000

This new version has many major refactorings that will be available on
0.9.0 release but the main fix is related to serial port redirection
that has got many fixes and improvements.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/freerdp/freerdp_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb b/meta-oe/recipes-support/freerdp/freerdp_git.bb
index a5f158a..a3f4a03 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_git.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_git.bb
@@ -9,7 +9,7 @@ PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
 PR = "${INC_PR}.2"
 
-SRCREV = "dd759622a097474114ce425021ef52d0aa5d3957"
+SRCREV = "d1eef40acc994d85cb78c0a98914edc097c9b44d"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;protocol=git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5



