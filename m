Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5784D7722B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 15:56:27 +0000 (UTC)
Received: by wmww144 with SMTP id w144so94605578wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 07:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ms8MA5oUX+MndIoMJsAB7pMQ6uUKM/CAtXKMdcHhqR8=;
	b=D6TNnVcWYi744soQVg6XB1aF9xo0J3eDF/ywXi8wxnP9RED7VXhWAltxSjai882VEp
	8T3ZUwIa1i9sNgtZ6QVSSsNtCxrmbvuL3jA2pxMUYuSfBolSbFCTGxKuqJ7BPkJS61C9
	6v73LqrB7UBjFZbVW8XfkM2O2Mi4A53wGGYeVltSOmo3ICq0Llf4XDMIiyNXY/ccNMyJ
	zIPUaOUucAFb96pak/EAj0zw3vebn7vgEUX6Tw98OvK110vLpGAY7sdvKmuyVU99XpM6
	tLAKY1NAxh17/ADJha89E/fLY0BCaX1m+azcdcSxO/elPFsfCx4aXwMMv27Bo1/8oASb
	hyAg==
X-Received: by 10.194.71.147 with SMTP id v19mr10080828wju.142.1447343786629; 
	Thu, 12 Nov 2015 07:56:26 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft4sm15085725wjb.37.2015.11.12.07.56.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Nov 2015 07:56:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 16:56:40 +0100
Message-Id: <1447343800-21460-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH][meta-xfce] xfce4-session: exclude machine-host dependency with SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Thu, 12 Nov 2015 15:56:30 -0000

* this whole machine-host is very bad idea, all changes from postinst
  will be removed when netbase package is upgraded (it has CONFFILES
  set but most users won't know that this entry was appended by
  machine-host package)
* see:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-September/103271.html
* fixes:
ERROR: xfce4-session different signature for task do_package_write_ipk.sigdata between qemux86copy and qemux86
runtaskdeps changed from ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packagedata', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-session_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packagedata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.do_packagedata'] to ['dbusdbus_1.8.20.bb.do_packagedata', 'opkg-utilsopkg-utils_git.bb.do_populate_sysroot:virtual:native', 'pseudopseudo_1.7.4.bb.do_populate_sysroot:virtual:native', 'upowerupower_0.9.14.bb.do_packagedata', 'xfce4-sessionmachine-host.bb.do_packagedata', 'xfce4-sessionxfce4-session_4.12.1.bb.do_package', 'xfce4-sessionxfce4-session_4.12.1.bb.do_packagedata', 'xorg-appiceauth_1.0.7.bb.do_packagedata', 'xorg-appxinit_1.3.4.bb.do_packagedata']
meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb.do_packagedata with hash 7b3f9a883729dfe908e17980476d10e2
 changed to
meta-openembedded/meta-xfce/recipes-xfce/xfce4-session/machine-host.bb.do_packagedata with hash f51309cb641c82a6d8e2dc5387bb6484
Hash for dependent task xfce4-sessionmachine-host.bb.do_packagedata changed from 7b3f9a883729dfe908e17980476d10e2 to f51309cb641c82a6d8e2dc5387bb6484

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-xfce/conf/layer.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
index 55bcef6..64b1077 100644
--- a/meta-xfce/conf/layer.conf
+++ b/meta-xfce/conf/layer.conf
@@ -17,3 +17,7 @@ LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "gnome-layer"
 LAYERDEPENDS_xfce-layer += "openembedded-layer"
 LAYERDEPENDS_xfce-layer += "meta-python"
+
+SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
+  xfce4-session->machine-host \
+"
-- 
2.6.3


