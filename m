Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0079560034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:24 +0000 (UTC)
Received: by wixw10 with SMTP id w10so21272275wix.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=u0jDVDNRdkG7kjdKohxaba382ybUe8i31o3q49QFcs0=;
	b=Ik3XX/PWc+EZzyqPZmGGeYxlIioTF9zuQKTMixNzlUm3OsBV8VNg99HbVgalq5eL1U
	Hdvr+r1FiVMMclUgSrVxz8opF67e94CSeA7t79IM6mWwnp43bomCdR9koUcPleeyZuBv
	uQWhjL/L6N69PG49/kqTZ3Le83U9bhnUntmN3/E3wHT89LLsfM1CVAokObdrkaewd522
	umsEliDL5Qq/l4jMSpwvwz9jIeNq6KEnFZ836OlP+BiEgq1DsBLuI9G5xD/8n7C/Ufe1
	EfsaDtpsCWqjg4lkh3g94GDCN+00mkiJDs1TG+ykyTn+YxRj+Gpr4CMXQY3lF6IfvPAH
	6YJA==
X-Received: by 10.194.243.1 with SMTP id wu1mr119871340wjc.69.1426462465878;
	Sun, 15 Mar 2015 16:34:25 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:32 +0100
Message-Id: <1426462419-10173-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 23/30] xfce4-mixer: update to 4.11.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This did not make it into the official Xfce 4.12 release. Reason is that
mixer interface was dropped in gstreamer-1.0. As long as we support
gstreamer 0.10 keep xfce4-mixer.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xfce4-mixer/{xfce4-mixer_4.10.0.bb => xfce4-mixer_4.11.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-mixer/{xfce4-mixer_4.10.0.bb => xfce4-mixer_4.11.0.bb} (72%)

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
similarity index 72%
rename from meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
rename to meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
index aa3202f..bdbec45 100644
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.10.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
@@ -8,7 +8,7 @@ DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
 
 SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e47d5b3e873fdee3fa80d309a5f53e9c"
-SRC_URI[sha256sum] = "a8c589001b438171ea5a6b46ce9895c3ffbc5081ab67805ab9870e540068dade"
+SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
+SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
 
 RDEPENDS_${PN} = "gst-meta-audio"
-- 
1.9.3


