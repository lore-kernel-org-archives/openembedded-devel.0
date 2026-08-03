Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB647C55838
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 11:21:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41007.1785756063812541761
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 04:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EQBUsTEh;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1639582a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 04:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785756063; x=1786360863; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrI+/9CcRGTnZT05da18Ku5dIcZatvvjkZNASs3ml6w=;
        b=EQBUsTEhP4FinyCZEGZJmwDGNkeh1JoToCajRJ/IdUBOjFqogg6j02iBVmjRi2WQDS
         NyysENXK7WquNGcUALbLDUBGfETBCgRBJWIxZs+tWylcSDzXxMwNlOkpgXLid3qf61q0
         bZsTL/AIJetZDtRQ45ZlTEDgcJhcrQOS0FCOddbNmNqqbIW9QS8z6JbEhUQTvF08bcLs
         zXiPYJraomC96ZMqX2PIh28BDUMaUBMW6nM4Qvoq/WGElqtZOrWuvk3ir8pRYpN1gchZ
         qzpfpSxSyWzKOR5fqrST8UNM+MeaZ8GXcsMVPFXcPVqoseOjS1r2d+GFcpr0p6jOQkyR
         AMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756063; x=1786360863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrI+/9CcRGTnZT05da18Ku5dIcZatvvjkZNASs3ml6w=;
        b=PIYprt51eQEqBTQ0c5ahUPbZOqp4KGy75Zj6eom9sNjak6XsOWo3qoWUtDjE2ifhEn
         JGPHLC2/ILyoLZPwI419LV/c19Xpuv+gzU3kRAXzLwYjIYWIgezQoHKw59EV+Z8L48bo
         cGkAgZY7XwTOmMXcrhaz4hxEUdajrs4qm9SHrYRebfrNByQP0sM0qu52DDeIvZvGix9+
         u6GQJ2pjPKxQaiQ+XYvzi/A4+sFS5sFANHhSS30wYB86IWBorljRXqfvin179umJVomc
         i93ho12cPGx4Fn6cFGQ5qMKeBSjsUXmb0z3D+WVy7h/I2lu9MyUErQGiM92sFHg+isGF
         epvg==
X-Gm-Message-State: AOJu0Yw2qAHX0hX/ze9d1GSXye+1JfA1p97GU5pB6kTyN8KJifwhpba2
	32kRQr/K/pAv0jAjQ1H73IvxSz9pOBRCT87PyXdyBOlyEhYLlP2JB5G+dgZvR5UA
X-Gm-Gg: AR+sD10ckfrROnW7qHJRRGQIZS1BPQYDLQuQAT45Chbkt/uXqEM7YQJtYzMZfUQg8tN
	cIWI+Fdw6e/Ol1AJLYpIcqpLnJnJiSAD8qVMLFAOVZCsiv4orVcF0WLgMbGRewnilwyMFUK3t9Z
	vwN+DtSwEIiN5OqhWsHu2pM8hxXRFz9UU3AUekh4m2qHSHiZIM6HM4I4AYCoZVnCcYiDDWE7HMO
	advd1d4wvC2s5JIZtoqdKntWAGCKUNa8LkYwY08vEgjJdbVMHJBTOFhyiGprRJsouWjXvq2nbL1
	j3SG+u7xlrX7KSp1PxZ2met0oUmK4Ebyg7n7XLf2rlmBjlXEQ8u9TaFqNZATF5ifPbL86yPt1dB
	RBAqYbvH3l9IJF8z+PwOLY/+2d8EoBdquuAwcDx6H+3T71FrDicPg8ZTV55TNjy1IkrOWld4B+D
	+96HmRrDR2cc07JEuHmNV79FxSnCx+tqfwWLmjwa3dXlklvVq35d40eiNTGipwayj6Cz/IkxB34
	KvU5p4+/qCQ
X-Received: by 2002:a05:6a21:103:b0:3bf:ab4b:2d34 with SMTP id adf61e73a8af0-3c92a8f3f72mr9100249637.53.1785756063088;
        Mon, 03 Aug 2026 04:21:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153ddcba2bsm42463843eec.11.2026.08.03.04.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:21:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/6] drm-info: upgrade 2.9.0 -> 2.10.0
Date: Mon,  3 Aug 2026 23:20:50 +1200
Message-ID: <20260803112055.3926085-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 11:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128676

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/emersion/drm_info/-/tags/v2.10.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...Reapply-Find-drm_fourcc.h-in-sysroot.patch | 27 +++++++++++++++++++
 .../{drm-info_2.9.0.bb => drm-info_2.10.0.bb} |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/drm/drm-info/0001-Reapply-Find-drm_fourcc.h-in-sysroot.patch
 rename meta-oe/recipes-graphics/drm/{drm-info_2.9.0.bb => drm-info_2.10.0.bb} (66%)

diff --git a/meta-oe/recipes-graphics/drm/drm-info/0001-Reapply-Find-drm_fourcc.h-in-sysroot.patch b/meta-oe/recipes-graphics/drm/drm-info/0001-Reapply-Find-drm_fourcc.h-in-sysroot.patch
new file mode 100644
index 0000000000..0cd379e458
--- /dev/null
+++ b/meta-oe/recipes-graphics/drm/drm-info/0001-Reapply-Find-drm_fourcc.h-in-sysroot.patch
@@ -0,0 +1,27 @@
+From a0acb0561be3176e2a1d2fb9ca629ab9b25d0057 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Mon, 3 Aug 2026 20:59:24 +1200
+Subject: [PATCH] Reapply "Find drm_fourcc.h in sysroot"
+
+This reverts commit https://gitlab.freedesktop.org/emersion/drm_info/-/commit/154d17ec47baa9f66528d81d73788ddbde5000e1
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index aa9e951..21ab150 100644
+--- a/meson.build
++++ b/meson.build
+@@ -68,7 +68,7 @@ if libdrm.version().version_compare('<2.4.134')
+ elif libdrm.type_name() == 'internal'
+   fourcc_h = meson.current_source_dir() / 'subprojects/libdrm/include/drm/drm_fourcc.h'
+ else
+-  fourcc_h = libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
++  fourcc_h = libdrm.get_variable(pkgconfig: 'pc_sysrootdir') + libdrm.get_variable(pkgconfig: 'includedir') / 'libdrm/drm_fourcc.h'
+ endif
+ 
+ # The DRM_BUS_FAUX bus and its information is included in libdrm v2.4.127
diff --git a/meta-oe/recipes-graphics/drm/drm-info_2.9.0.bb b/meta-oe/recipes-graphics/drm/drm-info_2.10.0.bb
similarity index 66%
rename from meta-oe/recipes-graphics/drm/drm-info_2.9.0.bb
rename to meta-oe/recipes-graphics/drm/drm-info_2.10.0.bb
index d309d71277..c2e8a7a696 100644
--- a/meta-oe/recipes-graphics/drm/drm-info_2.9.0.bb
+++ b/meta-oe/recipes-graphics/drm/drm-info_2.10.0.bb
@@ -3,8 +3,10 @@ HOMEPAGE = "https://gitlab.freedesktop.org/emersion/drm_info"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=32fd56d355bd6a61017655d8da26b67c"
 
-SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "67a49ad122e8fa5c85430a8e22f20b7f56e750d5"
+SRC_URI = "git://gitlab.freedesktop.org/emersion/drm_info.git;branch=master;protocol=https;tag=v${PV} \
+           file://0001-Reapply-Find-drm_fourcc.h-in-sysroot.patch \
+"
+SRCREV = "462458e0f292145b2a9d5a8b65c392eaeef7362d"
 
 
 inherit meson pkgconfig

