Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 80ECA60767
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 14:00:01 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id k184so3230929wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+jGmjitNgrf4oqQvF3xWSGo+8cbvddBjKzuOapmvVUM=;
	b=vR/23xq1VX6/f/iM/bdiS3+b/FuG4U5DCMvPKWMAASPvRFYn9AnvciyseNYekNaxSX
	ecfSJz8ovZm/p5xo9QZRA0zwfcoqfeHF+AFsRTGGq6ZKLftR39yy5rcMPawLFxlKKtDp
	VokbTXImKFRlO4hROJM9iICagEwVkTgaTVUFBknHBrQmmBE6XHuAYTkC090fM2Lm1A2b
	dGNzngo1AvFV5TxuGvEN7mWf8ih3oFIcrHJasOUDbnbfx8LfEFnVxj5ICNVr1FzPArUk
	xGHeV7NbGXxjr7ZIUygwOb9RbT9i0fds1k8DaIZsjTQEeYvyt+ZnvO4PA4On8aTS6Zj3
	eoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+jGmjitNgrf4oqQvF3xWSGo+8cbvddBjKzuOapmvVUM=;
	b=OF0VUkCcxVEnsB2iPgaMYfaSOhdsFrlCyj0LDGRIiWVsD6Ig3sFcsEMChsuNnDwzJA
	RUfdIKciblBCbwz2lM1eR4pGZ6dREULSzbIbMql9fHYTN8NPFs3wYroA6XkpS+psUJiL
	ISGGyNinIvXIFeQhtq84akPVfxNCLqnJZ6436z/9ovXgKntWilC7BxIA0li5N7+zp68L
	geXjOT3EPcAURdTOQLXprex8zEZALBWQerv2/m87SnbrLprBZkcXfIbZt9BkabvSSiXk
	wp435G2gUXWYL3EPZfNlp4UFyKEWdZ67LN7w5Q05CfV8bN6jWVZxNSilzm4AxobLHqZR
	+wBg==
X-Gm-Message-State: ALyK8tLo+jdYzm4J6bGs2nPEnTmoW6XJp3a/+4ZYDJsNMQznvLEfiIG82MYt0bvcK1Dn3g==
X-Received: by 10.28.141.21 with SMTP id p21mr5301925wmd.73.1465394401909;
	Wed, 08 Jun 2016 07:00:01 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z14sm327687wjw.6.2016.06.08.07.00.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 07:00:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 16:00:19 +0200
Message-Id: <20160608140019.6787-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160608140019.6787-1-Martin.Jansa@gmail.com>
References: <20160608140019.6787-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-qt5 2/2] qtwayland: add dependency on libxcomposite
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
X-List-Received-Date: Wed, 08 Jun 2016 14:00:01 -0000

* fixes QA:
  qtwayland-5.6.99+5.7.0-beta+gitAUTOINC+d27075a3f9: qtwayland-plugins rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtwayland_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 8f01658..e36d2c0 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = " \
 # libxkbcommon isn't mandatory make it easier to remove by .bbappend
 # (e.g. for building qtwayland with danny which doesn't have libxkbcommon in oe-core).
 XKB_DEPENDS = "libxkbcommon xproto"
-DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS}"
+DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS} ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxcomposite', '', d)}"
 
 QT_WAYLAND_CONFIG ?= "wayland-compositor"
 QT_WAYLAND_DEFINES ?= ""
-- 
2.8.4


