Return-Path: <ashcharles@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5CE8C718E4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 01:46:15 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so32299760pab.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 17:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AZKSuO4scIhIyTV1PYzBaikViCzwOqr3b+rjhlb5Hm0=;
	b=cOdVaeuUGlogAkrqZAmQsLNbRKw0tf1u3NWusBGcoyiOhBTlofZjOBvefj7ig46EJ8
	AtVkmJaJanAmd5cWOUVdsFeNxWU5Oa5Y+GXrzqIuAqPwtAh5n4EbfKI/D7O2+aDVaW4A
	iZV/52vne5jS4fHVQE6zDE9EPpBN7cQ5hyowEVzaqpa3U8d38HRs96OsUm+y02TZaXkr
	mJunXmpQmr+OvkSFdC2JIwZG2DxD4Z7im+zQBa/XccwjwE+MRIANJMQNQVGNIH9fK2wx
	+xZhbHbUsg7RtPfcf1UreX1gMLyzLr+LOQiiiIOKpqD3A+x4gQcexUHq07vsnTcZOyfn
	m1/A==
X-Received: by 10.69.20.10 with SMTP id gy10mr10522406pbd.76.1422495976399;
	Wed, 28 Jan 2015 17:46:16 -0800 (PST)
Received: from localhost.localdomain (104-37-60-13.dyn.novuscom.net.
	[104.37.60.13])
	by mx.google.com with ESMTPSA id tu7sm6070683pac.6.2015.01.28.17.46.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 Jan 2015 17:46:15 -0800 (PST)
From: Ash Charles <ashcharles@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jan 2015 17:46:13 -0800
Message-Id: <1422495973-20050-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] xfce4-wavelan-plugin: Specify BSD license
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
X-List-Received-Date: Thu, 29 Jan 2015 01:46:20 -0000

This software contains an older or slightly modified BSD license in
its COPYING file and assigns copyright to the specific authors.  The
code (see the wavelan_show_about function) makes it clear that a BSD
license is intended:

      "license", xfce_get_license_text (XFCE_LICENSE_TEXT_BSD),

(caveat: and of course, INAL)

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
index 487a5b8..7a3335a 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Panel plugin displaying stats from a wireless lan interface"
 HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-wavelan-plugin"
-LICENSE = "BenediktMeurer & FlorianRivoal"
+LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
-- 
2.1.0


