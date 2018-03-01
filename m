Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7440E78914
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:02:08 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id v111so8268492wrb.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Zke0NXfKuma/m//SjWg8bmtrNQiIQh7cevKx1F9k8h4=;
	b=XojoMQuwnhs+TzYtntaKM6KMwFJXLnpVYGjIbPzN93tHq0lRUO2KRb+pcdl/2KSnvU
	tlybF+atTqlC5alfhrkr0hA1YYvnyIfar2kABunD/B18U2c1eCq7VSfUTDQmU9RcLf8R
	iBIa8BxHX7g7vG7zJRcZ6oREiR5gPyF4UMnz6pkVjTL+wTx2I0a6xYU9aK7soiutCYiV
	Jg8MifYKe1rm4vXGe7XpsgyfZbq1WL3JNB4mi4J4G7ZdjU0nIW3e5h21C8qx34iz9R1g
	3XQDKoIbqxNqkZmCFQHQcoFD0WSL7k+acxL4Wqma54vF3kJeItUlwLWYCSKK0K9pbfOX
	DvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Zke0NXfKuma/m//SjWg8bmtrNQiIQh7cevKx1F9k8h4=;
	b=CMJExjN1rvF2ojifYrt41yuwoBOBeMHI8C/BzKsklZ5bjir0HpIZH/O4cFYl7+AseO
	elo6D1S0WLetWlrYgwgtjwUwsP+eBmffDHzfgfHcZB36tzKMIUKRYDLBB1NbJGOV6XsY
	mttqy3bQdwiYR1o+ohuilAKpqLVW/+nJaYUj+5gCRWRelDNeO0vd5oQ2aP3MZr+j4sXu
	Hp3iJitZsZWvMZ2QtH6Zfcfg8IEEhaML01VGvMLRwDH5APSu3I6a/Jx4Q4H8JsYuQ6u9
	NG7IbVkAMr42dZnt0YvIuzKSoI/bvtdb5wSdAz5kne+qkHsoty4kjqyjAl+6z4yNO5hb
	9pRw==
X-Gm-Message-State: APf1xPAKobmUyZYg5FS8/TuhuAVNCHjqELVOti8le+XR6W/MXOSWRlzx
	MSAYO17KYHqIWD+NR5oSYPpMtg==
X-Google-Smtp-Source: AG47ELt3qK5+fp3p5fWY2TTRFSVfjnw9egVeRPF5PWoSCaD2WikYfbSvqPSH6xmzVBAkmcE0oPkkMQ==
X-Received: by 10.223.134.42 with SMTP id 39mr3371293wrv.10.1519945328931;
	Thu, 01 Mar 2018 15:02:08 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC063001E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6300:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 8sm5490wmf.13.2018.03.01.15.02.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Mar 2018 15:02:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Mar 2018 00:01:43 +0100
Message-Id: <20180301230148.2284-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301230148.2284-1-schnitzeltony@gmail.com>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/12] xfce4-timer-plugin: update 1.6.0 -> 1.7.0
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
X-List-Received-Date: Thu, 01 Mar 2018 23:02:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* 0001-Specify-string-format-explicitly.patch: Code was restructured and fix
  was done upstream.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Specify-string-format-explicitly.patch    | 32 ----------------------
 ...plugin_1.6.0.bb => xfce4-timer-plugin_1.7.0.bb} |  6 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch
 rename meta-xfce/recipes-panel-plugins/timer/{xfce4-timer-plugin_1.6.0.bb => xfce4-timer-plugin_1.7.0.bb} (65%)

diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch
deleted file mode 100644
index 3f0bb05af..000000000
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin/0001-Specify-string-format-explicitly.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 6b786e1c161026ab5486ac218891a85db65bf3ba Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Mar 2017 15:28:24 -0700
-Subject: [PATCH] Specify string format explicitly
-
-Avoids below errors when compiling with -Wformat-security
-
-error: format string is not a string literal (potentially insecure)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/xfcetimer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/xfcetimer.c b/src/xfcetimer.c
-index 601772f..4b89682 100644
---- a/src/xfcetimer.c
-+++ b/src/xfcetimer.c
-@@ -190,7 +190,7 @@ static gboolean update_function (gpointer data){
- 
-     dialog = gtk_message_dialog_new (NULL, GTK_DIALOG_MODAL,
-                                     GTK_MESSAGE_WARNING,
--                                    GTK_BUTTONS_NONE, dialog_message);
-+                                    GTK_BUTTONS_NONE, "%s", dialog_message);
-                            
-     gtk_window_set_title ((GtkWindow *) dialog, dialog_title);                                    
-  
--- 
-2.12.0
-
diff --git a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.0.bb
similarity index 65%
rename from meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
rename to meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.0.bb
index 961519285..2ddc6f67c 100644
--- a/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.6.0.bb
+++ b/meta-xfce/recipes-panel-plugins/timer/xfce4-timer-plugin_1.7.0.bb
@@ -6,7 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae39271267fd63eb7619432ff24e7ff1"
 
 inherit xfce-panel-plugin
 
-SRC_URI += "file://0001-Specify-string-format-explicitly.patch"
-
-SRC_URI[md5sum] = "3be2a4ccfb2af20441b1d25c2cea5f28"
-SRC_URI[sha256sum] = "39d7d21f099bc4219f6a6156142f0bbb8374986ee1970a9c0c8dc138b87f867c"
+SRC_URI[md5sum] = "32e6a14e80bf9a93db2f2b3bfd7de920"
+SRC_URI[sha256sum] = "2e4e5343e39926230cc981d5fe56cd58a2f3817d2e9b6089b5673a2e39bf7e9b"
-- 
2.14.3


