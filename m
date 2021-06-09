Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web12.4431.1623220732751262462
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hntH1fuk;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id h24so36705026ejy.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kslwMrcHl01HXi2PW+7g5OpJHG8XDoT7vHWSI5wSiAk=;
        b=hntH1fukvLN52vy99IWhWxFk+/HVKh6IhJ7evvSjXtnBB3jmIsP5LU+N9ZJXILn6/y
         1HwZp1ch6N3Y3NxiYi/DGJip4juEf0kJrskPyggczmpyVx/DGzl7GhfDo+LPy3LVIc56
         tIvObRzo4Rx13pmGjXq5L0/Ou0sPBOU473EXb+831WSTbR4dwdoH3vbQ0w9Iya21EFEf
         A3k7cKp7ZVRrY5+NjHKfnPFZbuxU49/Ynud04Odgm4R//u7WQ3QdS/JZqdoPfzy7IObR
         tEI39RDoPiGX1uuSfmgXS2QfI84dXMszLoGYYWMtGMeAKYByLr+vibBVZrut5tq0PZYQ
         Fr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kslwMrcHl01HXi2PW+7g5OpJHG8XDoT7vHWSI5wSiAk=;
        b=ONEueDQ6mlNq5Ss9SHI46wT884bQzVKmM7PXAJIjsJrhl2ArzK4gHVbpdNLdYXNNvP
         b5x2WbdNgbEuJPPKnkxC01MEaYokBAJC2skWOjuLYBTNlgikmw3Bt73Oda/flu3XlCjD
         I+5tLJkVZ1HiJKcS+NoKUWXQTbPv/UFSrMYHciNtfTCPzIhqzZQEgJeX8Nad3XBT1oQL
         ewWycfsQOedWH2BpsdxHYCPrqKOaUXjEj3FAFK88OjlRmu1o9vU6I+lFRIDUwsmQ4x1s
         kkxlxpKC/fmkD3L1NYEZsm6l+0SGXAeK309f0US8EjecKsIz7WkcVpQlGulC+T/nOTk2
         ICRQ==
X-Gm-Message-State: AOAM533T2WTwdRKPzR3BNmT5cbANOVEMqOmeyMdhjlD0HyR58ytO05lA
	jty01Evm4k/HjsMGBS2oqB3fGPCV5cfQDg==
X-Google-Smtp-Source: ABdhPJxLaVLt9Oi1L3iqPXT4ke3YPy22JE46tkkoog4htXMLgiWzAnCjcA4lCzQL4fQLLIVjiNtGpQ==
X-Received: by 2002:a17:906:f744:: with SMTP id jp4mr8859510ejb.210.1623220731287;
        Tue, 08 Jun 2021 23:38:51 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:50 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/28] gspell: upgrade 1.8.4 -> 1.9.1
Date: Wed,  9 Jun 2021 08:38:15 +0200
Message-Id: <20210609063831.3400611-12-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

News in 1.9.1, 2020-10-10
-------------------------
* gspell_language_get_name() is now implemented with the ICU library, not with
  the iso-codes package. As a result, gspell no longer depends on the
  iso-codes, and has the ICU as a new dependency.
* Translation updates.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gspell/{gspell_1.8.4.bb => gspell_1.9.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gspell/{gspell_1.8.4.bb => gspell_1.9.1.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/gspell/gspell_1.8.4.bb b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/gspell/gspell_1.8.4.bb
rename to meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
index f7f493dc3..d6de146b1 100644
--- a/meta-gnome/recipes-gnome/gspell/gspell_1.8.4.bb
+++ b/meta-gnome/recipes-gnome/gspell/gspell_1.9.1.bb
@@ -7,4 +7,4 @@ DEPENDS = "gtk+3 iso-codes enchant2"
 
 inherit gnomebase gettext gobject-introspection
 
-SRC_URI[archive.sha256sum] = "cf4d16a716e813449bd631405dc1001ea89537b8cdae2b8abfb3999212bd43b4"
+SRC_URI[archive.sha256sum] = "dcbb769dfdde8e3c0a8ed3102ce7e661abbf7ddf85df08b29915e92cd723abdd"
-- 
2.31.1

