Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QqJEW-0001GM-HV
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Aug 2011 08:22:40 +0200
Received: by iyf13 with SMTP id 13so10290080iyf.16
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Aug 2011 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=lv9YwIxqUaumTQD8y7T7E/2LhZ32CEVzDC/nXoG0bTQ=;
	b=EYkFCLuxzoPaArFfn/EeMUy3oQHl6Cywcq8MKCU+Of3fJLSio40DdkTvOu0F0UdQRi
	xH/zi+b1tO+cr8aajJgI0Xd6STTPkOypzXYsY9ZW2Rk4bG+pwR5ajjZXJgC/N44XzntZ
	BGzTzkmRtdVn/zZ2p2gWHjG57Gbbmf7ggzXkk=
Received: by 10.42.18.136 with SMTP id x8mr1730828ica.31.1312784292367;
	Sun, 07 Aug 2011 23:18:12 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id t14sm3992823ibj.47.2011.08.07.23.18.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Aug 2011 23:18:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Aug 2011 23:18:06 -0700
Message-Id: <1312784286-3163-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] systemd: inherit perlnative
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
X-List-Received-Date: Mon, 08 Aug 2011 06:22:40 -0000

otherwise intltool fails to find XML parser module
as it uses perl from build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index 44f2e7f..525e2d2 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,9 +14,9 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r1"
+PR = "r2"
 
-inherit autotools vala
+inherit autotools vala perlnative
 
 SRCREV = "612e58b45b84eda7e1f2a82fdfc006f1ae421cb5"
 
-- 
1.7.5.4



