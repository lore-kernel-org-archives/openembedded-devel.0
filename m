Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 46C6473459
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:35 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id q59so12858094wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=I61khJiRFWYCSgksQz9z6e6R/6gDlf0NA+u6yxj08XM=;
	b=GSHAbfU1QV2aKbfZAEnnM60GLiMLCdHAGtTSzyKJlCb624Iip/ZhFe2xZ0GpemubBJ
	G5kBCwGuriUuxxW8wg0twIBxzs2U+rlqPxzFnkdOOYU9TQnR5xlPyKD5s8ZSuiw2Z8nm
	wPQFosKD3MeSykLWRvGICHf5uyoFAAJhu6GSwtCvzTqonK0lYCL9JfcWXA24EWuJpK8p
	/OKRPM9vtr8MZzHHwhFjL+VGlPLCK+ox/4UAP0kvkCUhxlVZre0yGr0HYz58sINRq/Op
	UgMFI8cMCPlcu2Ht01JFyeoavAjTBSSGj9iNpY5A/AzxUpZc02DSQ4vPJIkH10uhqeId
	XLAg==
X-Received: by 10.194.191.228 with SMTP id hb4mr6589265wjc.116.1423776156198; 
	Thu, 12 Feb 2015 13:22:36 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:56 +0100
Message-Id: <1423776119-14981-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 16/19] xfce4-timer-plugin: initial add 1.6.0
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb      | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
new file mode 100644
index 0000000..67da684
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-timer-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "3be2a4ccfb2af20441b1d25c2cea5f28"
+SRC_URI[sha256sum] = "39d7d21f099bc4219f6a6156142f0bbb8374986ee1970a9c0c8dc138b87f867c"
-- 
1.9.3


