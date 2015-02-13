Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B8523732DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:02:20 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id b13so14841069wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 23:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=mlF5hQoAdbrL0vzxvpmiGJlbSysMQzN9fiIeg2gY4KE=;
	b=d54kr5/Flo5v/TLiai7q4HuUoyn+xCCcSWKhcJJJ50RYZ8XaVMIuZPnlwyeM+V5x+n
	2AaxHepCv/gNMPWMj99Z5O+dHgV8M59csg7iFXTq7AEnY0x9pAavrtMqBs0yNHrjBkFK
	bf7l+yXBR75ZVXZGvSUVYbEkS/At4MXiigXX9uHj1YpY8vIIiuFijiP9Ixo+b5TFDgFj
	wgSjbw4yjJ1aYaxsoJVVG1bmVarvVuPI6FWxeJm9RFH7HtlCNhjCPsNi0nh8C4hlkYDB
	of6hB8LmHkjBC3veaVhNAT+mJtFIrOpoaWM0eQSWXw+XGB/Uvh3yqM9JEZ0Yi99OpIBz
	FkQg==
X-Received: by 10.180.100.202 with SMTP id fa10mr3849043wib.10.1423810941247; 
	Thu, 12 Feb 2015 23:02:21 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip0.t-ipconnect.de.
	[91.10.19.148])
	by mx.google.com with ESMTPSA id v16sm1635972wib.5.2015.02.12.23.02.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 23:02:19 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 08:01:46 +0100
Message-Id: <1423810919-9857-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423810919-9857-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [V2][PATCH 06/19] xfce4-kbdleds-plugin: Initial add 0.0.6
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
X-List-Received-Date: Fri, 13 Feb 2015 07:02:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../kbdleds/xfce4-kbdleds-plugin_0.0.6.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb

diff --git a/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
new file mode 100644
index 0000000..caf5508
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
@@ -0,0 +1,15 @@
+SUMMARY = "XFCE panel plugin displaying status of keyboard LEDs"
+DESCRIPTION = "This plugin shows the state of your keyboard LEDs: Caps, Scroll and Num Lock in Xfce panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-kbdleds-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = " \
+    file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+    file://COPYING.LIB;md5=252890d9eee26aab7b432e8b8a616475 \
+"
+
+inherit xfce-panel-plugin
+
+SRC_URI[md5sum] = "db6ad8e3502f3373f087ba2034141552"
+SRC_URI[sha256sum] = "6d280ad7207bcb9cc87c279dc3ab9084fd93325e87f67858e8917729b50201cd"
+
+FILES_${PN} += "${libdir}/xfce4/panel-plugins/xfce4-kbdleds-plugin"
-- 
1.9.3


