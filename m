Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D3B7C433F5
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 12:46:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.28218.1652705157186134790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 05:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=4tB3iZ5d;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id
 l38-20020a05600c1d2600b00395b809dfbaso8277706wms.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 May 2022 05:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xeG26xSj/J3NkH6CzJ2LM12bk6Bt5LHJP8spv3pOQs0=;
        b=4tB3iZ5dHNjuGaMFepVE07H/ddFKe9EGF0yqwhme3/kEgUToMebtiNjgmCdnbBCKmB
         +0ltnJczyLEg1q5ZiRe/9SKQguUo17OLbsr5+Vkk75YQmjpfx1c1/zG+RR9dBGWW/UTD
         AIRQANeRefUqSlXWAq/71L7ofOA8PIZzkqzsOjO2qFNEBVNsbdAqUnCZpwFVy/gv3NKJ
         hdzo9QYvkKvXfmBIZOJexoQmCCJcRdpgh16WcVpsJvioJkYX2ADco+s49LvlEQjPpFfw
         +171WBes81L1GudvhERmHG8X9AHbwr2m5iFBgoA5dhBqGlXaWIg7qCkkfrFRE0HTMbyT
         oTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xeG26xSj/J3NkH6CzJ2LM12bk6Bt5LHJP8spv3pOQs0=;
        b=GEWqgktKdKPWXoTaZSkDZ5Dk9ez8LybKShcApLbP7whzHMkCIHPCIw/T+h4dXdSblp
         HkPRkpJ6spZ6/XWksM7Ary/rBtcQa0NJY5tmeUPrjSkZ0l5JvRYNCGtM/diMtlCif1uy
         kNJvZiAo2X8BmCcLVKBn3RKe+qPDLWVvaC4lzTI1rZa7c3tQlFC79Z4FuxPxaE7hOE67
         HOqf67Sf125apSbDsDjJSKEYHau2rXi/kDPnCzHkY7d81qpIK5VtfhUd72jtt9SXMQaj
         4N+WqVFcseUU0bTj/vU1I4AIeJGePrMesS8MYjsPu1DN2DLZ/Nb6VJI5dZH75FmR9SDM
         adZw==
X-Gm-Message-State: AOAM530NrfK2921ShXXPTMCqtUD0uE9t2R1VcmcEMKMLb61EJbhqIW2w
	XOVi+IBUSaqasuslfLQl9IIZ0Q==
X-Google-Smtp-Source: 
 ABdhPJyByP09I6oZGSSmnv8/TMK+70CgnSggQ8aDnf403Lpz85rkpHs10HUzPMG82qhAhbPVVdgd6w==
X-Received: by 2002:a05:600c:3b10:b0:394:69a0:9d73 with SMTP id
 m16-20020a05600c3b1000b0039469a09d73mr16476134wms.193.1652705155486;
        Mon, 16 May 2022 05:45:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8a7c:37d2:fea:a9a])
        by smtp.gmail.com with ESMTPSA id
 o42-20020a05600c512a00b003942a244f49sm14657054wms.34.2022.05.16.05.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 05:45:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-inotify: new package
Date: Mon, 16 May 2022 14:45:53 +0200
Message-Id: <20220516124553.232642-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 May 2022 12:46:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97126

We have a recipe for python3-pyinotify (not to be confused with the
recently added python3-pyfanotify) but this project has been abandoned
years ago. There's another - still maintained - project called simply
inotify on pypi and this adds the recipe for it.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../packagegroups/packagegroup-meta-python.bb      |  1 +
 .../python/python3-inotify_0.2.10.bb               | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index d08908939..6ca652e12 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -186,6 +186,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-imgtool \
     python3-incremental \
     python3-inflection \
+    python3-inotify \
     python3-intelhex \
     python3-intervals \
     python3-ipaddress \
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
new file mode 100644
index 000000000..524c3a0d2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
@@ -0,0 +1,14 @@
+SUMMARY = "An adapter to Linux kernel support for inotify directory-watching."
+AUTHOR = "Dustin Oprea"
+HOMEPAGE = "https://pypi.org/project/inotify/"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://setup.py;md5=79b7ec72aa0d446a552d3cceb5799e41;beginline=28;endline=28"
+
+SRC_URI[sha256sum] = "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e96ccdf0df6c02a07"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-logging \
+"
-- 
2.34.1


