Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32788CCFA1A
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 14:09:07 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14127.1762956545590573574
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 06:09:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5Z79hcE;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-787be077127so9338527b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 06:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762956544; x=1763561344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cRISLYADBhfhMdW+1wu758Ho3S5f0AhbySxQ6SbctAw=;
        b=D5Z79hcEa+13PnIDBUeNlr6vIAqtap9P7EujA5/jFwFuP3i/BTkVPw+S5sRuOUjxYf
         4RlOorxfKqnA7O9qJy4FSkmOym0rAePC4zC7/NI3fpmMD6a8YQUbtLVidTkoCZJwgILT
         4gVjZQVJtVGwLvd+LJsPuvs1rhZakDUSmlRh/PmH30032YElJVdBz2GdOCVD50RUjnS+
         UVi/MB1AHi9z4rIKSyJAENbw2Aq88GLKl5PdbJ3MqKXHdfwPEab08e0bcX2CvFtMkQc6
         57/+EfS8qwmqnLDsDvFSeUyrlkniZdLbjxV+NuQdGmcpOuT7iS0alWP6BFuTGog0/Bye
         PL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762956544; x=1763561344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRISLYADBhfhMdW+1wu758Ho3S5f0AhbySxQ6SbctAw=;
        b=QwFUPtUiP26bbSCi1cqFxkGe/UxlqRgLPPYgvvo84TWfH7owlYf3GEVMlR39RJxfK5
         PUpX5UUOyyCHA9O3oG5dxlKUfXWtBGjeJc7D7n8bX8BrTlD3E3Pjhf9B56xUPmAV76AY
         Qk+6Kvpckptry0zTNqrBExSLTDMqqtM9sPgwRuaIkt1WW3ETaLA8jIBeqQzmlXfi20Zn
         IKOxOqK+6tSXfPb5Aj2E7fkwHOmMzH/ZFskttkPj/ydjyKEgBsMmOfTnvMh9JuoGcd9r
         xdRpx0be6u8+Rq/7f9D1sbwJRxatN5V86qocMWn9K0JKzGqshQF7YUqkXf0b2pklKluT
         VRPA==
X-Gm-Message-State: AOJu0Yztg6pQ9VKE779efHAG9O/u5tW5f7sVmv64H0VZw3QfyryBxroi
	84eqT6XOd6MMAy3IvmeioFWbx4cP+KFaSCfcN14qh4B1pykzUWX6rzWaSfeb5M5L
X-Gm-Gg: ASbGncv+00TqUX54v0ME4+MnlTZUYyPxXsZNHs3SavqIAjPP/LnW2IEVI5u7u5K8kDo
	75kfuN4sWjEQT6CjrWefL328pxssx6+2kzBkpVM8+QDRXuzwzJ80NLD6OiicilJXgiIQZAC4Qkw
	BnDByZFQn2JJ8Ha+XxrQjmB0uoGzmmD21PU5AR/LZtJFKMRXN1tyGfhhl95W9VI6JDEGlH+NrBa
	n11RocWJ/vtS44kvyP3VKhgk1pcWlGmYCKUl0+edv2rHNM2kdHf7xMK3+w5cxjNiPomS7nC/41r
	lv9Jjqd7YQWn5VCb2+0JGOXevAoBWfthhiwOoe+8Lbt2HNlq3ZzopW1/lWv9rtsbJiEw/NGBVHA
	6nokyozuPyCkXBVtHsSHSL53B6CUwTCR25hjs4mQuI1JqoVJPlGSiYom1+uRKE9ATjtXyX1GCeD
	B0+X2I
X-Google-Smtp-Source: AGHT+IHhVfgpX+/GFfqTaLm3LDwWlg+Xh1awgPvQtzzyx7XXOKpbGMj7xD9JL7te2qO4pJWj9IbGEQ==
X-Received: by 2002:a05:690c:8d10:b0:787:c5b9:2663 with SMTP id 00721157ae682-788135e2d73mr20809347b3.8.1762956544281;
        Wed, 12 Nov 2025 06:09:04 -0800 (PST)
Received: from localhost.localdomain ([71.3.201.67])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d680d03esm41923847b3.5.2025.11.12.06.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:09:03 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] exo: upgrade 4.20.0 -> 4.21.0
Date: Wed, 12 Nov 2025 09:08:51 -0500
Message-ID: <20251112140851.7584-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 14:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121549

exo is deprecated in favor of libxfce4ui and libxfce4util as of
development version 4.21.0. The last stable release before archiving
the repository will be 4.22.0. See
https://gitlab.xfce.org/xfce/exo/-/merge_requests/87
and the links it contains for details.

- Update copyright year
- Deprecate exo-job and exo-simple-job
- Deprecate binaries
- Deprecate exo-tree-view
- Deprecate exo-icon-chooser-dialog and friends
- Deprecate exo-gtk-extensions
- Deprecate exo-gdk-pixbuf-extensions
- Deprecate exo-execute
- I18n: Update po/LINGUAS list
- Properly check iterator before usage (#124)
- Fix code style
- exo-tree-view: Allow Ctrl+Shift+Click in single click mode
- Translation Updates:
  Albanian, Catalan, Danish, Estonian, Polish, Portuguese, Romanian,
  Russian, Slovak, Slovenian, Venetian

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-xfce/recipes-xfce/exo/{exo_4.20.0.bb => exo_4.21.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.20.0.bb => exo_4.21.0.bb} (90%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.20.0.bb b/meta-xfce/recipes-xfce/exo/exo_4.21.0.bb
similarity index 90%
rename from meta-xfce/recipes-xfce/exo/exo_4.20.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.21.0.bb
index 4b2c5375f2..26ff1d0504 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.21.0.bb
@@ -15,7 +15,7 @@ SRC_URI += " \
     file://exo-no-tests-0.8.patch \
 "
 
-SRC_URI[sha256sum] = "4277f799245f1efde01cd917fd538ba6b12cf91c9f8a73fe2035fd5456ec078d"
+SRC_URI[sha256sum] = "26f85ca2db3bcf99d8b8af28b0d565b0186ccc3d2ed4a5ba315f6a589b8bc2c9"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.43.0


