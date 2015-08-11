Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id E255A76947
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 07:58:12 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so165550326wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2015 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=UHwYZpVb950mqF/jy83MUu+RB7yXXUkITvYt6zTs//s=;
	b=S6tW2iHrdO8Hi8PQ5tFPGvsrW4F7Vwry6lGOm7Bhrak6yAj31aiES/R8tiKUrFeugC
	UPOAM0fYChzh09fobiYGmfMgCs5uzLKt/t0XmMlw9CzA9K7jhfzDAHQ6ce1ZZLncg1Kz
	VYwNoVgEME0t5s42XQuEJABrV6JUeIXNlW2WLGP0TRu83TD2+xknOHFbT7Agjqcf/xhe
	pzhOVlQk2UGRwZDPuOpK5UC5X318rZ7DjRBu1aAK9ZMOQNUqPoUhtUdD+Q1hFvwOEwKM
	FnM6zAZWmHufkywzl/psi26dx7GCjUpHN6UcfoFKpWlV8apqrGfC8n5dItjpevuAtND4
	neKQ==
X-Received: by 10.194.184.82 with SMTP id es18mr56881267wjc.79.1439279892042; 
	Tue, 11 Aug 2015 00:58:12 -0700 (PDT)
Received: from localhost.localdomain
	(ip-109-91-251-29.hsi12.unitymediagroup.de. [109.91.251.29])
	by smtp.googlemail.com with ESMTPSA id
	fs8sm2124773wib.0.2015.08.11.00.58.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 00:58:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Aug 2015 09:57:24 +0200
Message-Id: <1439279859-1815-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
References: <1439279859-1815-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 02/17] xfce4-pulseaudio-plugin: initial add 0.2.3
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
X-List-Received-Date: Tue, 11 Aug 2015 07:58:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb            | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb

diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
new file mode 100644
index 0000000..f9ad32f
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.2.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Pulseaudio mixer for the xfce panel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f5eac6bb0d6ec0dc655e417781d4015f"
+
+inherit xfce-panel-plugin distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "pulseaudio"
+
+DEPENDS += "pulseaudio"
+
+SRC_URI[md5sum] = "13a47ba5a72c16fb06f7e1cc89858cc7"
+SRC_URI[sha256sum] = "e82836bc8cf7d905b4e60d43dc630ba8e32dea785989700c71d4aeee9f583b33"
+
+RRECOMMENDS_${PN} = "pavucontrol"
-- 
2.1.0


