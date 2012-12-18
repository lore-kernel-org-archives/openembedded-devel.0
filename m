Received: from mail-gg0-f178.google.com ([209.85.161.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tl4kW-00043L-On
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Dec 2012 22:30:53 +0100
Received: by mail-gg0-f178.google.com with SMTP id u1so274414ggl.23
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2012 13:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=0SFDuULQi8WPpQSVLPIhszj4TZwGpOu4Q8BwswE2dCo=;
	b=C/BPHYck7dw77ltMbIi7RlhvX9/Vr670VddgrweVa1hMuOcp7NGOQLxtPPz5BD0gqW
	ItrkjSl3xFqSR4xKP+avsN7Y3Pj3/qs+AUG4RYmSzgTyoqaAd1gXwBqHCgoggc2N98ue
	Hd+WIvxsxlV8Q4oWDiHoeVsKLoTEYnZvLMj6TIlyzzXsFTQY/TqVm/BoqWq7RPog2JN+
	RMy4+HdyNHDMuEeS/6qpezYZvibRuRP0vZicBTwOklbmGiy8Kc0Am7JsMmIFBlHu6aje
	yQRn55Z1xGCYujXCecehPdL2kf33ZKzjLtCtuHQL6IsmDksHSpJgGOzXl+ZWaDnbqQCe
	+h5Q==
X-Received: by 10.101.94.20 with SMTP id w20mr982211anl.2.1355865370269;
	Tue, 18 Dec 2012 13:16:10 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id h37sm2441909anm.10.2012.12.18.13.16.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 13:16:09 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2012 19:15:57 -0200
Message-Id: <1355865358-21642-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
References: <1355865358-21642-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 2/3] xinput-calibrator: Fix service file to require display-manager.service
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
X-List-Received-Date: Tue, 18 Dec 2012 21:30:54 -0000

The xinput-calibrator.service had a requires to xserver-nodm.service
but in fact it ought to wait by any display-manager to be initialized.
We fix it changing the require to display-manager.service.

Change-Id: Ie6fae0ec8053ab888ac0df48c9710e7b9e23fe43
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xinput-calibrator/xinput-calibrator.service    |    4 ++--
 .../xinput-calibrator_git.bbappend                 |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
index e23bfc4..2301876 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator.service
@@ -1,8 +1,8 @@
 [Unit]
 Description=Loads xinput calibration data
 ConditionPathExists=/etc/pointercal.xinput
-Requires=xserver-nodm.service
-After=xserver-nodm.service
+Requires=display-manager.service
+After=display-manager.service
 
 [Service]
 ExecStart=/usr/bin/xinput_calibrator_once.sh
diff --git a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
index e12abec..5bc5bc3 100644
--- a/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
+++ b/meta-systemd/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.7.2.5



