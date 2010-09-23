Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chasemaupin03@gmail.com>) id 1Oympd-0006og-C1
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 16:32:21 +0200
Received: by gyg8 with SMTP id 8so407635gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Sep 2010 07:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=i+/bysIKzGAjICLC5QEjNcA5Ijsm3uV3q3s4g/Q3Llo=;
	b=WRzj7CgkvIpf7o06QHhI1+PI4GHxOxY3y+IxJgaGxjfWBlqnsJD4PQyduSF7d7D0IK
	jUwRFe8eSYAtglshvKQIKR41rG0sQUDyVBmb5EJeDM8Kzna4A0HqUahOhWYu6Ep5m8Rn
	99ICez41nXg7Yu022FoulgDOotE7cLObXymic=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=rZZYAvpmG4zfgrtgR0MuxUHYyGfJPAtTGW6Xf1NaTNMfD8o/anryFaNqdneJgGzY8r
	ii6vO5EALtkayTsIJNNvzX4QsX2udx4zwfXz2ZMSrXm+QHHL+QJuoOCIDZxVFPs3FxzK
	joiQBm7Zem2Q025A8IjrNXI1HpqoNnjy+nVqI=
Received: by 10.151.132.21 with SMTP id j21mr2914369ybn.104.1285252269565;
	Thu, 23 Sep 2010 07:31:09 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id u24sm1050786yba.21.2010.09.23.07.31.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Sep 2010 07:31:08 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Sep 2010 09:18:48 -0500
Message-Id: <1285251528-11416-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: chasemaupin03@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] freetype: update LICENSE field
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
X-List-Received-Date: Thu, 23 Sep 2010 14:32:21 -0000

* The LICENSE.TXT file says that freetype may be licensed under
  either the FreeType license or the GPLv2 license.  This patch
  updates the LICENSE field to reflect that this software can
  use either license.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 recipes/freetype/freetype_2.2.1.bb  |    2 +-
 recipes/freetype/freetype_2.3.12.bb |    2 +-
 recipes/freetype/freetype_2.3.6.bb  |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/freetype/freetype_2.2.1.bb b/recipes/freetype/freetype_2.2.1.bb
index 0fb2c9c..b67da31 100644
--- a/recipes/freetype/freetype_2.2.1.bb
+++ b/recipes/freetype/freetype_2.2.1.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
-LICENSE = "freetype"
+LICENSE = "freetype GPLv2"
 PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
diff --git a/recipes/freetype/freetype_2.3.12.bb b/recipes/freetype/freetype_2.3.12.bb
index eda6ee5..f7c3d1c 100644
--- a/recipes/freetype/freetype_2.3.12.bb
+++ b/recipes/freetype/freetype_2.3.12.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
-LICENSE = "freetype"
+LICENSE = "freetype GPLv2"
 PR = "r2"
 DEPENDS = "zlib"
 
diff --git a/recipes/freetype/freetype_2.3.6.bb b/recipes/freetype/freetype_2.3.6.bb
index b70bf56..e92bef8 100644
--- a/recipes/freetype/freetype_2.3.6.bb
+++ b/recipes/freetype/freetype_2.3.6.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Freetype font rendering library"
 SECTION = "libs"
-LICENSE = "freetype"
+LICENSE = "freetype GPLv2"
 PR = "r0"
 
 SRC_URI = "\
-- 
1.7.0.4



