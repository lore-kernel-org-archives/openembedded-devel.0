Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.6905.1620698858812163883
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 19:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gnySSMkx;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id l13so18457072wru.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 May 2021 19:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QwdKkMO6xZ/7gNpLDSYCHdimVXjZMFUhG6B7TFMZvrw=;
        b=gnySSMkxnZyIyB8R597CxSwoNyP5F+5w2BPBlDmVABDFXaMd97BBEy4jTQup0srR8k
         cZgmEIpdE9rH4mbLH+6qYeK4D/fBqhI9jHrStj0nMd3c2obZQMpW9iKlzLZhuNGwvzID
         dLub8dg3luHFYjlxA3Bhg0NlL6fq14gIfLZ4j5sRQExfj6LtLuUHI4k2ijrt5bPYj4u6
         RCFcHomj7RAGit2rRwUJZFlsLN2s5OF0ATmyqM+aUEMrD9ZJT79yIPH/i6Wr0yHTbTpX
         rMWDEIveVzya50LZAYfCZxXUzf6XplFUo4FTR3Bnv0olZE5pIML64pUUHHKfE1ju3tx3
         Q3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwdKkMO6xZ/7gNpLDSYCHdimVXjZMFUhG6B7TFMZvrw=;
        b=STJQLxBnU1ejNw4lmSX9mn7/NM3SdEiHqEt6Y2YhtD1qB3iL2+sR/+KBdFqwLOL/9l
         GBYTrhLxQdDiAiV/a/BgP8CfQZhaJJgOCvFKiDJoBU6nfsmIv1rA4FJe2wazvTWSZkW4
         hOlf8pgLe7fiFLGJqRBf3a08sL9HWQm74k5hgioRzMtZ9GMt7oo1QrIhEtKctU+MO5pC
         QmIZ7BZ6VCypcezFAGPe1ooNeRx/rPAxF0VhknuzgoUI7VIESxR/kI5o+yB4B4FB+pHb
         a6yCLQlOhdFsNFhU1Qog5DTFyAymZmYXBFQ72dw0/Y+BXzd6uqXJPK0MF3x/toFQreBy
         xk1Q==
X-Gm-Message-State: AOAM532N8LNcAxGGU9Rts9ai5nuXnNwBkWvnPXAIGEzb3pyX3FJNPl+H
	0k8MP5iTJAn7KlPZcotjJnvNDlBEa0E=
X-Google-Smtp-Source: ABdhPJygbDbK+1QiJSIF3H5prOF3qTLnDIIGvhFF1KBrOeoqJ4Vx4ak3Z5NhAJ0BuUOeqzzSjwLXtA==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr34376864wro.359.1620698857306;
        Mon, 10 May 2021 19:07:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f4fac346ac282ef7d435921.dip0.t-ipconnect.de. [2003:f0:7f4f:ac34:6ac2:82ef:7d43:5921])
        by smtp.gmail.com with ESMTPSA id n12sm20145075wmq.29.2021.05.10.19.07.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 19:07:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/7] xfce4-systemload-plugin: upgrade 1.3.0 -> 1.3.1 / introduce PACKAGECONFIGs
Date: Tue, 11 May 2021 04:07:20 +0200
Message-Id: <20210511020725.346160-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511020725.346160-1-schnitzeltony@gmail.com>
References: <20210511020725.346160-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Both dependencies upower/libgtop are optional so add PACKAGECONFIG and enable
  both because they are worth it.
* The term '(uses libgtop as a fallback)' below is a bit misleading: In
  xfce4-systemload-plugin-1.3.1/panel-plugin/network.c we find whole code
  wrapped by #ifdef HAVE_LIBGTOP / #endif. So in case libgtop is not found
  nothing of value is compiled.

1.3.1 (2021-03-22)
=====
- Update README.md
- Update and sort the list of authors
- Add a simple network bandwidth monitor (uses libgtop as a fallback)
- Remove 4-valued history
- Fix initial progress bar value
- Fix system-monitor-command setting (Fixes #15)
- Distinguish uptime from the appearance of a digital real-time clock
- Replace "Options" with "Label" in the properties dialog
- Finish porting to xfconf
- Update docs URL
- Code cleanups
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...oad-plugin_1.3.0.bb => xfce4-systemload-plugin_1.3.1.bb} | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/systemload/{xfce4-systemload-plugin_1.3.0.bb => xfce4-systemload-plugin_1.3.1.bb} (62%)

diff --git a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
similarity index 62%
rename from meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.0.bb
rename to meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
index e6a5ec0b2..151ce3849 100644
--- a/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/systemload/xfce4-systemload-plugin_1.3.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9acb172a93ff6c43cce2aff790a8aef8"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "upower"
+PACKAGECONFIG ?= "network power"
+PACKAGECONFIG[power] = ",,upower"
+PACKAGECONFIG[network] = ",,libgtop"
 
-SRC_URI[sha256sum] = "1148f8e90cc53cae9b3aa32e10df4bd9fdc2f06db09d8429f88fbdd874fc171d"
+SRC_URI[sha256sum] = "56d1007801d52d7c2b5a13bb54745f6d7f06fda28b49ce936145633068817652"
-- 
2.30.2

