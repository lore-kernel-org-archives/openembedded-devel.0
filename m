Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f193.google.com (mail-wj0-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A9FC771AE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:41:03 +0000 (UTC)
Received: by mail-wj0-f193.google.com with SMTP id xy5so46568561wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=K2bCoObVmWXpfWNc7OZwFRdK33Tx9Hg1NoiHSGA348M=;
	b=XsiIRV12D7GZwG8cqyzdUx0gOTjqqDkyMf4bGmBenGglcaCGbBdPXsqbFs0tGstgAk
	1jXKoTM8+/+m21IYLVZCxdC6gnk3pdCSfE/r4f7ph0ftCi7FaXcL+eqVF+oXOB4IIUXL
	elWjoDohv3spHSCM+8TIP8L5LY9TyXQFrwPu2Wm0BXD1Hv+Rvaw7K4LUQRhxhWXfo+lo
	YsO5gE/9sq16hxwhsXoVR/g9IXfgEhaSpiIX1WYr8LnDGh4KlGmFvIRqlda3FPjQabvb
	CsMZQ3yE05anY5thl5BBxD57H2MCUzT0xCvNt436ISJWU4doGUAPsHJTo4M9vijO88ga
	ZrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=K2bCoObVmWXpfWNc7OZwFRdK33Tx9Hg1NoiHSGA348M=;
	b=mfgEqQhuIZ0pC5G0Ndn5AolSUMSkTqgZu8/s2fXuWHpgSht7b4jCjwH3kNZEL3g0pe
	D54wzW1Bx1nWQpyqhjyffxpkMea3bx4y4x3RtGYrtG6XN7LE5JExrcENqC4z5XFfdtrm
	UgkO9Kc5UWrrtg0nxHcj+nnIToiOVlNbw3xLuyRrOJU7maUkrdb5GhFOPaokviphcrwN
	4kjKBF2iecbf8C3CTsdpjkPSpbfQfisQiW5M31qCae+b2cCcyBDWzDDuyz6pcYE4jHNz
	8ZBxpTv+jvfzwpEMzUJC9SCg44m+SHImmnCn4+CfYlrjMLW83D+AvBMH2YdjDMoS/7Jg
	+Yvw==
X-Gm-Message-State: AKaTC03G0Kfs0GF5JHamfmYXS2Cc3xkOuMdw+xbvGY01Sw0KLCwevGkAvQB5JmmBc4G6jA==
X-Received: by 10.194.81.233 with SMTP id d9mr68538706wjy.118.1481064064189;
	Tue, 06 Dec 2016 14:41:04 -0800 (PST)
Received: from localhost.localdomain (p579CEAA5.dip0.t-ipconnect.de.
	[87.156.234.165]) by smtp.googlemail.com with ESMTPSA id
	j6sm28060674wjk.25.2016.12.06.14.41.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 14:41:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 23:40:40 +0100
Message-Id: <1481064044-26249-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
References: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] exo: update to 0.11.2
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
X-List-Received-Date: Tue, 06 Dec 2016 22:41:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch was applied upstream [1]

[1] https://git.xfce.org/xfce/exo/commit/?id=fea2619e6d07ac72b2eff6f408bb3daa2dbdf671

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ----------------------
 .../exo/{exo_0.11.1.bb => exo_0.11.2.bb}           |  5 ++-
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
 rename meta-xfce/recipes-xfce/exo/{exo_0.11.1.bb => exo_0.11.2.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch b/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
deleted file mode 100644
index 16f12fe..0000000
--- a/meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fea2619e6d07ac72b2eff6f408bb3daa2dbdf671 Mon Sep 17 00:00:00 2001
-From: Sean Davis <smd.seandavis@gmail.com>
-Date: Thu, 27 Oct 2016 20:31:36 -0400
-Subject: [PATCH] Probable fix for Thunar detailed view (Xfce #12916)
-
-Upstream-Status: Pending [1-2]
-
-[1] https://git.xfce.org/xfce/exo/commit/?id=fea2619e6d07ac72b2eff6f408bb3daa2dbdf671
-[2] https://bugzilla.xfce.org/show_bug.cgi?id=12916
-
----
- exo/exo-tree-view.c | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/exo/exo-tree-view.c b/exo/exo-tree-view.c
-index 8c8564f..2d0fc04 100644
---- a/exo/exo-tree-view.c
-+++ b/exo/exo-tree-view.c
-@@ -385,13 +385,9 @@ exo_tree_view_button_press_event (GtkWidget      *widget,
-         }
-     }
- 
--  /* see bug http://bugzilla.xfce.org/show_bug.cgi?id=6230 for more information */
-   if (G_LIKELY (gtk_tree_selection_get_select_function (selection) == (GtkTreeSelectionFunc) exo_noop_false))
-     {
--      /* just reset the select function (previously set to exo_noop_false),
--       * there's no clean way to do this, so what the heck.
--       */
--      gtk_tree_selection_set_select_function (selection, NULL, NULL, NULL);
-+      gtk_tree_selection_set_select_function (selection, (GtkTreeSelectionFunc) exo_noop_true, NULL, NULL);
-     }
- 
-   /* release the path (if any) */
--- 
-2.5.5
-
diff --git a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb b/meta-xfce/recipes-xfce/exo/exo_0.11.2.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.11.2.bb
index c145ce0..cb29c34 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.11.2.bb
@@ -14,15 +14,14 @@ REQUIRED_DISTRO_FEATURES_class-native = ""
 SRC_URI += " \
     file://exo-no-tests-0.8.patch \
     file://configure.patch \
-    file://0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch \
 "
 
 SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "866292556586facb034191aa66431697"
-SRC_URI[sha256sum] = "c70c47f690284a5cb4f507dd89088efbdd8123506f924e33a5f97aab74eb97d4"
+SRC_URI[md5sum] = "0b036c8042a2ed5d3767d1177a4213a2"
+SRC_URI[sha256sum] = "76bd1c4229503ff3c301485de3a41c55dec93e98de1a9eef1be77fe502ca4f77"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.5.5


