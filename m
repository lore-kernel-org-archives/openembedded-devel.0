Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.14260.1587292113425522496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2020 03:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ve/yzWIK;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id v4so2261229wme.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2020 03:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6XhSCB013m9Gb6TRcWRBO5CVJf2bJl3MJrThuA4YTuw=;
        b=Ve/yzWIKbhKPBuU6wtC6yyQQBNp+/DNQ6kVfxYok0YM2Onu4ZoaifoYoHwAEgWcD3K
         BUnADfJFH1h9S9qqimofNO2U+ktATRwNuQDV3pGbRlOGvDI0/jrmE3ahc9RBhY2hRgIN
         aAY9AZOEHNE6m6xgZ23DrFHby4rAN80BO2gLHq3J4XcehAAHdcDehZaD2K1eOeMKQfye
         f7oF0M70zunsnLvuQK/mZpKYw0RN5s9YhWRoBEUaIbKdtfI7jAPj/p8Cox3sX/PP2ywh
         8xCOood+Zk+QkirwGbj46Q5wVfM4qwx5HDL7gw6fURxEGVFO5+0YJmAIZ1gtjT6pm6Ub
         W/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6XhSCB013m9Gb6TRcWRBO5CVJf2bJl3MJrThuA4YTuw=;
        b=hUpM4s2S25aTnMnpJVDMAou5srNqtzFpaDxTNvbVezS+YvI0QYJaXuz+4XqVgUiQxN
         T+sXkp42kC6vDEdEBKk4qYVnxt97qx4XupEjaAfz79yuNHibIssdI0K+954/JhbUQVCH
         YTn/YY/lCFVS9UPext5dd+s40ux3cJFYm/TtF3WF62LrC2ghOiiZCcAHo4yDC7K4jYyJ
         CBRMsZKiKPo7PmSgwvi3fC9HB5Flh/ErRoFj3dA1xYEFaa3bzqJNqsrq0CxxlBRUvuzJ
         j28tOlsYI3lSqyd104EZChrbyGtkFm06/z/SUiWo3LTRwv8WFjhGTt7wKcBSfNeoczI8
         L4nQ==
X-Gm-Message-State: AGi0Pub+sts778Cq4Enp3gdOfyEnnb1hd3zE9+93S61kDLJzsJGLrV5M
	omYqktnUukNGxtoREZZZg6ifuB+f
X-Google-Smtp-Source: APiQypKprjDwEAviOQEJuUyU8Q5KiUAR/g7MzIJHiQuBBDxOlixajGISEyNIQ1eJkWsDZTa8WelP0Q==
X-Received: by 2002:a1c:23d4:: with SMTP id j203mr3643813wmj.49.1587292111568;
        Sun, 19 Apr 2020 03:28:31 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F307D87D57164A5D9C87CA2.dip0.t-ipconnect.de. [2003:f0:7f30:7d87:d571:64a5:d9c8:7ca2])
        by smtp.gmail.com with ESMTPSA id h6sm14946789wmf.31.2020.04.19.03.28.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 03:28:30 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] xcb-util-cursor: initial add 0.1.3
Date: Sun, 19 Apr 2020 12:28:19 +0200
Message-Id: <20200419102819.2849-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Have it in meta-qt5-extra for a while
* Now meta-musicians will depend on it

=> move to a more common layer

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xorg-lib/xcb-util-cursor_0.1.3.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb b/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb
new file mode 100644
index 000000000..f935edd6f
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.3.bb
@@ -0,0 +1,11 @@
+require recipes-graphics/xorg-lib/xcb-util.inc
+
+SUMMARY = "XCB port of libXcursor"
+
+DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
+
+SRC_URI[md5sum] = "6ac3b17cba51aaaa36ba035a53527214"
+SRC_URI[sha256sum] = "05a10a0706a1a789a078be297b5fb663f66a71fb7f7f1b99658264c35926394f"
-- 
2.21.1

