Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id CB96E7ED3D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:41:24 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id b18so26969396wrj.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Dy8h99jNr+ykBbIOl81+LsyLWuyUEyLqEYBALJ7C1xc=;
	b=INgqBSqovO2EIm6nbarB3oKKB/ATRsBrXyj1sYqkCUGFLJlZN9PD+m4ZSdbIypzm9G
	tNjC3tCFUGWQ5fgNwCzqM3N/AN+AKzzAStcPPm8TfevQO7pU9O4iO2BcK3RjbdfPmC4G
	PHwXU6svkpTXfZrjAO2O3vbMQdkK4UNcWn+TDr6wvRe3CAEFKV8qPG2f81/H7WP0l9xQ
	v8XlwTeH+QmDI1wwFCAj4YQKqREbqMz+kOOxtakKU9ov/l+nWMdgDDfE35M2EbcqwPG9
	0onpzKzLkVKdwfu6OPYMqAEUPTMrz34tLkYhBNeigVuKjqgV4H/PpulYtaTu6Ql2wwW3
	Ou0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dy8h99jNr+ykBbIOl81+LsyLWuyUEyLqEYBALJ7C1xc=;
	b=EHh9Omq+UzgFoTKwCQgwZjz63TkhpsTqVtxd9Peg6DB9+bYfk3CXyXHIX3FjocBxb0
	0FXG6HE1oJL4UN6qdUmxxyyWqf0aihYaXAgWqbyV8mAemBj+PhUEXs0eTGqfAzbMFrgl
	s9iAYbw6Fw8BbZ8yqw1AbLYiso+pTQAUVMyTCmydg5Yv30BcTgOiimJttg4atj74qfSM
	mTTRiqQ331wSklEtBN4SOGbqH71u4Q2DqRbPH0MF4ezsUwGI7gCSgtASKM/GYLj3dl9O
	1eCm9AYPFjc+cWCSD83dTd85WJVOJitkXhUnZte8tiipGhMUQ0uZ11O8RGnQQ/GIC+WZ
	2BGQ==
X-Gm-Message-State: APjAAAVv4H48bkG9Y5wCyXl65e3eh2fE2FAsMhufG9JvbmEz0EePfBR6
	EeLaBo9WJjJIl1zk/nXYgfeOPI8+
X-Google-Smtp-Source: APXvYqw5IYh7r8SG1uo+fv5fk/h/PbnWf7+ZLOl0+k0Ng8FnDCFWprXgOdKE0KrIhn94oEEGVqWejQ==
X-Received: by 2002:a05:6000:12ce:: with SMTP id
	l14mr29710931wrx.342.1574865685301; 
	Wed, 27 Nov 2019 06:41:25 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	q15sm19454409wrs.91.2019.11.27.06.41.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:41:24 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 15:41:16 +0100
Message-Id: <20191127144116.18751-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127144116.18751-1-schnitzeltony@gmail.com>
References: <20191127144116.18751-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 2/2] networkmanager: do not deploy unnecessary udev rule file
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
X-List-Received-Date: Wed, 27 Nov 2019 14:41:25 -0000
Content-Transfer-Encoding: 8bit

From: Stefan Agner <stefan.agner@toradex.com>

The 84-nm-drivers.rules is not required for systemd-udevd versions
v210 and later. The file has been split into a separate file so
distributions with a new enough systemd version can drop it. See
also:
https://github.com/NetworkManager/NetworkManager/commit/1e0375826252abf9aab2aef273a2a24cd08c9f42

I noticed this while investigating into a warning show during
bootup:
  /usr/lib/udev/rules.d/84-nm-drivers.rules:10 Invalid value "/bin/sh -c
  'ethtool -i $1 | sed -n s/^driver:\ //p' -- $env{INTERFACE}" for PROGRAM
  (char 24: invalid substitution type), ignoring, but please fix it.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 82ecc0e69fe3920360d1ba8bd1b5e6ede164de42)
---
 .../networkmanager/networkmanager_1.18.4.bb                  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
index 085807c4c..27508c4d9 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
@@ -141,8 +141,11 @@ do_install_append() {
 
     rm -rf ${D}/run ${D}${localstatedir}/run
 
-    # For read-only filesystem, do not create links during bootup
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        # For read-only filesystem, do not create links during bootup
         ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
+
+        # systemd v210 and newer do not need this rule file
+        rm ${D}/${nonarch_base_libdir}/udev/rules.d/84-nm-drivers.rules
     fi
 }
-- 
2.21.0


