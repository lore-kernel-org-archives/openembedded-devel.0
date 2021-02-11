Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.567.1613069366655197019
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 10:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=jA7R8NDh;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.194, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f194.google.com with SMTP id s18so8621747ljg.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 10:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ei456pRI7irqYeH50g0XXm7VnMgcQlPnAEAiwC6r4/g=;
        b=jA7R8NDhPiPXWvkTXKXOSwGiEZEpZBWbb1UnJ9B44Vp/4VgPNHZX9bcM/k2TqRp1tj
         vC+N2p77J9k9KI43HYVd3MX6y+xmpuLFoJWRz4wi9ZUpd2q1SsqQe3f8Eu35kwc0HdF7
         N5qcpToSFj1Uedj2IpNg+UxItik++x6dFwBkWIjqfitz2YHz8IPMDtAUmNhD7m8WWLz/
         C6knsl6fvjXpGZUrINA6G/7NjZxf/oXlLVWil2HE4VATsrsDgVmIyfn8IrjkJK5X9fjV
         5GHTKlF2jBnRGFnhgGBMVhOx0mfQiae6JOBng5Bv9YHeaMAXoyAEPJOYdrvuDwyG0RNf
         u5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ei456pRI7irqYeH50g0XXm7VnMgcQlPnAEAiwC6r4/g=;
        b=q/4BlPtZ8Ax0wkrxMAusmAzxxBfJFjMQ7YpjWEK28r8axt3b2AoFzKrQnlLf+gi8jx
         COn9CVz0Z54sb/xkAavrp5rHkisQUh8QiWhxjzWQcFOuvvx+uLTFvPLpjeD9f75bjfn5
         +OdNErww9sSH1j0yOJvpDPGLklHqSsntuyhWcorQQfA4IcJtrqCc+l3UBt6n6uPIXKrd
         jbCxWx1myjOJI9Pdo51Il2Yfkn3JKg1vwa7zAUk+aE+iUlsy0lKkxDbqNauchad5nSoa
         MXkLs8IerqOxJAM4TTpsl6W/zNkmzbTKjZr7fWeBTrD4ITD8xmqo9nEVekQLre5ag6TN
         NdrA==
X-Gm-Message-State: AOAM532wJFhdYF6j+xLcGzyLcw08t5SyqrrWEgrXgW0JPCDropr70+Mc
	Wh06UOgGodqBps5CInJZxB8nPWW0daUXpceY
X-Google-Smtp-Source: ABdhPJzK9sB+0Q5NBJ9gSu9HnWngSOXoFIca7bcEOujbeuPaH6rNklxBRbVuLX6LRTNtOX5fm7/uGg==
X-Received: by 2002:a2e:a554:: with SMTP id e20mr5767352ljn.128.1613069364440;
        Thu, 11 Feb 2021 10:49:24 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id d2sm213522lja.19.2021.02.11.10.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 10:49:23 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libgit2: update to 1.1.0
Date: Thu, 11 Feb 2021 19:49:22 +0100
Message-Id: <20210211184922.2248614-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libgit2/{libgit2_1.0.1.bb => libgit2_1.1.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgit2/{libgit2_1.0.1.bb => libgit2_1.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/libgit2/libgit2_1.0.1.bb b/meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/libgit2/libgit2_1.0.1.bb
rename to meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb
index 363ed4d65..2bbf59ea7 100644
--- a/meta-oe/recipes-support/libgit2/libgit2_1.0.1.bb
+++ b/meta-oe/recipes-support/libgit2/libgit2_1.1.0.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b002a195fb7ea2d8d583f07eaff3a8e"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.0"
-SRCREV = "0ced29612dacb67eefe0c562a5c1d3aab21cce96"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.1"
+SRCREV = "7f4fa178629d559c037a1f72f79f79af9c1ef8ce"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

