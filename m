Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 336187807A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id s66so6946774pfs.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kyO+J1+NE0P4cJail/sosU9dTrVK9igoCQNL6Lb5No4=;
	b=OKBZ5AiFO9c79Qblodjo0CRvVxxr7U1PUo3nqaukd0D8+tiXd68OYqO3OloFgNcbmn
	Aty7RmfG/j6Cq++t40kC7kM1EjxvvzI385Mzb/nLRvLD/RXgMzWWcomJw5R93sAGIG+z
	ShKFgIdJ/bhE/gBeJsKjOHTAFt5FfbQWXB7+XKpcslGs+nAzEuIx4/D6jDv7EireAhH9
	RA577cMNyMB0u5wBDg3tG8zKbBCKxRzuTbCn/nvhnvvYMLxLMuUTFs1cgavc1Z4lEJvw
	3c132WlDL61oNuUmkjQxC+AAiHXsESBWNkVm4hJyUECm3wYRZDUVrLHMw8TOPp+1lu5k
	o9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kyO+J1+NE0P4cJail/sosU9dTrVK9igoCQNL6Lb5No4=;
	b=uet+0D2tWZyQXBjmdvNX2J3r5JKoVy0mHmro6K92h8UEd9TPbSsdLDWLoQsA4mJiv2
	OWLadUcDyYfkRBmXlG45oYYgEg3ncrZeYuzpGxHkBTHePL6MyRZpJSywwiIG9lyd3raV
	eoX7iqCICMckYK8cfQHmLgcpQrY8IMSaEzvrv+ZkgvoiwSme/cil1VYx7U4EN73hPO8V
	2dqZzFUGxQwmo3LyXejsggDeUx9y4Lcd1JDVMkjWBjfQJoVhuhdrUoAQcp2kBf6/LTU9
	4uMuZby0Q0JVjF7ksbzNdzEywKiX6bRL9spb1Auf4+Ta0O6lzOAQvr5SuEdvv3n46mCD
	HrzA==
X-Gm-Message-State: AKS2vOxwAz1e6xsSQCQ1uSvdar8UmR2lOFDrPQXRc6bUh4AGG9lJX52J
	3Z870Zx99TIBS0m4
X-Received: by 10.84.143.36 with SMTP id 33mr8982563ply.171.1498615735966;
	Tue, 27 Jun 2017 19:08:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:17 -0700
Message-Id: <20170628020819.17047-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 11/13] wv: Fix build with hardening flags
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...vRTF.c-Specify-print-format-in-rtf_output.patch | 26 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/wv/wv_1.2.4.bb            |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch

diff --git a/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch b/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
new file mode 100644
index 000000000..2fc3f367f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/wv/wv-1.2.4/0001-wvRTF.c-Specify-print-format-in-rtf_output.patch
@@ -0,0 +1,26 @@
+From 079529b8d5e339e2211fa2f8c15543a738a627bc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 14:50:51 -0700
+Subject: [PATCH] wvRTF.c: Specify print format in rtf_output()
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wvRTF.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/wvRTF.c b/wvRTF.c
+index 361d258..4f24b30 100644
+--- a/wvRTF.c
++++ b/wvRTF.c
+@@ -192,7 +192,7 @@ output_rtfUserData (rtfUserData * ud)
+     rtf_output_char ('{');
+ 
+     /* font color */
+-    rtf_output (rtfColors[ud->cCol]);
++    rtf_output ("%s", rtfColors[ud->cCol]);
+ 
+     /* font face */
+     rtf_output ("\\f%d", ud->cFont);
+-- 
+2.13.2
+
diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
index 6489c6f19..8ed1fcd15 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
@@ -8,7 +8,8 @@ DEPENDS = "libgsf glib-2.0 libpng"
 SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/wv-${PV}.tar.gz \
            file://pkgconfig.patch \
            file://0001-configure-use-foreign-mode-to-avoid-errors-with-miss.patch \
-          "
+           file://0001-wvRTF.c-Specify-print-format-in-rtf_output.patch \
+           "
 
 SRC_URI[md5sum] = "c1861c560491f121e12917fa76970ac5"
 SRC_URI[sha256sum] = "673109910e22d4cf94cc8be4dcb9a0c41b5fbdb1736d4b7bdc7778894d57c2d6"
-- 
2.13.2


