Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D8D3678821
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 17:36:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id m26so4093505pfj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 09:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UzDHQDyYbsWYq8e0S1qM9SLOaelaiz/1TzJuSzguyr8=;
	b=FwhP7MzwOqMcDn1RQOU9ryGda/MYtQmi7rdP5ORXLqWOt6SmfXLymBbbVyx1wRWSYO
	w602Dz2tMvJsrTQTTN7GW1JDKcWzVBdGnutJeHULqZrsUP/t8e0s+7U7zt1inikvpkPm
	ILd9XP5khAvQgi6DM/AZxksTERusy6AsMGTzbTGAIo7oaui/zjdamPM39cbCqy1sKAto
	1bADvy9vYe1qNwIOXc19hdYZC6cGDjmNLcXeW1mZY9VmMywPNvKGCBs4AKPeJHSfHu7W
	Ncxn7grVZBZmrtzShj6vrLCn9dgVDeht0p5+N5DFwpLtjKb3Ip5YPFiVXvzGDiQ7lWly
	zUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UzDHQDyYbsWYq8e0S1qM9SLOaelaiz/1TzJuSzguyr8=;
	b=J8a8EFPoYNbUdTnVA00Ph02WIYpvf+7lipt8Ul/8alP1MpC+RH9c46zGrRQ9eRvcsW
	5XZqdoMqK5QcvRXK16lccmPhU/NczC1phltkPB0uz9dQKBa2KICj7vKkKmhZMtYFj6Pg
	Q/38annMfClVd5vJrSNdygh0aVxhGucnOYpjm24nk0X9wrxuFAXPIBQTdnhiSMDD0yt9
	n1JlWOJVPB3uB6XWMJNvhgWDliHW3iWt8ZGmW2cMf7eoGfZ/htfC3XV7igE5byjfdc2i
	+0NhJrsgRb4EGmyR8FoviN8WvqSGuz3ZFo6/rgL18HmN3PyamGVBjLbpb/Zj1JeApaUW
	YVhQ==
X-Gm-Message-State: AKGB3mIuOKWeFS7rmLA9QFGC7UQcygKEyw7FHnSGl1RwFCcINMhZQ13Q
	2U1Xekb1Zy0Qj9Ho5gK14if5Bw==
X-Google-Smtp-Source: ACJfBotm7gAv9KtasrAXH+E578LW/UDVNs6PzJpwJVF2ARl8v3utJjN5zlnFCCM4sWk2SxAiaqpxSQ==
X-Received: by 10.84.253.150 with SMTP id a22mr10114658plm.65.1513273005749;
	Thu, 14 Dec 2017 09:36:45 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::c579])
	by smtp.gmail.com with ESMTPSA id l14sm7437748pgn.9.2017.12.14.09.36.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 09:36:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 09:36:30 -0800
Message-Id: <20171214173633.16405-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171214173633.16405-1-raj.khem@gmail.com>
References: <20171214173633.16405-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 2/5] gtk-xfce-engine: Fix build with glib-2.0 > 2.53
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
X-List-Received-Date: Thu, 14 Dec 2017 17:36:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes errors like
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xd6 in position 980: invalid continuation byte
Makefile:737: recipe for target 'xfce_typebuiltin.h' failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gtk-xfce-engine/glib-2.54-ftbfs.patch          | 23 ++++++++++++++++++++++
 .../gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb       |  2 ++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch

diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch
new file mode 100644
index 000000000..fb8910204
--- /dev/null
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine/glib-2.54-ftbfs.patch
@@ -0,0 +1,23 @@
+Description: Fix FTBFS with glib 2.54
+ glib-mkenums now expects input files to be UTF-8,
+ fix the encoding of libgnomeui/gnome-scores.h
+Author: Adrian Bunk <bunk@debian.org>
+
+ported from: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=870738
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gtk-xfce-engine-3.2.0/gtk-3.0/xfce_style_types.h
+===================================================================
+--- gtk-xfce-engine-3.2.0.orig/gtk-3.0/xfce_style_types.h
++++ gtk-xfce-engine-3.2.0/gtk-3.0/xfce_style_types.h
+@@ -19,7 +19,7 @@
+  *
+  *  Portions based Thinice port by 
+  *                       Tim Gerla <timg@rrv.net>,
+- *                       Tomas Ögren <stric@ing.umu.se,
++ *                       Tomas Ã–gren <stric@ing.umu.se>,
+  *                       Richard Hult <rhult@codefactory.se>
+  *  Portions based on Smooth theme by
+  *                       Andrew Johnson <ajgenius@ajgenius.us>
diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
index ae7f99f5a..ef4f4bfa8 100644
--- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
+++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
@@ -8,6 +8,8 @@ inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://glib-2.54-ftbfs.patch"
+
 SRC_URI[md5sum] = "363d6c16a48a00e26d45c45c2e1fd739"
 SRC_URI[sha256sum] = "875c9c3bda96faf050a2224649cc42129ffb662c4de33add8c0fd1fb860b47ed"
 
-- 
2.15.1


