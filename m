Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C38C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 08:52:02 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.7996.1700211114007170353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Nov 2023 00:51:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cfGZ7AFy;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso243624466b.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211112; x=1700815912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG7LQlBDE7I7AhU9sd4S1iKYYVm0ilC1cREoRpFKh4g=;
        b=cfGZ7AFyp8ELCI5z4yYp+fLKaz8EGuSmy7/5y1JElmObBuP+RLyY/qnMsNcN7itXzo
         USoXdX4B6DBxiFZCBG3/DnFROlRGewuQSJphGk3ThTAUrVzRnAuIdRDCmoCDf0vZ972K
         MkcnKRQHD1SQcg3RNM/voJUqutmWZeIh53Xmbv4HukG+BIFiP47Aatwjna1OkwjXiyMH
         9ZYXY5TOLa43luH8l41QEFQTi+2adVz3TRQeCKk7z1SX/dldMMf1pvcQlrDT+EEXmA3i
         zABFhWaZ1tWGEVUYsZLNexjPEmDDwY8HKgWwPjckdPnX0z5iN8TPPLbmsGT+jm/MJfiM
         Ne9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211112; x=1700815912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IG7LQlBDE7I7AhU9sd4S1iKYYVm0ilC1cREoRpFKh4g=;
        b=VVwojYa+s7RomFs/RXADUZsVBg3bIwZyM3jW2yIyDvtcMmwfsYa4uAusuQlmRYeOGm
         t7j2m1XFDAWrUWkqT1UER3vGByc2liobpXY0OfAmsnQR5H8YHwANxAirIRqgBd/wRD2l
         3SimxqV+8fnGI44zM+mK/xKFvQVw7mW44gRCFE12tQe9jADhmut9i1Z5elyVQkboFU7E
         S+gxrGDJUL07Qq47QQ3T4w7bYCuB4kxww/43jAuQlWgXF3TOzVAe82pUwA6JtJzCi0e1
         mjHADeoCIuHzzlu0p5YRpSMw4I4ATwYCWOeA5lktifmlcxWgH/GmwzoE6RU2PPLp9Xoc
         hNQA==
X-Gm-Message-State: AOJu0Yy4y8zn1zcIw2KTx6ilB/9bCgoAOfBkbDysNV8SZhAOGFtjfkjB
	H+EdnndW4XsDzQdPo8Ol5kL3AXF7R9k=
X-Google-Smtp-Source: AGHT+IGDZ96UW3deu38sO1SAIEmB50FxXFRcM8eOCCsKQRA8+l/f9cpSZCQKsqetNOFMqvewXYD1zw==
X-Received: by 2002:a17:906:739e:b0:9f8:2bdf:63f9 with SMTP id f30-20020a170906739e00b009f82bdf63f9mr672752ejl.72.1700211112124;
        Fri, 17 Nov 2023 00:51:52 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j18-20020a170906255200b009ae05f9eab3sm554056ejb.65.2023.11.17.00.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 00:51:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/8] xmlrcp-c: drop ${PE}, ${PR} from /usr/src/debug paths
Date: Fri, 17 Nov 2023 09:51:38 +0100
Message-ID: <20231117085143.3813216-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231117085143.3813216-1-martin.jansa@gmail.com>
References: <20231117085143.3813216-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 08:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106852

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
index 278db6dc84..5d5152b834 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.59.01.bb
@@ -41,7 +41,7 @@ do_configure() {
 }
 
 do_install:append:class-target() {
-        sed -i 's,${WORKDIR},/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g' ${D}${bindir}/xmlrpc-c-config
+        sed -i 's,${WORKDIR},${TARGET_DBGSRC_DIR},g' ${D}${bindir}/xmlrpc-c-config
 }
 
 BBCLASSEXTEND = "native"
-- 
2.42.1


