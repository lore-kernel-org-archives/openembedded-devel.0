Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.48682.1591047955018606579
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jun 2020 14:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pMVS40/R;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id g10so932254wmh.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jun 2020 14:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pcgt8lBqCjNTXByCWdtjkffiUj9Ebx5er9K3xwFGnEQ=;
        b=pMVS40/RYkC0f8dGcWLjsYVG0Ygh/mre9LFwaxpB4XZDkv68mCjk5SMH0khQSYaMIn
         ZugtEs42+LiRcamNhvFDAdYvKeQ96YEnlJqoSDczjjAbbAem+PPsdyR3UTKbzdAk6rzr
         5ID0aZL+KrgYfGkjUCHOZnylSwVPyIvvK3UcYurhQAiQMRT7IzHXvnTQ7fHhJvpq0DMZ
         RDxWX6QPrnU7lgPcd08K4G23ASWfX/qkkCIRzp+rOcyTZDr72q7Rx8u0zQx4R/4UleUF
         B0iOMINMunuLshpMaIENB6q+qcWSq+Z67M234se2G5zsewWnAuiRJ16BQtMZgC/z1oKL
         9rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcgt8lBqCjNTXByCWdtjkffiUj9Ebx5er9K3xwFGnEQ=;
        b=aFWml53KjkJ9NNee5vTV79hXy12VHZaph8w2ngbhe8S/Xblto2aT6KDGoHPXQNIHP+
         3eEIUcgTZIj1R35XUtZz8lsuPlx/lBqPFTdtbWaibHFG6ZvfkgHOYo1lYEwCiX2SCKpt
         HxKlEwyfr1vqWbJ/j/vV9Xrv2jP9KpINc1oBj6ufHoou6ZQ+Sj+OVquucHGSb4qpWY18
         iaxx+8YQ10xKcPWKVNUcJlTS0vzcTQLv6k/feUIcWl9QC4h7DvKQrhEI0TkOVenQ9zIs
         xqxoFxrOi+b2B33Oj1bGmIefG80MbFznFcNmPFycVjTE3vZ8K6WyN5SJak7NoqXNfjGK
         NL7w==
X-Gm-Message-State: AOAM530HbLBga0EufgyiDa12fVMrVa2KMMU3qIkNagLSZ8S9tqoAOoVd
	vcXNiuwQy4gmQL6UAVxBYrmUhxBcsKo=
X-Google-Smtp-Source: ABdhPJwCMv9qN60V8BS/3kzvTjtIpQM3VMbKSa2GJkI1gS2NZ682y86VOdcNORSrtAlO20Evc6XkHQ==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr1209962wmc.142.1591047953416;
        Mon, 01 Jun 2020 14:45:53 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f06ad34da2c69d11ac2eac0.dip0.t-ipconnect.de. [2003:f0:7f06:ad34:da2c:69d1:1ac2:eac0])
        by smtp.gmail.com with ESMTPSA id 40sm1050119wrc.15.2020.06.01.14.45.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 14:45:52 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 26/38] gnome-session: upgrade 3.34.2 -> 3.36.0
Date: Mon,  1 Jun 2020 23:45:04 +0200
Message-Id: <20200601214516.26624-27-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200601214516.26624-1-schnitzeltony@gmail.com>
References: <20200601214516.26624-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.0
==============

	data: Require UsbProtection component
	doap: Call this "GNOME Session Manager"
	Translation Updates: Indonesian, Punjabi

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-session_3.34.2.bb => gnome-session_3.36.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-session/{gnome-session_3.34.2.bb => gnome-session_3.36.0.bb} (86%)

diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.2.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.36.0.bb
similarity index 86%
rename from meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.2.bb
rename to meta-gnome/recipes-gnome/gnome-session/gnome-session_3.36.0.bb
index 15bf489c7..29a2e1ee2 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.34.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_3.36.0.bb
@@ -22,8 +22,8 @@ inherit gnomebase gettext gsettings upstream-version-is-even features_check
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit systemd pam gobject-introspection-data"
 
-SRC_URI[archive.md5sum] = "38dcdb844a0349cc2fb10998095543e4"
-SRC_URI[archive.sha256sum] = "8bb77381650a03ae4be7260751363bd27da93f09bac1ddbc885f4ce44ebaf8e1"
+SRC_URI[archive.md5sum] = "cd23e30c4991ca1f477020c67ea3a540"
+SRC_URI[archive.sha256sum] = "d54b38b818c812f64b82cc6a1279e3ca5a6e391ee662793322a38cab5670bb7a"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit',d)}"
 
-- 
2.21.3

