Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id BF1567D01B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 10:21:47 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id o25so1569009wmf.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 03:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=AuBxSXtIj3wwvlRAV2JXk02wm53PtNT+7F/JwGRei7I=;
	b=Wz052ZrBGCNYXydWtKNWFBGxrjjkzAbIElGTkt0lKFWd3l9+0Y8+0uMphI/WBV0UKE
	xyJdL+VUKFvM6n2Ze2XwtWaVFABhvHythXsDVbdPCkhfXwFxqFIoDDNnI17EXXgVCmGY
	+CrDURb00HDWUs5qTS3VzGdDjVyQUO4g7tqKlXA+DXEEsGTQirIp2I8UnvBVoG6ls3Sb
	/HIxDzOa0ScDbi+5wYKrnURWClbwmabeDHar/LQmwQ02wb58DV4b+ccsPxlFPXbx4ihe
	B40f2gcYMBUDrBCbZFE/dw5uenZVQmiJfEe/+Af18KBO7dpnw2b/fcCYZ/vHOU0hES7H
	qBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AuBxSXtIj3wwvlRAV2JXk02wm53PtNT+7F/JwGRei7I=;
	b=ckjnnq1C4pcUErZKkt32EKBPQGPDHND2sLJaf196hHswaQqKc2vs4KMMwTzngqqg4T
	jlPVBaQhMGj6sYIJYaLxC8wouiKTGfvSLJI6sLP/4QGvGTlcRRu9rHMhskNLKFmcyfo0
	hElOXkjN1wL9n4E4nAzUCZOs2e/AP4smssOGXg1mGb/EkMyeXdjmzsGnh4ACqVbYMejx
	9qcHaDmABvF3viBQuv8poXhm+7rzkezNEv0qrB3ViZZotMNhLChb1kiXtbAlk2qN3wqy
	SL3TgLRJ9fcitB84FLtIm/rqtCulJS1C5qObKue++YNT9e8kiMkV929JJaIT2jo24JNZ
	RplQ==
X-Gm-Message-State: APjAAAVFygdnklNyUlVECHsXUo/XhdNHpr55ayN/2H4VXbxZO/Bcjfyu
	RFRTNyoazVpyaJpiLRe83i+Ucnwk
X-Google-Smtp-Source: APXvYqxa4MDIKLzyebz3Kuwl23ETi/A9WDq0X3vFVH0DhBJ4g+nbs9CFkLVE1PgEDGU/6JvkKNKjmQ==
X-Received: by 2002:a1c:4105:: with SMTP id o5mr2587845wma.35.1553250108400;
	Fri, 22 Mar 2019 03:21:48 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	t69sm12255677wmt.16.2019.03.22.03.21.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 22 Mar 2019 03:21:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Mar 2019 11:21:25 +0100
Message-Id: <20190322102129.5067-7-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190322102129.5067-1-schnitzeltony@gmail.com>
References: <20190322102129.5067-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/11] xfce4-calculator-plugin: 0.6.0 -> 0.7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Mar 2019 10:21:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Another plugin ported to gtk3

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...lator-plugin_0.6.0.bb => xfce4-calculator-plugin_0.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/calculator/{xfce4-calculator-plugin_0.6.0.bb => xfce4-calculator-plugin_0.7.0.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb
rename to meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
index de0d0a06d..1216456b4 100644
--- a/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/calculator/xfce4-calculator-plugin_0.7.0.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=909430f63fddd63f120ba29e8979f65c"
 
 inherit xfce-panel-plugin gtk-icon-cache
 
-SRC_URI[md5sum] = "1b956a89693d039a61b4725cefb23a4d"
-SRC_URI[sha256sum] = "eb51765580ea4650f9cf062382a820fb6483ee5dbe003aeb6f063929e299f9c2"
+SRC_URI[md5sum] = "1ae192a69834ee2f51f34a0a981181f4"
+SRC_URI[sha256sum] = "7b50ab947ab058e1c079113e7f0f8b38ef242fec36ec9f31bb4e3c19cb3f9de9"
-- 
2.20.1


