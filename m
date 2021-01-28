Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.21504.1611820063415691721
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 23:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gNiTy+IK;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id ox12so6358871ejb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Jan 2021 23:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=i9h/g794cpzulErQe62sQSDX2ucHr1R/2FMLHWgg0HQ=;
        b=gNiTy+IKc2y8IBFyLO2yT4tS7PDk8yjx2WWelxlhABnavLU255mxDX0hSkRVeK7SQc
         n3A85vfyTx3RVhfx0IejrOUia2KS5jgbGPivRx2nWabMLYMu00NH8cBuz4H6rhJ3wtax
         dI0t24R8JQMQzM++6dDOBE3J5PFd2rtu80O2CZtUNCJsz1KueloY4HduNoKwl1PuwwBS
         D9o9KpsM8jcZDcWyY3VZK+/Oy6oT4jZcdtU15uSL8ruO9S9EOEbSW5ePowu5U+B7ZROA
         zpYBN0LcNS4Jt0awLmuKJIhHgH9lGaOLM98FuGlK0pFWU75Z/tYSTRA2XgCVJb+iimiI
         Ufzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i9h/g794cpzulErQe62sQSDX2ucHr1R/2FMLHWgg0HQ=;
        b=mw7MMrcZwRKivrXuxEVuTKmDhEbs9SSzF0/J+D2rj8GsQjyZLFu3wrh0Lzk8WcHq0G
         ZCjAkttMUBx7euBai+E7mbVhnsobkcnxn6Rln2dT4Ubq/q6P+90P3s4G4wgtPrVz5aBx
         zXn56QNGS8arhTjfXl+aT+XGdAdM3eiUSrhtPq7CsOekUP8CMDprazG4wySpU8XSvRkG
         TVp/jWexExljpQKkVlr16SMHWg5k+DF4ajC6iek1KS4iEbQdG4K7BOzkEqBEJ+rC8Q/5
         K9Cavj7lPYbDG/jP1rHFSMG/Q50VREyaw0rZmZvLGwSsm1jaqp6ETzxpJnbyxh2ViBci
         V+IQ==
X-Gm-Message-State: AOAM531/KgdgmJobnMisitKVYEeo6cPKqma4A7zcOEUocI+6fRrIBJzS
	H+10LVCI8Y8KUwTf8B5LtrUTb2oduDchQA==
X-Google-Smtp-Source: ABdhPJwZ6oEdgZhEgfXLDaWvjE6Lt2/K9NgsdsC3TFR73KA3Hat8hAyes33HZhuqvnuweYghs8ue4g==
X-Received: by 2002:a17:906:e958:: with SMTP id jw24mr4779214ejb.208.1611820062056;
        Wed, 27 Jan 2021 23:47:42 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07f659ecbde7b17c1a812c.dip0.t-ipconnect.de. [2003:f0:7f07:f659:ecbd:e7b1:7c1a:812c])
        by smtp.gmail.com with ESMTPSA id b17sm2570850edv.56.2021.01.27.23.47.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 23:47:41 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] xfce4-notes-plugin: re-add 1.9.0
Date: Thu, 28 Jan 2021 08:47:27 +0100
Message-Id: <20210128074728.1631219-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128074728.1631219-1-schnitzeltony@gmail.com>
References: <20210128074728.1631219-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* we lost by xfce 4.16
* it is a development release but it was run tested and as soon as a stable
  version is released we can come back

Release notes for 1.9.0
=======================
[Please note that this is a development release.]

This is a development release which (finally) port the plugin to gtk3
and make it compatible with xfce 4.16.

- Remove unused variable
- Update deprecated autotools macros
- Do not mark text with ':' after '://' as a link (bug #52)
- Add support for links with scheme other than HTTP (bug #52)
- Fix missing-prototypes
- Create README.md. Update configure.ac.in
- Add basic gitlab CI
- Fix "Disabled labels on context menu are dark yellow"
- Fix a few deprecation warnings
- Fix make distcheck
- Fix blinking image on panel
- Remove commented code
- Update build system
- Fix make distcheck
- Remove deprecated gtk stock usage
- Fix build system
- Continue the gtk3 port
- Update URLs from goodies.x.o to docs.x.o (Bug #16171)
- po: update POTFILES.in
- gtk3: update css style with required changes from 3.20
- gtk3: drop libunique leftover flags and code
- gtk3: Drop support for GTK+-2.0
- bump post release
- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../notes/xfce4-notes-plugin_1.9.0.bb                  | 10 ++++++++++
 .../packagegroups/packagegroup-xfce-extended.bb        |  1 +
 2 files changed, 11 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
new file mode 100644
index 000000000..cd7212f65
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.9.0.bb
@@ -0,0 +1,10 @@
+SUMMARY = "Notes plugin for the Xfce Panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "gtk+3 libxfce4ui xfce4-panel xfconf"
+
+SRC_URI[sha256sum] = "13f909c948b639f96de64cf793eb74cb1779589201d3933eff214ee8f35ab088"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index cd3fa26aa..7f1c17261 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -40,6 +40,7 @@ RRECOMMENDS_${PN} = " \
     xfce4-mount-plugin \
     xfce4-powermanager-plugin \
     xfce4-closebutton-plugin \
+    xfce4-notes-plugin \
     xfce4-whiskermenu-plugin \
     xfce4-mailwatch-plugin \
     xfce4-smartbookmark-plugin \
-- 
2.26.2

