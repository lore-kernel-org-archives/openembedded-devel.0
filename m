Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.1853.1620069136313589610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 12:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XSiDnLIC;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id l6so6454354oii.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=/47oxn7W+lM+QleC+UQy11RwhhsMMFQP+n1+U1py6Ag=;
        b=XSiDnLICfQ3FStlPCKCd9iSUDgTQEA/WmRL409CbfiTpypdjWjQwPt7FXb9IOSzjBo
         /DG57HCA6YTA/LNCijnBnqnIbL5SLqqLDXSynpyxDCFBvZFtX14XJtu640GhQBaTo9aT
         2NpIm8HasWwGMza0Xe4POCQzbBuW9sS9GJv/xHFsKnPU8mb2QI2Bntr9PNC8lFwaoeFf
         6FYWDNv0U0akPTZ5f2vY/pqNc1zxQTGp0nwyGJuThMWRy+H0i9KEayW8PhhnkWkcNqWl
         TzfropWnkD4VQLvhWX4eiTmYnpMnNGJoTgglInu84EnsHbeF0pw2InzGEMPJeBNNWd0A
         Ue6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/47oxn7W+lM+QleC+UQy11RwhhsMMFQP+n1+U1py6Ag=;
        b=sjI/7E7kD6Yx45RDCWFGfzU9JhwZ7dQ12yz0XK78Fjl2FiB4+lmqjg+jn8NyoTXsNL
         kBPoZY9ucgeb3pAVavT8FFRbs0OsRaBpUE5OeeczTVNkjZktC7yVv9MfBUhgrLrylrIJ
         QEDJduU5LaABOJoLSZ5kwreRzRnC1+YkHaCEjombmwWBOtCr3X8Pe3ATx+x4KjAv7Szz
         VN6ev8mC5eXMlru4SaWLDTjYLaBus2LT1sMZ/1HC3Upb503rEbEgwzP10fpUlYzbYlwT
         cJbZtbw0gw6OHmNutBKcwBFCwyfqvj9EaK+KOucT0fBX0c2MjXZYdmDanirRaUdS6upv
         HgQw==
X-Gm-Message-State: AOAM532/9gPuxnYAMmIOxRRsAMLeRqkzV1+slX+1Y/cB/twZH68WE8+Y
	OgWWf9Y8G+jjGhj6LfNncuU+qdfPL81IPA==
X-Google-Smtp-Source: ABdhPJw2pKom6mwUydrIa0s+QUBcBBPSBrdCpO5J/MMdtYyfppGZcBm+Va9GH89jnbHVvEq+Lfk/uQ==
X-Received: by 2002:aca:b05:: with SMTP id 5mr14655010oil.113.1620069135522;
        Mon, 03 May 2021 12:12:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:dc35:22d6:72af:c1da])
        by smtp.gmail.com with ESMTPSA id s85sm150047oos.4.2021.05.03.12.12.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:12:15 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 06/14] networkmanager: upgrade 1.30.2 -> 1.30.4
Date: Mon,  3 May 2021 12:11:59 -0700
Message-Id: <67eaaf85483ad9c5d5ff816f221dfc2d27b80989.1620069041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1620069041.git.akuster808@gmail.com>
References: <cover.1620069041.git.akuster808@gmail.com>

From: zangrc <zangrc.fnst@fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 56782012e3f647dd1808aa08fc20ca759bce2b82)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{networkmanager_1.30.2.bb => networkmanager_1.30.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.30.2.bb => networkmanager_1.30.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
index ec3bdd22bd..7c07b0a34d 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.30.4.bb
@@ -31,7 +31,7 @@ SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "0c8e80e77877860e4a4e6ab4a0f7cdc1186e356b65b042a751897188b88944d2"
+SRC_URI[sha256sum] = "6050b724212ea3ce7386113359bea9afa1f679a54f60d999a5999892e672c190"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.17.1

