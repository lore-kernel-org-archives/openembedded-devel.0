Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 33B10731C8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 19:49:06 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id v188so32763591wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IejVBa8bulXV5MQSlUBdDLRXNxEtkkMO+pUlsG60MG4=;
	b=fqWYqEEyA9dOLJe92X1nq602gcaRW+41C9Br7bCBkHF3+IzL1WWQWcMgYBAWfPu+GH
	PxSzo4KWWbr9HE8hRPBWprzr3xXYkzbyav52OodAgzN2/tzwt+xh0emCvXFFL8324Kx+
	1nPO+RyOgpoN8455j5MgLVrHsr2gacKUXlmobx1wjHkWpPC+o03hRmHSRTy6WzUXD7Di
	AddgwrVd3jJ3Dzs3EH2cjARE6OHEuOXMBJBntbTzAmD6Ddj+3SGqxOlqGeqdCiZ9ob1y
	w9JN4ZwDBwM8titefWgyI0gtKUdyC8LlDfzWk/bIs2JpLleShNsFdzG+9aNiAvTY+ysc
	EuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IejVBa8bulXV5MQSlUBdDLRXNxEtkkMO+pUlsG60MG4=;
	b=AnhtbgLd4OxpCxL/wHMogb9+b5D4xa5V3clmvZhqQ/sLoHuyw5RzsYrFwtE9mVAPKr
	FmBc8wrS1C1CCD3d9Nx9eRpfsz4ZauwfhNztPV7Cybj+4LEonfVPpWjNctxNyLN8r2yt
	ivD2Zg9ZYByvjHUpxXLPVdDiuLqDRvd0ERBpqMQ/ZePr9sK4jWfUq1zVSIBzr/8esXiK
	fESUy+Zu7z23plu+3buwKsgaeKwihafxaBpEc7EgQ1N5EhQZ3mOOPaqgaoYmZcerbnIK
	MahrkYMlTquA5U/jxzKfShbLm7gwKKIXm9FTa0jLkG1GxEYV2CK4vEQ7lr+a1We+MwaC
	zBog==
X-Gm-Message-State: AOPr4FWA2wpHMjudkUy7F2Qh1gycg3JSGRwJs2DAJM49C606nx5g/Pmy8ClSLyGJuTS4u5oD
X-Received: by 10.194.134.3 with SMTP id pg3mr21835094wjb.141.1461354547340;
	Fri, 22 Apr 2016 12:49:07 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id t4sm4875842wmf.8.2016.04.22.12.49.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Apr 2016 12:49:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Apr 2016 20:48:52 +0100
Message-Id: <1461354536-23240-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
References: <1461354536-23240-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/8] meta-xfce: use bb.utils.contains() instead of base_contains()
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
X-List-Received-Date: Fri, 22 Apr 2016 19:49:07 -0000

base_contains() is a compatibility wrapper and may warn in the future, so
replace all instances with bb.utils.contains().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb | 4 ++--
 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb       | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
index fa38c8a..81b6771 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF = " \
     --enable-panel-plugins \
 "
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
 
 PACKAGES += "xfce4-powermanager-plugin"
@@ -34,7 +34,7 @@ FILES_xfce4-powermanager-plugin = " \
 "
 
 RDEPENDS_xfce4-powermanager-plugin = "${PN}"
-RDEPENDS_${PN} = "networkmanager ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
+RDEPENDS_${PN} = "networkmanager ${@bb.utils.contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
 
 # xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
 RPROVIDES_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index c8224a1..d5ed044 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -21,8 +21,8 @@ PV = "4.12.0+git${SRCPV}"
 EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
 
 PACKAGECONFIG ??= " \
-    ${@base_contains('DISTRO_FEATURES','systemd','datetime-setter','',d)} \
-    ${@base_contains('DISTRO_FEATURES','alsa','sound-setter', base_contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','systemd','datetime-setter','',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES','alsa','sound-setter', bb.utils.contains('DISTRO_FEATURES','pulseaudio','sound-setter','',d),d)} \
 "
 PACKAGECONFIG[datetime-setter] = "--enable-datetime-settings, --disable-datetime-settings,, tzdata"
 PACKAGECONFIG[notify] = "--enable-libnotify,--disable-libnotify,libnotify"
@@ -34,5 +34,5 @@ FILES_${PN} += " \
 "
 
 RRECOMMENDS_${PN} += "adwaita-icon-theme"
-RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
-RRECOMMENDS_${PN} += "${@base_contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','alsa','libcanberra-alsa','',d)}"
+RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','pulseaudio','libcanberra-pulse','',d)}"
-- 
2.8.0.rc3


