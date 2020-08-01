Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.9191.1596283455593463412
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2020 05:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=iosM5mru;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id 140so18173541lfi.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2020 05:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAQhPxLKrViGt/PS1gooIK+FUMQKWXkZ+jPB0XljkF8=;
        b=iosM5mrujiT5BWY72OEMKzKoeSSc9vrxUrlJ79QG4pF6iJ+UYT82kcvqs2en6Y1aj2
         Gs4zPf3N7ecadlccGPNXxP/cRFKF5VmDA24DR+lLgZwuaLjhlXQolR7brVpeyGcsE3wb
         TwuNHQW0Sq6vCbBeTMFI3h1p8T/90e1Ip3+lryJq+4iw+hkCGYGud+YJqxyGtCBRCASo
         hLCvZ98bPz4ttOR5EvPreQN+uEIy9q1jTXwhSVF/bznvybG55WCJofLILtqNKpUyYgNu
         eTEOBI1HEBioUJJfsfG6d11fcx9g4c5NSoOZBykbG8wCqMIxxgNHiH6cjZ5zZmWJgr4E
         6rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xAQhPxLKrViGt/PS1gooIK+FUMQKWXkZ+jPB0XljkF8=;
        b=CB7wPmFF56nKl701viK6BwRVMNKp+Bfml34VzUM7fZxEfCNho/TsKLnE9OcPJ80J2A
         3iETcUK6IShXJb7TkDfGILiynlM6YkLtZ5sMsvxKUYHRsGefvP/OCoV92auCUGZbo9Kb
         OR/S6k2K1rC1QY3ju8wv/yY1DkBVV1QJD4UFHNsEpr1+PABEi/O0rgtk27uWZo0KBqfD
         uYwhby4SVTJtc1Z5nUYIYeu8diMvmD224Z6PDKDFbzgCU+cEjtaJ4YLKpQASpQ87G6XF
         iccpsUGsGKHYMO2GezwrM0hAQ1NZTryj1UUAwOry8/6vvx5g7+2+zCxHRTURoPoOWYL4
         flVg==
X-Gm-Message-State: AOAM531QPA3J1fkLudIEumShaAi6rRVKjkS9wSusLM4H/hJG0/vQboW6
	wz2ixnPzR/XIDOlS4Ami7QO9rc28VFk=
X-Google-Smtp-Source: ABdhPJwu9iCACpstcIh294AJRvTGq2mQzmOu2oWeMEm9/1rVLCuuqGsQgcwGbLYYfMflHNOtogUJRA==
X-Received: by 2002:ac2:4c33:: with SMTP id u19mr4420317lfq.154.1596283453239;
        Sat, 01 Aug 2020 05:04:13 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id m12sm2098172ljh.127.2020.08.01.05.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2020 05:04:12 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH v2][meta-multimedia] libupnp: update to 1.14.0
Date: Sat,  1 Aug 2020 14:04:09 +0200
Message-Id: <20200801120409.295343-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libupnp/{libupnp_git.bb => libupnp_1.14.0.bb}          | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_git.bb => libupnp_1.14.0.bb} (88%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
similarity index 88%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
index 339c07cd9..88652a443 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.0.bb
@@ -6,17 +6,14 @@ supporting the Document Object Model (DOM) Level 2 API and an optional, \
 integrated mini web server for serving UPnP related documents."
 HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
-
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-PV = "1.8.4+git${SRCPV}"
-# release-1.8.4
-SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
+SRCREV = "a6c3616530490ca67db41131572ec18f00d95eb0"
 SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
 
 S="${WORKDIR}/git"
 
-inherit autotools
+inherit autotools pkgconfig
 
 EXTRA_OECONF += "--enable-reuseaddr"
 
-- 
2.25.1

