Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.1052.1611592308802935617
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 08:31:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cLgxgwji;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id u14so4929476wml.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 08:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dmv0f2NtiAq0xFG47YR+5Hbpwb8As8XeZGSYXtN+PIo=;
        b=cLgxgwjiEwKC+mce6JsiE0se3f9QWagMSFk0KEUY5mG+oaiKnpuzTXlL1rzypnTmpl
         /u0+zTrYmmTmufFpDiiIT0eZrgIM0ctw3j+aBjC6QrLdPuIamqX9ieM4X0eGrU378fvY
         Pm1JOw2E+FUpuhi4c/ThN2BQ319BharlR1Lww1hz/e+/oJZxtmBTlrwG4SPrrbrR+YK2
         gBnzAA51MLbuYGdzWkvc8hJmAly1kcgjEt7APOlSjh4Vygfr5obh+gyCnxPUH1rsPieT
         2v/eoaiD+3Lf+8LjPfiNza06eLbuaPFSb+AX+SBeQT4idkRRT2nmFNPvE6y2CHLuh4pQ
         SFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dmv0f2NtiAq0xFG47YR+5Hbpwb8As8XeZGSYXtN+PIo=;
        b=sANRnIcQ+47fGhTIfyKIZQ1DRmTfc2ketNiARyhMkF9393HkRzTtAde5BUhJ6aNee2
         J8MHj4P1iqUVCnd32voZw8sitc7kAYoZwdtQsZfoJ3Jtls/56DPu1g8K7cjYoIsir5w5
         +jyzxRb2IzkTph53nf+qYY54Ip4EJUVZu/QlfSwLhFJ2kjeA603R4Weg1Wu4W3ryjrXu
         LsBSxrEz377eYh8pb6/8X3/x+c6Z8yWBcd+8P7ydrXyEMEn0nSGShaEUjEqYxzWPWZ7q
         exvv7es14TDtJyTLv0jZbn2CwOBbEMrk3NwxRS5BgwCQx0nJ78PoHebu+9mp0+wPeyEo
         avMw==
X-Gm-Message-State: AOAM530S1gzOeDDbI/M+rVleBccI8itkkeSXo88q9igDV7NorcKQL88G
	43R+UzguYYnS6r4ZfatFyliDwq8E+ok=
X-Google-Smtp-Source: ABdhPJzzhvRMRDZTQ6oMO/3htY/XE6etH9h2fpQzCp1ADRue2RuZu34XlHnkXE9+Q+HWA5GYTQv4LQ==
X-Received: by 2002:a1c:11:: with SMTP id 17mr944454wma.12.1611592307086;
        Mon, 25 Jan 2021 08:31:47 -0800 (PST)
Return-Path: <adrian.freihofer@gmail.com>
Received: from md2ramxc.lan.ffah.ch ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id p15sm23242417wrt.15.2021.01.25.08.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 08:31:45 -0800 (PST)
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [oe][meta-networking][PATCH] networkmanager: add missing readline depends
Date: Mon, 25 Jan 2021 17:31:36 +0100
Message-Id: <20210125163136.2497652-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../recipes-connectivity/networkmanager/networkmanager_1.28.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
index 1053bdd42..7338290e1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
@@ -17,6 +17,7 @@ DEPENDS = " \
     libnewt \
     jansson \
     curl \
+    readline \
 "
 
 inherit gnomebase gettext update-rc.d systemd bash-completion vala gobject-introspection gtk-doc update-alternatives upstream-version-is-even
-- 
2.26.2

