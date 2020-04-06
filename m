Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.7328.1586164847600237435
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Apr 2020 02:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jf/o/o9T;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id x25so2825455wmc.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2020 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BE+aRDSGKrnP4pIoZMlaunbdAKeceHFcBflT5MKUn88=;
        b=jf/o/o9TjoK/CGYQcBdHB5JaErBfd9EzELBFSSZXmMrDPRVgtkqJzW/8e82/4C6PqJ
         /Y+QpbmUO/gx9IjDQjJllHDGfkAEPNQ0Qh/HI3UB2sD+Ptr1ek5cl6MXYDqwfCDv7x2Z
         VPdr+3nEfqZKTZPo9m6dcakZh1jj51EoJ5rQ3ZfoIZ7uM0Sp/YWwdSw66gqU1Zow/afR
         /DWMkQNthx3yT08o9G9G77LTrqpk4VgHcYmViC38C3qZ49aTQ+4dgRYfO8kdkgwJHW9x
         VZGCeA3u2QKm3m+MF1oVrcBfb7AKsnlpB6JfuC9P4C0g0H7/aWB5M/HgQQRPoAuvYNOT
         6xFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BE+aRDSGKrnP4pIoZMlaunbdAKeceHFcBflT5MKUn88=;
        b=Cc0/4kRpHH6U9GslN5JBOzZl+19GPNkWzCYRRUDeTpVdOFDDJUIeL5FRMktXXdTrNZ
         3NkoavqKPDwlcDciYIKX4xOfQDDmeq/6l5ojnUgn3eSBlINSlQlMtLOg6hkrEzRm4mAO
         VXXNQ0W2C7RoRighnbv2lBobdp+WxdBKDllw7nZk5JasVT9tiAyVgfybGFMZC/2zRQK1
         xn32K5DOBs6EoWLeqv6o6ANmYMlUyyrRyRVL7WmXl0PXdMXVAWo6VT6t4TtERCb38Nm/
         LhhOp0mnIjHi58V9KlkrHhwSFv4ks6+RXmWvPc81Q+mw/+B4qBEMy8oThA5MABAdKvj2
         Z/eQ==
X-Gm-Message-State: AGi0Puah4DjkNf9JHbHq1LLgzKqHCOwBkpZCT+wZkXIJmcUTs8rECdDa
	5d/VysWd1Js12IekOeyGNK8scE/yxuc=
X-Google-Smtp-Source: APiQypIJR52JpjvehG+bqQDGfzCc+NOjT2VdHEdQxgnBCiTWfk4AAUFp3kZqC1SHXOHxVVT22K8Sbg==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr21209604wmc.52.1586164845946;
        Mon, 06 Apr 2020 02:20:45 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F295D58AB00388BFE597C49.dip0.t-ipconnect.de. [2003:f0:7f29:5d58:ab00:388b:fe59:7c49])
        by smtp.gmail.com with ESMTPSA id h13sm207075wru.64.2020.04.06.02.20.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 02:20:45 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/14] gjs: upgrade 1.58.5 -> 1.58.6
Date: Mon,  6 Apr 2020 11:20:23 +0200
Message-Id: <20200406092032.3574-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406092032.3574-1-schnitzeltony@gmail.com>
References: <20200406092032.3574-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Version 1.58.6
--------------

- Various backports:
  * Correctly handle vfunc inout parameters [Marco Trevisan]
  * Fix failed redirect of output in CommandLine tests [Liban Parker]
  * Avoid filename conflict when tests run in parallel [Philip Chimento]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.58.5.bb => gjs_1.58.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.58.5.bb => gjs_1.58.6.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.58.5.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.58.6.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.58.5.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.58.6.bb
index fd74c45c1..dbe935537 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.58.5.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.58.6.bb
@@ -11,8 +11,8 @@ DEPENDS = "mozjs gtk+3"
 
 inherit gnomebase gsettings gobject-introspection vala gettext features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "4e74456ccb16d4cc5004a441f6abbec1"
-SRC_URI[archive.sha256sum] = "e76d99c09f887438b9883e328710b26b3717f6dcdb4097dc7a9bab06ebd7a13a"
+SRC_URI[archive.md5sum] = "7f671b3fc3b149adce263495540e7f50"
+SRC_URI[archive.sha256sum] = "1864bf22f4f5e4107832b4c54127cce8509d37ccc14abd25a6878c7ffed96640"
 SRC_URI += "file://0001-Disable-tests-on-host.patch"
 
 # gobject-introspection is mandatory and cannot be configured
-- 
2.21.1

