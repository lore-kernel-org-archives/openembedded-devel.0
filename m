Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753D2EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 11:38:15 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.9401.1686742691801786665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 04:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EHvlOnIP;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b50e309602so374765ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1686742691; x=1689334691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iE0kWONxdrJjpDYVeDe3N1enzV6LPgLPb1TcZIbo1Q0=;
        b=EHvlOnIPsFmy4AZGmOT6j+SJ4QI+ZU5BZbCOpbtYFPTmS+gXbCwi1d63xUIIG6Jtri
         8C/GwT6BCtp5i8DI5Ozn380rpXaVvBgoId9cZm6Q+N7LvJVmT74vIcPB1KbLeqbY2Mqr
         Pp9sCTkVJ84Ynuxyf1VpSA1bCk6elweTffy9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686742691; x=1689334691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iE0kWONxdrJjpDYVeDe3N1enzV6LPgLPb1TcZIbo1Q0=;
        b=ALhkuly92zNedIJS2XgF9ec34oWNtAK2e95fI/lfgG52FS+kkcvvuAEA7zrLV7STZr
         HWqIPgIMzvm52gLxo5pk0KGBCEPpsKuJBS72QUdbmY+IVztIXoIUKnXCrtYxxDRdMa+Z
         ygk1JG6wbf1wEiegA/jgINgppsH4GX3yIBEdGwGMlingNLxQt5Im+VDhH/mC5n4pEaUF
         PhkYBtZWGzBqkmgjcTdIJifJTquGX0qmI0IgbB9tCMUGRi7vM9OereQlq13tXo6q+0Y0
         nEpQJYPmShaI6zWaaLKxdWs7Al5surEF1ARRjeGbH09ofJ5His3Xf5ALSFLmQZhEWFz+
         vW2Q==
X-Gm-Message-State: AC+VfDzsVVYq8WGmGIaWxKls9FCBS1MWBbvL0pNBo1W3u5wgh1wWzULq
	pRUX6vimoKF7HeiwCzI/efpKDs0iaWUrbYFEfpc=
X-Google-Smtp-Source: ACHHUZ5LI00z5hBjNxncCBzOQjlTHm5YdDRH89vMzxrIfsn4S4S6G5uJhLec9snReq42yIfKuiOEwA==
X-Received: by 2002:a17:902:bc8a:b0:1b0:6e16:b92c with SMTP id bb10-20020a170902bc8a00b001b06e16b92cmr11339143plb.54.1686742690771;
        Wed, 14 Jun 2023 04:38:10 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.134])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709026b8b00b001b39ffff838sm8232351plk.25.2023.06.14.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 04:38:10 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 14 Jun 2023 17:08:04 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-qt5][kirkstone][PATCH] qt: CVE-2023-32763 Fix Integer overflow
Date: Wed, 14 Jun 2023 17:08:00 +0530
Message-Id: <20230614113800.34975-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 11:38:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103283

Upstream-Status: Backport from https://download.qt.io/official_releases/qt/5.15/CVE-2023-32763-qtbase-5.15.diff

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 recipes-qt/qt5/qtbase/CVE-2023-32763.patch | 74 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb               |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/CVE-2023-32763.patch

diff --git a/recipes-qt/qt5/qtbase/CVE-2023-32763.patch b/recipes-qt/qt5/qtbase/CVE-2023-32763.patch
new file mode 100644
index 0000000..68a1fca
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/CVE-2023-32763.patch
@@ -0,0 +1,74 @@
+From 7cc6296600ef436afaa9ed86d2f8a85869abf62a Mon Sep 17 00:00:00 2001
+From: Allan Sandfeld Jensen <allan.jensen@qt.io>
+Date: Fri, 5 May 2023 09:51:32 +0200
+Subject: [PATCH] Fix specific overflow in qtextlayout
+
+Adds qAddOverflow and qMulOverflow definitions to QFixed
+
+Fixes: QTBUG-113337
+Change-Id: I13579306defceaccdc0fbb1ec0e9b77c6f8d1af9
+Reviewed-by: Eirik Aavitsland <eirik.aavitsland@qt.io>
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+(cherry picked from commit 7b7a01c266b507636eab51a36328c7c72d82d93c)
+Reviewed-by: Qt Cherry-pick Bot <cherrypick_bot@qt-project.org>
+
+Upstream-Status: Backport [https://download.qt.io/official_releases/qt/5.15/CVE-2023-32763-qtbase-5.15.diff]
+CVE: CVE-2023-32763
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/gui/painting/qfixed_p.h  | 9 +++++++++
+ src/gui/text/qtextlayout.cpp | 9 ++++++---
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/src/gui/painting/qfixed_p.h b/src/gui/painting/qfixed_p.h
+index 846592881c..57d750a4b3 100644
+--- a/src/gui/painting/qfixed_p.h
++++ b/src/gui/painting/qfixed_p.h
+@@ -54,6 +54,7 @@
+ #include <QtGui/private/qtguiglobal_p.h>
+ #include "QtCore/qdebug.h"
+ #include "QtCore/qpoint.h"
++#include <QtCore/private/qnumeric_p.h>
+ #include "QtCore/qsize.h"
+ 
+ QT_BEGIN_NAMESPACE
+@@ -182,6 +183,14 @@ Q_DECL_CONSTEXPR inline bool operator<(int i, const QFixed &f) { return i * 64 <
+ Q_DECL_CONSTEXPR inline bool operator>(const QFixed &f, int i) { return f.value() > i * 64; }
+ Q_DECL_CONSTEXPR inline bool operator>(int i, const QFixed &f) { return i * 64 > f.value(); }
+ 
++inline bool qAddOverflow(QFixed v1, QFixed v2, QFixed *r)
++{
++    int val;
++    bool result = add_overflow(v1.value(), v2.value(), &val);
++    r->setValue(val);
++    return result;
++}
++
+ #ifndef QT_NO_DEBUG_STREAM
+ inline QDebug &operator<<(QDebug &dbg, const QFixed &f)
+ { return dbg << f.toReal(); }
+diff --git a/src/gui/text/qtextlayout.cpp b/src/gui/text/qtextlayout.cpp
+index 26ac37b016..f6c69ff4a2 100644
+--- a/src/gui/text/qtextlayout.cpp
++++ b/src/gui/text/qtextlayout.cpp
+@@ -2150,11 +2150,14 @@ found:
+         eng->maxWidth = qMax(eng->maxWidth, line.textWidth);
+     } else {
+         eng->minWidth = qMax(eng->minWidth, lbh.minw);
+-        eng->maxWidth += line.textWidth;
++        if (qAddOverflow(eng->maxWidth, line.textWidth, &eng->maxWidth))
++            eng->maxWidth = QFIXED_MAX;
+     }
+ 
+-    if (line.textWidth > 0 && item < eng->layoutData->items.size())
+-        eng->maxWidth += lbh.spaceData.textWidth;
++    if (line.textWidth > 0 && item < eng->layoutData->items.size()) {
++        if (qAddOverflow(eng->maxWidth, lbh.spaceData.textWidth, &eng->maxWidth))
++            eng->maxWidth = QFIXED_MAX;
++    }
+ 
+     line.textWidth += trailingSpace;
+     if (lbh.spaceData.length) {
+-- 
+2.25.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index a5ce677..e8756cf 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
     file://0021-rcc-Just-dcument-file-name-without-full-path-to-redu.patch \
     file://0022-testlib-don-t-track-the-build-or-source-directories.patch \
     file://0023-zlib-Do-not-undefine-_FILE_OFFSET_BITS.patch \
+    file://CVE-2023-32763.patch \
 "
 
 # Disable LTO for now, QT5 patches are being worked upstream, perhaps revisit with
-- 
2.25.1


