Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.7230.1593383758640045391
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2020 15:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDYjax5U;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id n26so769182ejx.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2020 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gQtGFedhbfon/SJI3/zyeib2ld7zN06HIB2cj7uROCM=;
        b=LDYjax5UelYj4pBe7ZXpFEROAzQS2K8TEsznSCfiG2bDNHfJ6lgF6BpgRDQOsoKkrB
         Xf76P/fgmmpSl1JvD+KcORRBFF3OZPF0O2iUPeHsXYWQuIkDxOAT0E8nniOQ1ZSh4q3e
         FIlBFGFXVaWc8H1vfR0kQ+FXpoJeeg8MHc9CIs02qhP11ZC1A5LGxmAonYiYsKqoV/M3
         bEyt6ymDcqbqJNLLVRKXUezuyCpScfFLvUWT4J69ggT/SM1TG8HhJkHSaeU65pyzJgoS
         vlotiVny5MdlNRoKw8HT3ncf5MJzVOIAnyUUAjsdSQZvsiUVygJf4IQfHMxoEazO2pUw
         0EIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gQtGFedhbfon/SJI3/zyeib2ld7zN06HIB2cj7uROCM=;
        b=PqcH/PwLpvIVCjop47TTluT+B9nM+iPeDi2V2KTwbiAX6FDMELoVfb1nHSmkAuyUYM
         BmvtJXjYjF0qLKQNYZ84vfEu3v6SwxHKKeEzxMz934S96wBIbQ6s2sbw0Uwxg4cUIivv
         RGfXLvDof/Uwa7IllBSkIq7uSJxqYyXpZBxhroNXzZMSUQGivDX0yqr+2aog50U5IBT7
         gZJd4EzQ6e6WwskMAa7Y/cTbnYA25JeVan8+0ZKRrQ7BkWHl3JKlp2PNqQw2a6L5kh7D
         63I8MUSltOZircd9vGdkD1aEnbEBHhrH8oPHHlKUpAAfpK+l2wvMVxEeV18ZgrZN6Pb+
         FCYg==
X-Gm-Message-State: AOAM530xLOjF/zw3GTMYZVs6zZxB/hS/bi1p5HlY1/dzAFe7FdTN/MED
	Ed0tZ03rM2rCt5QXNRVz5No5JwZ+
X-Google-Smtp-Source: ABdhPJzzQOlEaKd+7gYEli6DtjX7VZk8SjHboEvgY2wfDfWsNcablSvBdq1R2nym+VkPd/wZUu6C+w==
X-Received: by 2002:a17:906:1e85:: with SMTP id e5mr3896262ejj.76.1593383756956;
        Sun, 28 Jun 2020 15:35:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f4b8e33cbb401a015e6742d.dip0.t-ipconnect.de. [2003:f0:7f4b:8e33:cbb4:1a0:15e6:742d])
        by smtp.gmail.com with ESMTPSA id q25sm7602169ejz.97.2020.06.28.15.35.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2020 15:35:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] modemmanager: upgrade 1.12.10 -> 1.12.12
Date: Mon, 29 Jun 2020 00:35:43 +0200
Message-Id: <20200628223545.3853840-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200628223545.3853840-1-schnitzeltony@gmail.com>
References: <20200628223545.3853840-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb}   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.10.bb => modemmanager_1.12.12.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
index deab6f046..b0ab46f3f 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.10.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.12.bb
@@ -11,11 +11,8 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
-SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
-           "
-
-SRC_URI[sha256sum] = "b2b3058bbb72adf98b24707fdbebe58e590644a38145e30d574f685f154bf8aa"
-
+SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
+SRC_URI[sha256sum] = "a4fc4b33c0e8ae9372885f86fa033f3c1a89a76cd59a3458670eff1824222a3d"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.26.2

