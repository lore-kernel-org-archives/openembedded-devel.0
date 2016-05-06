Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 30AD276A51
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:20 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id x7so60310365qkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=QyD5q3gWIZB4oX0BuHEg4s+V0i+nPEyhUQZqA/kbOnY=;
	b=UwOX9S/d5jI1zKJ6vN0BAW4iiPSdHqkYCcNsyGnZAmoWICgrHQg8znNKjkUaOJ50wo
	H8e2VaGMccgWbKu9mgWyMNXPylQrm5Ta0lCdSOgLdZSdJUt60ZsOL8KEWm3+/i6TU47v
	utMJDwPHVcivTRYB1eXN0/nbnPVy+OiDW5Xsx0XQObAui1hyLpRW/m5Ev/U6a8zDvMte
	jlcThxeNLcrEpnb/x1242mFymKlKVqjEnrNITO9AB2Qzg/7cKNtRn8n20gjWP5UUV0M2
	H0mNT3cTObfmcYy803ei8+Ltb77b3PNXvSjhdcdLQItSdmkB43VMXwM8V5xpolO69QwK
	YWow==
X-Gm-Message-State: AOPr4FUQg0hm3bk6oGz7gQuPEqrr2yyLy8vP65wwUoigJeW26NEd+OOp633mW0aKOEG2Nw==
X-Received: by 10.55.23.138 with SMTP id 10mr3296676qkx.149.1462543341618;
	Fri, 06 May 2016 07:02:21 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id q2sm677636qke.15.2016.05.06.07.02.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:20 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:51 -0300
Message-Id: <1462543259-7206-14-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 14/22] meta-xfce: add intltool-native to DEPENDS
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
X-List-Received-Date: Fri, 06 May 2016 14:02:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@googlemail.com>

fix tons of messages as:

| WARNING: foo do_configure: Missing DEPENDS on intltool-native

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta-xfce/classes/xfce.bbclass                                          | 2 ++
 meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb     | 2 +-
 meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb                     | 2 +-
 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb       | 2 +-
 meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb | 2 +-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-xfce/classes/xfce.bbclass b/meta-xfce/classes/xfce.bbclass
index f4ef556..b49bba1 100644
--- a/meta-xfce/classes/xfce.bbclass
+++ b/meta-xfce/classes/xfce.bbclass
@@ -8,6 +8,8 @@ SRC_URI = "http://archive.xfce.org/src/xfce/${BPN}/${@xfce_verdir("${PV}")}/${BP
 
 inherit autotools gettext gtk-icon-cache pkgconfig
 
+DEPENDS += "intltool-native"
+
 FILES_${PN} += "${datadir}/icons/* ${datadir}/applications/* ${libdir}/xfce4/modules/*.so*"
 FILES_${PN}-doc += "${datadir}/xfce4/doc"
 
diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
index e24606c..cb1be67 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-app
 
-DEPENDS = "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
+DEPENDS += "gtk+ cairo libwnck xfce4-dev-tools-native exo-native"
 
 SRC_URI[md5sum] = "7da465a4798629ebd8650fef62770ab7"
 SRC_URI[sha256sum] = "2e1eb161f966cbfbd68bd029fb59115bc5ab0c0704cb500d20e7d73967e59ecb"
diff --git a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
index 1514c61..f27396c 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_0.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-app gtk-doc mime
 
-DEPENDS = " \
+DEPENDS += " \
     glib-2.0 \
     dbus-glib \
     gtk+3 \
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
index 142b289..313534b 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-DEPENDS = "gtk+ libxfce4ui xfce4-panel xfconf libunique"
+DEPENDS += "gtk+ libxfce4ui xfce4-panel xfconf libunique"
 
 SRC_URI += " \
     file://0001-main-status-icon.c-remove-deprecated-g_type_init.patch \
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
index 81b6771..2070db2 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce
 
-DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
+DEPENDS += "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel upower"
 
 SRC_URI[md5sum] = "e7d00548e58bf19229e727818184c1e0"
-- 
2.8.2


