Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D19FF71E51
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 21:02:36 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id c85so295303849wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 13:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=beAXokMMqPB1z42hb8ECB9NTETFzwqV4nk5JNhn7ugA=;
	b=qnYlxs7Qoaa+NcNrQpSBKInHRV3mgHgVN4vtgvzbUew61zHbOId777T5ly+0n2+nU8
	mvY/TZbtUdAGwY8QRBu25XGaMBT4o/afhXOxjMRhgXzH5/RoQhof3hTCZlKXHyWJHq9K
	r+XawxuPL5c3fxD4dxA1HzyLlcIW6iCt0rgsehknDiDhoxTv/efmzf1+SEoFWQjDbMeq
	3crLIbF2qkyLOcY6//7XX8V9tvoZlJZh8ZVLzmmR5npeTZ40zf3stpQ9tp6fFwDrrAyk
	zo+LrDjOd/CmNu9gVmWvOrSsrZPo3bTeeVOIEJWSVnLlBqJjYan/3PdF4xIzBskMPeeC
	KalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=beAXokMMqPB1z42hb8ECB9NTETFzwqV4nk5JNhn7ugA=;
	b=QSBev5W2+eUd8YD3hd8wEYaKg3WydEJ0EyEYB4F1db17oHZwRwE9itQlP3c5XHK8Gp
	a8CfFPX8/qrWNyPzTVCm+AIgyfgwayGFhj0h7oHnwPf0i+W9yqLz7bPRXM5m9q3ICl+U
	0URfOUTQvOc2hkMvZMB6cWoYGkiIVtD9+tPuMN6vC8srcaNepIrGQ0seklvNLC4vOG0c
	xnAUL5KpAVlvo5KZAWti83HAAJUUupFVWU+rIM7PP/3c2/LQ5uXVRHrr13EBtpEl2Tch
	ZwXF/MmDD8Rhpyk9WhQ0WBzcQ7R89Fkfok1Y8iBY+fG9QLSeBML9WCZnV2chmcZYCBBE
	VIdA==
X-Gm-Message-State: AMke39kjn4rCL1RW1aAuOsp/Jhx3dMoNAHvJ/ixsATy30dacDJb2PbNwBbeK5bcdMVkiiw==
X-Received: by 10.28.158.82 with SMTP id h79mr37585008wme.30.1486933356373;
	Sun, 12 Feb 2017 13:02:36 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E91173851E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:7385:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	s18sm2688541wmb.18.2017.02.12.13.02.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 13:02:35 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Feb 2017 22:02:14 +0100
Message-Id: <20170212210216.867-10-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170212210216.867-1-schnitzeltony@googlemail.com>
References: <20170212210216.867-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/11] gedit: fix build
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
X-List-Received-Date: Sun, 12 Feb 2017 21:02:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 175b832..03d7fa4 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native gnome-common-native"
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ gtksourceview2 iso-codes intltool-native gnome-common-native libice"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -20,5 +20,7 @@ GNOME_COMPRESS_TYPE="bz2"
 EXTRA_OECONF = "--disable-scrollkeeper \
                 --enable-gvfs-metadata"
 
+LDFLAGS += "-lgmodule-2.0 -lICE"
+
 FILES_${PN} += "${libdir}/gedit-2/plugin* ${datadir}/gedit-2"
 FILES_${PN}-dbg += "${libdir}/gedit-2/plugin-loaders/.debug ${libdir}/gedit-2/plugins/.debug"
-- 
2.9.3


