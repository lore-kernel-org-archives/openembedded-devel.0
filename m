Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7506F60034
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:22 +0000 (UTC)
Received: by wixw10 with SMTP id w10so29397809wix.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=R7S0qRpJY/OIPP3RIeTUE40jo4wW0bnuSLhMUyyMSmg=;
	b=Z5UaAibbGCB59gFhgigM+75m2H2/rc7lrGbIpf7ZY/uTuUG3O2tjoPAx7qCfdx7+U9
	+0L3Rzqx5NS0nhG6s91W+bvVfQrW3jrUGbqtcUD0oC2wDt5WmnNUhS/1rA6jWRhk/meo
	TIIZpX6fpTfl3YDbkoETaQ7+Y0GenxqXxW8e4sR08loMgz8ep1QbfP7K/yWu+y0YJ21m
	eT2NPJMMl+scELHqOJ+55sK55r8tyN0bZnPC8wumqNVcWb/FG0b6CZwBuG+UbyYpb0l8
	r+kKQuqvRRWBnxkakdeAMUHbSjZramc+xrxLa5EaPvUhdE2z2JXoNZ41rXCwMtw8pP9E
	/Ulg==
X-Received: by 10.180.78.136 with SMTP id b8mr118951711wix.6.1426462463047;
	Sun, 15 Mar 2015 16:34:23 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:30 +0100
Message-Id: <1426462419-10173-22-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 21/30] xfce4-whiskermenu-plugin: update to 1.5.0.bb
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-whiskermenu-plugin_1.4.2.bb => xfce4-whiskermenu-plugin_1.5.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_1.4.2.bb => xfce4-whiskermenu-plugin_1.5.0.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.0.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.0.bb
index 7764109..f7b0616 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_1.5.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 inherit xfce-panel-plugin cmake
 
 SRC_URI = "http://gottcode.org/${BPN}/${BPN}-${PV}-src.tar.bz2"
-SRC_URI[md5sum] = "967bbff0e98fdf0c1b78e61b3b152c2d"
-SRC_URI[sha256sum] = "7266d7a16df4bffe6f00d3d4711b8b8fd972491bac70f13a9d7edd9f0472d311"
+SRC_URI[md5sum] = "32fcbf16931038c10b1b7a7ccc392132"
+SRC_URI[sha256sum] = "da82bdbc899a9935b560323aac9037d44f37fb110509b80ec293196722671851"
-- 
1.9.3


