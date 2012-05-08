Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRs4e-0005bo-NP
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 23:36:00 +0200
Received: by wibhj13 with SMTP id hj13so1048773wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2012 14:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=3fhBT99mAJOx11cty+IqlapLStJjwaCWg3OYNdnqYuw=;
	b=c8rpID2O1SjWIfYRruZMWYyrVcpY6dl3StnWjKDkmdZx4H5eMjOupp3zDIVXXCPGAS
	ztDnvEQBGlky50vBod7rE7F5wVjoFSRyhn6EaQdfjbqJ8ZmyEqqHlipMLaKEvyCm7m9f
	WLJDhak/3L2MlR3zCMrru6T6jwwBhPi0YaYYNOU3loE1GVTbK1EjAapXBEmnQ/dInLQK
	0mikdt0ZK92TCkyuIK5PXDoBZho1f/Py880uHSJ+DXkoKOnzvws/Oc4d+zemaVUpNPDG
	+8s9wmo7E4uqJYR8N8KuXtu8L9hCIv1I1lPiZ7lAd4tDbb+8bN870Izdclec3y9vNeT/
	Rzzw==
Received: by 10.180.75.241 with SMTP id f17mr48135040wiw.11.1336512368866;
	Tue, 08 May 2012 14:26:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e8sm31671410wiy.3.2012.05.08.14.26.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 14:26:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 May 2012 23:26:02 +0200
Message-Id: <1336512362-8693-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-oe][PATCH] openssh: rename bbappends to match new oe-core version
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
X-List-Received-Date: Tue, 08 May 2012 21:36:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...enssh_5.9p1.bbappend => openssh_6.0p1.bbappend} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)
 rename meta-oe/recipes-connectivity/openssh/{openssh_5.9p1.bbappend => openssh_6.0p1.bbappend} (88%)

diff --git a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend b/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
similarity index 88%
rename from meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
rename to meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
index de7668f..a459065 100644
--- a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
+++ b/meta-oe/recipes-connectivity/openssh/openssh_6.0p1.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 1}"
 
 SYSTEMD_PACKAGES = "openssh-sshd-systemd"
 SYSTEMD_SERVICE = "sshd.socket"
-- 
1.7.8.6



