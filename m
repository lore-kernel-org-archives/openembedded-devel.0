Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 299D276952
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:16 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so182962108wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=xCy56WChALpG9JGtgsMwkTJqpf6IQBt2zGn9Tp/3H/Q=;
	b=bYuLykWkt7njWuQfKp9NbXWTc1UMNsH69zRUHMOLZ6DmR/K6QbNMoiETnQDWaX89RA
	PKkFnE/kbo+moKHiZnM59iJH0GxLJakv72933w3JDsZUiW1/+r8ijqe1Ojfh15XBSrd8
	4bdIL50Npah/px06j//5HH5oznNvDePWYgtyHTeAgzatp+h7wJn0LZrcIrmB3NVgOpL+
	GMVjd76XrkJFo7VzeDmmub6NcOCjkipDnM4jV/7UsNYwRuVtb/JTEUt8R+58EV8k4wne
	dAHxF4zJ30hx66m9X4g6OuLl7QalHyozR9UPwDSbr7Z07uFt/dvo5EY4wlQbq9lu23yr
	WBHg==
X-Received: by 10.180.76.232 with SMTP id n8mr34490633wiw.72.1439279896899;
	Tue, 11 Aug 2015 00:58:16 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:29 +0200
Message-Id: <1439279859-1815-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 07/17] xfce4-notes-plugin: update to 1.8.1
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-notes-plugin_1.8.0.bb => xfce4-notes-plugin_1.8.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.8.0.bb => xfce4-notes-plugin_1.8.1.bb} (78%)

diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
similarity index 78%
rename from meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.0.bb
rename to meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
index 451ec55..142b289 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
@@ -10,8 +10,8 @@ DEPENDS = "gtk+ libxfce4ui xfce4-panel xfconf libunique"
 SRC_URI += " \
     file://0001-main-status-icon.c-remove-deprecated-g_type_init.patch \
 "
-SRC_URI[md5sum] = "569341bc27e2e46d23b6bffc14bff41a"
-SRC_URI[sha256sum] = "3627b7da0533ca3fb10310f287dc0d569470960ffdaea7678fd878a20d409678"
+SRC_URI[md5sum] = "31cb9520b01512a94344770b4befdb3b"
+SRC_URI[sha256sum] = "07a4c3e71431c24f97d2e270452dd0fa51ff0bdb6219a13a20d0bfa8d9de54b2"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so.*"
 
-- 
2.1.0


