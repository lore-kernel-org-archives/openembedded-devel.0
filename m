Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TQfBq-0000vi-Tk
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 16:10:42 +0200
Received: by mail-we0-f175.google.com with SMTP id t44so1998699wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=e69N4W/W1G8k4isXG94a2sfTwfw2M1CgWyiTwqXxl4c=;
	b=ccanBM//hRwTaUV5XDqxXSeESj600gHpp9omw8zy1GdXm1o9CLJxxJhckDnlzIPSLV
	ob8khcCeU0in/XPKyhvV0eUDYHXFyaG8X/FkC0VFTSF/eCMfvxJUROMnpliuwQvUnLEJ
	R9kZ/O9W+OAaoADMF4p6OImGylp/Ng17OBTfJyVk7L8uSH6D2i/Un775/v2tiOY9+UmS
	N5uyfo8Tztzga07StH4mheLINYzOmgNeUQeiNmtD3FpZXGcnXq8u4We6IOCk6gZiyMgJ
	+iA+Jp2mVWsvVYUFHYB4UWf7kQoAWVcge3/vAEapemcdUQFYfB3bFMJoRdwm3kwpH8r7
	U9LQ==
Received: by 10.180.94.73 with SMTP id da9mr29406267wib.19.1351000636918;
	Tue, 23 Oct 2012 06:57:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm19357798wib.0.2012.10.23.06.57.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 06:57:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2012 15:57:31 +0200
Message-Id: <1351000651-16335-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Subject: [meta-oe,meta-systemd][PATCH] systemd: inherit pythonnative
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
X-List-Received-Date: Tue, 23 Oct 2012 14:10:43 -0000

* otherwise configure uses python-config from host and passes wrong CFLAGS
  see http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-October/042058.html
  for details

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/recipes-core/systemd/systemd_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index efc2d95..b89bd76 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,9 +19,9 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r8"
+PR = "r9"
 
-inherit useradd pkgconfig autotools perlnative
+inherit useradd pkgconfig autotools perlnative pythonnative
 
 SRCREV = "4d92e078e9d7e9a9d346065ea5e4afbafbdadb48"
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
-- 
1.7.12.4



