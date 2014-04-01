Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 306BB6F8A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:02 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so6324350wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2Yio/lGisRami9WmTGYpXSWAWkWoqiV0upBqyniHqn8=;
	b=t+tjeXZZ/g6rP/L/JVpd7dIkdDVadxzFTdT5nYEpah8Y7vRh3dclIhUd3wYDVuOzk/
	9z+MYGsx/xVJ0tjnwSXdvYhavZZ4ahEYzQmyPzT2lruPpyGIm2EenvDTNJ1MRmvciOZI
	f6fxob9JdSae0Gk4pDDcj5/zTD/ghpAZtS1OHcVtp6IX1wrM7UeNvV1YWpL7a0JbPPHn
	jfmvXf2E87rnadBhRj6oyd/8+l4QNOoz+tqIx1/z3t7aeXgdNk8Ilp64hMhd2/T/Vktn
	1fYrmM+xTB7SzSU0+WiyeSUydqDQSWvmeENllFbSgImShjO7tD9XdgaoHnCXarjj9/nQ
	vXiQ==
X-Received: by 10.194.174.100 with SMTP id br4mr4730462wjc.83.1396365723354;
	Tue, 01 Apr 2014 08:22:03 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:41 +0200
Message-Id: <1396365706-14220-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 05/10] xfce4-taskmanager: fix configue by inheriting xfce-git.bbclass
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 15:22:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
index 88e646b..289cf55 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Easy to use task manager"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit xfce-app
+inherit xfce-git xfce-app
 
 DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
 
@@ -16,7 +16,3 @@ S = "${WORKDIR}/git"
 PV = "1.0.0+git${SRCPV}"
 
 EXTRA_OECONF += "--enable-maintainer-mode"
-
-do_configure_prepend() {
-       NOCONFIGURE=yes ./autogen.sh
-}
-- 
1.8.3.1


