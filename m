Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web08.10809.1613848291907195208
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Feb 2021 11:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=nVSZUKFY;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id o16so38184558ljj.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Feb 2021 11:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LoIFzLr1L8wexE6a8BY0nvv2Hc8c6l+S4B6tRlxfJKg=;
        b=nVSZUKFYG3ynJVdGH11VEJTJIsII2TwQ3LUXKcrUawfl7i7BgARq+5yszEHpmroXza
         rwTSJ6LgIJiqpSl6vCIPzq0o4kSTV2QAQmVQFq9ZzVIUmvVm7VwTuaaipfvh5/0TrlHi
         bM3kswhkatTQMnyTdj2+lFoUbQwx+xyI5SvmB6jreiC6imISvSCQWUg1M9avzspGGjvM
         +LIwRzP3ErNFIh5ZtP1pMaK0BtPEzwAOzNdfe0GCieQ2u762bj48eJLLPhWaojGHMohm
         nN2aECyTHmxHpz6e1RVB+zTARlEBMcfxl8V4tHhs1KYAvsDe4MiFqJzpGhI5SbIumoV0
         icPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LoIFzLr1L8wexE6a8BY0nvv2Hc8c6l+S4B6tRlxfJKg=;
        b=XSufgeQ7hlMzX5epGJ+tkxF8ZntWozRVrZypbmoUtEnKrBrpnTZUs+bygSPy5WxoiE
         hyI794hrJzMXRZhPxfAhp/k1OeYvpqEulNcsoXreDFEPKQtQ/dk8GP9KLeWyXfHDBm4T
         vDzjN+iO4AsiksoG/tAx0tPHXs6Ee8rMCrLjm6ujb//t1cOLJkMjryLPLvuJYYTOZUGH
         RR0RME7hLufgxSm/uKlSi186/Vgm7cz38PaHNN8uBdhvzizGL6R3RX58M86YxhODL/Hz
         b48eKkJAR1jzxLbp6CLv+ODiFhuqo28a9ozWmkj+JZRYZUAfjpph6IEuz3aO4FD7J70s
         0KvA==
X-Gm-Message-State: AOAM532EB59T5BKGW3znr3/h+SlRTUotxA4LDfIyOMElL+jG+vledDog
	XsVIHg8TKgiXWErS0oeYuqHQ6tWcp+s2HWuN
X-Google-Smtp-Source: ABdhPJw4ZnOWRyUfrKR7Ex8hqU3E4xl8oY3vH3IIVF4mLn6mXHOby2zZ8q5dZpdDLcqGlo++4Oiaew==
X-Received: by 2002:ac2:4114:: with SMTP id b20mr9180474lfi.180.1613848289734;
        Sat, 20 Feb 2021 11:11:29 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b24sm1329636lff.164.2021.02.20.11.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 11:11:29 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] stm32flash: update to 0.6
Date: Sat, 20 Feb 2021 20:11:26 +0100
Message-Id: <20210220191126.59688-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../stm32flash/{stm32flash_0.5.bb => stm32flash_0.6.bb}      | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-oe/recipes-support/stm32flash/{stm32flash_0.5.bb => stm32flash_0.6.bb} (71%)

diff --git a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb b/meta-oe/recipes-support/stm32flash/stm32flash_0.6.bb
similarity index 71%
rename from meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
rename to meta-oe/recipes-support/stm32flash/stm32flash_0.6.bb
index 854df06cb..195c0f5c2 100644
--- a/meta-oe/recipes-support/stm32flash/stm32flash_0.5.bb
+++ b/meta-oe/recipes-support/stm32flash/stm32flash_0.6.bb
@@ -4,13 +4,10 @@ BUGTRACKER = "https://sourceforge.net/p/stm32flash/tickets/"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-S = "${WORKDIR}/${BPN}"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
 
 do_install() {
 	oe_runmake install DESTDIR=${D} PREFIX=${prefix}
 }
 
-SRC_URI[md5sum] = "40f673502949f3bb655d2bcc539d7b6a"
-SRC_URI[sha256sum] = "97aa9422ef02e82f7da9039329e21a437decf972cb3919ad817f70ac9a49e306"
+SRC_URI[sha256sum] = "ee9b40d4d3e5cd28b993e08ae2a2c3c559b6bea8730cd7e1d40727dedb1dda09"
-- 
2.25.1

