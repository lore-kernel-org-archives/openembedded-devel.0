Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.11391.1622894999030856168
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 05:09:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a7N3fdXZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id d13so698698edt.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 05:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KQPLdxnX/ISBAAT7RUDepksFKY4TUdPGUqo45lCd5yc=;
        b=a7N3fdXZvUMYiyFCnPfXJWgCIBvH0bcDZdgvvw5ktIcgw0zbo4nlz1Q1v7OPE5MO7e
         FpbfZKkZEOid8bkG9yRA11+1+nTqKfV/D5/DppX6N747XryQDO8IsDryxq2GZry1ndpr
         bj3APl3ZHEr45mS2N7BVgk3zqg9np6+iuCE3kXLWgvvcSgYdfsiihwcSmh34nSNms7vr
         EIFDTWdomYGXa1aHmKIRPCrdY6268sdouRffUDdraYst9gGGKYY78sSdpwGsT1hQJtyZ
         fMBP2x8eMPXPWbzUxlJidSOGrWwOI1nGICF5ADcS6VkoWbLdwaahY8GBPFpargLACs4y
         4/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQPLdxnX/ISBAAT7RUDepksFKY4TUdPGUqo45lCd5yc=;
        b=gLVZsIB+AQDt8IDV1rLZOv+4OmkVmV1VhejLw1rzwyzFmhnm6zfVyvnf6nUZJ8duqT
         BOqw0kdfG4t5Xruu3WtQzvtSEmwVoUNnOe0yn4MMMaeX2LU4uHIHzwK/lmr6pePLRlIJ
         q0dyz2vzrbgWPyyndyptpv0R3SxqB3BPmbuYCdc+gBf/lamgQecMzEiC4yIh/bIu+Fhr
         jAk4fhZ7qaxsASoI4nGnifulIT1J+417i+l57lYLFvPu7EEdnjjxbJ/WYLRnUBdO5GVX
         BkgpmPKhLkoKC79pKm2J2vWGIe2Al6Dy50xew9AErQlZkQGAc7o5Rb3Z293/0qja/ouH
         /hTA==
X-Gm-Message-State: AOAM532bdceYFVy847waPgFC5jfFOAWD8YsZbAxf+FJIge+e1DkiIufK
	gf8qlU91peiWWeQeJjDkaMOBW5hI0gEChQ==
X-Google-Smtp-Source: ABdhPJzlZixf3lywx7tbW2ybrWVZozk3Qh1ZsUl0EXkgiGTqRPo7D0NJ/NoRgw3vRBx4P6shu8YMBw==
X-Received: by 2002:a05:6402:520c:: with SMTP id s12mr10031920edd.304.1622894997612;
        Sat, 05 Jun 2021 05:09:57 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d25sm3994489ejd.59.2021.06.05.05.09.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 05:09:57 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] ttf-noto-emoji: upgrade 20190815 -> 20200916
Date: Sat,  5 Jun 2021 14:09:42 +0200
Message-Id: <20210605120942.1080733-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605120942.1080733-1-schnitzeltony@gmail.com>
References: <20210605120942.1080733-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...{ttf-noto-emoji_20190815.bb => ttf-noto-emoji_20200916.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/ttf-fonts/{ttf-noto-emoji_20190815.bb => ttf-noto-emoji_20200916.bb} (78%)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
similarity index 78%
rename from meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
rename to meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
index e74f7a7f6..6dc39b17b 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20190815.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://github.com/googlefonts/noto-emoji"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://fonts/LICENSE;md5=55719faa0112708e946b820b24b14097"
 
-SRC_URI = "git://github.com/googlefonts/noto-emoji;protocol=https"
-SRCREV = "833a43d03246a9325e748a2d783006454d76ff66"
+SRC_URI = "git://github.com/googlefonts/noto-emoji;branch=main;protocol=https"
+SRCREV = "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
 
 PACKAGES = "${PN}-color ${PN}-regular"
 FONT_PACKAGES = "${PN}-color ${PN}-regular"
-- 
2.31.1

