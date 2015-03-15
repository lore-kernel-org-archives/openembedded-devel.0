Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BEB1A73949
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:29 +0000 (UTC)
Received: by wgra20 with SMTP id a20so27053391wgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=YUxpLJ6VVDp3xt72/Ssmsa8D01IfEolNJ9lP4tTwp1M=;
	b=QFfV3SiSekWc0TvMrUGeks1PaksOqmsbmwN6j6umUkHAhmM1vYgvmYWSr/edJOrSxh
	UEaZ0c9bdW7eBV+wSGJwIgzglur56kqJyccHKZFO3HfGpTR5wYwulFvyUtU5QtDuGLyK
	ZaICKFE4l60z7OUuC+EtxxrJqESIyj1Yv7o/ZAMgcHGU8JiqD16l1+Xm9AGBlp+9Az+Q
	1JaLq0fMFdhLQupu/gPZjBh2v1jA+tzQzfVF318sGTpIgdgVUwQegy9XqccTsQAtiF5G
	GJPa7LXN0NIBw1pVp1ydvS3z6J8Z8EhQnNXgz05nSd4wzT6OH8+8gLm/mPl/PCWRVh2v
	Axog==
X-Received: by 10.194.21.137 with SMTP id v9mr115215241wje.140.1426462470589; 
	Sun, 15 Mar 2015 16:34:30 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:27 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:34 +0100
Message-Id: <1426462419-10173-26-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 25/30] xfce4-wavelan-plugin: update to 0.5.12
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-wavelan-plugin_0.5.11.bb => xfce4-wavelan-plugin_0.5.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/wavelan/{xfce4-wavelan-plugin_0.5.11.bb => xfce4-wavelan-plugin_0.5.12.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.12.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
rename to meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.12.bb
index 7a3335a..1ccd557 100644
--- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb
+++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.12.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e1e5872df9c5cf1a23f16493d9104920"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "50514bb286f1ed6761a1b36832bb7fe3"
-SRC_URI[sha256sum] = "fe06c7ffc29c2d4ca7bc452b3356825354e276565de9b0a2d087ab55471755ae"
+SRC_URI[md5sum] = "3ba5ee0626612942d249d4a80a1a67b7"
+SRC_URI[sha256sum] = "67dce45739f063b95e2bc2232c625277685887b1f84088316d919671b5500ac4"
-- 
1.9.3


