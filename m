Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB2B733B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:22:20 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id bs8so7703951wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=FblqLdPm4egJCYXwCMzPVPnRvIoUDivU1lD54ok03uI=;
	b=F+hdsJqY3840rwrmN9a+s45AnSjVTMa7v/7RmpJCF94u8LgJ39AsU0zahtOfNsCaE9
	r6zCBkmVTw9OCSG2lj5E+yakdwKaaqRATK7/+eyF/JmASzjUOASFwTPivebAnW15kB2q
	1CQC2C8PUkzh1/zrSl1vfX2639eIwA8cH58tNANi1lMhVhGqV6kbYNw7lMcp1+/rCI5G
	FQozLq4gkzgTq3/rEsEH06wcsTm0MvlkgTlGNTi3MifPbuupXatSD7KFL5d6l4hF5RmM
	lgYUz8UQrp6Ztn3QTTOlm8+qA0/qKEOk08arRevPas5cEZeqWc9qAsLVBqYWxtMfNM07
	Fr0g==
X-Received: by 10.194.190.162 with SMTP id gr2mr11880160wjc.13.1423776141321; 
	Thu, 12 Feb 2015 13:22:21 -0800 (PST)
Received: from localhost.localdomain (p5B0A0430.dip0.t-ipconnect.de.
	[91.10.4.48])
	by mx.google.com with ESMTPSA id fm10sm4136024wib.7.2015.02.12.13.22.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 13:22:20 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Feb 2015 22:21:46 +0100
Message-Id: <1423776119-14981-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 06/19] xfce4-kbdleds-plugin: Initial add 0.0.6
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
X-List-Received-Date: Thu, 12 Feb 2015 21:22:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../kbdleds/xfce4-kbdleds-plugin_0.0.6.bb                  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb

diff --git a/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
new file mode 100644
index 0000000..b2b9627
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/kbdleds/xfce4-kbdleds-plugin_0.0.6.bb
@@ -0,0 +1,14 @@
+SUMMARY = "This plugin shows the state of your keyboard LEDs: Caps, Scroll and Num Lock in Xfce panel"
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


