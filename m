Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B913C7C37F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 21:31:30 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so9325760wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 13:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=E9e1pTU4SQ7Kr1fh/35/0rT9RWU/jlVhMnAzSHHPuis=;
	b=YZLZwwwIEzpuPQ6nZqMxKbQf8RY2e1IIWYEMM2RQogIiHaz47ex90cjCX1qfVYEuqk
	T6bZj5GCsVpgwgMXOyJn0i8lT7Jofsgpz8UWg8fwIJPzmDVpS7vfinxPoNaEa4v8oEYw
	izJ71ltYrR0UNV9XL50oJaXDyuLzV3HWUVcxWwuo1Z6xhUS7bh4b3ZJxC3ukc/+6RYuu
	UMTIa53h+OS0qZxb2++bKrw/yWt3stUtyhC5GHkHxzcOuXUG6rWiWapOA/CHkBVelvlp
	ge4408A2D3TRWApx0mTWI8Plg5wAYwKb+v8dW8w84bMzRayORdMcigWXcjyN6yv8GtnJ
	8Maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=E9e1pTU4SQ7Kr1fh/35/0rT9RWU/jlVhMnAzSHHPuis=;
	b=RRe0z/Yc7RLETU69zK0QS26UPfp7wPIx8rH28ZK645+AdrTYDQxkVtyrN3/3YIdc2v
	+Owtl9XesJ2SGMCSshzn6aL2E+lj8Su8Tz4lGIaQDSx9Q0OHOOJnc27+Lwjph5z0cDdV
	WAmZRy6fjoZjeD4zDPA8X9WaG8FP56x1BhLbovkwvdXbCsbELWWTcWAxCbFKJkZ0EboJ
	Z+Ihph+xGYrl+U+CvRIjEa5bKkuRAY6mL7SPyHCA52k9jZOE4DYLJwhKLqq/y4xk7lbS
	3gHzUrCe0GJI+Luyn/7l+NHMDWYp0w6SkS/cCNoxS54uFEgBJcXB//Lu20GCSnjzUwB4
	yvkA==
X-Gm-Message-State: APjAAAWgC0k6yqBFBqi8NDjhdY/CQLg8uuHD9OxkHrGptO+artr1jLa3
	8d4J7pLGzKjzaBBG6EfNtxAQQxsDPGQ=
X-Google-Smtp-Source: APXvYqyDgGoxY+LBOVepaGWKJrdndl87L1jgQxvShG3o1dgCfY0n3kkDh6ebjl7E6KriNnKotYYIDg==
X-Received: by 2002:a7b:c946:: with SMTP id i6mr20477815wml.28.1577482291333; 
	Fri, 27 Dec 2019 13:31:31 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F052B8722A751F738295925.dip0.t-ipconnect.de.
	[2003:f0:7f05:2b87:22a7:51f7:3829:5925])
	by smtp.gmail.com with ESMTPSA id
	m7sm11915929wma.39.2019.12.27.13.31.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Dec 2019 13:31:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Dec 2019 22:31:02 +0100
Message-Id: <20191227213120.3930-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227213120.3930-1-schnitzeltony@gmail.com>
References: <20191227213120.3930-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 05/23] xfce4-terminal: upgrade 0.8.8 -> 0.8.9
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
X-List-Received-Date: Fri, 27 Dec 2019 21:31:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Looks like a bugfix/translation release:

Release notes for 0.8.9
=======================
0.8.9
=====
- Respect the "Working Directory" setting when opening initial window (the
  current directory was used instead). (bug #16292)
- Disable "Paste" actions in read-only mode
- Point session manager to desktop file. This means that the session manager
  will know the (translated) name and icon for the application. This is visible
  e.g. in xfce4-session-settings in the "Current Session" tab. (bug #16121)
- Resolve G_TYPE_INSTANCE_GET_PRIVATE deprecation warning
- Allow to use <Alt> shortcuts when menu mnemonics are disabled - like <Alt>h
  which is normally used for "Help" menu. (bug #15989)
- Fix 'Menubar starts shown when set to hidden in properties' (bug #15979)
- Fix invalid geometry on Wayland. Also fixes the issue with increasing the
  window size when showing or hiding widgets such as tabbar, toolbar, menubar
  on Wayland.
- Fix size increase when the menu is used on Wayland (bug #13938)
- Avoid passing null pointer to g_warning()
- Replace GLib threading functions with their GDK counterparts
- Fix setting a font via the command line (bug #15869)
- Properly apply zoom factor when creating new tab (bug #15785)
- Add icons to "Cancel" and "Paste" buttons
- Fix background color changing when changing focus if "Vary the background
  color for each tab" is enabled (bug #15740)
- Revert "Save accelerators map on exit". It turned out that saving accelerators
  map on exit prevents users from disabling the Alt+N shortcuts by setting them
  to "" in accels.scm. The shortcuts that had been disabled got overridden on
  the next launch of the terminal. (bug #16058)
- Allow to unset window urgency hint even if "Visual bell" is disabled (bug #15729)
- Unmaximize drop-down window when hiding it. This seems to help xfwm4;
  otherwise, it won't be able to unmaximize the window once it's shown again.
  (bug #15681)
- Allow to use --maximize with drop-down windows
- Search dialog: Make opacity scale unfocusable. This prevents the text entry
  from losing focus when the opacity scale is used.
- Fix closing tabs with middle click. This includes switching to last active
  tab, allowing to undo close tab, and checking for a running process. (bug #15687)
- Translation updates: Croatian, English (United Kingdom), Finnish, French,
  Galician, Greek, Italian, Lithuanian, Norwegian Bokmål, Portuguese, Slovak, Slovenian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{xfce4-terminal_0.8.8.bb => xfce4-terminal_0.8.9.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_0.8.8.bb => xfce4-terminal_0.8.9.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.8.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.8.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.bb
index ebc046b78..493758c18 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.8.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.8.9.bb
@@ -8,7 +8,7 @@ inherit xfce-app
 FILES_${PN} += "${datadir}/xfce4 \
                 ${datadir}/gnome-control-center"
 
-SRC_URI[md5sum] = "4295d4d783f6d6dfe92f5bb15d96f6c6"
-SRC_URI[sha256sum] = "8fba6a60d3a0fee07417ad7c36bf78cc45be1b27f0759e125051aa73f08487fd"
+SRC_URI[md5sum] = "cb40a6cc5b3e35fa4d68f1b702f11027"
+SRC_URI[sha256sum] = "247683a51a964cfaa6b1e92030afe9f782efebfcb550a464170b53eb94216795"
 
 RRECOMMENDS_${PN} += "vte-prompt"
-- 
2.21.0


