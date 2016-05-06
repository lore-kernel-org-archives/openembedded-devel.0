Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7EC731C4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:02:37 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id f92so56351652qgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=svVBpLtbgoBFQH7NuUl6RcQ9KIJiYwLyWqs+UiiASbk=;
	b=l6Y9oJ1RriI+v3hp2QwNCtVTK/HqdDwV3yT5xtTg7vH8fVh9mKklSKhfq8paXNMDqV
	0aCnSc2riDv1TUqw1T203cPYCX+JXyndwdZI7viyuRaRfwIIBSGmjagapbVwShHKM4Ug
	61+BPQvfonbpqPPEvA0tkWb6Rt8rHkiAqc2FoC1DcHfnl0mz6b3qjteQxaCW0r1rqSll
	6/yWubEGSqS2dj1Wl/fY8rAktaUr24+5Q734rFFLN1cHYClfmq5Oauz2MysPHWNKK9JB
	Ul4avD05t4QwukpNNoC/5lh2SDBB29MV0mgEL9B2YMlupDccQfwB5frZIXwDSXIRb5ql
	lH9w==
X-Gm-Message-State: AOPr4FXSbq4kELeVsMTaLdgiRbpJCjGnj08rYTyVIkyyXpNUilwvcKIm9Uwom+iOhwEo7A==
X-Received: by 10.140.108.247 with SMTP id j110mr20198606qgf.54.1462543358501; 
	Fri, 06 May 2016 07:02:38 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id f66sm5816708qkb.5.2016.05.06.07.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:02:36 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 06 May 2016 11:02:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri,  6 May 2016 11:00:54 -0300
Message-Id: <1462543259-7206-17-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
References: <1462543259-7206-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe backport krogoth PATCH 17/22] glmark2: wl_surface should be destoryed after destroying wl_window
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
X-List-Received-Date: Fri, 06 May 2016 14:02:38 -0000

From: Neena Busireddy <neenareddy.busireddy@nxp.com>

If wl_surface is destroyed while work thread is still running,
segmentation fault occurs.

Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...ace-should-be-destoryed-after-the-wl_wind.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
new file mode 100644
index 0000000..4395081
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch
@@ -0,0 +1,34 @@
+From 9c74ec83e2929b1d5ab65d5137b6ba42edeb332d Mon Sep 17 00:00:00 2001
+From: Yong Gan <b45748@freescale.com>
+Date: Tue, 27 Oct 2015 18:15:20 +0800
+Subject: [PATCH] Fix: wl_surface should be destoryed after the wl_window
+ destroyed.
+
+Upstream-Status: Submitted [https://github.com/glmark2/glmark2/issues/12]
+
+Signed-off-by: Yong Gan <b45748@freescale.com>
+
+---
+ src/native-state-wayland.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/native-state-wayland.cpp b/src/native-state-wayland.cpp
+index 41fc743..cdcdf34 100644
+--- a/src/native-state-wayland.cpp
++++ b/src/native-state-wayland.cpp
+@@ -56,10 +56,10 @@ NativeStateWayland::~NativeStateWayland()
+             wl_shell_surface_destroy(window_->shell_surface);
+         if (window_->opaque_reqion)
+             wl_region_destroy(window_->opaque_reqion);
+-        if (window_->surface)
+-            wl_surface_destroy(window_->surface);
+         if (window_->native)
+             wl_egl_window_destroy(window_->native);
++        if (window_->surface)
++            wl_surface_destroy(window_->surface);
+         delete window_;
+     }
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 98ce377..e29921b 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -13,7 +13,8 @@ DEPENDS = "libpng12 jpeg"
 PV = "2014.03+${SRCPV}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
-           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch"
+           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
+           file://0001-Fix-wl_surface-should-be-destoryed-after-the-wl_wind.patch"
 SRCREV = "fa71af2dfab711fac87b9504b6fc9862f44bf72a"
 
 S = "${WORKDIR}/git"
-- 
2.8.2


