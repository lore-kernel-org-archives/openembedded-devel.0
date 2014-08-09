Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 38FDF70A72
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:33 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id f8so2338637wiw.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=p03OMWTyib0upRBNPaPJit0x9M8sejADdje3W1HDXpU=;
	b=QcLN6zoAv5du5nptLWXdGODrOpsqyWdjLrlf/MjDZzl8inrr4OQqJCjc6q6WV9SBUZ
	v9laAD125JCG2Ftgqah4YmiwKR5PwdFQ3yN+lgWfoCngdW7U3L4JQU71opwy18yvvOzH
	5mrSgDTndn37nqI8AwdhZxPNw3dCTrPmbD8TUKHmMChtlqVKDf9B9lXIHuRphcf0a83w
	Kg1ahTEngzGR8qPO1oXWJ8yQgnN3dHI8sZUwudsNePJX5l9Yuy3JhhL+Bg9YT2bshh2Q
	/SCz6fjAxuY43NVW0vGirwK2gUMiB5EJY0im//WqgxN63d1eMnq9aNDA6MQ0boUX56sY
	+ahQ==
X-Received: by 10.194.189.230 with SMTP id gl6mr3488547wjc.118.1407600514693; 
	Sat, 09 Aug 2014 09:08:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w14sm3330669wij.2.2014.08.09.09.08.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:27 +0200
Message-Id: <1407600537-10857-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/36] gmtk: add dependency on gtk+3 and pulseaudio
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:34 -0000

* fixes following floating dependencies:
  gmtk/gmtk/latest lost dependency on  cairo-gobject dbus-lib gtk+3
    json-c libcap libice libpulse libpulse-mainloop-glib libsm libsndfile1
    libx11-xcb libxi libxtst util-linux-libuuid

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index 4b4721b..d455f14 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11 intltool-native"
+DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11 intltool-native pulseaudio gtk+3"
 
 SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
 SRC_URI[md5sum] = "e06e9ca8d61d74910343bb3ef4348f7f"
-- 
2.0.4


