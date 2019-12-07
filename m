Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id D9BDC7F3BB
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2019 13:04:00 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id s22so10599556ljs.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Dec 2019 05:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=mFmwapeVDOpZceyrBK9XR0qZ/klSxHgXVg7VSeW7SVQ=;
	b=CV3R8QlB69qYc4/3i8xzLwG5toIzvEBIlWiUFleL9XboOu85sffBaF73OfeO1XxLw2
	3weQAddW9kv20Zyu2wDnOWNRDraDnkIX/LJ4XHCKJbBSTZ0RQN51qCAVHQItNr0CEsXn
	lBXBVhzVtFc3l9Adv08Bz71gGNT+jE8+z1f+Dv1Tq7aynefZqhIBBdSB8iINZsfQkGPY
	xZnsAXH8g4l3uE9WL66kEbrSpdefwMzZS8ztvw0m3HJ+N1kTxE2F7/RJX8uvQJPrZCqH
	0t3zQPH9njKnmjafKSmluQH1QaHpWhZHfA4Wyf0P/fwx3aQMNh6Hc4YVGdgNZ25p01Sz
	7DKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mFmwapeVDOpZceyrBK9XR0qZ/klSxHgXVg7VSeW7SVQ=;
	b=prfMKgxZcIHIjmyYkXT1WldNvjbD+l6ZYqbVSvJxyO74vGgE4DPtMbtwCpPJzx487z
	Ptf4686NCtVkgA5hGEJTE2ze7JI9B9bgvreZ14fmowu2C2qUq5pPBHZ1FkENB7tdoa2a
	f+U6OIPKhG0Zji3tKn0Vxv2jPKhFSbsOuwG7irNLyX+7ScchOLYMz/gSNSAkL3kmuQpt
	tDYjuNG/U1Q1wWGZOauRCq8+fja+PcobpoaNBoK/8AOIWOMO4oNScU9ib4YgoUvHf5Av
	5Tf/NyP/O2P7AOZUeAR7TkvtIaXxEcAY1x0hNU9F6hlaJ99tFSO/pvNiHRQMvhMVc602
	92sQ==
X-Gm-Message-State: APjAAAUjGBVA6YiXFtPdTwAEzf2dMpp0YzPf3G7DQJWb2mdBn4YUf5N2
	0tQs2Zgdro965sVeIlHTOGk+qF5qQ28=
X-Google-Smtp-Source: APXvYqxrpPB178pBZCAdDVhtIDs/xY0e3wRFEBIiVgvOJLqr9Oj8uCVu+EaQR30y1jHFwvGZ+Ze2tg==
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr10917126ljc.246.1575723840734; 
	Sat, 07 Dec 2019 05:04:00 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id q8sm8000668lfk.33.2019.12.07.05.03.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Dec 2019 05:03:59 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Dec 2019 14:03:54 +0100
Message-Id: <1575723834-22763-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>, stefan.agner@toradex.com,
	simon.bueler@toradex.com
Subject: [meta-oe] [PATCH] ostree: introduce OSTREE_PULL_TRANSPORT
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
X-List-Received-Date: Sat, 07 Dec 2019 13:04:01 -0000

From: Ming Liu <liu.ming50@gmail.com>

It could be soup or curl, for convenience to be overridden by other
meta layers, like in meta-updater, it is choosing curl as the pull
transport.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2019.5.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
index 4f437f3..c3e3a12 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.5.bb
@@ -43,6 +43,11 @@ S = "${WORKDIR}/git"
 
 inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconfig ptest-gnome systemd
 
+# Value: soup or curl
+# We include soup because ostree can't (currently) be built without
+# soup or curl - https://github.com/ostreedev/ostree/issues/1897
+OSTREE_PULL_TRANSPORT ??= "soup"
+
 # Package configuration - match ostree defaults, but without rofiles-fuse
 # otherwise we introduce a dependendency on meta-filesystems
 #
@@ -50,15 +55,13 @@ inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconf
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
-    soup \
+    ${OSTREE_PULL_TRANSPORT} \
 "
 
-# We include soup because ostree can't (currently) be built without
-# soup or curl - https://github.com/ostreedev/ostree/issues/1897
 PACKAGECONFIG_class-native ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     builtin-grub2-mkconfig \
-    soup \
+    ${OSTREE_PULL_TRANSPORT} \
 "
 
 PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
-- 
2.7.4


