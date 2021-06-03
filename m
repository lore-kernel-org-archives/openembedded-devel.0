Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.1.1622754341885388543
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vs8gQGAL;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id dg27so8665689edb.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=muKxyhnl/EwxaF6iFbPFFRnT//4ic60C23ZH3PtGQUg=;
        b=Vs8gQGALVkwkIJnJEAuwDtDqvWmuHMwsaDsMg3+gA/SuT7mQ7wcyOaN9gihhX/0/t8
         lUfBtI17tHFOTsgMAtIWaY1hdX0M+e5EzxvSEJfXN/fLLlC5H1HkFswXVc7MFB5LmNBO
         +0v7D9U45Ajy9YjEXZspSgJMfzQLSTG/5mwU950poyMiVUVD2yUx87druk8URDJ4uujt
         Kyh39Mr9hAN5ryhO0aBUsztHWrG+7S9oZrHiJk7nwbrLh+0uatM3U6T9USpf9BwuCnHL
         q9/Zgdfp+d466rJUVbCv+oJcvDv6KYH5chX3ELNr5CgzAgsUn95GGbuIyRbKIaPqBeFr
         5eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=muKxyhnl/EwxaF6iFbPFFRnT//4ic60C23ZH3PtGQUg=;
        b=YhCiUK/CfmKaXM/VN2X91KhYB0LoFYD326VLL9+KomCEyQPzCovwVPXaYdfAuCf9u7
         om0FrGDqWw1mNcBqGExG2uF8JbAnx0zP7Eh87XFOmO1bGLfs1QAr88iB4l59ame/qXR2
         fQfBEFjP7xrQNqjosRhLwjsx54FNGRaDY3hjavi4v0SJ2GnaSG5rYzexZNyyBOg7FZTx
         NCIVpOtDWOitnNtK52vXJCPS3qFYVs3S6iWxhHdiKsMlQQlpFyF5ZC4xaIgRzgN5Ua77
         CmyLbGswkn/0rMwiAoBUqMjXCzEZiTILYxvA9t7ALWmDGkXodEzCH1wZ7CEMiFuBP/8/
         eHkQ==
X-Gm-Message-State: AOAM533xm2g91OAH8ZvU1mH/yhVTwAzMdA9h2BhejmIKthdMIoIuccAo
	kZVYXE/FFbF+lIhlJmyI34/iDaupAdBluA==
X-Google-Smtp-Source: ABdhPJxcGo5KJ+cxFZrx+6L8C3KSq+fJsddAnI39O45TGLQiCojo7QIB/TxvsiJscSFB2Al2jOJwSQ==
X-Received: by 2002:a05:6402:254d:: with SMTP id l13mr1292393edb.281.1622754340421;
        Thu, 03 Jun 2021 14:05:40 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id j22sm2020050ejt.11.2021.06.03.14.05.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:05:39 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/5] dbus-broker: upgrade 28 -> 29
Date: Thu,  3 Jun 2021 23:05:28 +0200
Message-Id: <20210603210531.2314701-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603210531.2314701-1-schnitzeltony@gmail.com>
References: <20210603210531.2314701-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

    * Improve SELinux audit messages. This requires the new libselinux-3.2
      and libaudit-3.0 releases. If audit/selinux support is enabled, those
      are now the minimum required versions.
    * Make linux-4.17 a hard-requirements. Older kernels are no longer
      supported.
    * Fix startup failures when at-console users have consecutive uids.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-core/dbus/{dbus-broker_28.bb => dbus-broker_29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/dbus/{dbus-broker_28.bb => dbus-broker_29.bb} (92%)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_28.bb b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
similarity index 92%
rename from meta-oe/recipes-core/dbus/dbus-broker_28.bb
rename to meta-oe/recipes-core/dbus/dbus-broker_29.bb
index a35f5c64c..49ba16911 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_28.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_29.bb
@@ -7,7 +7,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 SRC_URI = "https://github.com/bus1/dbus-broker/releases/download/v${PV}/dbus-broker-${PV}.tar.xz"
-SRC_URI[sha256sum] = "abb8b54434faeeb6bf59a70ebf0732e851a50bd922995ba5928e8c28c18b05ea"
+SRC_URI[sha256sum] = "4eca425db52b7ab1027153e93fea9b3f11759db9e93ffbf88759b73ddfb8026a"
 
 UPSTREAM_CHECK_URI = "https://github.com/bus1/${BPN}/releases"
 
-- 
2.31.1

