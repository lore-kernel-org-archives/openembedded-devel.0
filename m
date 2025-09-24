Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07043CAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:29:08 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.11200.1758716937719718685
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gf4t47E3;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-631845b51e2so5273791a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758716936; x=1759321736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hw8U5Og4oOK94/4Db5aFnzFafNpiTJHGi/En+mCII3Y=;
        b=gf4t47E3IP23YiUrd4RhogEMHRLCSWORGvpm1D6h2Sbfg0XnQyuETxnakBZip7SLmH
         Z7X/s15aPhl9kUF45sE8JGGeaEJSPLOXeZXMRD7TjXT0xqL17MGp+rBNTnS9VTPh5Fa8
         0OwKKUuh7JrREw5pZSaua2fKm5Onkh3a7SPEXRDnfvwjpCUn0RdUTAd+7Jmd9yBuowKn
         lr6qsEUt9TM+XF90o5zle3xuMc+zB0wf5G0s0Cbq/6RdeUmrt13CuPMemuRShNCNsgxc
         8yVXjNhq+APy057bqHctiFqY5JHdsi/3tVo3C359xrlRbKAjbij7BlD9Uz6Sjf2yFu/i
         lyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758716936; x=1759321736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hw8U5Og4oOK94/4Db5aFnzFafNpiTJHGi/En+mCII3Y=;
        b=HRigG/uB8+te2RaauXeeaXo/On8SALwFuQWTVZ4t5jZ4hKeNEjG3DKDzS8MohJ1tUU
         1I3i0IgtCRuHfWKym86gI+BiY8BKN/Xz58ivhuQxk2ZFI6+pP9ddD3V/vgtwHwhMn5lW
         RXl75D6VnSASOoRuncJ1FzVk3uR7/L5bsfCs4TITysgPYXKaSYsSt0e8UHoxnojwz8HP
         Kcgkuk7eIa+HzChx3BmZGky+cvcYK4okBwoqyiK7lPXhCiX8AoiPck/gzILQrNwDDOCO
         /9LFGKBYc4br/UFkiwP/A6wJTRzr5ymBVhYZYDAT3RBMkIyQMzYnl3YyGK1dQkG9Tkhj
         HCVg==
X-Gm-Message-State: AOJu0YwYkdN4otfvh2Wn5bnun1O4uGftmv4qD9GTUtzJeEqi1HqEs6ZM
	MTxvYEifqJU80PuKdBKJKUnceJH7nwfgOileWLw/ZdWLfDTi273mNrT2LA6HUQ==
X-Gm-Gg: ASbGncv5cq/9kOr2C8JwhclkWg19I4q3RHNQAqgIYU7q6w9GouJldZpLeEwEHwaOaZ4
	Nq+mBxXfjj8pOUDx9aAREf23zL18K3SkCRumeft1cHa2ewiySHiAYepy43AZrIajdJzIQWq2qx2
	ieFhBNsAE/0DbIo37zohrwJ0/NKnZiPyo8B5O3bC+E1oecHk72/pdX+qOo1XMAEAM0f+snwklvh
	vJPnVtFtT4ln7WNAO/KvGFgew3UfAJPqzGTaCbXXLR33ehduH1OMILGktvWa1pJzXqBF2xrnOTd
	OssiL3kwbCUb6QBfq5GYMIEBaM5tgfWHio6ZtzsKs/gLUllf8yiNE6QESppRzEgsZQOY/cXxhdt
	/gnDYwXIMxUKIX5L4w4zk
X-Google-Smtp-Source: AGHT+IGAEvAsS7ZKT2jemLF6T1A2Fq0fm22SrHe7U9bW703n7okRFEhNji3JUrmspEHkT2icXSbMHg==
X-Received: by 2002:a05:6402:518c:b0:634:17a1:ba95 with SMTP id 4fb4d7f45d1cf-63467a1ae17mr5282448a12.38.1758716936007;
        Wed, 24 Sep 2025 05:28:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63469f30772sm3024835a12.22.2025.09.24.05.28.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:28:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 11/20] gvfs: stylize DEPENDS
Date: Wed, 24 Sep 2025 14:28:29 +0200
Message-ID: <20250924122839.4184719-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924122839.4184719-1-skandigraun@gmail.com>
References: <20250924122839.4184719-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119814

From: Alex Stewart <alex.stewart@ni.com>

Use multiline styling in the gvfs DEPENDS variable assignment, so that
diffs are easier to understand.

Also alpha-sort the DEPENDS, since their order isn't meaningful.

Signed-off-by: Alex Stewart <alex.stewart@ni.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9e725dfee3a6fa6d8efef9522a787b9b4893bafc)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
index d56b51c727..73b9bd3b09 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
@@ -5,8 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check useradd
 
-DEPENDS += "libsecret glib-2.0 glib-2.0-native libgudev shadow-native \
-            gsettings-desktop-schemas dbus"
+DEPENDS += "\
+    dbus \
+    glib-2.0 \
+    glib-2.0-native \
+    gsettings-desktop-schemas \
+    libgudev \
+    libsecret \
+    shadow-native \
+"
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
 

