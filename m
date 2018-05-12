Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 78EFA7887A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 May 2018 03:08:01 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id n1-v6so3182803pgs.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 20:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ijMj/cKxjpTKMlggrVXwayx9bBWjjRsIUCuM5thVHJg=;
	b=ke06S6KvURW1dpygmq61SwFnqqBqX5gLDi3bxThQvV9TCnrkRFyyaBpOvyxaL28W9q
	HirQYoBizPkiBAAYuc89+RjqWg4e6DxsV52twOnvyjQop8CkW9GCncPFRF6iUfmOPT0e
	KWgyAPeioz3V99bLksu+ezUR6p8lv4BAPDMEM0E6pjDadSjML+XA5lrJBoUaKbF7nwMD
	o831i6yJ6I53qL38Z+lpPT7Ix00hetPG0t18cqgZL/CPcOoExNZVopNZTpaKV8cJDk3t
	CRX+ckwsjtHchtF6sGyJIp5rrogG/O4CXmnBovv12J3lnzXB/8+WCL2wBvEM9oTQwDAj
	75dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ijMj/cKxjpTKMlggrVXwayx9bBWjjRsIUCuM5thVHJg=;
	b=EPnFgFmu87XoHsY8slbGHw/W2mHJ1l2bghfi/DJyIH9HjFzWhBHm0C27UToReq4cbD
	ZxXt0T5GcbOa+mXSUuLzSm8Rst4ryfpVLhchSzwouCidODMNOeglA2uvFmOcuha77YG/
	fhIkyF9zd9/nAtO8NJpZRJtAhe1KMdLYhDfzpISPdLzyIUmQBb39dn0dUiEM9cqCadqx
	HTQ/ukHJ4WZvYb7SQ+my5KYgoBaPc/+4/w08x2RHRasjEgkrQ389r0Tt+teM6dXZYg7W
	7ZC60A9hyk1rtW7ewbeEpk8ms/+wPtbzFVNlHl9juYKHmwJKUMAbGVwd+s1Ea6HHcR1X
	OiSg==
X-Gm-Message-State: ALKqPwcq+GMtz9l9zXadBlCZW1CgPS2gnaPLk81ACQ4JQif7rNlexe1x
	jZnnTyADd4tr9G7XMsvU/haSWw==
X-Google-Smtp-Source: AB8JxZpVhQJ5yO/X7edy2rEsXV+qHQ3MEKL7BzDw4zGkQ2E4CPKIL3vkEF17LrHirTDWatrK4RftMQ==
X-Received: by 2002:a62:5b02:: with SMTP id p2-v6mr1396737pfb.96.1526094482140;
	Fri, 11 May 2018 20:08:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	d4-v6sm6440933pgv.73.2018.05.11.20.08.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 20:08:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 20:07:52 -0700
Message-Id: <20180512030758.31409-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180512030758.31409-1-raj.khem@gmail.com>
References: <20180512030758.31409-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/8] evince: Upgrade to 3.28.0
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
X-List-Received-Date: Sat, 12 May 2018 03:08:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../evince/{evince_3.24.0.bb => evince_3.28.0.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/evince/{evince_3.24.0.bb => evince_3.28.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.28.0.bb
index c7ecf2ba5c..fe83c91fb1 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.0.bb
@@ -3,7 +3,6 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
-PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
@@ -13,8 +12,8 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
            "
-SRC_URI[archive.md5sum] = "3fb65ff46de191dc49c481f1fc66201c"
-SRC_URI[archive.sha256sum] = "043895af7bbd6f1b57f9ab8778e78cf9c0af5dfcc347eaa94a17bf864c04dc8f"
+SRC_URI[archive.md5sum] = "96f8372c376e7062bc3b833099f6664f"
+SRC_URI[archive.sha256sum] = "fa23264b65e140afb8ec27b070a277bda748d9d4a86788240d9f3514346573a8"
 
 EXTRA_OECONF = " --enable-thumbnailer \
 "
@@ -53,6 +52,7 @@ PACKAGES =+ "${PN}-browser-plugin"
 
 FILES_${PN} += "${datadir}/dbus-1 \
                 ${datadir}/appdata \
+                ${datadir}/metainfo \
                 ${datadir}/thumbnailers \
                 ${systemd_unitdir}/systemd/user/evince.service \
                "
-- 
2.17.0


