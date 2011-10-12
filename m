Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDo9H-00019M-S1
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 04:02:24 +0200
Received: by iafi7 with SMTP id i7so6615iaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Oct 2011 18:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CHreQUnUnVIsMBAQRZ1FGt9EBg9DVLuaHePF3SFpIV4=;
	b=oO10uKajtZPlgSH3AIkYTF9lerwbSdalJsz42ViP1EzsQPa8RiXoFUCIvCqPjdSXvg
	xAqkVW1cChkS1YLcJvti/n9UrA0kzL0qoBxg9yHlBYAH48rpvU3ixuwvzdPyAkOpiZGE
	5GN1Y4lGQjovn7vXJcS2acnuseCKGKqysGMgk=
Received: by 10.231.82.12 with SMTP id z12mr11733011ibk.36.1318384600486;
	Tue, 11 Oct 2011 18:56:40 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id 2sm1471311ibf.0.2011.10.11.18.56.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 18:56:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Oct 2011 18:56:29 -0700
Message-Id: <1318384589-17127-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-intel][PATCH] xorg-xserver: Include xserver-xorg-lite.inc instead of xserver-xf86-dri-lite.inc
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
X-List-Received-Date: Wed, 12 Oct 2011 02:02:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb    |    2 +-
 .../xorg-xserver/xserver-psb_1.7.99.2.bb           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/common/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb b/common/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb
index 81d70bc..c3d6d02 100644
--- a/common/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb
+++ b/common/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.9.3.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+require recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
 
 PROTO_DEPS += "xf86driproto dri2proto"
 
diff --git a/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb b/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
index 5227faa..28d77d5 100644
--- a/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
+++ b/meta-emenlow/recipes-graphics/xorg-xserver/xserver-psb_1.7.99.2.bb
@@ -1,4 +1,4 @@
-require recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+require recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
 
 PR = "r3"
 
-- 
1.7.5.4



