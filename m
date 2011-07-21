Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1Qk1qZ-0002uK-Vy
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 00:36:00 +0200
Received: by fxh10 with SMTP id 10so4316241fxh.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2011 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Aix97U7czs9BNIkmvQdYBTYJDbAy+AUesxG9uuyPE74=;
	b=vgWiI7jEMtTj3pKFgldXJ6e+UR9bdzOSK0bNU6pXq+LykH1uqw5FCL7E/fP5fFZwQJ
	6vXjvvWt3sJqlpqvsMIPlEFjhQGOWYS0F0YADzvBGViwefhHVCfSnvuGBIp09Cj/v+nV
	EDBnOQE1BsgB2jQiYfVT+nOlohamPs+4GEXVo=
Received: by 10.204.8.89 with SMTP id g25mr227790bkg.10.1311287512078;
	Thu, 21 Jul 2011 15:31:52 -0700 (PDT)
Received: from localhost.localdomain (a83-245-252-47.elisa-laajakaista.fi
	[83.245.252.47])
	by mx.google.com with ESMTPS id f13sm331160bku.18.2011.07.21.15.31.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 15:31:51 -0700 (PDT)
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jul 2011 01:31:04 +0300
Message-Id: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] gpe-mini-browser2_svn : remove fixes SRCREV
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
X-List-Received-Date: Thu, 21 Jul 2011 22:36:00 -0000

* SCREV points to a broken revision which crashes due to badly initialized g_threads
  See http://bugs.openembedded.org/show_bug.cgi?id=5409

Signed-off-by: Philippe De Swert <philippedeswert@gmail.com>
---
 recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb b/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
index 6bc89c8..2aa55b4 100644
--- a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
+++ b/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
@@ -2,8 +2,6 @@ DEPENDS = "gtk+ glib-2.0 libgpewidget webkit-gtk"
 PV = "0.0.1+svnr${SRCPV}"
 PR = "r0"
 
-SRCREV = "9900"
-
 inherit autotools
 
 SRC_URI = "${GPE_EXTRA_SVN}"
-- 
1.7.2.5



