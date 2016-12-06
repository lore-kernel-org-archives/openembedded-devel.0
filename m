Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id B532C60079
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 02:36:31 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so18242960pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 18:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RqweYl0dOBkPg4gp/SfYot9UbMO3Zvh6NpXj6NHBVyE=;
	b=cSLayMRpEMNc5xC284YbPlK2PUPr5wVJmrDNPPTfdHQ7SZNIH20CDAmlN2VVYaKch/
	8joU2elIytO9rzL1ZOClL4DRO9YbYLeSJAlMWmOPA75bmztWTCkqae/mA8KI9BvTExKD
	Xi2NzYX9OMv1rKwDG/21AdBgtHupc19G5A68H23/NC3OXGLL2c5qs956Nw9JKy/ZrfAn
	YdXk2W5VZLhln/KlYT8JWF5wmAz6cOUsDn74P+OWUK1N5KVAPRd5Ql+S4KRmDte2aK+M
	caX6FsmAZpysLumDlKLH8dTPpZDGwChtJxAFbWqOI6bwbxkmj4UXPIrhJxUVmyRmuFH6
	64WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RqweYl0dOBkPg4gp/SfYot9UbMO3Zvh6NpXj6NHBVyE=;
	b=j8YlPm3AK1shpUjuqlkQOWpSxvAXkckUHiZlg4EvyCpS/+AK2+00PuUKrOJHNOgHi5
	eYT2qam7ufThHroOM6BLAAiKVd1dfJcl4o0xO7wxSsH3uqGlIGHg9BPpkn5PAFwrSIaH
	dmJbRJNnoUl+ziEprIxUrjqE8P86MZuKgoVCr7IbM13iv/Vv+SKmP7Pl45AXqoEn64IV
	8Yfn91OYLHrsrbJCmeLkKecBtQ19tN216c0C2N1pxtTQjpzrUrwFH8Ebemi26056yMsx
	RMrD48H0bPeSOcRkNU/XMutYrizE+9nblgfhHDFs44z3CLHQU9FIw2tiia2fnz2B1ZPO
	52fw==
X-Gm-Message-State: AKaTC02oo0KNTmf/JvMnSFsb+9Dfd6c5EXtbDbSfiiqn2xQDWSbg3DEbHcPUAQNJ+SQxwg==
X-Received: by 10.99.237.69 with SMTP id m5mr107816603pgk.94.1480991793499;
	Mon, 05 Dec 2016 18:36:33 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	64sm30357837pfu.17.2016.12.05.18.36.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Dec 2016 18:36:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2016 18:36:24 -0800
Message-Id: <20161206023625.12901-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161206023625.12901-1-raj.khem@gmail.com>
References: <20161206023625.12901-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/7] gthumb: Add missing dependency on gnome-common-native
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
X-List-Received-Date: Tue, 06 Dec 2016 02:36:31 -0000

| ../gthumb-2.12.4/configure: line 17557: GNOME_MAINTAINER_MODE_DEFINES: command not found
| ../gthumb-2.12.4/configure: line 17558: syntax error near unexpected token `maximum'
| ../gthumb-2.12.4/configure: line 17558: `GNOME_COMPILE_WARNINGS(maximum)'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 5eee7f0..13c027c 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
 SECTION = "x11/gnome"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native"
+DEPENDS = "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native"
 
 PR = "r4"
 
-- 
2.10.2


