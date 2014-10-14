Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id BC1B26A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:35 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id h11so7238889wiw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=2/nfib2b5uvM2cy43ztSn2D8YQHfptVwCWMwndsDw/g=;
	b=E3APlPg04cr2dIapHw+qsAgUf3Dq2sCegqx+4YskVipc7fKS7b/idJQ4/ZYhnjKrK4
	LgLLc3kafyqNYntyzrtLFQcmSuC+7ysb1bJAC1fBs4CuZqxdEnLF0uycbiAcZE7Ws+1z
	2A/8X7hzYFg5R5Nu7NSsjMUxsEdg3xNOc/zLw7MqFtyI8bhAOrrbw3Pkvkv1FmbzNtyy
	5cEqbxmzc/qe/AfuVVDjAvADUuD3t8PK8hSCt/ii56FzGsJJx8HDm/fKfGUMW5PU3MAH
	F0mJISGSOtN4vM/pQ1XL/LP+uKcx+pW/5aVQmRAQhRerB2sUUV2eKF1v8DGzTrc+28yF
	4mew==
X-Received: by 10.194.103.74 with SMTP id fu10mr8392383wjb.0.1413324877206;
	Tue, 14 Oct 2014 15:14:37 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:14 +0200
Message-Id: <1413324868-11856-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 01/15] xfce4-clipman-plugin: update to 1.2.6
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...{xfce4-clipman-plugin_1.2.3.bb => xfce4-clipman-plugin_1.2.6.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.2.3.bb => xfce4-clipman-plugin_1.2.6.bb} (69%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
similarity index 69%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
index 06f0d94..aee4a3d 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.3.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.2.6.bb
@@ -8,8 +8,10 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xproto libxtst"
 
-SRC_URI[md5sum] = "61f3be97efa379cb358980c94e14692a"
-SRC_URI[sha256sum] = "4424447067cb2c3972c375330d2e1d19f12e59c41bd03e111c2e6e9e174a5067"
+SRC_URI[md5sum] = "f7f2440647493243cbd7787eaee92fcb"
+SRC_URI[sha256sum] = "23043f99c3e5257d1f3d68b5ee5125e3469c15620d098e22c6250386197f48a5"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[unique] = "--enable-unique,--disable-unique,libunique"
+
+FILES_${PN} += "${datadir}/appdata"
-- 
1.8.3.1


