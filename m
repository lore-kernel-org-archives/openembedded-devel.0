Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id D9854733FC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:35 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so9703550wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=HAS9DiJYZx0pQfeEx9ECrTHUj3ExcQkK97a+/v9U9/Y=;
	b=uAChNormL0JLsgmyxDXZGqss8dcIkuY2ujdVKDWxzJTVA02oQ/L7vDgJ+2CX7T3uoa
	Ng0E/y0qyP28D1aOPZ2OD+hsRoGujJHP6IYWxcknAC1pAaTASOXP9EwXJFdlz9OAzns2
	bAiKlqMwxkerCdhfFghwT483enZGXFpqCQ0G2+wUrIB/48msW7E8PtN3TkfsSRY75+ar
	YmO+wb15C9ge1TZmfzbxaFwx/9n2Q/aRsacq2VR3Mk4O4t/W3xryyEZhuZ4Scsw8rQZi
	cOtG0yQV0kQMvXj5OjOv5I1SpEB5YYUjGrnrgEGFdtrXlQLXG3Njr9TmiBk8+b6LhwqN
	YRtA==
X-Received: by 10.180.21.161 with SMTP id w1mr13100334wie.44.1423810956695;
	Thu, 12 Feb 2015 23:02:36 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:56 +0100
Message-Id: <1423810919-9857-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 16/19] xfce4-timer-plugin: initial add 1.6.0
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
new file mode 100644
index 0000000..d61235f
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "XFCE panel plugin to generate alarm messages"
+DESCRIPTION = "This is a simple plugin that lets the user run an alarm at a specified time or at the end of a specified countdown period"
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


